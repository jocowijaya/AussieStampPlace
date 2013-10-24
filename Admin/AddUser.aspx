<%@ Page Title="Add User" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="Admin_AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <h1>Add new user</h1>
    <div align="center">
    <asp:CreateUserWizard ID="CreateUserWizard_AddNewUser" runat="server" 
            ContinueDestinationPageUrl="~/Default.aspx" 
            oncreateduser="CreateUserWizard_Add_New_User" 
            FinishDestinationPageUrl="~/Default.aspx" LoginCreatedUser="False">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizard" runat="server" />
            <asp:CompleteWizardStep ID="CompleteUserWizard" runat="server" />
        </WizardSteps>
    </asp:CreateUserWizard>
    </div>
    <br />
</asp:Content>

