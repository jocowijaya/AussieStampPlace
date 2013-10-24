using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Pages_Register : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateUserWizard_CreatedUser(object sender, EventArgs e)
    {
        Roles.AddUserToRole(CreateUserWizard_Register.UserName, "Member");
    }
}