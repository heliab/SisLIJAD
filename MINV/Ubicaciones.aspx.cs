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
    public partial class Ubicaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Callbacks

        protected void SubGrid_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["IdUbicacion"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
        protected void GridPrincipal_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridPrincipal.DataBind();
            GridPrincipal.Focus();
        }

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
                case "3": SubInsert();
                    break;
                case "4": SubUpdate();
                    break;
                case "5": SubDelete();
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
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from MINV_Ubicaciones where IdUbicacion= @IdUbicacion", con);
                cmd.Parameters.AddWithValue("@IdUbicacion", txtId.Text);

                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["IdUbicacion"].ToString();
                    txtUbic.Text = dr["DescUbicacion"].ToString();
                    cmbTipoUbic.Value = dr["IdTipoUb"].ToString();
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
                SqlCommand cmd = new SqlCommand("insert into MINV_Ubicaciones(DescUbicacion,IdTipoUb) values(@DescUbicacion,@IdTipoUb)", con);
                cmd.Parameters.AddWithValue("@DescUbicacion", txtUbic.Text);
                cmd.Parameters.AddWithValue("@IdTipoUb", cmbTipoUbic.Value);
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
                SqlCommand cmd = new SqlCommand("update MINV_Ubicaciones set DescUbicacion=@DescUbicacion, IdTipoUb=@IdTipoUb where IdUbicacion = @IdUbicacion", con);
                cmd.Parameters.AddWithValue("@IdUbicacion", txtId.Text);
                cmd.Parameters.AddWithValue("@DescUbicacion", txtUbic.Text);
                cmd.Parameters.AddWithValue("@IdTipoUb", cmbTipoUbic.Value);


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
                SqlCommand cmd = new SqlCommand("delete from MINV_Ubicaciones where IdUbicacion = @IdUbicacion", con);
                cmd.Parameters.AddWithValue("@IdUbicacion", txtIdD.Text);
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

        #region Subcallbacks
        protected void SubFillingCallback_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            SubSelect();
        }

        //protected void cmbUbic_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        //{
        //    Session["IdUb"] = HiddenV.Get("Session").ToString();
        //    cmbUbic.DataBind();
        //}

        #endregion

        #region SubDRUD
        protected void SubSelect() {

            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT CAST(IdUbicacion AS NVARCHAR) + '.' + CAST(IdUbicEspec AS NVARCHAR) AS IdEspec, EspecUbic, IdUbicacion FROM MINV_Ubic_Espec WHERE (CAST(IdUbicacion AS NVARCHAR) + '.' + CAST(IdUbicEspec AS NVARCHAR) = @IdEspec)", con);
                cmd.Parameters.AddWithValue("@IdEspec", txtSubId.Text);

                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtSubId.Text = dr["IdEspec"].ToString();
                    txtUbicEs.Text = dr["EspecUbic"].ToString();
                   // cmbUbic.Value = dr["IdUbicacion"].ToString();
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
        protected void SubInsert() {
           string idub= HiddenV.Get("Session").ToString();
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into MINV_Ubic_Espec(EspecUbic,IdUbicacion) values(@EspecUbic,@IdUbicacion)", con);
                cmd.Parameters.AddWithValue("@EspecUbic", txtUbicEs.Text);
                cmd.Parameters.AddWithValue("@IdUbicacion", idub);
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
        protected void SubUpdate() {
            string idub = HiddenV.Get("Session").ToString();
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE MINV_Ubic_Espec set EspecUbic=@EspecUbic, IdUbicacion=@IdUbicacion where (CAST(IdUbicacion AS NVARCHAR) + '.' + CAST(IdUbicEspec AS NVARCHAR) = @IdEspec)", con);
                cmd.Parameters.AddWithValue("@IdEspec", txtSubId.Text);
                cmd.Parameters.AddWithValue("@EspecUbic", txtUbicEs.Text);
                cmd.Parameters.AddWithValue("@IdUbicacion", idub);


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
        protected void SubDelete() {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from MINV_Ubic_Espec WHERE (CAST(IdUbicacion AS NVARCHAR) + '.' + CAST(IdUbicEspec AS NVARCHAR) = @IdEspec)", con);
                cmd.Parameters.AddWithValue("@IdEspec", txtIdD.Text);
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