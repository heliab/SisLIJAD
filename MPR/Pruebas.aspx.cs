using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web.ASPxGridView;

namespace SisLIJAD.MPR
{
    public partial class Pruebas : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("Select IdPrueba,NomPrueba,DescPrueba,Duracion,IdUbicacion,Precio,IdTipoPrueba from MPR_Prueba where IdPrueba= @IdPrueba", con);
                // SqlCommand cmd = new SqlCommand("Select IdPrueba,NomPrueba,DescPrueba,Precio,IdTipoPrueba from MPR_Prueba where IdPrueba= @IdPrueba", con);
                cmd.Parameters.AddWithValue("@IdPrueba", txtId.Text);

                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["IdPrueba"].ToString();
                    txtNom.Text = dr["NomPrueba"].ToString();
                    memoDesc.Value = dr["DescPrueba"].ToString();
                    sCant.Value = dr["Duracion"];
                    cmbUbic.Text = dr["IdUbicacion"].ToString();
                    sPrecio.Value = dr["Precio"].ToString();
                    cmbTipoPr.Text = dr["IdTipoPrueba"].ToString();
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
                SqlCommand cmd = new SqlCommand("insert into MPR_Prueba(NomPrueba,DescPrueba,Duracion,IdUbicacion,Precio,IdTipoPrueba) values(@NomPrueba,@DescPrueba,@Duracion,@IdUbicacion,@Precio,@IdTipoPrueba)", con);
                cmd.Parameters.AddWithValue("@NomPrueba", txtNom.Text);
                cmd.Parameters.AddWithValue("@DescPrueba", memoDesc.Text);
                cmd.Parameters.AddWithValue("@Duracion", sCant.Value);
                cmd.Parameters.AddWithValue("@IdUbicacion", cmbUbic.Value);
                cmd.Parameters.AddWithValue("@Precio", sPrecio.Value);
                cmd.Parameters.AddWithValue("@IdTipoPrueba", cmbTipoPr.Value);


                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {
                    //Response.Write("<script>alert('" + Server.HtmlEncode("El tipo " + txtDesc.Text + " se ha guardado correctamente") + "')</script>");

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
                SqlCommand cmd = new SqlCommand("update MPR_Prueba set NomPrueba=@NomPrueba,DescPrueba=@DescPrueba,Duracion=@Duracion,IdUbicacion=@IdUbicacion,Precio=@Precio,IdTipoPrueba=@IdTipoPrueba where IdPrueba = @IdPrueba", con);
                cmd.Parameters.AddWithValue("@IdPrueba", txtId.Text);
                cmd.Parameters.AddWithValue("@NomPrueba", txtNom.Text);
                cmd.Parameters.AddWithValue("@DescPrueba", memoDesc.Text);
                cmd.Parameters.AddWithValue("@Duracion", sCant.Value);
                cmd.Parameters.AddWithValue("@IdUbicacion", cmbUbic.Value);
                cmd.Parameters.AddWithValue("@Precio", sPrecio.Value);
                cmd.Parameters.AddWithValue("@IdTipoPrueba", cmbTipoPr.Value);

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
                SqlCommand cmd = new SqlCommand("delete from MPR_Prueba where IdPrueba = @IdPrueba", con);
                cmd.Parameters.AddWithValue("@IdPrueba", txtIdD.Text);
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