using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;
using DevExpress.Web.ASPxGridView;

namespace SisLIJAD.Clientes.Results
{
    public partial class GeaGruesoRes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void NewCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {

        }

        protected void GridResultados_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridResultados.DataBind();
        }

        private void ShowReport()
        {
            string IdQuery = Request.QueryString["Id"];
            string IdSol = Request.QueryString["Sol"];
            string IdPr = Request.QueryString["Pr"];

            ReportViewer1.Reset();

            DataTable dt = GetData((IdSol), (IdPr));
            ReportDataSource rds = new ReportDataSource("DSGetASTM127_SSD_ById", dt);
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.ReportPath = "Clientes/DSRPT/Rpt_GeaGrueso.rdlc";
            ReportParameter[] rptParams = new ReportParameter[] { 
            new ReportParameter("IdSol",IdSol),
            new ReportParameter("IdPr",IdPr)
            };
            ReportViewer1.LocalReport.SetParameters(rptParams);
            ReportViewer1.LocalReport.Refresh();

        }
        private DataTable GetData(string IdSol, string IdPr)
        {
            DataTable dt = new DataTable();
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["BDLabsConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(Database.ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("GetASTM127_SSD_ById", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@IdSol", SqlDbType.NVarChar).Value = IdSol;
                cmd.Parameters.Add("@IdPr", SqlDbType.NVarChar).Value = IdPr;

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
            }
            return dt;

        }

        protected void btnReport_Click(object sender, EventArgs e)
        {
            ShowReport();
        }
    }
}