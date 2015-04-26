<%@ Page Title="Página principal" Language="C#" MasterPageFile="~/SisLijadMaster.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="SisLIJAD._Default" %>

<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="FormContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="GridContent">
    
    
    <div class="formRegister">
    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
        <p>Por favor inicie sesion</p>
            <asp:Login ID="Login1" runat="server" 
                CreateUserText="Registrarse" CreateUserUrl="~/Account/Register.aspx" 
                PasswordRecoveryText="¿Olvidastes tu contraseña?" 
                PasswordRecoveryUrl="~/Recover/RecoverPassword.aspx">
            </asp:Login>
        </AnonymousTemplate>
        <LoggedInTemplate>
        <p>Bienvenido 
            <asp:LoginName ID="LoginName1" runat="server" />
            <asp:LoginStatus ID="LoginStatus1" runat="server" /></p>
            <%--<dx:ASPxMenu ID="AdminMenu" runat="server" AutoSeparators="RootOnly" 
        ClientIDMode="AutoID" CssFilePath="~/App_Themes/Blue/{0}/styles.css" 
        CssPostfix="Blue" ImageFolder="~/App_Themes/Blue/{0}/" ItemSpacing="0px" 
        SeparatorHeight="100%" SeparatorWidth="2px" ShowPopOutImages="True" 
        ShowSubMenuShadow="False" Width="100%">
        <Items>
            <dx:MenuItem NavigateUrl="~/MINV/DefaultMINV.aspx" Text="Inventario Materiales">
            </dx:MenuItem>
            <dx:MenuItem NavigateUrl="~/MPR/DefaultMPR.aspx" Text="Pruebas">
            </dx:MenuItem>
            <dx:MenuItem NavigateUrl="~/Cuenta/ManageUser.aspx" Text="Cuenta">
            </dx:MenuItem>
        </Items>
        <ItemSubMenuOffset FirstItemX="2" FirstItemY="-12" LastItemX="2" 
            LastItemY="-12" X="2" Y="-12" />
        <RootItemSubMenuOffset FirstItemX="-2" LastItemX="-2" X="-1" />
        <SubMenuItemStyle ImageSpacing="19px" PopOutImageSpacing="30px">
        </SubMenuItemStyle>
        <SubMenuStyle GutterWidth="0px" />
    </dx:ASPxMenu>
            <dx:ASPxMenu ID="ClinetMenu" runat="server" AutoSeparators="RootOnly" 
                ClientIDMode="AutoID" CssFilePath="~/App_Themes/Blue/{0}/styles.css" 
                CssPostfix="Blue" ImageFolder="~/App_Themes/Blue/{0}/" ItemSpacing="0px" 
                SeparatorHeight="100%" SeparatorWidth="2px" ShowPopOutImages="True" 
                ShowSubMenuShadow="False">

                <Items>
                    <dx:MenuItem NavigateUrl="~/Clientes/welcome.aspx" Text="Inicio">
                    </dx:MenuItem>
                    <dx:MenuItem NavigateUrl="~/Clientes/CrearSolicitudes.aspx" 
                        Text="Solicitud de pruebas">
                    </dx:MenuItem>
                </Items>
                <ItemSubMenuOffset FirstItemX="2" FirstItemY="-12" LastItemX="2" 
                    LastItemY="-12" X="2" Y="-12" />
                <RootItemSubMenuOffset FirstItemX="-2" LastItemX="-2" X="-1" />
                <SubMenuItemStyle ImageSpacing="19px" PopOutImageSpacing="30px">
                </SubMenuItemStyle>
                <SubMenuStyle GutterWidth="0px" />

            </dx:ASPxMenu>
            <dx:ASPxMenu ID="ASPxMenu1" runat="server" AutoSeparators="RootOnly" 
                ClientIDMode="AutoID" CssFilePath="~/App_Themes/Blue/{0}/styles.css" 
                CssPostfix="Blue" ImageFolder="~/App_Themes/Blue/{0}/" ItemSpacing="0px" 
                SeparatorHeight="100%" SeparatorWidth="2px" ShowPopOutImages="True" 
                ShowSubMenuShadow="False">
                <Items>
                    <dx:MenuItem NavigateUrl="~/Tecnicos/SolicitudesAsignadas.aspx" 
                        Text="Solicitudes asignadas">
                    </dx:MenuItem>
                </Items>
                <ItemSubMenuOffset FirstItemX="2" FirstItemY="-12" LastItemX="2" 
                    LastItemY="-12" X="2" Y="-12" />
                <RootItemSubMenuOffset FirstItemX="-2" LastItemX="-2" X="-1" />
                <SubMenuItemStyle ImageSpacing="19px" PopOutImageSpacing="30px">
                </SubMenuItemStyle>
                <SubMenuStyle GutterWidth="0px" />
            </dx:ASPxMenu>--%>
      </LoggedInTemplate>

        </asp:LoginView>
        </div>
</asp:Content>
