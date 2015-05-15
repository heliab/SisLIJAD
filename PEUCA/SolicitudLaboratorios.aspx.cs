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
    public partial class SolicitudLaboratorios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["username"] = User.Identity.Name;
        }
        #region CRUD
        protected void Select()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT  IdPrestLab,Procedimiento,Cedula,Asignatura,CodAsignatura,CONVERT(DATE,FechaReq) as FechaReq,Horaini,HoraFin,NoGrupos,NoEstudiantesGrup,IdUbicacion,Enviada,Aprobada,Cancelada FROM  [MPR_Solic_Lab]", con);
                cmd.Parameters.AddWithValue("@IdPrestLab", txtId.Text);
                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["IdPrestLab"].ToString();
                    mProc.Text = dr["Procedimiento"].ToString();
                    txtCed.Text = dr["Cedula"].ToString();
                    txtAsig.Text = dr["Asignatura"].ToString();
                    txtCodAsig.Text = dr["CodAsignatura"].ToString();
                    deFeReq.Value = dr["FechaReq"].ToString();
                    teHora.Text = dr["Horaini"].ToString();
                    teHoraFin.Text = dr["HoraFin"].ToString();
                    sGrup.Value= dr["NoGrupos"].ToString();
                    seEstGrup.Value= dr["NoEstudiantesGrup"].ToString();
                    cmbLabs.Text = dr["IdUbicacion"].ToString();
                   
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
                SqlCommand cmd = new SqlCommand("insert into MPR_Solic_Lab (Procedimiento,username,Cedula,Asignatura,CodAsignatura,FechaReg,FechaReq,Horaini,HoraFin,NoGrupos,NoEstudiantesGrup,IdUbicacion) values(@Procedimiento,@username,@Cedula,@Asignatura,@CodAsignatura,@FechaReg,@FechaReq,@Horaini,@HoraFin,@NoGrupos,@NoEstudiantesGrup,@IdUbicacion)", con);
                cmd.Parameters.AddWithValue("@Procedimiento", mProc.Text);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@Cedula", txtCed.Text);
                cmd.Parameters.AddWithValue("@Asignatura", txtAsig.Value);
                cmd.Parameters.AddWithValue("@CodAsignatura", txtCodAsig.Text);
                cmd.Parameters.AddWithValue("@FechaReg", serverTime);
                cmd.Parameters.AddWithValue("@FechaReq", deFeReq.Value);
                cmd.Parameters.AddWithValue("@Horaini", teHora.Text);
                cmd.Parameters.AddWithValue("@HoraFin", teHoraFin.Text);
                cmd.Parameters.AddWithValue("@NoGrupos", sGrup.Text);
                cmd.Parameters.AddWithValue("@NoEstudiantesGrup", seEstGrup.Text);
                cmd.Parameters.AddWithValue("@IdUbicacion", cmbLabs.Value);

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
                SqlCommand cmd = new SqlCommand("update MPR_Solic_Lab set Procedimiento=@Procedimiento,Cedula=@Cedula,Asignatura=@Asignatura,CodAsignatura=@CodAsignatura,FechaReq=@FechaReq,Horaini=@Horaini,HoraFin=@HoraFin,NoGrupos=@NoGrupos,NoEstudiantesGrup=@NoEstudiantesGrup,IdUbicacion=@IdUbicacion where IdPrestLab = @IdPrestLab", con);
                cmd.Parameters.AddWithValue("@IdPrestLab", txtId.Text);
                cmd.Parameters.AddWithValue("@Procedimiento", mProc.Text);
                cmd.Parameters.AddWithValue("@Cedula", txtCed.Text);
                cmd.Parameters.AddWithValue("@Asignatura", txtAsig.Value);
                cmd.Parameters.AddWithValue("@CodAsignatura", txtCodAsig.Text);
                cmd.Parameters.AddWithValue("@FechaReq", deFeReq.Value);
                cmd.Parameters.AddWithValue("@Horaini", teHora.Text);
                cmd.Parameters.AddWithValue("@HoraFin", teHoraFin.Text);
                cmd.Parameters.AddWithValue("@NoGrupos", sGrup.Text);
                cmd.Parameters.AddWithValue("@NoEstudiantesGrup", seEstGrup.Text);
                cmd.Parameters.AddWithValue("@IdUbicacion", cmbLabs.Value);

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
                SqlCommand cmd = new SqlCommand("delete from MPR_Solic_Lab where IdPrestLab = @IdPrestLab", con);
                cmd.Parameters.AddWithValue("@IdPrestLab", txtIdD.Text);
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
            string val = HiddenV.Get("EnvioId").ToString();
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE MPR_Solic_Lab set Enviada=@Enviada where IdPrestLab=@IdPrestLab", con);
                cmd.Parameters.AddWithValue("@IdPrestLab", val);
                cmd.Parameters.Add("@Enviada", SqlDbType.Bit).Value = 1;
                if (cmd.ExecuteNonQuery() == 1)
                {
                    EnviarMensaje();
                    Response.Write("<script>alert('" + Server.HtmlEncode("El registro se ha sido aprobadp") + "')</script>");
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
                mail.Subject = "Solicitud de Laboratorios pendiente";

                mail.IsBodyHtml = true;
                string htmlBody;

                htmlBody = "<div style='width:100;height:34px;background-color:#3B71B8'><h2 style='text-align: center;'><span style='color:#FAFAFA;'>Notificacion SISLIJAD</span></h2></div><p>Saludos <b>Administrador</b>, usted tiene una solicitud de prestamo de laboratorios pendiente en el sistema.</p><p>Favor revisar,</p><br><div style='width:100;height:25px;background-color:#3B71B8'><h4 style='text-align: center;'><span style='color:#FAFAFA;'>Copyrights © Sislijad 2015</span></h4></div>";

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
              case "7": EnviarSol();
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
        protected void ASPxGridView1_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["IdPrestLab"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
        protected void ASPxGridView2_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["IdPrestLab"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
        #endregion
        
     }
}