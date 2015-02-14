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
    public partial class Oficinas : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("Select * from MINV_Oficina where IdOficina= @IdOficina", con);
                cmd.Parameters.AddWithValue("@IdOficina", txtId.Text);

                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["IdOficina"].ToString();
                    txtOfic.Text = dr["NomOficina"].ToString();
                    mDesc.Text = dr["DescOficina"].ToString();
                  
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
                SqlCommand cmd = new SqlCommand("insert into MINV_Oficina(NomOficina, DescOficina) values(@NomOficina,@DescOficina)", con);
                cmd.Parameters.AddWithValue("@NomOficina", txtOfic.Text);
                cmd.Parameters.AddWithValue("@DescOficina", mDesc.Text);
           
                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("La oficina " + txtOfic.Text + " se ha guardado correctamente") + "')</script>");

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
                SqlCommand cmd = new SqlCommand("update MINV_Oficina set NomOficina=@NomOficina, DescOficina=@DescOficina where IdOficina = @IdOficina", con);
                cmd.Parameters.AddWithValue("@IdOficina", txtId.Text);
                cmd.Parameters.AddWithValue("@NomOficina", txtOfic.Text);
                cmd.Parameters.AddWithValue("@DescOficina", mDesc.Text);
                
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
                SqlCommand cmd = new SqlCommand("delete from MINV_Oficina where IdOficina = @IdOficina", con);
                cmd.Parameters.AddWithValue("@IdOficina", txtIdD.Text);
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