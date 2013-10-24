<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Shopping_Checkout" %>

<%@ Register src="ShoppingCartControl.ascx" tagname="ShoppingCartControl" tagprefix="uc1" %>
<%@ Import Namespace ="System.Data.SqlClient"%>
<%@ Import Namespace ="AssignmentShoppingCard"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">

     <asp:Label id="InformationLabel" runat="server" visible="false">
        There is nothing in your shopping cart.
    </asp:Label>
    <div style="float:right">
        <asp:LoginView ID="LoginViewl" Runat="server">
        <AnonymousTemplate>
            <asp:passwordrecovery id="PasswordRecoveryl" runat="server" />
        </AnonymousTemplate>
        </asp:LoginView>
    </div>

    <asp:Wizard ID="Checkout_Wizard" runat="server" ActiveStepIndex="1" 
        onfinishbuttonclick="Checkout_Wizard_FinishButtonClick" 
        onactivestepchanged="Checkout_Wizard_ActiveStepChanged" 
        onnextbuttonclick="Checkout_Wizard_NextButtonClick">
        <WizardSteps>
            <asp:WizardStep runat="server" title="Login">
                <asp:Login ID="User_Login" runat="server">
                </asp:Login>
            </asp:WizardStep>

            <asp:WizardStep runat="server" title="Delivery Address">
                <asp:checkbox id="chkUseProfileAddress" runat="server" autopostback="True" 
                    text="Use membership address" 
                    OnCheckedChanged="chkUseProfileAddress_CheckedChanged"></asp:checkbox>
                <br />
                    <table border="O">
                    <tr>
                        <td>Name</td><td><asp:textbox id="txtName" runat="server" /></td>
                    </tr>

                    <tr>
                        <td>Address</td><td><asp:textbox id="txtAddress" runat="server" /></td>
                    </tr>

                    <tr>
                    <td>City</td><td><asp:textbox id="txtCity" runat="server" /></td>
                    </tr>

                    <tr>
                        <td>State</td><td><asp:textbox id="txtState" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Postcode</td><td><asp:textbox id="txtPostCode" runat="server" /></td>
                    </tr>

                    <tr>
                        <td>Country</td><td><asp:textbox id="txtCountry" runat="server" /></td>
                    </tr>
                    </table>
            </asp:WizardStep>

            <asp:WizardStep runat="server" Title="Payment">
                <asp:DropDownList id="lstCardType" runat="server">
                    <asp:Listitem>MasterCard</asp:Listitem>
                    <asp:Listitem>Visa</asp:Listitem>
                </asp:DropDownList>
                <br />
                Card Number: <asp:Textbox id="txtNurnber" runat="server" Text="0123456789" ReadOnly="True"/>
                <br />
                Expires:
                <asp:textbox id="txtExpiresMonth" runat="server" columns="2" />
                /
                <asp:textbox id="txtExpiresYear" runat="server" columns="4" />
                </asp:WizardStep>

                <asp:WizardStep runat="server" Title="Confirmation">
                    <uc1:ShoppingCartControl ID="ShoppingCartControl1" runat="server" />
                    <br />
                    <br />
                    <br />
                    Please confirm the amount you wish to have deducted from your credit card.
                </asp:WizardStep>

            <asp:WizardStep runat="server" Title="Complete">
            Thank you for your order.
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</asp:Content>

