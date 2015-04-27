using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Profile;
using System.Data;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace SisLIJAD.Account
{
    public partial class CreateNewWizard : System.Web.UI.Page
    {


        // CreatedUser event is called when a new user is successfully created
        public void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {

            // Create an empty Profile for the newly created user
            ProfileBase p = (ProfileBase)ProfileBase.Create(CreateUserWizard.UserName, true);
             // Populate some Profile properties off of the create user wizard
            p.Nombres = ((TextBox)CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("Nombres")).Text;
            p.Apellidos = ((TextBox)CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("Apellidos")).Text;
          
            
            // Save the profile - must be done since we explicitly created this profile instance
            p.Save();
        }

        // Activate event fires when the user hits "next" in the CreateUserWizard
        public void AssignUserToRoles_Activate(object sender, EventArgs e)
        {

            // Databind list of roles in the role manager system to a listbox in the wizard
            AvailableRoles.DataSource = Roles.GetAllRoles(); ;
            AvailableRoles.DataBind();
        }

        // Deactivate event fires when user hits "next" in the CreateUserWizard 
        public void AssignUserToRoles_Deactivate(object sender, EventArgs e)
        {

            // Add user to all selected roles from the roles listbox
            for (int i = 0; i < AvailableRoles.Items.Count; i++)
            {
                if (AvailableRoles.Items[i].Selected == true)
                    Roles.AddUserToRole(CreateUserWizard.UserName, AvailableRoles.Items[i].Value);
            }
        }
    }
}