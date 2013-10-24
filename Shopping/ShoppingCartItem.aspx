<%@ Page Title="Shopping Cart Item" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCartItem.aspx.cs" Inherits="Shopping_ShoppingCartItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <h1>Selected Item</h1>
    <asp:DataList ID="DataList_Item" runat="server" DataKeyField="StampId" 
        DataSourceID="SqlDataSource_DataList" HorizontalAlign="Center">
        <ItemTemplate>
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval ("Picture") %>' />
            <asp:Label ID="PictureLabel" runat="server" Text='<%# Eval("Picture") %>' Visible="False" />
            <br />
            <br />
            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
            <br />
            <asp:Label ID="PriceLabel" runat="server"><% = priceRequest%></asp:Label>
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <br />
    <br />
    <asp:ImageButton ID="Add_To_Cart_Button" runat="server" ImageUrl="~/Images/AddToCart.jpg" onclick="Add_To_Cart_Button_Click" ImageAlign="Middle" />
    <br />
    <br />

    <asp:SqlDataSource ID="SqlDataSource_DataList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString_StampDatabase %>" 
        SelectCommand="SELECT [StampId], [Name], [Price], [Picture] FROM [TabularStamps] WHERE ([StampId] = @StampId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="StampId" QueryStringField="StampId" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

