using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web.ASPxGridView;
using System.Net.Mail;

namespace SisLIJAD.MPR
{
    public partial class AutPrestaLabs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["username"] = User.Identity.Name;
        }

        #region Mensaje
        protected void EnviarMensaje()
        {
            string email = txtMail.Text;
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                mail.From = new MailAddress("sislijad@gmail.com", "Alerta del sistema");
                mail.To.Add(email);
                mail.Subject = "Prestamo de laboratorio";

                mail.IsBodyHtml = true;
                string htmlBody;

                htmlBody = "<div style='width:100;height:34px;background-color:#3B71B8'><h2 style='text-align: center;'><span style='color:#FAFAFA;'>Notificacion SISLIJAD</span></h2></div><p>Saludos, <br>El administrador del sistema ha procesado su solicidud de prestamo de laboratorios.</p><p>Favor revisar en el sistema,</p><br><div style='width:100;height:25px;background-color:#3B71B8'><h4 style='text-align: center;'><span style='color:#FAFAFA;'>Copyrights © Sislijad 2015</span></h4></div>";

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
                case "7": AprobarSol();
                    break;
                case "8": CancelarSol();
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
         protected void ASPxGridView1_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["IdPrestLab"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
        protected void ASPxGridView2_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["IdPrestLab"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
        #endregion
        #region CRUD
        protected void AprobarSol() {
            string val = HiddenV.Get("Id").ToString();
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE MPR_Solic_Lab set Aprobada=@Aprobada,Cancelada=@Cancelada where IdPrestLab=@IdPrestLab", con);
                    cmd.Parameters.AddWithValue("@IdPrestLab", val);
                    cmd.Parameters.Add("@Aprobada", SqlDbType.Bit).Value = 1;
                    cmd.Parameters.Add("@Cancelada", SqlDbType.Bit).Value = 0;
                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        EnviarMensaje();
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
        protected void CancelarSol() {
        
          string val = HiddenV.Get("Id").ToString();
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE MPR_Solic_Lab set Aprobada=@Aprobada,Cancelada=@Cancelada where IdPrestLab=@IdPrestLab", con);
                    cmd.Parameters.AddWithValue("@IdPrestLab", val);
                    cmd.Parameters.Add("@Aprobada", SqlDbType.Bit).Value = 0;
                    cmd.Parameters.Add("@Cancelada", SqlDbType.Bit).Value = 1;
                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        EnviarMensaje();
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
        #endregion
    }
}