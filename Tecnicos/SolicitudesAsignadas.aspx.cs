using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web.ASPxGridView;
using System.Web.Security;


namespace SisLIJAD.Tecnicos
{
    public partial class SolicitudesAsignadas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubGrid_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["IdSolicPrueba"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void NewCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            Session["IdDetalle"] = HiddenV.Get("IdDetalle").ToString();
            Session["IdPrueba"] = HiddenV.Get("IdPrueba").ToString();
            string IdPrueba= HiddenV.Get("IdPrueba").ToString();
            switch (IdPrueba) {
                case "1": Response.Redirect("~/Pruebas/");
                    break;
                default: Response.Write("Error con ID PRueba");
                    break;
            }

          
        }

        protected void GridPrincipal_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridPrincipal.DataBind();
        }

        protected void SubGrid2_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["IdSolicPrueba"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

       
    }
}