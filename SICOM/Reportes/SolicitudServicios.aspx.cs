using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms; 

namespace SisLIJAD.SICOM.Reportes
{
    public partial class SolicitudServicios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void ShowReport()
        {
            ReportViewer1.Reset();

            //DataTable dt = GetData((TextBox1.Text).ToString());

            //DataTable dt = GetData((txt1.Text).ToString());
            DataTable dt = GetData((cmbUsuarios.Value).ToString());
            ReportDataSource rds = new ReportDataSource("DataSet1", dt);
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.ReportPath = "SICOM/DSRPT/Rpt_SolicitudServicio.rdlc";
            ReportParameter[] rptParams = new ReportParameter[] { 
            //new ReportParameter("username",TextBox1.Text)
             //new ReportParameter("IdSol",txt1.Text)
             new ReportParameter("IdSol",(cmbUsuarios.Value).ToString())
            };
            ReportViewer1.LocalReport.SetParameters(rptParams);
            ReportViewer1.LocalReport.Refresh();

        }
        private DataTable GetData(string IdSol)
        {
            DataTable dt = new DataTable();
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["BDLabsConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(Database.ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("GetSolServicioById", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@IdSol", SqlDbType.NVarChar).Value = IdSol;

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