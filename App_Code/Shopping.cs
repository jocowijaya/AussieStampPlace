using System;
using System.Data;
using System.Web;
using System.Data.SqlClient;
using System.Collections.Generic;

/// <summary>
/// Summary description for Shopping
/// </summary>
/// 
namespace AssignmentShoppingCard
{
    [Serializable]
    public class CartItem
    {
        private int stampID;
        private string stampName;
        private double stampPrice;
        private string stampPicture;
        private int stampQuantity;
        private double stampSubTotal;

        public CartItem()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public CartItem(int StampID, String StampName, double StampPrice, String StampPicture, int StampQuantity)
        {
            stampID = StampID;
            stampName = StampName;
            stampPrice = StampPrice;
            stampPicture = StampPicture;
            stampQuantity = StampQuantity;
            stampSubTotal = StampQuantity * StampPrice;

        }

        public int GET_SET_StampID
        {
            get
            {
                return stampID;
            }
            set
            {
                stampID = value;
            }
        }

        public string GET_SET_StampName
        {
            get
            {
                return stampName;
            }

            set
            {
                stampName = value;
            }
        }

        public double GET_SET_StampPrice
        {
            get
            {
                return stampPrice;
            }

            set
            {
                stampPrice = value;
            }
        }

        public string GET_SET_StampPicture
        {
            get
            {
                return stampPicture;
            }

            set
            {
                stampPicture = value;
            }
        }

        public int GET_SET_StampQuantity
        {
            get
            {
                return stampQuantity;
            }
            set
            {
                stampQuantity = value;
            }
        }

        public double GET_StampSubTotal
        {
            get
            {
                return stampQuantity * stampPrice;
            }
        }

    }

    [Serializable]
    public class ShoppingCart
    {
        private DateTime DateCreated;
        private DateTime LastUpdated;
        private List<CartItem> CartItems;

        public ShoppingCart()
        {
            if (this.CartItems == null)
            {
                this.CartItems = new List<CartItem>();
                this.DateCreated = DateTime.Now;
            }
        }

        public List<CartItem> Items
        {
            get
            {
                return CartItems;
            }

            set
            {
                CartItems = value;
            }
        }

        public void Insert(int StampID, String StampName, double StampPrice, String StampPicture, int StampQuantity)
        {
            int ItemIndex = ItemIndexOfID(StampID);
            if (ItemIndex == -1)
            {
                CartItem newCartItem = new CartItem();
                newCartItem.GET_SET_StampID = StampID;
                newCartItem.GET_SET_StampName = StampName;
                newCartItem.GET_SET_StampPicture = StampPicture;
                newCartItem.GET_SET_StampPrice = StampPrice;
                newCartItem.GET_SET_StampQuantity = StampQuantity;

                Items.Add(newCartItem);
            }

            else
            {
                Items[ItemIndex].GET_SET_StampQuantity += 1;
            }

            LastUpdated = DateTime.Now; 
        }

        public void Update(int RowID, int StampID, int StampQuantity, double StampPrice)
        {
            CartItem UpdatedItem = CartItems[RowID];
            UpdatedItem.GET_SET_StampID = StampID;
            UpdatedItem.GET_SET_StampQuantity = StampQuantity;
            UpdatedItem.GET_SET_StampPrice = StampPrice;
            LastUpdated = DateTime.Now; 
        }

        public void Delete(int RowID)
        {
            CartItems.RemoveAt(RowID);
            LastUpdated = DateTime.Now;
        }

        public int ItemIndexOfID(int StampID)
        {
            int index = 0;
            foreach (CartItem item in CartItems)
            {
                if (item.GET_SET_StampID == StampID)
                {
                    return index;
                }
                index += 1;
            }
            return -1;
        }

        public double Total
        {
            get
            {
                double t = 0;
                if (CartItems == null)
                {
                    return 0;
                }
                foreach (CartItem Item in CartItems)
                {
                    t += Item.GET_StampSubTotal;
                }
                return t;
            }
        }
    }
}