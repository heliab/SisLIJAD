<%@ Page Title="Iniciar sesión" Language="C#" MasterPageFile="~/Account/AccountMASTER.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="SisLIJAD.Account.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="FormContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="GridContent">
<div class="centertitle">
    <h2>
        Iniciar sesión
    </h2>
    <p>
        Especifique su nombre de usuario y contraseña.
        <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">Registrarse</asp:HyperLink> si no tiene una cuenta.
    </p>
    <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false">
        <LayoutTemplate>
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="LoginUserValidationGroup"/>
                 </div>
            <div class="accountInfo formRegister">
                <fieldset class="login">
                    <legend>Información de cuenta</legend>
                    <p>
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nombre de usuario:</asp:Label>
                        <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                             CssClass="failureNotification" ErrorMessage="El nombre de usuario es obligatorio." ToolTip="El nombre de usuario es obligatorio." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Contraseña:</asp:Label>
                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                             CssClass="failureNotification" ErrorMessage="La contraseña es obligatoria." ToolTip="La contraseña es obligatoria." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:CheckBox ID="RememberMe" runat="server"/>
                        <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Mantenerme conectado</asp:Label>
                    </p>
                    <p>
                    <asp:LinkButton ID="lbtnRecover" runat="server" 
                            PostBackUrl="~/Recover/RecoverPassword.aspx" onclick="lbtnRecover_Click">¿Olvidó contraseña?</asp:LinkButton>
                    </p>
                </fieldset>
                <p class="submitButton">
                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" 
                        CssClass="white-font button-blue" Text="Iniciar sesión" 
                        ValidationGroup="LoginUserValidationGroup" Font-Size="18px"/>
                </p>
            </div>
        </LayoutTemplate>
    </asp:Login>
    </div>
</asp:Content>
