<%@ Page Title="Registrarse" Language="C#" MasterPageFile="~/Account/AccountMASTER.Master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="SisLIJAD.Account.Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="FormContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="GridContent">
    <div class="registerbg">
    <asp:CreateUserWizard ID="RegisterUser" runat="server" 
    EnableViewState="False" OnCreatedUser="RegisterUser_CreatedUser" 
    DisableCreatedUser="True" BackColor="#F7F6F3" BorderColor="#E6E2D8" 
        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em">
        <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" 
            Font-Size="0.9em" ForeColor="White" HorizontalAlign="Center" />
        <LayoutTemplate>
            <asp:PlaceHolder ID="wizardStepPlaceholder" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="navigationPlaceholder" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>
        <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            ForeColor="#284775" />
        <CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            ForeColor="#284775" />
        <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <WizardSteps>
            <asp:CreateUserWizardStep ID="RegisterUserWizardStep" runat="server">
                <ContentTemplate>
                <div class="centertitle">
                    <h2>
                        Crear una nueva cuenta
                    </h2>
                    <p>
                        Use el formulario siguiente para crear una cuenta nueva.
                    </p>
                    <p>
                        Las contraseñas deben tener una longitud mínima de <%= Membership.MinRequiredPasswordLength %> caracteres.
                    </p>
                   
                    <span class="failureNotification">
                        <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                    </span> 
                    <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification" 
                         ValidationGroup="RegisterUserValidationGroup" Font-Bold="True" 
                        Font-Size="Small" ForeColor="#CC0000"/>
                        </div>
                    <div class="accountInfo formRegister">
                        <fieldset class="register">
                          <legend class="legenda">Información de cuenta</legend>
                            <p>
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nombre de usuario:</asp:Label>
                                <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                                     CssClass="failureNotification" ErrorMessage="El nombre de usuario es obligatorio." ToolTip="El nombre de usuario es obligatorio." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Correo electrónico:</asp:Label>
                                <asp:TextBox ID="Email" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" 
                                     CssClass="failureNotification" ErrorMessage="El correo electrónico es obligatorio." ToolTip="El correo electrónico es obligatorio." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Contraseña:</asp:Label>
                                <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                                     CssClass="failureNotification" ErrorMessage="La contraseña es obligatoria." ToolTip="La contraseña es obligatoria." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirmar contraseña:</asp:Label>
                                <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic" 
                                     ErrorMessage="Confirmar contraseña es obligatorio." ID="ConfirmPasswordRequired" runat="server" 
                                     ToolTip="Confirmar contraseña es obligatorio." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                     CssClass="failureNotification" Display="Dynamic" ErrorMessage="Contraseña y Confirmar contraseña deben coincidir."
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
                            </p>
                        </fieldset>
                        <p class="submitButton">
                            <asp:Button ID="CreateUserButton" runat="server" CommandName="MoveNext" Text="Crear usuario" 
                                 ValidationGroup="RegisterUserValidationGroup" BorderColor="#99CCFF" 
                                CssClass="white-font button-blue" Height="29px" Width="119px" 
                                Font-Bold="False"/>
                        </p>
                    </div>
                </ContentTemplate>
                <CustomNavigationTemplate>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
<asp:CompleteWizardStep runat="server">
    <ContentTemplate>
        <table style="font-family:Verdana;font-size:100%;">
            <tr>
                <td align="center" colspan="2" 
                    style="color:White;background-color:#5D7B9D;font-weight:bold;">
                    Completar</td>
            </tr>
            <tr>
                <td>
                    La cuenta se ha creado correctamente.</td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <asp:Button ID="ContinueButton" runat="server" BackColor="#FFFBFF" 
                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                        CausesValidation="False" CommandName="Continue" Font-Names="Verdana" 
                        ForeColor="#284775" Text="Continuar" ValidationGroup="RegisterUser" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
            </asp:CompleteWizardStep>
        </WizardSteps>
        <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            ForeColor="#284775" />
        <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
        <SideBarStyle BackColor="#5D7B9D" BorderWidth="0px" Font-Size="0.9em" 
            VerticalAlign="Top" />
        <StepStyle BorderWidth="0px" />
    </asp:CreateUserWizard>
    </div>
</asp:Content>
