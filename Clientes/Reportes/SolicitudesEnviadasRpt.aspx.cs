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
    public partial class SolicitudesEnviadasRpt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                txtuser.Text = User.Identity.Name;
                ShowReport();
            }
        }
        private void ShowReport()
        {
            ReportViewer1.Reset();

            //DataTable dt = GetData((TextBox1.Text).ToString());
            DataTable dt = GetData((txtuser.Text).ToString());
            ReportDataSource rds = new ReportDataSource("DSGetSolByUSer", dt);
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.ReportPath = "Clientes/DSRPT/Solicitudesenviadas.rdlc";
            ReportParameter[] rptParams = new ReportParameter[] { 
            //new ReportParameter("username",TextBox1.Text)
             new ReportParameter("username",txtuser.Text)
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
                SqlCommand cmd = new SqlCommand("GetSolicEnviadasByUser", con);
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