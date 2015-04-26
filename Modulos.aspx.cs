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

namespace SisLIJAD
{
    public partial class Modulos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Roles.IsUserInRole("Administrador"))
            {
                Response.Write("<script>alert('" + Server.HtmlEncode("Hola Tecnico") + "')</script>");
                //Response.Redirect("Default.aspx");
            }
        }
    }
}