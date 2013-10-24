using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string chosenTheme = Page.Theme;
            HttpCookie pickedTheme = Request.Cookies.Get("PickedTheme");
            if (pickedTheme != null)
            {
                chosenTheme = pickedTheme.Value;
            }
            if (!string.IsNullOrEmpty(chosenTheme) && ThemeList.Items.FindByValue(chosenTheme) != null)
                {
                    ThemeList.Items.FindByValue(chosenTheme).Selected = true;
                }
        }
    }
    protected void ThemeList_SelectedIndexChanged(object sender, EventArgs e)
    {
        HttpCookie pickedTheme = new HttpCookie("PickedTheme");
        pickedTheme.Expires = DateTime.Now.AddMonths(3);
        pickedTheme.Value = ThemeList.SelectedValue;
        Response.Cookies.Add(pickedTheme);
        Response.Redirect(Request.Url.ToString());
    }
  
}
