<%@ Page Title="Specials" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Specials.aspx.cs" Inherits="Pages_Specials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">

       <asp:LoginView ID="LoginView_Specials" runat="server">

            <AnonymousTemplate>

                    <h1>Welcome to our specials!</h1>

                    <h2>To be eligible to see and purchase listed specials, you must register as a member.</h2>
                    <h2>To become a member, <asp:HyperLink ID="Register_HyperLink" NavigateUrl="~/Pages/Register.aspx" runat="server">register now.</asp:HyperLink></h2>

            </AnonymousTemplate>

            <RoleGroups>

                <asp:RoleGroup Roles="member">
                    <ContentTemplate>

                        <h1>Welcome to our member specials!</h1>
                        <h2>Here at Aussie Stamp Place we feature a number of stamps.</h2>
                        <h2>Featured stamps are available at 15% off their regular listed sale price to members.</h2>
                        <asp:GridView ID="StampCatalogueGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource_StampCatalogue" GridLines="None" HorizontalAlign="Center">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <asp:BoundField DataField="Price" HeaderText="Sales Price" SortExpression="Price" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
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
                            SelectCommand="SELECT [StampId], [Name], [Price] * 0.85 AS [Price], [InStock], [LastUpdate], [Picture] FROM [TabularStamps] WHERE [OnSpecial] = 1">
                        </asp:SqlDataSource>
                            
                    </ContentTemplate>

                    </asp:RoleGroup>

                    <asp:RoleGroup Roles="dealer">
                      <ContentTemplate>

                    <h1>Welcome to our dealer specials!</h1>
                    <h2>Here at Aussie Stamp Place we feature a number of stamps.</h2>
                    <h2>Featured stamps are available at 30% off their regular listed sale price to dealers.</h2>
                    <asp:GridView ID="StampCatalogueGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource_StampCatalogue" GridLines="None" HorizontalAlign="Center">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Price" HeaderText="Wholesale Price" SortExpression="Price" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
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
                        SelectCommand="SELECT [StampId], [Name], [Price] * 0.7 AS [Price], [InStock], [LastUpdate], [Picture] FROM [TabularStamps] WHERE [OnSpecial] = 1">
                    </asp:SqlDataSource>
                            
                </ContentTemplate>
                </asp:RoleGroup>

                <asp:RoleGroup Roles="admin">
                      <ContentTemplate>

                    <h1>Welcome to our admin specials!</h1>
                    <h2>Here at Aussie Stamp Place we feature a number of stamps.</h2>
                    <h2>Featured stamps are available at 30% off their regular listed sale price to admins.</h2>
                    <asp:GridView ID="StampCatalogueGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource_StampCatalogue" GridLines="None" HorizontalAlign="Center">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Price" HeaderText="Wholesale Price" SortExpression="Price" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
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
                        SelectCommand="SELECT [StampId], [Name], [Price] * 0.7 AS [Price], [InStock], [LastUpdate], [Picture] FROM [TabularStamps] WHERE [OnSpecial] = 1">
                    </asp:SqlDataSource>
                            
                </ContentTemplate>
                </asp:RoleGroup>

            </RoleGroups>

       </asp:LoginView>

</asp:Content>

