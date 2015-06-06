<%@ Page Title="" Language="C#" MasterPageFile="~/SisLijadMaster.Master" AutoEventWireup="true" CodeBehind="Modulos.aspx.cs" Inherits="SisLIJAD.Modulos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
   <div id="fondo">
    <div class="formWelcome">
        
            <h2>
                Lista de M&oacutedulos SISLIJAD
            </h2>
        <ul class="listaModulo">
         <li><i class="fa fa-home fa-lg green-font"></i>
                <asp:LinkButton ID="LinkHome" runat="server" PostBackUrl="~/Default.aspx"
                    Visible="False" Font-Size="1.6em" ForeColor="#003399" 
                 CssClass="green-font">Ir Inicio</asp:LinkButton>
            </li>
            <li><i class="fa fa-external-link-square"></i>
                <asp:LinkButton ID="LinkInventarios" runat="server" PostBackUrl="~/MINV/DefaultMINV.aspx"
                    Visible="False" Font-Size="1.6em" ForeColor="#003399">Ir M&oacutedulo Materiales</asp:LinkButton>
            </li>
            <li><i class="fa fa-external-link-square"></i>
                <asp:LinkButton ID="LinkPrueba" runat="server" PostBackUrl="~/MPR/Default.aspx" Visible="False"
                    Font-Size="1.6em" ForeColor="#003399">Ir Módulo Ensayes</asp:LinkButton>
             </li>
            <li><i class="fa fa-external-link-square"></i>
                <asp:LinkButton ID="LinkCompra" runat="server" PostBackUrl="~/SICOM/Default.aspx"
                    Visible="False" Font-Size="1.6em" ForeColor="#003399">Ir Solicitudes Compra</asp:LinkButton>
            </li>
            <li><i class="fa fa-external-link-square"></i>
                <asp:LinkButton ID="LinkCuenta" runat="server" PostBackUrl="~/Cuenta/UserAndRoles.aspx"
                    Visible="False" Font-Size="1.6em" ForeColor="#003399">Ir Administración Seguridad</asp:LinkButton>
            </li>
                        <li><i class="fa fa-external-link-square"></i>   <asp:LinkButton ID="LinkTecnico" runat="server" PostBackUrl="~/Tecnicos/Default.aspx"
                    Visible="False" Font-Size="1.6em" ForeColor="#003399">Ir Módulo Técnicos</asp:LinkButton>
            </li>
            <li><i class="fa fa-external-link-square"></i>
                <asp:LinkButton ID="LinkClientes" runat="server" PostBackUrl="~/Clientes/Default.aspx"
                    Visible="False" Font-Size="1.6em" ForeColor="#003399">Ir Módulo Clientes</asp:LinkButton>
            </li>
            <li><i class="fa fa-external-link-square"></i>
                <asp:LinkButton ID="LinkUCA" runat="server" PostBackUrl="~/PEUCA/Default.aspx"
                    Visible="False" Font-Size="1.6em" ForeColor="#003399">Ir Módulo Usuarios UCA</asp:LinkButton>
            </li>
        </ul>
    </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
