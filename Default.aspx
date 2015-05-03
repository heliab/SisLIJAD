<%@ Page Title="Página principal" Language="C#" MasterPageFile="~/SisLijadMaster.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="SisLIJAD._Default" %>

<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="FormContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="GridContent">
    
    <div id="fondo"> 
    <div class="formWelcome">
    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
        <p class="bold font-inicio">Por favor inicie sesion</p>
       
            <asp:Login ID="Login1" runat="server" 
                CreateUserText="Registrarse" CreateUserUrl="~/Account/Register.aspx" 
                PasswordRecoveryText="¿Olvidastes tu contraseña?" 
                PasswordRecoveryUrl="~/Recover/RecoverPassword.aspx" Font-Size="Large" 
                ForeColor="#333333" DestinationPageUrl="~/Modulos.aspx">
                <CheckBoxStyle BorderColor="#0066CC" />
                <LoginButtonStyle Font-Size="Medium" />
                <TitleTextStyle Font-Bold="True" HorizontalAlign="Left" />
            </asp:Login>
        </AnonymousTemplate>
        <LoggedInTemplate>
        <p>Bienvenido 
            <asp:LoginName ID="LoginName1" runat="server" />
            <asp:LoginStatus ID="LoginStatus1" runat="server" /></p>
            
          <i class="fa fa-external-link-square fa-lg"></i>  
            <asp:LinkButton ID="LinkModulo" runat="server" 
                PostBackUrl="~/Modulos.aspx" Font-Size="Large">Ir al sistema</asp:LinkButton>
<br />
         <i class="fa fa-key fa-lg"></i>   
            <asp:LinkButton ID="LinkButton1" runat="server" 
                PostBackUrl="~/Account/ChangePassword.aspx" Font-Size="Large">Cambiar contraseña</asp:LinkButton>
      </LoggedInTemplate>

     
        </asp:LoginView>
        </div>
       </div>
      <%-- A U T O R : H A N I E L L O P E Z--%>
</asp:Content>
