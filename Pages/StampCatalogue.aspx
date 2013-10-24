<%@ Page Title="Stamp Catalogs - View As Catalogue" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StampCatalogue.aspx.cs" Inherits="Pages_StampCatalogue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <h1>View our Catalogue</h1>
    <h2>Below is a complete catalogue of our stamps.</h2>
    <h3>All Stamps</h3>
    <br />

    <asp:GridView ID="StampCatalogueGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource_StampCatalogue" GridLines="None" HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
            <asp:BoundField DataField="InStock" HeaderText="InStock" SortExpression="InStock" />
            <asp:BoundField DataField="LastUpdate" HeaderText="LastUpdate" SortExpression="LastUpdate" DataFormatString="{0:d}" />
            <asp:ImageField DataImageUrlField="Picture" SortExpression="Picture" />
            <asp:TemplateField>
                 <ItemTemplate>
                    <asp:LinkButton ID="AddToCartLinkButton" Text="Add to cart" PostBackUrl='<%# string.Format("~/Shopping/ShoppingCartItem.aspx?StampId={0}&specialPrice={1}", Eval("StampId"), Eval ("Price")) %>' runat="server" />
                 </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource_StampCatalogue" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString_StampDatabase %>" 
        SelectCommand="SELECT [StampId], [Name], [Price], [InStock], [LastUpdate], [Picture] FROM [TabularStamps]">
    </asp:SqlDataSource>
</asp:Content>

