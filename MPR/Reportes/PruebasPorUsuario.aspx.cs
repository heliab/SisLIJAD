using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms; 

namespace SisLIJAD.MPR.Reportes
{ 
    public partial class PruebasPorUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void ShowReport() {
            rvPruebasxUsuario.Reset();

            DataTable dt = GetData((TextBox1.Text).ToString());
            ReportDataSource rds = new ReportDataSource("DSTestByUSer1",dt);
            rvPruebasxUsuario.LocalReport.DataSources.Add(rds);
            rvPruebasxUsuario.LocalReport.ReportPath = "MPR/DSRPT/SolicitudePorUsuario.rdlc";
            ReportParameter[] rptParams = new ReportParameter[] { 
            new ReportParameter("username",TextBox1.Text)
            };
            rvPruebasxUsuario.LocalReport.SetParameters(rptParams);
            rvPruebasxUsuario.LocalReport.Refresh();

        }
        private DataTable GetData(string username) {
            DataTable dt=new DataTable();
            string connStr=System.Configuration.ConfigurationManager.ConnectionStrings["BDLabsConnectionString"].ConnectionString;
          using(  SqlConnection con = new SqlConnection(Database.ConnectionString))
          {
              SqlCommand cmd=new SqlCommand("GetTestByUser",con);
              cmd.CommandType=CommandType.StoredProcedure;
              cmd.Parameters.Add("@username",SqlDbType.NVarChar).Value=username;

              SqlDataAdapter adp=new SqlDataAdapter(cmd);
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