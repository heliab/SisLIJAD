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
    public partial class Materiales : System.Web.UI.Page
    {
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
                //SqlCommand cmd = new SqlCommand("Select * from MPR_EquipMaquin where IdMaterial= @IdMaterial", con);
                SqlCommand cmd = new SqlCommand("SELECT  IdMaterial, CodUCA, NomMaterial, IdUnidad, Marca  FROM dbo.MINV_Materiales WHERE (IdMaterial = @IdMaterial)", con);
                cmd.Parameters.AddWithValue("@IdMaterial", txtId.Text);
                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["IdMaterial"].ToString();
                    txtCodUCA.Text = dr["CodUCA"].ToString();
                    txtNomMat.Text = dr["NomMaterial"].ToString();
                    cmbUdM.Value = dr["IdUnidad"].ToString();
                    txtMarca.Text = dr["Marca"].ToString();
                    //chkPrest.Checked = Convert.ToBoolean(dr["Prestamo"]);
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

            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into MINV_Materiales (CodUCA, NomMaterial, IdUnidad, Marca) values(@CodUCA, @NomMaterial, @IdUnidad, @Marca)", con);
                cmd.Parameters.AddWithValue("@CodUCA", txtCodUCA.Text);
                cmd.Parameters.AddWithValue("@NomMaterial", txtNomMat.Text);
                cmd.Parameters.AddWithValue("@IdUnidad", cmbUdM.Value);
                cmd.Parameters.AddWithValue("@Marca", txtMarca.Text);
                //cmd.Parameters.AddWithValue("@Prestamo", chkPrest.Checked ? 1 : 0);
                //cmd.Parameters["@Prestamo"].Value = chkPrest.Checked ? 1 : 0;

                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {
                    //Response.Write("<script>alert('" + Server.HtmlEncode("El equipo " + + " se ha guardado correctamente") + "')</script>");

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



        }
        protected void Update()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update MINV_Materiales set CodUCA=@CodUCA,NomMaterial=@NomMaterial,IdUnidad=@IdUnidad,Marca=@Marca where IdMaterial = @IdMaterial", con);
                cmd.Parameters.AddWithValue("@IdMaterial", txtId.Text);
                cmd.Parameters.AddWithValue("@CodUCA", txtCodUCA.Text);
                cmd.Parameters.AddWithValue("@NomMaterial", txtNomMat.Text);
                cmd.Parameters.AddWithValue("@IdUnidad", cmbUdM.Value);
                cmd.Parameters.AddWithValue("@Marca", txtMarca.Text);
                //cmd.Parameters.AddWithValue("@Prestamo", chkPrest.Checked ? 1 : 0);


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
                SqlCommand cmd = new SqlCommand("delete from MINV_Materiales where IdMaterial = @IdMaterial", con);
                cmd.Parameters.AddWithValue("@IdMaterial", txtIdD.Text);
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