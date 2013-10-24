<%@ Page Title="Register" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Pages_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <h1>Welcome to Aussie Stamp Place!</h1>
    <h2>We welcome your registration. Please fill out from below to register.</h2>
    <div align="center">
    <asp:CreateUserWizard ID="CreateUserWizard_Register" runat="server" 
            ContinueDestinationPageUrl="~/Pages/Specials.aspx" 
            oncreateduser="CreateUserWizard_CreatedUser" 
            FinishDestinationPageUrl="~/Pages/Specials.aspx">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizard" runat="server" />
            <asp:CompleteWizardStep ID="CompleteUserWizard" runat="server" />
        </WizardSteps>
    </asp:CreateUserWizard>
    </div>
    <br />

</asp:Content>

