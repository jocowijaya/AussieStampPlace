<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<span id="top"></span>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <h1>Welcome to Aussie Stamp Place!</h1>
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/kangaroos.jpg" />
    <br />
    <p>
        <strong>Aussie Stamp Place</strong> specialises in online sales of all Australia stamps.</p>
    <p>
        We don&#39;t run a show , we are able to keep our prices down. All our stamps are in 
        good condition.</p>
    <p>
        Our online showroom is divided into numerous parts - our demonstration site only 
        shows.</p>
    <p>
        3 series of early Australian stamps. We think you&#39;ll like our full range.</p>
    <p>
        If you have any question , please don&#39;t hesitate to contact us on:</p>
    <p>
        Aussie Stamps Place Online Showroom <br />
        123 Fake Street <br />
        Fake City, QLD, 1234 <br />
        Ph : 07 1234 5678 <br />
         </p>
   
   <a href="#top">Top</a>

</asp:Content>

