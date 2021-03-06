﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Cuenta/AccountMASTER.Master" AutoEventWireup="true"
    CodeBehind="UserAndRoles.aspx.cs" Inherits="SisLIJAD.Cuenta.UserAndRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
  <div class="registerbg">
    <div class="wrapctrl">
        <%--<h2>
            Administracion de roles de usuario</h2>--%>
            <div class="Titulo2">Administracion de roles de usuario</div>
    </div>
    <p align="center">
        <asp:Label ID="ActionStatus" runat="server"></asp:Label>
    </p>
    <div class="BaseForm">
        <div class="row">
            <div class="first formUserAdmin">
                <h3>
                    Administrar roles por usuario</h3>
                <p>
                    <b>Seleccione un usuario:</b>
                    <asp:DropDownList ID="UserList" runat="server" AutoPostBack="True" DataTextField="UserName"
                        DataValueField="UserName" OnSelectedIndexChanged="UserList_SelectedIndexChanged">
                    </asp:DropDownList>
                </p>
                <p>
                    <asp:Repeater ID="UsersRoleList" runat="server">
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="RoleCheckBox" AutoPostBack="true" Text='<%# Container.DataItem %>'
                                OnCheckedChanged="RoleCheckBox_CheckChanged" />
                            <br />
                        </ItemTemplate>
                    </asp:Repeater>
                </p>
            </div>
            <div class="second formUserAdmin">
                <h3>
                    Administrar usuarios por roles</h3>
                <p>
                    <b>Seleccione un rol:</b>
                    <asp:DropDownList ID="RoleList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RoleList_SelectedIndexChanged">
                    </asp:DropDownList>
                </p>
                <p>
                    <asp:GridView ID="RolesUserList" runat="server" AutoGenerateColumns="False" EmptyDataText="No users belong to this role."
                        OnRowDeleting="RolesUserList_RowDeleting">
                        <Columns>
                            <asp:CommandField DeleteText="Eliminar" ShowDeleteButton="True" />
                            <asp:TemplateField HeaderText="Usuario">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="UserNameLabel" Text='<%# Container.DataItem %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </p>
                <p>
                    <b>Nombre de usuario:</b>
                    <asp:TextBox ID="UserNameToAddToRole" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="AddUserToRoleButton" runat="server" Text="Añada usuario al rol" OnClick="AddUserToRoleButton_Click" />
                </p>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
