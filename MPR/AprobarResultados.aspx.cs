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

namespace SisLIJAD.MPR
{
    public partial class AprobarResultados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        #region GridCallbacks
        protected void GridPrincipal_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridPrincipal.DataBind();
        }
        protected void SubGrid2_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["IdSolicPrueba"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
        protected void SubGrid_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["IdSolicPrueba"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
        #endregion
        #region Callback
        protected void NewCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            string valNuevo = HiddenV.Get("Nuevo").ToString();
            switch (valNuevo)
            {
                case "7": Publish();
                    break;
                default: Response.Write("Error con valor de crud");
                    break;
            }
            HiddenV.Clear();
        }
        #endregion
        #region CRUD
        protected void Publish() {
            string val = HiddenV.Get("GridId").ToString();
            string estado = HiddenV.Get("Enviado").ToString();
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                if (estado == "1")
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE MPR_Solic_Pruebas set Publicada=@Publicada where IdSolicPrueba=@IdSolicPrueba", con);
                    cmd.Parameters.AddWithValue("@IdSolicPrueba", val);
                    cmd.Parameters.Add("@Publicada", SqlDbType.Bit).Value = 0;
                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        Response.Write("<script>alert('" + Server.HtmlEncode("El registro se ha sido aprobadp") + "')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('" + Server.HtmlEncode("El registro no se ha podido aprobar") + "')</script>");
                    }
                }
                else
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE MPR_Solic_Pruebas set Publicada=@Publicada where IdSolicPrueba=@IdSolicPrueba", con);
                    cmd.Parameters.AddWithValue("@IdSolicPrueba", val);
                    cmd.Parameters.Add("@Publicada", SqlDbType.Bit).Value = 1;
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
            string email =txtMail.Text;
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                mail.From = new MailAddress("sislijad@gmail.com", "Alerta del sistema");
                mail.To.Add(email);
                mail.Subject = "Resultado de pruebas publicados";

                mail.IsBodyHtml = true;
                string htmlBody;

                htmlBody = "<div style='width:100;height:34px;background-color:#3B71B8'><h2 style='text-align: center;'><span style='color:#FAFAFA;'>Notificacion SISLIJAD</span></h2></div><p>Saludos, <br>Usted tiene una publicacion de resultado de ensayes en nuestro sistema.</p><p>Favor revisar,</p><br><div style='width:100;height:25px;background-color:#3B71B8'><h4 style='text-align: center;'><span style='color:#FAFAFA;'>Copyrights © Sislijad 2015</span></h4></div>";

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
    }
}