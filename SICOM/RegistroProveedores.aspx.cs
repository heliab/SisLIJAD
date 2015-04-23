using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web.ASPxGridView;


namespace SisLIJAD.SICOM
{
    public partial class RegistroProveedores : System.Web.UI.Page
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
                //SqlCommand cmd = new SqlCommand("Select * from USER_Entidad where IdEntidad= @IdEntidad", con);
                SqlCommand cmd = new SqlCommand("SELECT  IdEntidad, Empresa, Email, Telefono, Web, Direccion FROM USER_Entidad WHERE  (IdEntidad = @IdEntidad)", con);
                cmd.Parameters.AddWithValue("@IdEntidad", txtId.Text);
                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["IdEntidad"].ToString();
                    txtDesc.Text = dr["Empresa"].ToString();
                    txtMail.Text = dr["Email"].ToString();
                    txtTel.Text = dr["Telefono"].ToString();
                    txtWeb.Text = dr["Web"].ToString();
                    memoDirec.Text = dr["Direccion"].ToString();


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
                SqlCommand cmd = new SqlCommand("insert into USER_Entidad (Empresa, Email, Telefono, Web, Direccion,IdTipo) values(@Empresa, @Email, @Telefono, @Web, @Direccion,@IdTipo)", con);
                cmd.Parameters.AddWithValue("@Empresa", txtDesc.Text);
                cmd.Parameters.AddWithValue("@Email", txtMail.Text);
                cmd.Parameters.AddWithValue("@Telefono", txtTel.Text);
                cmd.Parameters.AddWithValue("@Web", txtWeb.Text);
                cmd.Parameters.AddWithValue("@Direccion", memoDirec.Text);
                cmd.Parameters.AddWithValue("@IdTipo", 2);

                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {
                   
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
                SqlCommand cmd = new SqlCommand("update USER_Entidad set Empresa=@Empresa, Email=@Email, Telefono=@Telefono, Web=@Web, Direccion=@Direccion where IdEntidad = @IdEntidad", con);
                cmd.Parameters.AddWithValue("@IdEntidad", txtId.Text);
                cmd.Parameters.AddWithValue("@Empresa", txtDesc.Text);
                cmd.Parameters.AddWithValue("@Email", txtMail.Text);
                cmd.Parameters.AddWithValue("@Telefono", txtTel.Text);
                cmd.Parameters.AddWithValue("@Web", txtWeb.Text);
                cmd.Parameters.AddWithValue("@Direccion", memoDirec.Text);

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
                SqlCommand cmd = new SqlCommand("delete from USER_Entidad where IdEntidad = @IdEntidad", con);
                cmd.Parameters.AddWithValue("@IdEntidad", txtIdD.Text);
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