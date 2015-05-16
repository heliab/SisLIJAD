using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web.ASPxGridView;

namespace SisLIJAD.Perfil
{
    public partial class Perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["username"] = User.Identity.Name;
            ClientScript.RegisterStartupScript(GetType(), "show", "fn_Welcome();", true);
        }

        protected void GridPrincipal_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridPrincipal.DataBind();
            GridPrincipal.Focus();
        }

        protected void FillingCallback_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            Select();
        }
        #region CRUD
        protected void Select()
        {
            string username = User.Identity.Name;
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(" Select PNombre,SNombre,PApellido,SApellido,Empresa,Celular,Web,username from USER_Entidad where username= @username", con);
                cmd.Parameters.AddWithValue("@username", username);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {

                    txtPNom.Text = dr["PNombre"].ToString();
                    txtSNom.Text = dr["SNombre"].ToString();
                    txtPApel.Text = dr["PApellido"].ToString();
                    txtSApel.Text = dr["SApellido"].ToString();
                    txtEmpresa.Text= dr["Empresa"].ToString();
                    txtCel.Text = dr["Celular"].ToString();
                    //txtMail.Text = dr["Email"].ToString();
                    txtWeb.Text = dr["Web"].ToString();
                    
                   
                }
                else
                {
                    ChangeProfile();
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
        #endregion

        protected void NewCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            ChangeProfile();
        }
        protected void ChangeProfile()
        {
            string username= User.Identity.Name;
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_ChangeProfile", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@PNombre", SqlDbType.NVarChar).Value =txtPNom.Text ;
                cmd.Parameters.Add("@SNombre", SqlDbType.NVarChar).Value = txtSNom.Text;
                cmd.Parameters.Add("@PApeliido", SqlDbType.NVarChar).Value = txtPApel.Text;
                cmd.Parameters.Add("@SApellido", SqlDbType.NVarChar).Value = txtSApel.Text;
                cmd.Parameters.Add("@Empresa ", SqlDbType.NVarChar).Value = txtEmpresa.Text;
                cmd.Parameters.Add("@Celular", SqlDbType.NVarChar).Value = txtCel.Text ;
                //cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txtMail.Text;
                cmd.Parameters.Add("@Web", SqlDbType.NVarChar).Value = txtWeb.Text;
                cmd.Parameters.Add("@username", SqlDbType.NVarChar).Value = username;
               


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
    }
}