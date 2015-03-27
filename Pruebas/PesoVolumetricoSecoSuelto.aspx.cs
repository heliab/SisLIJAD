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
    public partial class PesoVolumetricoSecoSuelto : System.Web.UI.Page
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
                case "-1": CalcularPVSS_V();
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
                SqlCommand cmd = new SqlCommand("Select * from MPR_Det_Result_Prueba where IdTipoUb= @IdTipoUb", con);
                cmd.Parameters.AddWithValue("@IdTipoUb", txtId.Text);

                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["IdTipoUb"].ToString();
                    //txtUbic.Text = dr["DescTipoUB"].ToString();
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
                SqlCommand cmd = new SqlCommand("insert into MPR_Det_Result_Prueba(FechaEmisionIndiv,C29_G,C29_T,C29_V,"+ 
               "C29_M_Result) values(@FechaEmisionIndiv,@C29_G,@C29_T,@C29_V,@C29_M_Result)", con);
                cmd.Parameters.AddWithValue("@FechaEmisionIndiv", DateTime.Now);
                cmd.Parameters.AddWithValue("@C29_G", sG.Value);
                cmd.Parameters.AddWithValue("@C29_T", sT.Value);
                cmd.Parameters.AddWithValue("@C29_V", sV.Value);
                cmd.Parameters.AddWithValue("@C29_M_Result", txtResult.Text);
                
                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {
                   // Response.Write("<script>alert('" + Server.HtmlEncode("La ubicacion " + txtUbic.Text + " se ha guardado correctamente") + "')</script>");
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
                SqlCommand cmd = new SqlCommand("update MPR_Det_Result_Prueba set DescTipoUB=@DescTipoUB where IdTipoUb = @IdTipoUb", con);
                cmd.Parameters.AddWithValue("@IdTipoUb", txtId.Text);
              //  cmd.Parameters.AddWithValue("@DescTipoUB", txtUbic.Text);


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
                SqlCommand cmd = new SqlCommand("delete from MPR_Det_Result_Prueba where IdTipoUb = @IdTipoUb", con);
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


        #region formnulas
        protected void CalcularPVSS_V() 
        {
            float G = Convert.ToInt32(sG.Text);
            float S = Convert.ToInt32(sT.Text);
            float V = Convert.ToInt32(sV.Text);
            float suma = G - S;
            float division = suma / V;
            txtResult.Text = Convert.ToString(division);
        }
        #endregion
    }
}