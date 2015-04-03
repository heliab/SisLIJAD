using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web.ASPxGridView;

namespace SisLIJAD.Tecnicos
{
    public partial class EntregaMaterialesPrestamo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void NewCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            string valNuevo = HiddenV.Get("Nuevo").ToString();

            switch (valNuevo)
            {
                case "7":EntregaDevol();
                    break;
                default: Response.Write("Error con valor de crud");
                    break;

            }
            HiddenV.Clear();
        }
        protected void EntregaDevol() {
            string val = HiddenV.Get("SubGridId").ToString();
            string estado = HiddenV.Get("Prestado").ToString();
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                if (estado == "1")
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE MINV_Det_Prestamo set Prestado=@Prestado where CAST(MINV_Det_Prestamo.IdDetPrest AS NVARCHAR) + '.' + CAST(MINV_Det_Prestamo.IdPrestamo AS NVARCHAR) + '.' + CAST(MINV_Det_Prestamo.IdMaterial AS NVARCHAR)=@CodDetalle", con);
                    cmd.Parameters.AddWithValue("@CodDetalle", val);
                    cmd.Parameters.Add("@Prestado", SqlDbType.Bit).Value = 0;
                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        Response.Write("<script>alert('" + Server.HtmlEncode("El registro se ha sido aprobadp") + "')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('" + Server.HtmlEncode("El registro no se ha podido aprobar") + "')</script>");
                    }
                }
                else
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE MINV_Det_Prestamo set Prestado=@Prestado where  CAST(MINV_Det_Prestamo.IdDetPrest AS NVARCHAR) + '.' + CAST(MINV_Det_Prestamo.IdPrestamo AS NVARCHAR) + '.' + CAST(MINV_Det_Prestamo.IdMaterial AS NVARCHAR)=@CodDetalle", con);
                    cmd.Parameters.AddWithValue("@CodDetalle", val);
                    cmd.Parameters.Add("@Prestado", SqlDbType.Bit).Value = 1;
                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        Response.Write("<script>alert('" + Server.HtmlEncode("El registro se ha sido aprobadp") + "')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('" + Server.HtmlEncode("El registro no se ha podido aprobar") + "')</script>");
                    }
                }
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
        protected void SubGrid_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["IdPrestamo"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
        protected void ASPxGridView1_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["IdPrestamo"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
        protected void ASPxGridView2_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["IdPrestamo"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
        protected void GridPrincipal_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridPrincipal.DataBind();
            GridPrincipal.Focus();
        }
    }
}