using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Admin_AddUser : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateUserWizard_Add_New_User(object sender, EventArgs e)
    {
        Roles.AddUserToRole(CreateUserWizard_AddNewUser.UserName, "Member");
    }
}