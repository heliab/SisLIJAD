using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms; 

namespace SisLIJAD.MINV.Reportes
{
    public partial class SolicitudesPorUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void ShowReport()
        {
            ReportViewer1.Reset();
           
            //DataTable dt = GetData((TextBox1.Text).ToString());
            DataTable dt = GetData((cmbUsuarios.Text).ToString());
            ReportDataSource rds = new ReportDataSource("DSGetLoanByUser", dt);
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.ReportPath = "MINV/DSRPT/Rpt_SolicitudesPorUsuario.rdlc";
          //  ReportViewer1.LocalReport.ReportPath = Server.MapPath("MINV/DSRPT/Rpt_SolicitudesPorUsuario.rdlc");
            ReportParameter[] rptParams = new ReportParameter[] { 
            //new ReportParameter("username",TextBox1.Text)
             new ReportParameter("username",cmbUsuarios.Text)
            };
            ReportViewer1.LocalReport.SetParameters(rptParams);
            ReportViewer1.LocalReport.Refresh();

        }
        private DataTable GetData(string username)
        {
            DataTable dt = new DataTable();
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["BDLabsConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(Database.ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("GetLoanMatByUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@username", SqlDbType.NVarChar).Value = username;

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