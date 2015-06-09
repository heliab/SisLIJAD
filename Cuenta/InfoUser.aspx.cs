using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;
using System.Data.SqlClient;

namespace SisLIJAD.Cuenta
{
    public partial class InfoUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // If querystring value is missing, send the user to ManageUsers.aspx
                string userName = Request.QueryString["user"];
                if (string.IsNullOrEmpty(userName))
                    Response.Redirect("ManageUser.aspx");


                // Get information about this user
                MembershipUser usr = Membership.GetUser(userName);
                if (usr == null)
                    Response.Redirect("ManageUser.aspx");

                UserNameLabel.Text = usr.UserName;
                IsApproved.Checked = usr.IsApproved;

                if (usr.LastLockoutDate.Year < 2000)
                    LastLockoutDateLabel.Text = string.Empty;
                else
                    LastLockoutDateLabel.Text = usr.LastLockoutDate.ToShortDateString();

                UnlockUserButton.Enabled = usr.IsLockedOut;
            }
        }

        protected void IsApproved_CheckedChanged(object sender, EventArgs e)
        {
            // Toggle the user's approved status
            string userName = Request.QueryString["user"];
            MembershipUser usr = Membership.GetUser(userName);
            usr.IsApproved = IsApproved.Checked;
            Membership.UpdateUser(usr);
            if (IsApproved.Checked == true)
            {
                EnviarMensaje();
            }
            StatusMessage.Text = "El estado de aprobado ha sido actualizado.";
        }

        protected void UnlockUserButton_Click(object sender, EventArgs e)
        {
            // Unlock the user account
            string userName = Request.QueryString["user"];
            MembershipUser usr = Membership.GetUser(userName);
            usr.UnlockUser();

            UnlockUserButton.Enabled = false;
            StatusMessage.Text = "La cuenta de usuario ha sido desbloqueada.";
        }

        protected void bntDelete_Click(object sender, EventArgs e)
        {
            Membership.DeleteUser(UserNameLabel.Text,true);
            StatusMessage.Text = "La cuenta de usuario ha sido borrada.";
            //Este codigo es para redirigir al usuario a loginpage y cerrar sesion
            //FormsAuthentication.SignOut();
            //FormsAuthentication.RedirectToLoginPage();
        }
        #region Mensaje
        protected void EnviarMensaje(){
         string userName = Request.QueryString["user"];

        SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                //SqlCommand cmd = new SqlCommand("Select * from MINV_Prestamos where IdPrestamo= @IdPrestamo", con);
                //Mail membership
                SqlCommand cmd = new SqlCommand("SELECT     dbo.aspnet_Membership.Email FROM  dbo.aspnet_Membership INNER JOIN  dbo.aspnet_Users ON dbo.aspnet_Membership.UserId = dbo.aspnet_Users.UserId INNER JOIN dbo.USER_Entidad ON dbo.aspnet_Users.UserName = dbo.USER_Entidad.username  where dbo.aspnet_Users.UserName=@username", con);
                cmd.Parameters.AddWithValue("@username", userName);
                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    string getemail = dr["Email"].ToString();

                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                mail.From = new MailAddress("sislijad@gmail.com", "Alerta del sistema");
                mail.To.Add(getemail);
                mail.Subject = "Aprobacion de Usuario";

                mail.IsBodyHtml = true;
                string htmlBody;

                htmlBody = "<div style='width:100;height:34px;background-color:#3B71B8'><h2 style='text-align: center;'><span style='color:#FAFAFA;'>Notificacion SISLIJAD</span></h2></div><p>Saludos,<br> <br>Su usuario ha sido aprobado en el sistema. Desde ahora puede acceder a SISLIJAD.</p><p>Gracias!,</p><br><div style='width:100;height:25px;background-color:#3B71B8'><h4 style='text-align: center;'><span style='color:#FAFAFA;'>Copyrights © Sislijad 2015</span></h4></div>";

                mail.Body = htmlBody;

                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential("SisLijad@gmail.com", "administracion2015");
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);
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
        #endregion
     }
}