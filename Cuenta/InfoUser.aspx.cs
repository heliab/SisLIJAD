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

            StatusMessage.Text = "El estado de apribado ha sido actualizado.";
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
    }
}