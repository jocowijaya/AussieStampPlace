using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using AssignmentShoppingCard;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Shopping_Checkout : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Profile.Cart == null)
            {
                InformationLabel.Visible = true;
                Checkout_Wizard.Visible = false;
            }
                if (User.Identity.IsAuthenticated)
                {
                    Checkout_Wizard.ActiveStepIndex = 1;
                }
                    else
                    {
                        Checkout_Wizard.ActiveStepIndex = 0;
                    }
        }
    }
    protected void chkUseProfileAddress_CheckedChanged(object sender, EventArgs e)
    {
 
        if (chkUseProfileAddress.Checked && txtName.Text.Trim() == "")
        {
            txtName.Text = Profile.Name;
            txtAddress.Text = Profile.Address;
            txtCity.Text = Profile.City;
            txtState.Text = Profile.State;
            txtPostCode.Text = Profile.PostCode;
            txtCountry.Text = Profile.Country;
         }
    }

    protected void  Checkout_Wizard_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        Profile.Cart.Items.Clear();
        
        Profile.Name = txtName.Text;
        Profile.Address = txtAddress.Text;
        Profile.City = txtCity.Text;
        Profile.State = txtState.Text;
        Profile.PostCode = txtPostCode.Text;
        Profile.Country = txtCountry.Text;

        Server.Transfer("~/Pages/StampCatalogue.aspx");
    }


    protected void  Checkout_Wizard_NextButtonClick(object sender, System.Web.UI.WebControls.WizardNavigationEventArgs e)
    {

        if (e.CurrentStepIndex == 0)
        {
            System.Web.UI.WebControls.Login l = (Login)Checkout_Wizard.FindControl("User_Login");
            if (Membership.ValidateUser(l.UserName, l.Password))
            {
                FormsAuthentication.SetAuthCookie(l.UserName, l.RememberMeSet);
                e.Cancel = false;
            }
            else
            {
                l.InstructionText = "Your login attempt was not successful. Please try again.";
                l.InstructionTextStyle.ForeColor = System.Drawing.Color.Red;
                e.Cancel = true;
            }
        }
        else
        {
            if (!User.Identity.IsAuthenticated)
            {
                e.Cancel = true;
                Checkout_Wizard.ActiveStepIndex = 0;
            }
        }
    }

    protected void  Checkout_Wizard_ActiveStepChanged(object sender, EventArgs e)
    {

        if (!User.Identity.IsAuthenticated)
        {
            Checkout_Wizard.ActiveStepIndex = 0;
        }

    }
}