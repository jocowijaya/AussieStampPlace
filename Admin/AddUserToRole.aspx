<%@ Page Title="Add User To Role" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddUserToRole.aspx.cs" Inherits="Admin_AddUserToRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <h1>Add User To Role</h1>
    <h3>Select a user</h3>

  <div align="center">
    <asp:ListBox ID="ListBox_User" runat="server" 
        DataSourceID="SqlDataSource_UserListBox" DataTextField="UserName" 
        DataValueField="UserName" Width="300">
    </asp:ListBox>

    <asp:SqlDataSource ID="SqlDataSource_UserListBox" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString_User %>" 
        SelectCommand="SELECT [UserName] FROM [vw_aspnet_Users]">
    </asp:SqlDataSource>
    
    <h3>Select a role</h3>
    <asp:ListBox ID="ListBox_Role" runat="server" 
        DataSourceID="SqlDataSource_RoleListBox" DataTextField="RoleName" 
        DataValueField="RoleName">
    </asp:ListBox>
    

    <asp:SqlDataSource ID="SqlDataSource_RoleListBox" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString_User %>" 
        SelectCommand="SELECT [RoleName] FROM [vw_aspnet_Roles]">
    </asp:SqlDataSource>

    <h3>Click button to add user to role</h3>
    <asp:Button ID="AddUserToRole_Button" runat="server" Text="Add user to role" onclick="AddUserToRole_Button_Click" />
    <br />
    <asp:Label ID="InformationLabel" runat="server" />
  </div>
    
</asp:Content>

