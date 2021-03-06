﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace SisLIJAD.Account
{
    public partial class Register : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false /* createPersistentCookie */);

         }

        protected void RegisterUser_SendingMail(object sender, MailMessageEventArgs e)
        {
            SmtpClient email = new SmtpClient();
            email.EnableSsl = true;
            email.Send(e.Message);
            e.Cancel = true;


            string continueUrl = RegisterUser.ContinueDestinationPageUrl;
            if (String.IsNullOrEmpty(continueUrl))
            {
                continueUrl = "~/Perfil/Perfil.aspx";
            }
            Response.Redirect(continueUrl);
        }
    }
}
