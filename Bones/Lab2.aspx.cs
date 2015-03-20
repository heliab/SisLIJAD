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
    public partial class Lab2 : System.Web.UI.Page
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
            string insertar = "0";
            string tipo = "1";


            if (valNuevo == insertar)
            {
                Insert();
                GridPrincipal.DataBind();
            }
            else
            {
                string valSave = HiddenV.Get("Save").ToString();
                if (tipo == valNuevo && tipo == valSave)
                {
                    Update();
                    GridPrincipal.DataBind();
                }

                else
                {
                    Select();
                }
            }

            HiddenV.Clear();

        }

        protected void DelCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            Delete();
        }

        protected void FillingCallback_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            Select();

            #region ifvalue
            //  string valNuevo = HiddenV.Get("Nuevo").ToString();
            //  string insertar = "0";
            //  string tipo = "1";


            //  if (valNuevo == insertar)
            //  {
            //      Insert();
            //   }
            //       else
            //  {
            //      string valSave = HiddenV.Get("Save").ToString();
            //      if (tipo == valNuevo && tipo == valSave)
            //      {
            //          Update();
            //      }

            //      else
            //      {
            //          Select();
            //      }
            //  }

            //HiddenV.Clear();
            #endregion
            #region swithc
            //string value = HiddenV.Get("Nuevo").ToString();
            ////string insertar = "0";
            ////string seleccionar = "1";

            //switch (value) {
            //    case "0": Insert();
            //        break;
            //    case "1": Select();
            //        break;

            //    default: Response.Write("<script>alert(\"an error filling callback occur\")</script>");
            //        break;
            //    }
            //HiddenV.Clear(); 
            #endregion


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
                SqlCommand cmd = new SqlCommand("Select * from MPR_Laboratorios where IdLaboratorio= @IdLaboratorio", con);
                cmd.Parameters.AddWithValue("@IdLaboratorio", txtId.Text);

                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["IdLaboratorio"].ToString();
                    txtLab.Text = dr["NomLaboratorio"].ToString();
                    mDesc.Text = dr["DescLaboratorio"].ToString();
                    cmbEntidad.Value = dr["IdEntidad"].ToString();

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
                SqlCommand cmd = new SqlCommand("insert into MPR_Laboratorios(NomLaboratorio, DescLaboratorio,IdEntidad) values(@NomLaboratorio,@DescLaboratorio,@IdEntidad)", con);
                cmd.Parameters.AddWithValue("@NomLaboratorio", txtLab.Text);
                cmd.Parameters.AddWithValue("@DescLaboratorio", mDesc.Text);
                cmd.Parameters.AddWithValue("@IdEntidad", cmbEntidad.Value);

                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El laboratorio" + txtLab.Text + " se ha guardado correctamente") + "')</script>");

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
                SqlCommand cmd = new SqlCommand("update MPR_Laboratorios set NomLaboratorio=@NomLaboratorio, DescLaboratorio=@DescLaboratorio,IdEntidad=@IdEntidad where IdLaboratorio = @IdLaboratorio", con);
                cmd.Parameters.AddWithValue("@IdLaboratorio", txtId.Text);
                cmd.Parameters.AddWithValue("@NomLaboratorio", txtLab.Text);
                cmd.Parameters.AddWithValue("@DescLaboratorio", mDesc.Text);
                cmd.Parameters.AddWithValue("@IdEntidad", cmbEntidad.Value);

                //cmbPersonal.DataBind();

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
                SqlCommand cmd = new SqlCommand("delete from MPR_Laboratorios where IdLaboratorio = @IdLaboratorio", con);
                cmd.Parameters.AddWithValue("@IdLaboratorio", txtIdD.Text);
                if (cmd.ExecuteNonQuery() == 1)
                {
                    Response.Write("<script>confirm('" + Server.HtmlEncode("El registro se ha sido eliminado") + "')</script>");
                    Response.Redirect("Lab2.aspx");
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