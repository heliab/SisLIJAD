using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web.ASPxGridView;

namespace SisLIJAD.MINV
{
    public partial class TipoUbicaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Callbacks

        protected void GridPrincipal_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridPrincipal.DataBind();
            GridPrincipal.Focus();
        }

        protected void NewCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            string valNuevo = HiddenV.Get("Nuevo").ToString();
                     
           switch (valNuevo) {
               case "0": Insert();
                         GridPrincipal.DataBind();
                         break;
               case "1": Update();
                         GridPrincipal.DataBind();
                         break;
               case "2": Delete();
                         GridPrincipal.DataBind();
                         break;
               default: Response.Write("Error con valor de crud");
                         break;
           
           }
            HiddenV.Clear();

        }

     
        protected void FillingCallback_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            Select();
        }

        #endregion


        #region CRUD
        protected void Select()
        {
            //string value = HiddenV.Get("GridId").ToString();
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from MINV_Tipo_Ubic where IdTipoUb= @IdTipoUb", con);
                cmd.Parameters.AddWithValue("@IdTipoUb", txtId.Text);

                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["IdTipoUb"].ToString();
                    txtUbic.Text = dr["DescTipoUB"].ToString();
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
                SqlCommand cmd = new SqlCommand("insert into MINV_Tipo_Ubic(DescTipoUB) values(@DescTipoUB)", con);
                cmd.Parameters.AddWithValue("@DescTipoUB", txtUbic.Text);
               
                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("La ubicacion " + txtUbic.Text + " se ha guardado correctamente") + "')</script>");
                }
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
                SqlCommand cmd = new SqlCommand("update MINV_Tipo_Ubic set DescTipoUB=@DescTipoUB where IdTipoUb = @IdTipoUb", con);
                cmd.Parameters.AddWithValue("@IdTipoUb", txtId.Text);
                cmd.Parameters.AddWithValue("@DescTipoUB", txtUbic.Text);
                

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
                SqlCommand cmd = new SqlCommand("delete from MINV_Tipo_Ubic where IdTipoUb = @IdTipoUb", con);
                cmd.Parameters.AddWithValue("@IdTipoUb", txtIdD.Text);
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

       


        
    }
}