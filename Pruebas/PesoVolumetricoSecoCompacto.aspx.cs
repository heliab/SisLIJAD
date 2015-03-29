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
    public partial class PesoVolumetricoSecoCompacto : System.Web.UI.Page
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
        protected void GridResultados2_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            GridResultados2.DataBind();
            GridResultados2.Focus();
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
                case "3": Insert2();
                    break;
                case "4": Update2();
                    break;
                case "5": Delete2();
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
                case "1": CalcularPVSC_V();
                    break;
                default: Response.Write("Error en fillingcallback");
                    break;
            }

        }
        protected void FillingCallback2_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            string value = HiddenV.Get("Fill").ToString();
            switch (value)
            {
                case "0": Select2();
                    break;
                case "1": CalcularPVSC_F();
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
                SqlCommand cmd = new SqlCommand("Select CAST(IdSolicPrueba AS NVARCHAR) + '.' + CAST(IdPrueba AS NVARCHAR) + '.' + CAST(IdCalc AS NVARCHAR) as Codigo,C29_G,C29_T,C29_V from MPR_Det_Result_Prueba where CAST(IdSolicPrueba AS NVARCHAR) + '.' + CAST(IdPrueba AS NVARCHAR) + '.' + CAST(IdCalc AS NVARCHAR) = @Codigo", con);
                cmd.Parameters.AddWithValue("@Codigo", txtId.Text);


                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["Codigo"].ToString();
                    sG.Text = dr["C29_G"].ToString();
                    sT.Text = dr["C29_T"].ToString();
                    sV.Text = dr["C29_V"].ToString();

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
                SqlCommand cmd = new SqlCommand("insert into MPR_Det_Result_Prueba(IdSolicPrueba,IdPrueba,FechaEmisionIndiv,C29_G,C29_T,C29_V," +
               "C29_M_Result,Variante) values(@IdSolicPrueba,@IdPrueba,@FechaEmisionIndiv,@C29_G,@C29_T,@C29_V,@C29_M_Result,@Variante)", con);

                cmd.Parameters.AddWithValue("@IdSolicPrueba", Sol);
                cmd.Parameters.AddWithValue("@IdPrueba", Pr);
                cmd.Parameters.AddWithValue("@FechaEmisionIndiv", DateTime.Now);
                cmd.Parameters.AddWithValue("@C29_G", sG.Value);
                cmd.Parameters.AddWithValue("@C29_T", sT.Value);
                cmd.Parameters.AddWithValue("@C29_V", sV.Value);
                cmd.Parameters.AddWithValue("@C29_M_Result", txtResult.Text);
                cmd.Parameters.AddWithValue("@Variante", 3);

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
                SqlCommand cmd = new SqlCommand("update MPR_Det_Result_Prueba set FechaEmisionIndiv=@FechaEmisionIndiv,C29_G=@C29_G,C29_T=@C29_T,C29_V=@C29_V,C29_M_Result=@C29_M_Result where CAST(IdSolicPrueba AS NVARCHAR) + '.' + CAST(IdPrueba AS NVARCHAR) + '.' + CAST(IdCalc AS NVARCHAR) = @codigo", con);
                cmd.Parameters.AddWithValue("@codigo", txtId.Text);
                cmd.Parameters.AddWithValue("@FechaEmisionIndiv", DateTime.Now);
                cmd.Parameters.AddWithValue("@C29_G", sG.Value);
                cmd.Parameters.AddWithValue("@C29_T", sT.Value);
                cmd.Parameters.AddWithValue("@C29_V", sV.Value);
                cmd.Parameters.AddWithValue("@C29_M_Result", txtResult.Text);

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

        #region SubCRUD
        protected void Select2()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select CAST(IdSolicPrueba AS NVARCHAR) + '.' + CAST(IdPrueba AS NVARCHAR) + '.' + CAST(IdCalc AS NVARCHAR) as Codigo,C29_G,C29_T,C29_F from MPR_Det_Result_Prueba where CAST(IdSolicPrueba AS NVARCHAR) + '.' + CAST(IdPrueba AS NVARCHAR) + '.' + CAST(IdCalc AS NVARCHAR) = @Codigo", con);
                cmd.Parameters.AddWithValue("@Codigo", txtId2.Text);


                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId2.Text = dr["Codigo"].ToString();
                    sG2.Text = dr["C29_G"].ToString();
                    sT2.Text = dr["C29_T"].ToString();
                    sF.Text = dr["C29_F"].ToString();

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
        protected void Insert2()
        {

            string Sol = Request.QueryString["Sol"];
            string Pr = Request.QueryString["Pr"];
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into MPR_Det_Result_Prueba(IdSolicPrueba,IdPrueba,FechaEmisionIndiv,C29_G,C29_T,C29_F," +
               "C29_M_Result,Variante) values(@IdSolicPrueba,@IdPrueba,@FechaEmisionIndiv,@C29_G,@C29_T,@C29_F,@C29_M_Result,@Variante)", con);

                cmd.Parameters.AddWithValue("@IdSolicPrueba", Sol);
                cmd.Parameters.AddWithValue("@IdPrueba", Pr);
                cmd.Parameters.AddWithValue("@FechaEmisionIndiv", DateTime.Now);
                cmd.Parameters.AddWithValue("@C29_G", sG2.Value);
                cmd.Parameters.AddWithValue("@C29_T", sT2.Value);
                cmd.Parameters.AddWithValue("@C29_F", sF.Value);
                cmd.Parameters.AddWithValue("@C29_M_Result", txtResult2.Text);
                cmd.Parameters.AddWithValue("@Variante", 4);

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
        protected void Update2()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update MPR_Det_Result_Prueba set FechaEmisionIndiv=@FechaEmisionIndiv,C29_G=@C29_G,C29_T=@C29_T,C29_F=@C29_F,C29_M_Result=@C29_M_Result where CAST(IdSolicPrueba AS NVARCHAR) + '.' + CAST(IdPrueba AS NVARCHAR) + '.' + CAST(IdCalc AS NVARCHAR) = @Codigo", con);
                cmd.Parameters.AddWithValue("@Codigo", txtId2.Text);
                cmd.Parameters.AddWithValue("@FechaEmisionIndiv", DateTime.Now);
                cmd.Parameters.AddWithValue("@C29_G", sG2.Value);
                cmd.Parameters.AddWithValue("@C29_T", sT2.Value);
                cmd.Parameters.AddWithValue("@C29_F", sF.Value);
                cmd.Parameters.AddWithValue("@C29_M_Result", txtResult2.Text);

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
        protected void Delete2()
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
        protected void CalcularPVSC_V()
        {
            double G = Convert.ToDouble(sG.Text);
            double T = Convert.ToDouble(sT.Text);
            double V = Convert.ToDouble(sV.Text);
            double resta = G - T;
            double division = resta / V;
            txtResult.Text = Convert.ToString(division);
        }
        protected void CalcularPVSC_F()
        {
            double G = Convert.ToDouble(sG2.Text);
            double T = Convert.ToDouble(sT2.Text);
            double F = Convert.ToDouble(sF.Text);
            double resta = G - T;
            double multiplicacion = resta * F;
            txtResult2.Text = Convert.ToString(multiplicacion);
        }
        #endregion
    }
}