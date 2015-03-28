<%@ Page Title="Página principal" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="SisLIJAD._Default" %>

<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        ASP.NET
    </h2>
    <p>
        Para obtener más información acerca de ASP.NET, visite <a href="http://www.asp.net" title="Sitio web de ASP.NET">www.asp.net</a>.
    </p>
    <p>
        También puede encontrar <a href="http://go.microsoft.com/fwlink/?LinkID=152368"
            title="Documentación de ASP.NET en MSDN">documentación sobre ASP.NET en MSDN</a>.
    </p>
    

    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
        <p>Por favor inicie sesion</p>
            <asp:Login ID="Login1" runat="server" BackColor="#E3EAEB" BorderColor="#E6E2D8" 
                BorderPadding="4" BorderStyle="Solid" BorderWidth="5px" Font-Names="Verdana" 
                Font-Size="2em" ForeColor="#333333" TextLayout="TextOnTop" 
                CreateUserText="Registrarse" CreateUserUrl="~/Account/Register.aspx" 
                PasswordRecoveryText="¿Olvidastes tu contraseña?" 
                PasswordRecoveryUrl="~/RecuperarConstraseña.aspx">
                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                <LoginButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" 
                    BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
                <TextBoxStyle Font-Size="0.8em" />
                <TitleTextStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="0.9em" 
                    ForeColor="White" />
            </asp:Login>
        </AnonymousTemplate>
        <LoggedInTemplate>
        <p>Bienvenido 
            <asp:LoginName ID="LoginName1" runat="server" />
            <asp:LoginStatus ID="LoginStatus1" runat="server" /></p>
            <dx:ASPxMenu ID="AdminMenu" runat="server" AutoSeparators="RootOnly" 
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
            </dx:ASPxMenu>
      </LoggedInTemplate>

        </asp:LoginView>
</asp:Content>
