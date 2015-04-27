using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
 using System.Web.Profile;

namespace SisLIJAD.Account
{
    public partial class RegisterUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // CreatedUser event is called when a new user is successfully created
    public void CreateUserWizard1_CreatedUser(object sender, EventArgs e) {

        // Create an empty Profile for the newly created user
        ProfileCommon p = (ProfileCommon) ProfileCommon.Create(CreateUserWizard1.UserName, true);

        // Populate some Profile properties off of the create user wizard
        p.Country = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Country")).SelectedValue;
        p.Gender = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Gender")).SelectedValue;
        p.Age = Int32.Parse(((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Age")).Text);

        // Save the profile - must be done since we explicitly created this profile instance
        p.Save();
    }

    // Activate event fires when the user hits "next" in the CreateUserWizard
    public void AssignUserToRoles_Activate(object sender, EventArgs e) {

        // Databind list of roles in the role manager system to a listbox in the wizard
        AvailableRoles.DataSource = Roles.GetAllRoles(); ;
        AvailableRoles.DataBind();
    }

    // Deactivate event fires when user hits "next" in the CreateUserWizard 
    public void AssignUserToRoles_Deactivate(object sender, EventArgs e) {

        // Add user to all selected roles from the roles listbox
        for (int i = 0; i < AvailableRoles.Items.Count; i++) {
            if (AvailableRoles.Items[i].Selected == true) 
                Roles.AddUserToRole(CreateUserWizard1.UserName, AvailableRoles.Items[i].Value);
        }
    }
}
    }
}