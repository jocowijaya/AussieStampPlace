using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Admin_AddUserToRole : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void AddUserToRole_Button_Click(object sender, EventArgs e)
    {
        String SelectedRole = ListBox_Role.SelectedValue.ToString();
        String SelectedUser = ListBox_User.SelectedValue.ToString();

        if (Roles.IsUserInRole(SelectedUser, SelectedRole))
        {
            InformationLabel.Text = "User " + SelectedUser + " is already in role " + SelectedRole;
        }

            else
            {
                String[] role_before = Roles.GetRolesForUser(SelectedUser);

                foreach (String Allroles in Roles.GetAllRoles())
                {

                    if (role_before.Contains(Allroles))
                    {
                        Roles.RemoveUserFromRole(SelectedUser, Allroles);
                    }

                }

                Roles.AddUserToRole(SelectedUser, SelectedRole);
                InformationLabel.Text = "User " + SelectedUser + " added to role " + SelectedRole;
            }
    }
}