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
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region checkauthentication
            //if (User.Identity.IsAuthenticated)
            //{
            //if (!Page.IsPostBack) {
               
            //        if (!Roles.IsUserInRole("Administrador") || !Roles.IsUserInRole("Tecnico") || !Roles.IsUserInRole("Clientes") || !Roles.IsUserInRole("PEUCA"))
            //        {
            //            Response.Write("<script>alert('" + Server.HtmlEncode("Aún no tiene asignado ningún permiso de usuario. Estamos trabajando en la autorización de su perfil. Por favor intente más tarde") + "')</script>");
            //        }
            //    }
            //}
            #endregion
        }
    }
}
