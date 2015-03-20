using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace SisLIJAD.Cuenta
{
    public partial class ManageUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindUserAccounts();

                BindFilteringUI();
            }
        }

        private void BindFilteringUI()
        {
            string[] filterOptions = { "All", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
            FilteringUI.DataSource = filterOptions;
            FilteringUI.DataBind();
        }

        private void BindUserAccounts()
        {
            int totalRecords;
            UserAccounts.DataSource = Membership.FindUsersByName(this.UsernameToMatch + "%", this.PageIndex, this.PageSize, out totalRecords);
            UserAccounts.DataBind();

            // Enable/disable the paging interface
            bool visitingFirstPage = (this.PageIndex == 0);
            lnkFirst.Enabled = !visitingFirstPage;
            lnkPrev.Enabled = !visitingFirstPage;

            int lastPageIndex = (totalRecords - 1) / this.PageSize;
            bool visitingLastPage = (this.PageIndex >= lastPageIndex);
            lnkNext.Enabled = !visitingLastPage;
            lnkLast.Enabled = !visitingLastPage;
        }

        protected void FilteringUI_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "All")
                this.UsernameToMatch = string.Empty;
            else
                this.UsernameToMatch = e.CommandName;

            BindUserAccounts();
        }

        #region Paging Interface Click Event Handlers
        protected void lnkFirst_Click(object sender, EventArgs e)
        {
            this.PageIndex = 0;
            BindUserAccounts();
        }

        protected void lnkPrev_Click(object sender, EventArgs e)
        {
            this.PageIndex -= 1;
            BindUserAccounts();
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            this.PageIndex += 1;
            BindUserAccounts();
        }

        protected void lnkLast_Click(object sender, EventArgs e)
        {
            // Determine the total number of records
            int totalRecords;
            Membership.FindUsersByName(this.UsernameToMatch + "%", this.PageIndex, this.PageSize, out totalRecords);

            // Navigate to the last page index
            this.PageIndex = (totalRecords - 1) / this.PageSize;
            BindUserAccounts();
        }
        #endregion

        #region Properties
        private string UsernameToMatch
        {
            get
            {
                object o = ViewState["UsernameToMatch"];
                if (o == null)
                    return string.Empty;
                else
                    return (string)o;
            }
            set
            {
                ViewState["UsernameToMatch"] = value;
            }
        }

        private int PageIndex
        {
            get
            {
                object o = ViewState["PageIndex"];
                if (o == null)
                    return 0;
                else
                    return (int)o;
            }
            set
            {
                ViewState["PageIndex"] = value;
            }
        }

        private int PageSize
        {
            get
            {
                return 10;
            }
        }
        #endregion
    }
}