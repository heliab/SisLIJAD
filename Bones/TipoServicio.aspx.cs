﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web.ASPxGridView;

namespace SisLIJAD.SICOM
{
    public partial class TipoServicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #region Buttons


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string value = HiddenV.Get("Nuevo").ToString();
            string real = "0";
            if (value == real)
            {
                Insert();
                GridPrincipal.DataBind();
            }
            else
            {
                Update();
                GridPrincipal.DataBind();
            }
            HiddenV.Clear();
        }


        protected void btnConfirmD_Click(object sender, EventArgs e)
        {
            Delete();
            GridPrincipal.DataBind();

        }
        protected void btnSelect_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "show", "FormPopup.Show();", true);
            HiddenV.Set("Nuevo", 1);
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
                SqlCommand cmd = new SqlCommand("Select * from MSCOMP_TipoServicio where IdServicio = @IdServicio", con);
                cmd.Parameters.AddWithValue("@IdServicio", txtId.Text);
                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["IdServicio"].ToString();
                    txtServ.Text = dr["NomServicio"].ToString();
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
                SqlCommand cmd = new SqlCommand("insert into MSCOMP_TipoServicio(NomServicio) values(@NomServicio)", con);
                cmd.Parameters.AddWithValue("@NomServicio", txtServ.Text);


                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El servicio " + txtServ.Text + " se ha guardado correctamente") + "')</script>");

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
                SqlCommand cmd = new SqlCommand("update MSCOMP_TipoServicio set NomServicio=@NomServicio where IdServicio = @IdServicio", con);
                cmd.Parameters.AddWithValue("@IdServicio", txtId.Text);
                cmd.Parameters.AddWithValue("@NomServicio", txtServ.Text);


                if (cmd.ExecuteNonQuery() == 1)
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El servicio se ha actualizado correctamente") + "')</script>");
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
                SqlCommand cmd = new SqlCommand("delete from MSCOMP_TipoServicio where IdServicio = @IdServicio", con);
                cmd.Parameters.AddWithValue("@IdServicio", txtIdD.Text);
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


    }
}