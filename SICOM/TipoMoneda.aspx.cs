using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web.ASPxGridView;

namespace SisLIJAD.SICOM
{
    public partial class TipoMoneda : System.Web.UI.Page
    {
        string mens;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region CRUD
        protected void Select()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from MSCOMP_Tipo_Moneda where IdTipoMoneda= @IdTipoMoneda", con);
                cmd.Parameters.AddWithValue("@IdTipoMoneda", txtId.Text);
                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["IdTipoMoneda"].ToString();
                    txtDesc.Text = dr["DescTipoM"].ToString();
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
        protected string Insert()
        {

            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into MSCOMP_Tipo_Moneda(DescTipoM) values(@DescTipoM)", con);
                cmd.Parameters.AddWithValue("@DescTipoM", txtDesc.Text);


                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {
                    //Response.Write("<script>alert('" + Server.HtmlEncode("El tipo " + txtDesc.Text + " se ha guardado correctamente") + "')</script>");
                    mens = "Exito";
                }
                else
                    Response.Write("<script>alert('" + Server.HtmlEncode("Error al guardar los datos, revise los datos del formulario") + "')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(ex.ToString()) + "')</script>");
            }
            finally
            {
                con.Close();
            }
            return mens;
        }
        protected void Update()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update MSCOMP_Tipo_Moneda set DescTipoM=@DescTipoM where IdTipoMoneda = @IdTipoMoneda", con);
                cmd.Parameters.AddWithValue("@IdTipoMoneda", txtId.Text);
                cmd.Parameters.AddWithValue("@DescTipoM", txtDesc.Text);


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
                SqlCommand cmd = new SqlCommand("delete from MSCOMP_Tipo_Moneda where IdTipoMoneda = @IdTipoMoneda", con);
                cmd.Parameters.AddWithValue("@IdTipoMoneda", txtIdD.Text);
                if (cmd.ExecuteNonQuery() == 1)
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El registro se ha sido eliminado") + "')</script>");
                }
                else
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El registro no se ha podido eliminar") + "')</script>");
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
        #endregion

        #region Callbacks
        protected void NewCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            string valNuevo = HiddenV.Get("Nuevo").ToString();

            switch (valNuevo)
            {
                case "0": Insert();
                    GridPrincipal.DataBind();
                    break;
                case "1": Update();
                    GridPrincipal.DataBind();
                    break;
                case "2": Delete();
                    break;
                default: Response.Write("Error con valor de crud");
                    break;

            }
            HiddenV.Clear();
        }
        protected void GridPrincipal_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridPrincipal.DataBind();
            GridPrincipal.Focus();
        }
        protected void FillingCallback_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            Select();
        }
        #endregion

          }
}