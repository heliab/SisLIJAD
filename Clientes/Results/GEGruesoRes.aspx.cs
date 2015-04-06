using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web.ASPxGridView;

namespace SisLIJAD.Clientes.Results
{
    public partial class GEGruesoRes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GridResultados_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridResultados.DataBind();
            GridResultados.Focus();
        }

    }
}