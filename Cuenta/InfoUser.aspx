<%@ Page Title="" Language="C#" MasterPageFile="~/Cuenta/AccountMASTER.Master" AutoEventWireup="true" CodeBehind="InfoUser.aspx.cs" Inherits="SisLIJAD.Cuenta.InfoUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
<div class="registerbg">
<div class="centertitle"><h2>Informacion de usuario</h2></div>
<div class="hvr-ripple-out formUserAdmin2 ">
    <p>
        <asp:HyperLink ID="BackLink" runat="server" 
            NavigateUrl="~/Cuenta/ManageUser.aspx">&lt;&lt; Volver a lista de usuarios</asp:HyperLink>
    </p>
    <table>
        <tr>
            <td class="tdLabel">Usuario:</td>
            <td><asp:Label runat="server" ID="UserNameLabel"></asp:Label></td>
        </tr>
        <tr>
            <td class="tdLabel">Aprobado:</td>
            <td>
                <asp:CheckBox ID="IsApproved" runat="server" AutoPostBack="true" 
                    oncheckedchanged="IsApproved_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td class="tdLabel">Bloqueado:</td>
            <td>
                <asp:Label runat="server" ID="LastLockoutDateLabel"></asp:Label>
                <br />
                <asp:Button runat="server" ID="UnlockUserButton" Text="Desbloquear usuario" 
                    onclick="UnlockUserButton_Click" />
            </td>
        </tr>
         <tr>
            <td class="tdLabel">Eliminar usuario</td>
            <td>
                <asp:Label runat="server" ID="Label1"></asp:Label>
                <br />
                <asp:Button runat="server" ID="bntDelete" Text="Eliminar" 
                    onclick="bntDelete_Click"/>
            </td>
        </tr>
    </table>
    <p>
        <asp:Label ID="StatusMessage" CssClass="Important" runat="server"></asp:Label>
    </p>
    </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
