using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web.ASPxGridView;

namespace SisLIJAD.Pruebas
{
    public partial class GEssFino : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #region Callbacks
        protected void GridResultados_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridResultados.DataBind();
            GridResultados.Focus();
        }

        protected void NewCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            string valNuevo = HiddenV.Get("Nuevo").ToString();

            switch (valNuevo)
            {
                case "0": Insert();
                    break;
                case "1": Update();
                    break;
                case "2": Delete();
                    break;
                default: Response.Write("Error con valor de crud");
                    break;

            }
            HiddenV.Clear();

        }
        protected void FillingCallback_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            string value = HiddenV.Get("Fill").ToString();
            switch (value)
            {
                case "0": Select();
                    break;
                case "1": CalGravEspecSatSec();
                    break;
                default: Response.Write("Error en fillingcallback");
                    break;
            }

        }
        #endregion

        #region CRUD
        protected void Select()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select CAST(IdSolicPrueba AS NVARCHAR) + '.' + CAST(IdPrueba AS NVARCHAR) + '.' + CAST(IdCalc AS NVARCHAR) as Codigo,C128_B_Gess,C128_C_Gess,C128_S_Gess from MPR_Det_Result_Prueba where CAST(IdSolicPrueba AS NVARCHAR) + '.' + CAST(IdPrueba AS NVARCHAR) + '.' + CAST(IdCalc AS NVARCHAR) = @Codigo", con);
                cmd.Parameters.AddWithValue("@Codigo", txtId.Text);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["Codigo"].ToString();
                    sB.Text = dr["C128_B_Gess"].ToString();
                    sC.Text = dr["C128_C_Gess"].ToString();
                    sS.Text = dr["C128_S_Gess"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("Error al recuperar la informacion") + "')</script>");

                }
                dr.Close();
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
        protected void Insert()
        {
            string Sol = Request.QueryString["Sol"];
            string Pr = Request.QueryString["Pr"];
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into MPR_Det_Result_Prueba(IdSolicPrueba,IdPrueba,FechaEmisionIndiv,C128_B_Gess," +
               "C128_C_Gess,C128_S_Gess,C128_SSD_Gess_Result) values(@IdSolicPrueba,@IdPrueba,@FechaEmisionIndiv,@C128_B_Gess,@C128_C_Gess,@C128_S_Gess,@C128_SSD_Gess_Result)", con);
                cmd.Parameters.AddWithValue("@IdSolicPrueba", Sol);
                cmd.Parameters.AddWithValue("@IdPrueba", Pr);
                cmd.Parameters.AddWithValue("@FechaEmisionIndiv", DateTime.Now);
                cmd.Parameters.AddWithValue("@C128_B_Gess", sB.Value);
                cmd.Parameters.AddWithValue("@C128_C_Gess", sC.Value);
                cmd.Parameters.AddWithValue("@C128_S_Gess", sS.Value);
                cmd.Parameters.AddWithValue("@C128_SSD_Gess_Result", txtResult.Text);

                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {}
                else
                    Response.Write("<script>alert('" + Server.HtmlEncode("Error al guardar los datos, revise los datos del formulario") + "')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(ex.ToString()) + "')</script>");
                Response.Write("<script>alert(\"an error occur\")</script>");
            }
            finally
            {
                con.Close();
            }
        }
        protected void Update()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update MPR_Det_Result_Prueba set FechaEmisionIndiv=@FechaEmisionIndiv,C128_B_Gess=@C128_B_Gess,C128_C_Ge=@C128_C_Gess,C128_S_Gess=@C128_S_Gess,C128_SSD_Gess_Result=@C128_SSD_Gess_Result where CAST(IdSolicPrueba AS NVARCHAR) + '.' + CAST(IdPrueba AS NVARCHAR) + '.' + CAST(IdCalc AS NVARCHAR) = @codigo", con);
                cmd.Parameters.AddWithValue("@codigo", txtId.Text);
                cmd.Parameters.AddWithValue("@FechaEmisionIndiv", DateTime.Now);
                cmd.Parameters.AddWithValue("@C128_B_Gess", sB.Value);
                cmd.Parameters.AddWithValue("@C128_C_Gess", sC.Value);
                cmd.Parameters.AddWithValue("@C128_S_Gess", sS.Value);
                cmd.Parameters.AddWithValue("@C128_SSD_Gess_Result", txtResult.Text);

                if (cmd.ExecuteNonQuery() == 1)
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El registro se ha actualizado correctamente") + "')</script>");
                }
                else
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("Los datos no se han actalizado") + "')</script>");
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
        protected void Delete()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from MPR_Det_Result_Prueba where CAST(IdSolicPrueba AS NVARCHAR) + '.' + CAST(IdPrueba AS NVARCHAR) + '.' + CAST(IdCalc AS NVARCHAR) = @codigo", con);
                cmd.Parameters.AddWithValue("@codigo", txtIdD.Text);
                if (cmd.ExecuteNonQuery() == 1)
                {
                    Response.Write("<script>confirm('" + Server.HtmlEncode("El registro se ha sido eliminado") + "')</script>");
                }
                else
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El registro no se ha podido eliminar") + "')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(ex.ToString()) + "')</script>");
                Response.Write("<script>alert(\"an error occur\")</script>");
            }
            finally
            {
                con.Close();
            }

        }
        #endregion

        #region formulas
        protected void CalGravEspecSatSec()
        {
            double B = Convert.ToDouble(sB.Text);
            double C = Convert.ToDouble(sC.Text);
            double S = Convert.ToDouble(sS.Text);
            double resultado = S / (B + S - C);
            txtResult.Text = Convert.ToString(resultado);
        }
        #endregion
    }
}