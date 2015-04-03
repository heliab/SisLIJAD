using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web.ASPxGridView;
using System.Web.Security;
using System.Net.Mail;

namespace SisLIJAD.Clientes
{
    public partial class CrearSolicitudes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["username"]= User.Identity.Name;
        }
        #region CRUD
        protected void Select()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT IdSolicPrueba,HeaderSolicPrueba From MPR_Solic_Pruebas  WHERE  (IdSolicPrueba = @IdSolicPrueba)", con);
                cmd.Parameters.AddWithValue("@IdSolicPrueba", txtId.Text);
                cmd.Parameters.AddWithValue("@HeaderSolicPrueba", memoDesc.Text);
                
                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["IdSolicPrueba"].ToString();
                    memoDesc.Text = dr["HeaderSolicPrueba"].ToString();
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
                SqlCommand cmd = new SqlCommand("insert into MPR_Solic_Pruebas (HeaderSolicPrueba,FechaRegistro,username) values(@HeaderSolicPrueba,@FechaRegistro,@username)", con);
                cmd.Parameters.AddWithValue("@HeaderSolicPrueba", memoDesc.Text);
                cmd.Parameters.AddWithValue("@FechaRegistro", DateTime.Now);
                cmd.Parameters.AddWithValue("@username", username);
                

                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("La solicitud " + memoDesc.Text + " se ha guardado correctamente") + "')</script>");

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
                SqlCommand cmd = new SqlCommand("update MPR_Solic_Pruebas set HeaderSolicPrueba=@HeaderSolicPrueba where IdSolicPrueba = @IdSolicPrueba", con);
                cmd.Parameters.AddWithValue("@IdSolicPrueba", txtId.Text);
                cmd.Parameters.AddWithValue("@HeaderSolicPrueba", memoDesc.Text);

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
                SqlCommand cmd = new SqlCommand("delete from MPR_Solic_Pruebas where IdSolicPrueba = @IdSolicPrueba", con);
                cmd.Parameters.AddWithValue("@IdSolicPrueba", txtIdD.Text);
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
        protected void EnviarSol()
        {
            string val = HiddenV.Get("Enviar").ToString();
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE MPR_Solic_Pruebas set Enviada=@Enviada where IdSolicPrueba=@IdSolicPrueba", con);
                cmd.Parameters.AddWithValue("@IdSolicPrueba", val);
                cmd.Parameters.Add("@Enviada", SqlDbType.Bit).Value = 1;
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
        #region Mensaje
        protected void EnviarMensaje()
        {
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                mail.From = new MailAddress("sislijad@gmail.com", "Alerta del sistema");
                mail.To.Add("sislijad@gmail.com");
                mail.To.Add("browonfire@yandex.com");
                mail.Subject = "Solicitud de Materiales pendiente";

                mail.IsBodyHtml = true;
                string htmlBody;

                htmlBody = "<div style='width:100;height:34px;background-color:#3B71B8'><h2 style='text-align: center;'><span style='color:#FAFAFA;'>Notificacion SISLIJAD</span></h2></div><p>Saludos <b>Administrador</b>, usted tiene una solicitud de ensayes en el sistema.</p><p>Favor revisar,</p><br><div style='width:100;height:25px;background-color:#3B71B8'><h4 style='text-align: center;'><span style='color:#FAFAFA;'>Copyrights © Sislijad 2015</span></h4></div>";

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
        protected void cmbPrueba_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            Session["IdSol"] = HiddenV.Get("SessionId").ToString();
            cmbPrueba.DataBind();
        }

        #endregion
        #region SubDRUD
        protected void SubSelect()
        {

            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT CAST(IdSolPrueba AS NVARCHAR) + '.' + CAST(IdPrueba AS NVARCHAR) AS IdEspec," +
                    "IdPrueba,ObservPrueba FROM MPR_Det_Sol_Prueba WHERE (CAST(IdSolPrueba AS NVARCHAR) + '.' + CAST(IdPrueba AS NVARCHAR)"
                    +"= @IdEspec)", con);
                cmd.Parameters.AddWithValue("@IdEspec", txtSubId.Text);

                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtSubId.Text = dr["IdEspec"].ToString();
                    cmbPrueba.Text = dr["IdPrueba"].ToString();
                    memoOb.Text = dr["ObservPrueba"].ToString();
                  
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
            string idub = HiddenV.Get("Session").ToString();
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into MPR_Det_Sol_Prueba(IdSolPrueba,IdPrueba,ObservPrueba) values(@IdSolPrueba,@IdPrueba,@ObservPrueba)", con);

                cmd.Parameters.AddWithValue("@IdSolPrueba", idub);
                cmd.Parameters.AddWithValue("@IdPrueba", cmbPrueba.Value);
                cmd.Parameters.AddWithValue("@ObservPrueba", memoOb.Text);
                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {

                    Response.Write("<script>alert('" + Server.HtmlEncode("El registro se ha guardado correctamente") + "')</script>");
                }
                else

                    Response.Write("<script>alert('" + Server.HtmlEncode("Error al guardar los datos, revise los datos del formulario") + "')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(ex.ToString()) + "')</script>");
                Response.Write("<script>alert(\"an error occur\")</script>");
            }
            finally
            {
                con.Close();
            }
        }
        protected void SubUpdate()
        {
            string idub = HiddenV.Get("Session").ToString();
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE MPR_Det_Sol_Prueba set IdSolPrueba=@IdSolPrueba, IdPrueba=@IdPrueba,ObservPrueba=@ObservPrueba where (CAST(IdSolPrueba AS NVARCHAR) + '.' + CAST(IdPrueba AS NVARCHAR) = @IdEspec)", con);
                cmd.Parameters.AddWithValue("@IdEspec", txtSubId.Text);
                cmd.Parameters.AddWithValue("@IdSolPrueba", idub);
                cmd.Parameters.AddWithValue("@IdPrueba", cmbPrueba.Value);
                cmd.Parameters.AddWithValue("@ObservPrueba", memoOb.Text);


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
                SqlCommand cmd = new SqlCommand("delete from MPR_Det_Sol_Prueba WHERE (CAST(IdSolPrueba AS NVARCHAR) + '.' + CAST(IdPrueba AS NVARCHAR) = @IdEspec)", con);
                cmd.Parameters.AddWithValue("@IdEspec", txtIdD.Text);
                if (cmd.ExecuteNonQuery() == 1)
                {
                    Response.Write("<script>confirm('" + Server.HtmlEncode("El registro se ha sido eliminado") + "')</script>");
                }
                else
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El registro no se ha podido eliminar") + "')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(ex.ToString()) + "')</script>");
                Response.Write("<script>alert(\"an error occur\")</script>");
            }
            finally
            {
                con.Close();
            }
        }
        #endregion

    }
}