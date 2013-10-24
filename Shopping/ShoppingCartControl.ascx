<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ShoppingCartControl.ascx.cs" Inherits="Shopping_ShoppingCartControl" %>
<asp:GridView ID="GridView_ShoppingCart" runat="server" 
        AutoGenerateColumns="False" DataKeyNames="GET_SET_StampID" HorizontalAlign="Center" 
        onrowediting="GridView_ShoppingCart_RowEditing" 
        onrowupdating="GridView_ShoppingCart_RowUpdating" 
        onrowcancelingedit="GridView_ShoppingCart_RowCancelingEdit" 
        onrowdeleting="GridView_ShoppingCart_RowDeleting" GridLines="None">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Image id="StampImage" Runat="server" ImageUrl='<%# Eval("GET_SET_StampPicture")%>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="GET_SET_StampName" HeaderText="Product" ReadOnly="True" />
            <asp:BoundField DataField="GET_SET_StampQuantity" HeaderText="Quantity" />
            <asp:BoundField DataField="GET_SET_StampPrice" DataFormatString="{0:c}" HeaderText="Price" ReadOnly="True" ItemStyle-HorizontalAlign="Right" />
            <asp:BoundField DataField="GET_StampSubTotal" DataFormatString="{0:c}" HeaderText="Total" ReadOnly="True" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>

        <EmptyDataTemplate>
        There is nothing in your shopping cart.
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:Label ID="TotalPriceLabel" runat="server"></asp:Label>