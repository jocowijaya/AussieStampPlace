<%@ Page Title="Admin" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <h1>Administration</h1>
    <h3>Welcome <asp:LoginName ID="AdminLoginName" runat="server" />. You have administration priviledges.</h3>
</asp:Content>

