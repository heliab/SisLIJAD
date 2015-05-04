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

             if (Roles.IsUserInRole("Tecnico"))
            {
                Response.Redirect("~/Tecnicos/Default.aspx");
            }
            if (Roles.IsUserInRole("Clientes"))
            {
                Response.Redirect("~/Clientes/Default.aspx");
            }

            if (Roles.IsUserInRole("PEUCA"))
            {
                Response.Redirect("~/PEUCA/Default.aspx");
            }
            if (Roles.IsUserInRole("Administrador"))
            {
                LinkHome.Visible = true;
                LinkInventarios.Visible = true;
                LinkPrueba.Visible = true;
                LinkCompra.Visible = true;
                LinkCuenta.Visible = true;
                LinkTecnico.Visible = true;
                LinkClientes.Visible = true;
                LinkUCA.Visible = true;
            }
            else {
                Response.Write("<script>alert('" + Server.HtmlEncode("Aun no tiene asignado ningun permiso de usuario. Estamos trabajando en la autorizacion de su perfil. Por favor intente mas tarde") + "')</script>");
                Response.Redirect("Default.aspx");
            }
        }
    }
}