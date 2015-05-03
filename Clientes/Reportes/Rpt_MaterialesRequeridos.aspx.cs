using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms; 

namespace SisLIJAD.Clientes.Reportes
{
    public partial class Rpt_MaterialesRequeridos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Session["Id"] = Request.QueryString["Id"];
                ShowReport();
            }
        }
        private void ShowReport()
        {
            string Id = Session["Id"].ToString();
            ReportViewer1.Reset();

            DataTable dt = GetData(Id);
            ReportDataSource rds = new ReportDataSource("DSGetReqMatById", dt);
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.ReportPath = "Clientes/DSRPT/Rpt_GetReqMatById.rdlc";
            ReportParameter[] rptParams = new ReportParameter[] { 
            new ReportParameter("Id",Id)
            };
            ReportViewer1.LocalReport.SetParameters(rptParams);
            ReportViewer1.LocalReport.Refresh();

        }
        private DataTable GetData(string Id)
        {
            DataTable dt = new DataTable();
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["BDLabsConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(Database.ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("GetReqMatById", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Id", SqlDbType.NVarChar).Value = Id;

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
            }
            return dt;

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            ShowReport();
        }
    }
}