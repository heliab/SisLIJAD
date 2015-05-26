using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web.ASPxGridView;
using System.Net.Mail;

namespace SisLIJAD.PEUCA
{
    public partial class SolicitudMateriales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["username"] = User.Identity.Name;
            deFefin.MinDate = DateTime.Today;
            deFeIni.MinDate = DateTime.Today;
        }
        #region CRUD
        protected void Select()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                 SqlCommand cmd = new SqlCommand("SELECT  [IdPrestamo],[Procedimiento],[FechaRegistro],[FechaPrestar],[FechaDevolver],[Asignatura],[CodigoAsignatura],[Cedula] FROM  [MINV_Prestamos] WHERE IdPrestamo=@IdPrestamo", con);
                 cmd.Parameters.AddWithValue("@IdPrestamo", txtId.Text);
                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["IdPrestamo"].ToString();
                    mProc.Text = dr["Procedimiento"].ToString();
                    deFeIni.Value = dr["FechaPrestar"];
                    deFefin.Value = dr["FechaDevolver"];
                    txtAsig.Text= dr["Asignatura"].ToString();
                    txtCod.Text = dr["CodigoAsignatura"].ToString();
                    txtCed.Text= dr["Cedula"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("Error al recuperar la informacion") + "')</script>");

                }
                dr.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(ex.ToString()) + "')</script>");


            }
            finally
            {
                con.Close();
            }
        }
        protected void Insert()
        {
            string username = User.Identity.Name;
             DateTime serverTime = DateTime.Today;
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into MINV_Prestamos (Procedimiento,FechaRegistro,FechaPrestar,FechaDevolver,SolicitadoPor,Asignatura,CodigoAsignatura,Cedula) values(@Procedimiento,@FechaRegistro,@FechaPrestar,@FechaDevolver,@SolicitadoPor,@Asignatura,@CodigoAsignatura,@Cedula)", con);
                cmd.Parameters.AddWithValue("@Procedimiento", mProc.Text);
                cmd.Parameters.AddWithValue("@FechaRegistro", serverTime);
                cmd.Parameters.AddWithValue("@FechaPrestar", deFeIni.Value);
                cmd.Parameters.AddWithValue("@FechaDevolver", deFefin.Value);
                cmd.Parameters.AddWithValue("@SolicitadoPor", username);
                cmd.Parameters.AddWithValue("@Asignatura", txtAsig.Value);
                cmd.Parameters.AddWithValue("@CodigoAsignatura", txtCod.Text);
                cmd.Parameters.AddWithValue("@Cedula", txtCed.Text);
                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {
                    //Response.Write("<script>alert('" + Server.HtmlEncode("El equipo " + txtNom.Text + " se ha guardado correctamente") + "')</script>");

                }
                else
                    Response.Write("<script>alert('" + Server.HtmlEncode("Error al guardar los datos, revise los datos del formulario") + "')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(ex.ToString()) + "')</script>");
            }
            finally
            {
                con.Close();
            }



        }
        protected void Update()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update MINV_Prestamos set Procedimiento=@Procedimiento,FechaPrestar=@FechaPrestar,FechaDevolver=@FechaDevolver,Asignatura=@Asignatura,CodigoAsignatura=@CodigoAsignatura,Cedula=@Cedula where IdPrestamo = @IdPrestamo", con);
                cmd.Parameters.AddWithValue("@IdPrestamo", txtId.Text);
                cmd.Parameters.AddWithValue("@Procedimiento", mProc.Text);
                cmd.Parameters.AddWithValue("@FechaPrestar", deFeIni.Value);
                cmd.Parameters.AddWithValue("@FechaDevolver", deFefin.Value);
                cmd.Parameters.AddWithValue("@Asignatura", txtAsig.Value);
                cmd.Parameters.AddWithValue("@CodigoAsignatura", txtCod.Text);
                cmd.Parameters.AddWithValue("@Cedula", txtCed.Text);
                
                if (cmd.ExecuteNonQuery() == 1)
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El registro se ha actualizado correctamente") + "')</script>");
                }
                else
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("Los datos no se han actalizado") + "')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(ex.ToString()) + "')</script>");
            }
            finally
            {
                con.Close();
            }
        }
        protected void Delete()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from MINV_Prestamos where IdPrestamo = @IdPrestamo", con);
                cmd.Parameters.AddWithValue("@IdPrestamo", txtIdD.Text);
                if (cmd.ExecuteNonQuery() == 1)
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El registro se ha sido eliminado") + "')</script>");
                }
                else
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El registro no se ha podido eliminar") + "')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(ex.ToString()) + "')</script>");
            }
            finally
            {
                con.Close();
            }

        }
        protected void EnviarSol() {
            string val = HiddenV.Get("Enviar").ToString();
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE MINV_Prestamos set Enviado=@Enviado where IdPrestamo=@IdPrestamo", con);
                cmd.Parameters.AddWithValue("@IdPrestamo", val);
                cmd.Parameters.Add("@Enviado", SqlDbType.Bit).Value = 1;
                if (cmd.ExecuteNonQuery() == 1)
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El registro se ha sido aprobadp") + "')</script>");
                    EnviarMensaje();
                }
                else
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El registro no se ha podido aprobar") + "')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(ex.ToString()) + "')</script>");
            }
            finally
            {
                con.Close();
            }
        }
        #endregion
        #region SubCrud
        protected void SubSelect()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT CAST(MINV_Det_Prestamo.IdDetPrest AS NVARCHAR) + '.' + CAST(MINV_Det_Prestamo.IdPrestamo AS NVARCHAR) + '.' + CAST(MINV_Det_Prestamo.IdEquipo AS NVARCHAR) AS CodDetalle,IdEquipo,Cantidad from MINV_Det_Prestamo WHERE CAST(MINV_Det_Prestamo.IdDetPrest AS NVARCHAR) + '.' + CAST(MINV_Det_Prestamo.IdPrestamo AS NVARCHAR) + '.' + CAST(MINV_Det_Prestamo.IdEquipo AS NVARCHAR) = @CodDetalle", con);
                cmd.Parameters.AddWithValue("@CodDetalle", txtSubId.Text);


                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtSubId.Text = dr["CodDetalle"].ToString();
                    cmbMateriales.Text = dr["IdEquipo"].ToString();
                   sCant.Value= dr["Cantidad"].ToString();
                  

                }
                else
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("Error al recuperar la informacion") + "')</script>");

                }
                dr.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(ex.ToString()) + "')</script>");


            }
            finally
            {
                con.Close();
            }
        }
        protected void SubInsert()
        {
            string IdPrestamo = HiddenGridPr.Get("SessionId").ToString();
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into MINV_Det_Prestamo(IdPrestamo,IdEquipo,Cantidad) values(@IdPrestamo,@IdEquipo,@Cantidad)", con);
                cmd.Parameters.AddWithValue("@IdPrestamo", IdPrestamo);
                cmd.Parameters.AddWithValue("@IdEquipo", cmbMateriales.Value);
                cmd.Parameters.AddWithValue("@Cantidad", sCant.Value);
            
                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {
                    //Response.Write("<script>alert('" + Server.HtmlEncode("El tipo " + txtDesc.Text + " se ha guardado correctamente") + "')</script>");

                }
                else
                    Response.Write("<script>alert('" + Server.HtmlEncode("Error al guardar los datos, revise los datos del formulario") + "')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(ex.ToString()) + "')</script>");
            }
            finally
            {
                con.Close();
            }



        }
        protected void SubUpdate()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update MINV_Det_Prestamo set IdEquipo=@IdEquipo,Cantidad=@Cantidad where CAST(MINV_Det_Prestamo.IdDetPrest AS NVARCHAR) + '.' + CAST(MINV_Det_Prestamo.IdPrestamo AS NVARCHAR) + '.' + CAST(MINV_Det_Prestamo.IdEquipo AS NVARCHAR) = @CodDetalle", con);
                cmd.Parameters.AddWithValue("@CodDetalle", txtSubId.Text);
                cmd.Parameters.AddWithValue("@IdEquipo", cmbMateriales.Value);
                cmd.Parameters.AddWithValue("@Cantidad", sCant.Value);
                

                if (cmd.ExecuteNonQuery() == 1)
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El registro se ha actualizado correctamente") + "')</script>");
                }
                else
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("Los datos no se han actalizado") + "')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(ex.ToString()) + "')</script>");
            }
            finally
            {
                con.Close();
            }
        }
        protected void SubDelete()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from MINV_Det_Prestamo where CAST(MINV_Det_Prestamo.IdDetPrest AS NVARCHAR) + '.' + CAST(MINV_Det_Prestamo.IdPrestamo AS NVARCHAR) + '.' + CAST(MINV_Det_Prestamo.IdEquipo AS NVARCHAR) = @CodDetalle", con);
                cmd.Parameters.AddWithValue("@CodDetalle", txtIdD.Text);
                if (cmd.ExecuteNonQuery() == 1)
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El registro se ha sido eliminado") + "')</script>");
                }
                else
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El registro no se ha podido eliminar") + "')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(ex.ToString()) + "')</script>");
            }
            finally
            {
                con.Close();
            }

        }
        #endregion
        #region Mensaje
        protected void EnviarMensaje() {
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                mail.From = new MailAddress("sislijad@gmail.com","Alerta del sistema");
                mail.To.Add("sislijad@gmail.com");
                mail.To.Add("browonfire@yandex.com");
                mail.Subject = "Solicitud de Materiales pendiente";
                
                mail.IsBodyHtml = true;
                string htmlBody;

                htmlBody = "<div style='width:100;height:34px;background-color:#3B71B8'><h2 style='text-align: center;'><span style='color:#FAFAFA;'>Notificacion SISLIJAD</span></h2></div><p>Saludos <b>Administrador</b>, usted tiene una solicitud de materiales pendiente en el sistema.</p><p>Favor revisar,</p><br><div style='width:100;height:25px;background-color:#3B71B8'><h4 style='text-align: center;'><span style='color:#FAFAFA;'>Copyrights © Sislijad 2015</span></h4></div>";

                mail.Body = htmlBody;

                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential("SisLijad@gmail.com", "administracion2015");
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
        }
        #endregion
        #region Callbacks
        protected void NewCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            string valNuevo = HiddenV.Get("Nuevo").ToString();

            switch (valNuevo)
            {
                case "0": Insert();
                    GridPrincipal.DataBind();
                    break;
                case "1": Update();
                    GridPrincipal.DataBind();
                    break;
                case "2": Delete();
                    break;
                case "3": SubInsert();
                    break;
                case "4": SubUpdate();
                    break;
                case "5": SubDelete();
                    break;
                case "6": EnviarSol();
                    break;
                default: Response.Write("Error con valor de crud");
                    break;

            }
            HiddenV.Clear();
        }
        protected void GridPrincipal_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridPrincipal.DataBind();
            GridPrincipal.Focus();
        }
        protected void FillingCallback_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            Select();
        }
        protected void cmbMateriales_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            Session["IdPrestamo"] = HiddenGridPr.Get("SessionId").ToString();
            cmbMateriales.DataBind();
        }
        #endregion
        #region Subcallbacks
        protected void SubFillingCallback_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            SubSelect();
        }
        protected void SubGrid_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["IdPrestamo"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
        protected void ASPxGridView1_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["IdPrestamo"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
        protected void ASPxGridView2_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["IdPrestamo"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
        #endregion


    }
}