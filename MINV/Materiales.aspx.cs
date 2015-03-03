﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web.ASPxGridView;

namespace SisLIJAD.MINV
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
                SqlCommand cmd = new SqlCommand("SELECT     IdMaterial, CodUCA, NomMaterial, IdUnidad, Marca, NumSerie, Modelo, Prestamo FROM dbo.MINV_Materiales WHERE (IdMaterial = @IdMaterial)", con);
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
                    txtNumSerie.Text = dr["NumSerie"].ToString();
                    txtModel.Text = dr["Modelo"].ToString();
                    chkPrest.Checked= Convert.ToBoolean(dr["Prestamo"]);
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
                SqlCommand cmd = new SqlCommand("insert into MPR_EquipMaquin (NomMaq,Modelo,NumSerie,IdUbicEspec) values(@NomMaq,@Modelo,@NumSerie,@IdUbicEspec)", con);
                //cmd.Parameters.AddWithValue("@NomMaq", txtNom.Text);
                //cmd.Parameters.AddWithValue("@Modelo", txtModel.Text);
                //cmd.Parameters.AddWithValue("@NumSerie", txtNumSerie.Text);
                //cmd.Parameters.AddWithValue("@IdUbicEspec", cmbUbicEspec.Value);
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
                SqlCommand cmd = new SqlCommand("update MPR_EquipMaquin set NomMaq=@NomMaq,Modelo=@Modelo,NumSerie=@NumSerie,IdUbicEspec=@IdUbicEspec where IdMaterial = @IdMaterial", con);
                //cmd.Parameters.AddWithValue("@IdMaterial", txtId.Text);
                //cmd.Parameters.AddWithValue("@NomMaq", txtNom.Text);
                //cmd.Parameters.AddWithValue("@Modelo", txtModel.Text);
                //cmd.Parameters.AddWithValue("@NumSerie", txtNumSerie.Text);
                //cmd.Parameters.AddWithValue("@IdUbicEspec", cmbUbicEspec.Value);


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
                SqlCommand cmd = new SqlCommand("delete from MPR_EquipMaquin where IdMaterial = @IdMaterial", con);
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