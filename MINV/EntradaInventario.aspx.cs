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
    public partial class EntradaInventario : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("Select IdEntrada,EntryHeader,IdEntidad,FechaEntrada,HoraRecep,RecepcionadoPor,Observacion from MINV_Entradas where IdEntrada= @IdEntrada", con);
                
                cmd.Parameters.AddWithValue("@IdEntrada", txtId.Text);


                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtId.Text = dr["IdEntrada"].ToString();
                    memoEntra.Text = dr["EntryHeader"].ToString();
                    cmbProveedor.Value = dr["IdEntidad"].ToString();
                    deFecha.Value = dr["FechaEntrada"];
                    teHora.Text = dr["HoraRecep"].ToString();
                    cmbPersonal.Value = dr["RecepcionadoPor"].ToString();
                    memoObser.Text = dr["Observacion"].ToString();
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
                SqlCommand cmd = new SqlCommand("insert into MINV_Entradas(EntryHeader,IdEntidad,FechaEntrada,HoraRecep,RecepcionadoPor,Observacion) values(@EntryHeader,@IdEntidad,@FechaEntrada,@HoraRecep,@RecepcionadoPor,@Observacion)", con);
                //  SqlCommand cmd = new SqlCommand("insert into MINV_Entradas(EntryHeader,IdEntidad,RecepcionadoPor,Observacion) values(@EntryHeader,@IdEntidad,@RecepcionadoPor,@Observacion)", con);
                cmd.Parameters.AddWithValue("@EntryHeader", memoEntra.Text);
                cmd.Parameters.AddWithValue("@IdEntidad", cmbProveedor.Value);
                cmd.Parameters.AddWithValue("@FechaEntrada", deFecha.Value);
                cmd.Parameters.AddWithValue("@HoraRecep", teHora.Text);
                cmd.Parameters.AddWithValue("@RecepcionadoPor", cmbPersonal.Value);
                cmd.Parameters.AddWithValue("@Observacion", memoObser.Text);


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
        protected void Update()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update MINV_Entradas set EntryHeader=@EntryHeader,IdEntidad=@IdEntidad,FechaEntrada=@FechaEntrada,HoraRecep=@HoraRecep,RecepcionadoPor=@RecepcionadoPor,Observacion=@Observacion where IdEntrada = @IdEntrada", con);
                cmd.Parameters.AddWithValue("@IdEntrada", txtId.Text);
                cmd.Parameters.AddWithValue("@EntryHeader", memoEntra.Text);
                cmd.Parameters.AddWithValue("@IdEntidad", cmbProveedor.Value);
                cmd.Parameters.AddWithValue("@FechaEntrada", deFecha.Value);
                cmd.Parameters.AddWithValue("@HoraRecep", teHora.Text);
                cmd.Parameters.AddWithValue("@RecepcionadoPor", cmbPersonal.Value);
                cmd.Parameters.AddWithValue("@Observacion", memoObser.Text);

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
                SqlCommand cmd = new SqlCommand("delete from MINV_Entradas where IdEntrada = @IdEntrada", con);
                cmd.Parameters.AddWithValue("@IdEntrada", txtIdD.Text);
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
        protected void AplicarEntrada()
        {
            string val = HiddenV.Get("Aprobar").ToString();
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE MINV_Entradas set Aprobado=@Aprobado where IdEntrada=@IdEntrada", con);
                cmd.Parameters.AddWithValue("@IdEntrada", val);
                cmd.Parameters.Add("@Aprobado", SqlDbType.Bit).Value = 1;
                if (cmd.ExecuteNonQuery() == 1)
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El registro se ha sido aprobadp") + "')</script>");
                }
                else
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("El registro no se ha podido aprobar") + "')</script>");
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
                case "6": AplicarEntrada();
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

        #region Subcallback
        protected void SubGrid_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["IdEntrada"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

     protected void SubFillingCallback_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            SubSelect();
        }
     protected void cmbMaterial_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
     {
         cmbMaterial.DataBind();
     }
        

        #endregion

   
        #region SubCrud
        protected void SubSelect()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT CAST(MINV_Det_Entradas.IdEntrada AS NVARCHAR) + '.' + CAST(MINV_Det_Entradas.IdMaterial AS NVARCHAR) AS IdDetalle,IdMaterial,ObservMaterial,IdEstado,Cantidad from MINV_Det_Entradas WHERE CAST(MINV_Det_Entradas.IdEntrada AS NVARCHAR) + '.' + CAST(MINV_Det_Entradas.IdMaterial AS NVARCHAR) = @IdDetalle", con);
               cmd.Parameters.AddWithValue("@IdDetalle", txtSubId.Text);


                //Thye data reader is only present in Select, due its function is to read and the we can display those readen values
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // display data in textboxes
                    txtSubId.Text = dr["IdDetalle"].ToString();
                    cmbMaterial.Value=dr["IdMaterial"].ToString();
                    memoOb.Text= dr["ObservMaterial"].ToString();
                    cmbEstado.Value = dr["IdEstado"].ToString();
                    sCant.Text = dr["Cantidad"].ToString();
                
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
            string IdEntrada =GridPrVal.Get("MValue").ToString();
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into MINV_Det_Entradas(IdEntrada,IdMaterial,IdUbicEspec,ObservMaterial,IdEstado,Cantidad) values(@IdEntrada,@IdMaterial,@IdUbicEspec,@ObservMaterial,@IdEstado,@Cantidad)", con);
                cmd.Parameters.AddWithValue("@IdEntrada", IdEntrada);
                cmd.Parameters.AddWithValue("@IdMaterial", cmbMaterial.Value);
                cmd.Parameters.AddWithValue("@IdUbicEspec", cmbSubUbic.Value);
                cmd.Parameters.AddWithValue("@ObservMaterial", memoOb.Text);
                cmd.Parameters.AddWithValue("@IdEstado", cmbEstado.Value);
                cmd.Parameters.AddWithValue("@Cantidad", sCant.Value);
        
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
                SqlCommand cmd = new SqlCommand("update MINV_Det_Entradas set IdMaterial=@IdMaterial,ObservMaterial=@ObservMaterial,IdEstado=@IdEstado,"
                + "Cantidad=@Cantidad where CAST(MINV_Det_Entradas.IdEntrada AS NVARCHAR) + '.' + CAST(MINV_Det_Entradas.IdMaterial AS NVARCHAR)= @IdDetalle", con);
                cmd.Parameters.AddWithValue("@IdDetalle", txtSubId.Text);
                cmd.Parameters.AddWithValue("@IdMaterial", cmbMaterial.Value);
               cmd.Parameters.AddWithValue("@ObservMaterial",memoOb.Text);
               cmd.Parameters.AddWithValue("@IdEstado", cmbEstado.Value);
                cmd.Parameters.AddWithValue("@Cantidad", sCant.Value);

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
                SqlCommand cmd = new SqlCommand("delete from MINV_Det_Entradas where CAST(MINV_Det_Entradas.IdEntrada AS NVARCHAR) + '.' "
                    +"+ CAST(MINV_Det_Entradas.IdMaterial AS NVARCHAR)= @IdDetalle", con);
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

        protected void cmbSubUbic_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            cmbSubUbic.DataBind();
        }




    }
}
