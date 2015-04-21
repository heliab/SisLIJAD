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
    public partial class SolicServicio : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("Select * from MSCOMP_Det_Solicitud_Serv where IdSolic_Comp= @IdSolic_Comp", con);
                cmd.Parameters.AddWithValue("@IdSolic_Comp", txtId.Text);
                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["IdSolic_Comp"].ToString();
                    memoServ.Text = dr["DescContrat"].ToString();
                    sCant.Value = dr["Precio"].ToString();
                    deFeReq.Value = dr["FechaReq"];
                   cmbTipoMo.Value = dr["IdTipoMoneda"].ToString();
                    cmbProveedor.Value = dr["IdEntidad"].ToString();
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
                SqlCommand cmd = new SqlCommand("insert into MSCOMP_Det_Solicitud_Serv (DescContrat,Precio,FechaReq,IdTipoMoneda,IdEntidad) values(@DescContrat,@Precio,@FechaReq,@IdTipoMoneda,@IdEntidad)", con);
                cmd.Parameters.AddWithValue("@DescContrat", memoServ.Text);
                cmd.Parameters.AddWithValue("@Precio", sCant.Value);
                cmd.Parameters.AddWithValue("@FechaReq", deFeReq.Value);
                cmd.Parameters.AddWithValue("@IdTipoMoneda", cmbTipoMo.Value);
                cmd.Parameters.AddWithValue("@IdEntidad", cmbProveedor.Value);


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
                SqlCommand cmd = new SqlCommand("update MSCOMP_Det_Solicitud_Serv set DescContrat=@DescContrat,Precio=@Precio,FechaReq=@FechaReq,IdTipoMoneda=@IdTipoMoneda ,IdEntidad=@IdEntidad where IdSolic_Comp = @IdSolic_Comp", con);
                cmd.Parameters.AddWithValue("@IdSolic_Comp", txtId.Text);
                cmd.Parameters.AddWithValue("@DescContrat", memoServ.Text);
                cmd.Parameters.AddWithValue("@Precio", sCant.Value);
                cmd.Parameters.AddWithValue("@FechaReq", deFeReq.Value);
                cmd.Parameters.AddWithValue("@IdTipoMoneda", cmbTipoMo.Value);
                cmd.Parameters.AddWithValue("@IdEntidad", cmbProveedor.Value);


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
                SqlCommand cmd = new SqlCommand("delete from MSCOMP_Det_Solicitud_Serv where IdSolic_Comp = @IdSolic_Comp", con);
                cmd.Parameters.AddWithValue("@IdSolic_Comp", txtIdD.Text);
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