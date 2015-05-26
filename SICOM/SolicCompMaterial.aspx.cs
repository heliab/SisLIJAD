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
    public partial class SolicCompMaterial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            deFeReq.MinDate = DateTime.Today;
        }
        #region CRUD
        protected void Select()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT  [IdSolic_Comp],[FechARecibir],[HeaderSolic],[IdEntidad],[IdMoneda] FROM  [MSCOMP_Solic_Compras] WHERE IdSolic_Comp=@IdSolic_Comp", con);
                cmd.Parameters.AddWithValue("@IdSolic_Comp", txtId.Text);
                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["IdSolic_Comp"].ToString();
                    deFeReq.Value = dr["FechARecibir"];
                    memoServ.Text = dr["HeaderSolic"].ToString();
                    cmbProveedor.Value = dr["IdEntidad"].ToString();
                    cmbTipoMo.Value = dr["IdMoneda"].ToString();
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
                SqlCommand cmd = new SqlCommand("insert into MSCOMP_Solic_Compras (FechARecibir,HeaderSolic,IdEntidad,IdMoneda) values(@FechARecibir,@HeaderSolic,@IdEntidad,@IdMoneda)", con);
                cmd.Parameters.AddWithValue("@FechARecibir", deFeReq.Value);
                cmd.Parameters.AddWithValue("@HeaderSolic", memoServ.Text);
                cmd.Parameters.AddWithValue("@IdEntidad", cmbProveedor.Value);
                cmd.Parameters.AddWithValue("@IdMoneda", cmbTipoMo.Value);
               
                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {
                    //Response.Write("<script>alert('" + Server.HtmlEncode("El equipo " + txtNom.Text + " se ha guardado correctamente") + "')</script>");

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
                SqlCommand cmd = new SqlCommand("update MSCOMP_Solic_Compras set FechARecibir=@FechARecibir,HeaderSolic=@HeaderSolic,IdEntidad=@IdEntidad,IdMoneda=@IdMoneda where IdSolic_Comp = @IdSolic_Comp", con);
                cmd.Parameters.AddWithValue("@IdSolic_Comp", txtId.Text);
                cmd.Parameters.AddWithValue("@FechARecibir", deFeReq.Value);
                cmd.Parameters.AddWithValue("@HeaderSolic", memoServ.Text);
                cmd.Parameters.AddWithValue("@IdEntidad", cmbProveedor.Value);
                cmd.Parameters.AddWithValue("@IdMoneda", cmbTipoMo.Value);

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
                SqlCommand cmd = new SqlCommand("delete from MSCOMP_Solic_Compras where IdSolic_Comp = @IdSolic_Comp", con);
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
        #region SubCrud
        protected void SubSelect()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT CAST(MSCOMP_Solicitud_Mat.IdSolic_Comp AS NVARCHAR) + '.' + CAST(MSCOMP_Solicitud_Mat.IdMaterial AS NVARCHAR) AS IdDetalle,IdMaterial,Cantidad,Precio from MSCOMP_Solicitud_Mat WHERE CAST(MSCOMP_Solicitud_Mat.IdSolic_Comp AS NVARCHAR) + '.' + CAST(MSCOMP_Solicitud_Mat.IdMaterial AS NVARCHAR)= @IdDetalle", con);
                cmd.Parameters.AddWithValue("@IdDetalle", txtSubId.Text);
                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtSubId.Text = dr["IdDetalle"].ToString();
                    cmbMateriales.Value = dr["IdMaterial"].ToString();
                    sCant.Value = dr["Cantidad"].ToString();
                    sCosto.Value = dr["Precio"].ToString();
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
            string IdSolic_Comp = HiddenGridPr.Get("SessionId").ToString();
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into MSCOMP_Solicitud_Mat(IdSolic_Comp,IdMaterial,Cantidad,Precio) values(@IdSolic_Comp,@IdMaterial,@Cantidad,@Precio)", con);
                cmd.Parameters.AddWithValue("@IdSolic_Comp", IdSolic_Comp);
                cmd.Parameters.AddWithValue("@IdMaterial", cmbMateriales.Value);
                cmd.Parameters.AddWithValue("@Cantidad", sCant.Value);
                cmd.Parameters.AddWithValue("@Precio",sCosto.Value);

                int count = cmd.ExecuteNonQuery();
                if (count == 1)
                {
                    //Response.Write("<script>alert('" + Server.HtmlEncode("El tipo " + txtDesc.Text + " se ha guardado correctamente") + "')</script>");

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
                SqlCommand cmd = new SqlCommand("update MSCOMP_Solicitud_Mat set IdMaterial=@IdMaterial,Cantidad=@Cantidad,Precio=@Precio where CAST(MSCOMP_Solicitud_Mat.IdSolic_Comp AS NVARCHAR) + '.' + CAST(MSCOMP_Solicitud_Mat.IdMaterial AS NVARCHAR) = @IdDetalle", con);
                cmd.Parameters.AddWithValue("@IdDetalle", txtSubId.Text);
                cmd.Parameters.AddWithValue("@IdMaterial", cmbMateriales.Value);
                cmd.Parameters.AddWithValue("@Cantidad", sCant.Value);
                cmd.Parameters.AddWithValue("@Precio", sCosto.Value);


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
                SqlCommand cmd = new SqlCommand("delete from MSCOMP_Solicitud_Mat where CAST(MSCOMP_Solicitud_Mat.IdSolic_Comp AS NVARCHAR) + '.' + CAST(MSCOMP_Solicitud_Mat.IdMaterial AS NVARCHAR) = @IdDetalle", con);
                cmd.Parameters.AddWithValue("@IdDetalle", txtIdD.Text);
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
        protected void cmbMateriales_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            Session["IdSolic_Comp"] = HiddenGridPr.Get("SessionId").ToString();
            string test = Session["IdSolic_Comp"].ToString();
            cmbMateriales.DataBind();
        }
        #endregion
        #region Subcallbacks
        protected void SubFillingCallback_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            SubSelect();
        }
        protected void SubGrid_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["IdSolic_Comp"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
        #endregion
    }
}
