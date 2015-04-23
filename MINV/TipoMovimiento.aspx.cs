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
    public partial class TipoMovimiento : System.Web.UI.Page
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
                //SqlCommand cmd = new SqlCommand("Select * from MINV_Tipo_Mov where IdTipoMov= @IdTipoMov", con);
                SqlCommand cmd = new SqlCommand("SELECT  * FROM MINV_Tipo_Mov WHERE  (IdTipoMov = @IdTipoMov)", con);
                cmd.Parameters.AddWithValue("@IdTipoMov", txtId.Text);
                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["IdTipoMov"].ToString();
                    txtNomMov.Text = dr["DescMov"].ToString();

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
                SqlCommand cmd = new SqlCommand("insert into MINV_Tipo_Mov (DescMov) values(@DescMov)", con);
                cmd.Parameters.AddWithValue("@DescMov", txtNomMov.Text);

                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El tipo de movimiento " + txtNomMov.Text + " se ha guardado correctamente") + "')</script>");

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
                SqlCommand cmd = new SqlCommand("update MINV_Tipo_Mov set DescMov=@DescMov where IdTipoMov = @IdTipoMov", con);
                cmd.Parameters.AddWithValue("@IdTipoMov", txtId.Text);
                cmd.Parameters.AddWithValue("@DescMov", txtNomMov.Text);

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
                SqlCommand cmd = new SqlCommand("delete from MINV_Tipo_Mov where IdTipoMov = @IdTipoMov", con);
                cmd.Parameters.AddWithValue("@IdTipoMov", txtIdD.Text);
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

        #region subcrud
        
         protected void SubSelect()
         {
             SqlConnection con = new SqlConnection(Database.ConnectionString);
             try
             {
                 con.Open();
                 //SqlCommand cmd = new SqlCommand("Select * from MINV_Tipo_Mov where IdTipoMov= @IdTipoMov", con);
                 SqlCommand cmd = new SqlCommand("SELECT  IdSubMov,DescSubMov FROM MINV_Sub_Mov WHERE  (IdSubMov = @IdSubMov)", con);
                 cmd.Parameters.AddWithValue("@IdSubMov", txtSubId.Text);
                 //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                 SqlDataReader dr = cmd.ExecuteReader();
                 if (dr.Read())
                 {
                     // display data in textboxes
                     txtSubId.Text = dr["IdSubMov"].ToString();
                     txtSubMov.Text = dr["DescSubMov"].ToString();

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

         protected void SubInsert()
         {
             string IdValue = HiddenV.Get("Session").ToString();

             SqlConnection con = new SqlConnection(Database.ConnectionString);
             try
             {
                 con.Open();
                 SqlCommand cmd = new SqlCommand("insert into MINV_Sub_Mov (DescSubMov,IdTipoMov) values(@DescSubMov,@IdTipoMov)", con);
                 cmd.Parameters.AddWithValue("@DescSubMov", txtSubMov.Text);
                 cmd.Parameters.AddWithValue("@IdTipoMov", IdValue);

                 int count = cmd.ExecuteNonQuery();
                 if (count == 1)
                 {
                     Response.Write("<script>alert('" + Server.HtmlEncode("El tipo de movimiento " + txtNomMov.Text + " se ha guardado correctamente") + "')</script>");

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
         protected void SubUpdate()
         {
             SqlConnection con = new SqlConnection(Database.ConnectionString);
             try
             {
                 con.Open();
                 SqlCommand cmd = new SqlCommand("update MINV_Sub_Mov set DescSubMov=@DescSubMov where IdSubMov = @IdSubMov", con);
                 cmd.Parameters.AddWithValue("@IdSubMov", txtSubId.Text);
                 cmd.Parameters.AddWithValue("@DescSubMov", txtSubMov.Text);

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
         protected void SubDelete()
         {
             SqlConnection con = new SqlConnection(Database.ConnectionString);
             try
             {
                 con.Open();
                 SqlCommand cmd = new SqlCommand("delete from MINV_Sub_Mov where IdSubMov = @IdSubMov", con);
                 cmd.Parameters.AddWithValue("@IdSubMov", txtIdD.Text);
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
         #region Subcallback
         protected void SubFillingCallback_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
         {
             SubSelect();
         }
         protected void SubGrid_BeforePerformDataSelect(object sender, EventArgs e)
         {
             Session["IdTipoMov"] = (sender as ASPxGridView).GetMasterRowKeyValue();
         }
        #endregion


    }
}