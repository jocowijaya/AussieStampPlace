using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageCatalogue : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void FormView_Catalogue_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        GridView_Catalogue.DataBind();
    }
    protected void FormView_Catalogue_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        e.Values["LastUpdate"] = DateTime.Now;
        String selectedSeries = DropDownList_Series.SelectedValue.ToString();
        e.Values["Series"] = selectedSeries;
    }
}