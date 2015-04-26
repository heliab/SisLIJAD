<%@ Page Title="" Language="C#" MasterPageFile="~/Cuenta/AccountMASTER.Master" AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="SisLIJAD.Account.RecoverPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
    <div>
    <h1>Recuperar contraseña</h1>
        <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" BackColor="#F7F6F3" 
            BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" 
            Font-Names="Verdana" Font-Size="0.8em" 
            onsendingmail="PasswordRecovery1_SendingMail">
            <SubmitButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
                ForeColor="#284775" />
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <MailDefinition BodyFileName="~/Recover/RecoverPassword.htm" From="SisLijad@gmail.com" 
                Subject="Recuperacion de contraseña" IsBodyHtml="True">
            </MailDefinition>
            <SuccessTextStyle Font-Bold="True" ForeColor="#5D7B9D" />
            <TextBoxStyle Font-Size="0.8em" />
            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" 
                ForeColor="White" />
        </asp:PasswordRecovery>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
