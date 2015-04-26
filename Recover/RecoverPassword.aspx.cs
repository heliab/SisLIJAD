using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace SisLIJAD.Account
{
    public partial class RecoverPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void PasswordRecovery1_SendingMail(object sender, MailMessageEventArgs e)
        {
            SmtpClient email = new SmtpClient();
            email.EnableSsl = true;
            email.Send(e.Message);
            e.Cancel = true;


            //MailMessage mail = new MailMessage();
            //SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

            //SmtpServer.Port = 587;
            //SmtpServer.Credentials = new System.Net.NetworkCredential("SisLijad@gmail.com", "administracion2015");
            //SmtpServer.EnableSsl = true;
            //SmtpServer.Send(e.Message);




            //SmtpClient email = new SmtpClient();
            //SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
            //SmtpServer.Port = 587;
            //SmtpServer.Credentials = new System.Net.NetworkCredential("SisLijad@gmail.com", "administracion2015");
            //email.EnableSsl = true;
            //email.Send(e.Message);
            //e.Cancel = true;



        }
    }
}