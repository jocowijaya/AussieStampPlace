using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Shopping_ShoppingCartItem : BasePage
{
    public String priceRequest = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            double temp = Double.Parse(Request.QueryString["specialPrice"].ToString());
            priceRequest = String.Format("{0:C}", temp); 
        }
        if (Profile.Cart != null)
        {
           
        }
    }
    protected void Add_To_Cart_Button_Click(object sender, ImageClickEventArgs e)
    {
        int stampId = int.Parse(Request.QueryString["StampId"]);
        string stampName = ((Label)DataList_Item.Controls[0].FindControl("NameLabel")).Text;
        double stampPrice = double.Parse(Request.QueryString["specialPrice"]);
        string stampPicture = ((Label)DataList_Item.Controls[0].FindControl("PictureLabel")).Text;
        
        if (Profile.Cart == null)
        {
            Profile.Cart = new AssignmentShoppingCard.ShoppingCart();
            
        }

        Profile.Cart.Insert(stampId, stampName, stampPrice, stampPicture, 1);
        Server.Transfer("~/Shopping/ShoppingCartPage.aspx");
        
    }
}