using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AssignmentShoppingCard;

public partial class Shopping_ShoppingCartControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Profile.Cart == null)
        {
            Profile.Cart = new AssignmentShoppingCard.ShoppingCart();
        }
            if (!Page.IsPostBack)
            {
                BindGrid();
            }
                if (Profile.Cart.Items == null)
                {

                    TotalPriceLabel.Visible = false;
                }
    }

    protected void GridView_ShoppingCart_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView_ShoppingCart.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void GridView_ShoppingCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox QuantityTextBox = (TextBox)GridView_ShoppingCart.Rows[e.RowIndex].Cells[2].Controls[0];
        int Quantity = Convert.ToInt32(QuantityTextBox.Text);
        if (Quantity == 0)
        {
            Profile.Cart.Items.RemoveAt(e.RowIndex);
        }
        else
        {
            Profile.Cart.Items[e.RowIndex].GET_SET_StampQuantity = Quantity;
            GridView_ShoppingCart.EditIndex = -1;
            BindGrid();
        }

        GridView_ShoppingCart.EditIndex = -1;
        BindGrid();
    }


    protected void GridView_ShoppingCart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView_ShoppingCart.EditIndex = -1;
        BindGrid();
    }

    protected void GridView_ShoppingCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Profile.Cart.Items.RemoveAt(e.RowIndex);
        BindGrid();
    }

    private void BindGrid()
    {
        GridView_ShoppingCart.DataSource = Profile.Cart.Items;
        DataBind();
        TotalPriceLabel.Text = String.Format("Total:{0,19:C}", Profile.Cart.Total);
    }
}