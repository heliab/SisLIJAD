<%@ Page Title="" Language="C#" MasterPageFile="~/MPR/MasterMPR.Master" AutoEventWireup="true"
    CodeBehind="DefaultMPR.aspx.cs" Inherits="SisLIJAD.MPR.DefaultMPR" %>

<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
    <div class="menumodulo">
        <dx:ASPxMenu ID="ASPxMenu1" runat="server" AutoSeparators="RootOnly" BorderBetweenItemAndSubMenu="HideRootOnly"
            ClientIDMode="AutoID" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange"
            GutterWidth="0px" ItemSpacing="1px" SeparatorHeight="1px" SeparatorWidth="1px"
            ShowPopOutImages="True" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"
            Font-Bold="True" Font-Size="Small" Width="100%" ForeColor="#333333">
            <SeparatorPaddings Padding="0px" />
            <Items>
                <dx:MenuItem Text="">
                </dx:MenuItem>
                <dx:MenuItem Text="Inicio" NavigateUrl="~/MINV/DefaultMINV.aspx">
                </dx:MenuItem>
                <dx:MenuItem BeginGroup="True" Text="Solicitudes">
                    <Items>
                        <dx:MenuItem Text="Solicitud Pendientes" 
                            NavigateUrl="~/MPR/SolicitudesPruebas.aspx">
                        </dx:MenuItem>
                        <dx:MenuItem Text="Solicitudes Aprobadas">
                        </dx:MenuItem>
                        <dx:MenuItem Text="Historial">
                        </dx:MenuItem>
                    </Items>
                </dx:MenuItem>
                <dx:MenuItem Text="Calculos">
                </dx:MenuItem>
                <dx:MenuItem Text="Resultados">
                </dx:MenuItem>
                <dx:MenuItem Text="Reportes">
                </dx:MenuItem>
                <dx:MenuItem Text="Mantenimiento">
                    <Items>
                        <dx:MenuItem Text="Pruebas" NavigateUrl="~/MPR/Pruebas.aspx">
                        </dx:MenuItem>
                        <dx:MenuItem NavigateUrl="~/MPR/EquiposMaquinarias.aspx" 
                            Text="Equipos y maquinarias">
                        </dx:MenuItem>
                        <dx:MenuItem Text="Tipos de Prueba" NavigateUrl="~/MPR/TiposPrueba.aspx">
                        </dx:MenuItem>
                    </Items>
                </dx:MenuItem>
                <dx:MenuItem Text="">
                </dx:MenuItem>
            </Items>
            <LoadingPanelImage Url="~/App_Themes/SoftOrange/Web/Loading.gif">
            </LoadingPanelImage>
            <ItemStyle DropDownButtonSpacing="8px" ImageSpacing="6px" PopOutImageSpacing="10px" />
            <SubMenuItemStyle>
                <HoverStyle BackColor="#0066CC" ForeColor="#CCCCCC">
                    <Border BorderColor="#0066CC" />
                </HoverStyle>
            </SubMenuItemStyle>
            <SubMenuStyle GutterWidth="0px" />
        </dx:ASPxMenu>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
