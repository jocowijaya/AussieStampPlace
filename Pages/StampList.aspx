<%@ Page Title="Stamp Catalogs - View As List" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StampList.aspx.cs" Inherits="Pages_StampList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <h1>View Our List</h1>
    <h2>Below is a complete list of our stamps. Use the drop down list to filter the stamps by series.</h2>
    <br />
    <h3>Stamps Series:</h3>

    <asp:DropDownList ID="DropDownList_Series" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource_DropDownList" DataTextField="Series" 
        DataValueField="Series">
    </asp:DropDownList>
    
    <asp:SqlDataSource ID="SqlDataSource_DropDownList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString_StampDatabase %>" 
        SelectCommand="SELECT DISTINCT [Series] FROM [TabularStamps]">
    </asp:SqlDataSource>

    <asp:GridView ID="StampListGridView" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource_GridView" AllowSorting="True" GridLines="None" HorizontalAlign="Center">
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
    
    <asp:SqlDataSource ID="SqlDataSource_GridView" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString_StampDatabase %>" 
        SelectCommand="SELECT [StampId], [Name], [Price], [InStock], [LastUpdate], [Picture] FROM [TabularStamps] WHERE ([Series] = @Series)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList_Series" 
                DefaultValue="StampSeries" Name="Series" PropertyName="SelectedValue" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
</asp:Content>

