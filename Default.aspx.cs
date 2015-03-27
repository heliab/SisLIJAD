using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace SisLIJAD
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                if (Roles.IsUserInRole("Clientes"))
                {
                    Response.Redirect("~/Clientes/CrearSolicitudes.aspx");
                }
                if (Roles.IsUserInRole("Tecnico"))
                {
                    Response.Redirect("~/Tecnicos/SolicitudesAsignadas.aspx");
                }
                if (Roles.IsUserInRole("Administrador"))
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
        }
    }
}
