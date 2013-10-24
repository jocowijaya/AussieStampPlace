using System;
using System.Web;

public class BasePage : System.Web.UI.Page
{
    private void Page_PreRender(object sender, EventArgs e)
    {
        if (this.Title == "Untitled Page" || string.IsNullOrEmpty(this.Title))
        {
            throw new Exception("Page title cannot be \"Untitled Page\" or an empty string.");
        }
    }

    private void Page_PreInit(object sender, EventArgs e)
    {
        HttpCookie pickedTheme = Request.Cookies.Get("PickedTheme");
        if (pickedTheme != null)
        {
            Page.Theme = pickedTheme.Value;
        }
    }

    public BasePage()
    {
        this.PreRender += new EventHandler(Page_PreRender);
        this.PreInit += new EventHandler(Page_PreInit);
    }
}