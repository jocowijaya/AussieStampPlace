<%@ Page Title="Manage Catalogue" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageCatalogue.aspx.cs" Inherits="Admin_ManageCatalogue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <h1>Manage Content</h1>
    <h3>Select category</h3>
    <p> 
        <asp:DropDownList ID="DropDownList_Series" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource_DropDownList" DataTextField="Series" 
            DataValueField="Series">
        </asp:DropDownList>
    
        <asp:SqlDataSource ID="SqlDataSource_DropDownList" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString_StampDatabase %>" 
            SelectCommand="SELECT DISTINCT [Series] FROM [TabularStamps]">
        </asp:SqlDataSource>
    </p>

    <h3>Existing Catalogue items:</h3>

    <p> 
        <asp:GridView ID="GridView_Catalogue" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="StampId" 
            DataSourceID="SqlDataSource_GridView" GridLines="None" HorizontalAlign="Center" 
            ForeColor="#333333" CellPadding="4" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:n4}" ItemStyle-HorizontalAlign="Right" />
                <asp:BoundField DataField="InStock" HeaderText="InStock" SortExpression="InStock" />
                <asp:BoundField DataField="LastUpdate" HeaderText="LastUpdate" SortExpression="LastUpdate" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Picture" HeaderText="Picture Url" SortExpression="Picture" />
                <asp:BoundField DataField="OnSpecial" HeaderText="OnSpecial" SortExpression="OnSpecial" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource_GridView" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString_StampDatabase %>" 
            DeleteCommand="DELETE FROM [TabularStamps] WHERE [StampId] = @StampId" 
            InsertCommand="INSERT INTO [TabularStamps] ([Name], [Price], [InStock], [LastUpdate], [Picture], [OnSpecial]) VALUES (@Name, @Price, @InStock, @LastUpdate, @Picture, @OnSpecial)" 
            SelectCommand="SELECT * FROM [TabularStamps] WHERE ([Series] = @Series)" 
            UpdateCommand="UPDATE [TabularStamps] SET [Name] = @Name, [Price] = @Price, [InStock] = @InStock, [LastUpdate] = @LastUpdate, [Picture] = @Picture, [OnSpecial] = @OnSpecial WHERE [StampId] = @StampId">
            <DeleteParameters>
                <asp:Parameter Name="StampId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="InStock" Type="Int32" />
                <asp:Parameter Name="LastUpdate" Type="DateTime" />
                <asp:Parameter Name="Picture" Type="String" />
                <asp:Parameter Name="OnSpecial" Type="Int16" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList_Series" Name="Series" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="InStock" Type="Int32" />
                <asp:Parameter Name="LastUpdate" Type="DateTime" />
                <asp:Parameter Name="Picture" Type="String" />
                <asp:Parameter Name="OnSpecial" Type="Int16" />
                <asp:Parameter Name="StampId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>

    <h3>Add a new stamp to the category:</h3>
        <asp:FormView ID="FormView_Catalogue" runat="server"
            DataKeyNames="StampId" DataSourceID="SqlDataSource_FormView" 
            DefaultMode="Insert" HorizontalAlign="Center" 
            oniteminserted="FormView_Catalogue_ItemInserted" 
            oniteminserting="FormView_Catalogue_ItemInserting" BorderColor="Black" 
            BorderStyle="Solid"  BackColor="#EFF3FB">
          
            <InsertItemTemplate>
               <table >

                        <tr>
                            <td align="right"> <asp:Label ID="NameLabel" runat="server"> Name: </asp:Label> </td>
                            <td> <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' Width="150" /> </td>
                        </tr>

                        <tr>
                            <td align="right"> <asp:Label ID="PriceLabel" runat="server"> Price: </asp:Label> </td>
                            <td> <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' Width="150"/> </td>
                        </tr>
               
                        <tr>
                            <td align="right"> <asp:Label ID="InStockLabel" runat="server"> InStock: </asp:Label> </td>
                            <td> <asp:TextBox ID="InStockTextBox" runat="server" Text='<%# Bind("InStock") %>' Width="150" /> </td>
                        </tr>
               
                        <tr>
                            <td align="right"> <asp:Label ID="PictureLabel" runat="server"> Picture: </asp:Label> </td>
                            <td> <asp:TextBox ID="PictureTextBox" runat="server" Text='<%# Bind("Picture") %>' Width="150" /> </td>
                        </tr>

                        <tr>
                            <td align="right"> <asp:Label ID="OnSpecialLabel" runat="server"> OnSpecial: </asp:Label> </td>
                            <td> <asp:TextBox ID="OnSpecialTextBox" runat="server" Text='<%# Bind("OnSpecial") %>' Width="150" /> </td>
                        </tr>
               
                        <tr>
                            <td> <asp:Label ID="DummyLabel" runat="server"></asp:Label> </td>
                            <td align="right"> <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                &nbsp;
                                 <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" /> </td>
                        </tr>
                
                </table>
            </InsertItemTemplate>

        </asp:FormView>

        <br/>

        <asp:SqlDataSource ID="SqlDataSource_FormView" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString_StampDatabase %>" 
            DeleteCommand="DELETE FROM [TabularStamps] WHERE [StampId] = @StampId" 
            InsertCommand="INSERT INTO [TabularStamps] ([Name], [Price], [InStock], [LastUpdate], [Picture], [Series], [OnSpecial]) VALUES (@Name, @Price, @InStock, @LastUpdate, @Picture, @Series, @OnSpecial)" 
            SelectCommand="SELECT * FROM [TabularStamps]" 
            UpdateCommand="UPDATE [TabularStamps] SET [Name] = @Name, [Price] = @Price, [InStock] = @InStock, [LastUpdate] = @LastUpdate, [Picture] = @Picture, [Series] = @Series, [OnSpecial] = @OnSpecial WHERE [StampId] = @StampId">
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="InStock" Type="Int32" />
                <asp:Parameter Name="LastUpdate" Type="DateTime" />
                <asp:Parameter Name="Picture" Type="String" />
                <asp:Parameter Name="Series" Type="String" />
                <asp:Parameter Name="OnSpecial" Type="Int16" />
            </InsertParameters>
        </asp:SqlDataSource>
</asp:Content>

