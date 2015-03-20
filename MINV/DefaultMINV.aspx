<%@ Page Title="" Language="C#" MasterPageFile="~/MINV/MasterMinv.Master" AutoEventWireup="true" CodeBehind="DefaultMINV.aspx.cs" Inherits="SisLIJAD.MINV.DefaultMINV" %>

<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
<div class="menumodulo">
    <dx:ASPxMenu ID="ASPxMenu1" runat="server" AutoSeparators="RootOnly" 
        BorderBetweenItemAndSubMenu="HideRootOnly" ClientIDMode="AutoID" 
        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        GutterWidth="0px" ItemSpacing="1px" 
        SeparatorHeight="1px" SeparatorWidth="1px" ShowPopOutImages="True" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
        Font-Bold="True" Font-Size="Small" Width="100%" ForeColor="#333333" >
        <SeparatorPaddings Padding="0px" />
        <Items>
<dx:MenuItem Text=""></dx:MenuItem>
            <dx:MenuItem Text="Inicio" NavigateUrl="~/MINV/DefaultMINV.aspx">
            </dx:MenuItem>
            <dx:MenuItem BeginGroup="True" Text="Solicitudes">
                <Items>
                    <dx:MenuItem Text="Solicitud Materiales" 
                        NavigateUrl="~/MINV/SolicitudesMateriales.aspx">
                    </dx:MenuItem>
                </Items>
            </dx:MenuItem>
            <dx:MenuItem Text="Registros">
                <Items>
                    <dx:MenuItem Text="Entradas" NavigateUrl="~/MINV/EntradaInventario.aspx">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Salidas" NavigateUrl="~/MINV/Salidas.aspx">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Transferencias" NavigateUrl="~/MINV/Transferencias.aspx">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Ajustes Inventario" 
                        NavigateUrl="~/MINV/AjustesInventario.aspx">
                    </dx:MenuItem>
                    <dx:MenuItem NavigateUrl="~/MINV/MaterialesDañados.aspx" 
                        Text="Materiales Dañados">
                    </dx:MenuItem>
                </Items>
            </dx:MenuItem>
            <dx:MenuItem Text="Reportes">
            </dx:MenuItem>
            <dx:MenuItem Text="Mantenimiento">
                <Items>
<dx:MenuItem Text="Materiales" NavigateUrl="~/MINV/Materiales.aspx"></dx:MenuItem>
                    <dx:MenuItem NavigateUrl="~/MINV/Existencias.aspx" Text="Existencias">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Estado de Materiales" 
                        NavigateUrl="~/MINV/EstadoMateriales.aspx">
                    </dx:MenuItem>
                    <dx:MenuItem NavigateUrl="~/MINV/TipoMateriales.aspx" Text="Tipo Materiales">
                    </dx:MenuItem>
                    <dx:MenuItem NavigateUrl="~/MINV/UnidadesMedida.aspx" Text="Unidades de Medida">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Tipo Ubicaciones" NavigateUrl="~/MINV/TipoUbicaciones.aspx">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Ubicaciones Especificas" 
                        NavigateUrl="~/MINV/Ubicaciones.aspx">
                    </dx:MenuItem>
                    <dx:MenuItem NavigateUrl="~/MINV/TipoMovimiento.aspx" 
                        Text="Tipo de movimientos">
                    </dx:MenuItem>
                </Items>
            </dx:MenuItem>
            <dx:MenuItem Text="">
            </dx:MenuItem>
        </Items>
        <LoadingPanelImage Url="~/App_Themes/SoftOrange/Web/Loading.gif">
        </LoadingPanelImage>
        <ItemStyle DropDownButtonSpacing="8px" ImageSpacing="6px" 
            PopOutImageSpacing="10px" />
        <SubMenuItemStyle>
            <HoverStyle BackColor="#0066CC" ForeColor="#CCCCCC">
                <Border BorderColor="#0066CC" />
            </HoverStyle>
        </SubMenuItemStyle>
        <SubMenuStyle GutterWidth="0px" />
    </dx:ASPxMenu>
    </div>

<h1>Bienvenido al modulo de inventario de materiales</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
