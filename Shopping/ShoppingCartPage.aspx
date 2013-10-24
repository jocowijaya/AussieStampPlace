<%@ Page Title="Shopping Cart Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCartPage.aspx.cs" Inherits="Shopping_ShoppingCartPage" %>

<%@ Register src="ShoppingCartControl.ascx" tagname="ShoppingCartControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <h1>Your Shopping Cart</h1>
    <uc1:ShoppingCartControl ID="ShoppingCartControl1" runat="server" />
    <br/>
    <br />
</asp:Content>

