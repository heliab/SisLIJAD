<%@ Page Title="" Language="C#" MasterPageFile="~/Cuenta/AccountMASTER.Master" AutoEventWireup="true" CodeBehind="PersonalInfo.aspx.cs" Inherits="SisLIJAD.Cuenta.PersonalInfo" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
 <div class="wrapctrl">

            <div class="Titulo2">Informacion personal de usuarios</div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
    <div class="registerbg">
        <div class="grid">
            <dx:ASPxGridView ID="GridUserData" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridUserData"
                DataSourceID="SqlDataSource1" Width="100%">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Usuario" FieldName="username" VisibleIndex="0">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Nombre" ReadOnly="True" VisibleIndex="1" Width="20%">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Empresa" VisibleIndex="2">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Celular" VisibleIndex="3">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="4" Width="13%">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn Caption="Aprobado?" FieldName="IsApproved" VisibleIndex="5"
                        Width="5%">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn Caption="Bloqueado?" FieldName="IsLockedOut" VisibleIndex="6"
                        Width="5%">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataDateColumn Caption="Ultimo LogIn" FieldName="LastLoginDate" VisibleIndex="7"
                        Width="5%">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn Caption="Creado" FieldName="CreateDate" VisibleIndex="8"
                        Width="5%">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewCommandColumn VisibleIndex="9" Width="0%">
                        <ClearFilterButton Text="Limpiar" Visible="True">
                        </ClearFilterButton>
                    </dx:GridViewCommandColumn>
                </Columns>
                <Settings ShowFilterRow="True" />
                <Styles Header-BackColor="#006699" Header-Border-BorderColor="#006699">
                    <Header BackColor="#006699" Font-Bold="True" Font-Size="Medium" ForeColor="White">
                        <Border BorderColor="#333333" BorderStyle="Solid"></Border>
                    </Header>
                    <Row Font-Size="Medium">
                    </Row>
                    <FilterRow BackColor="#008FD5">
                    </FilterRow>
                    <HeaderPanel BackColor="#006699">
                    </HeaderPanel>
                </Styles>
            </dx:ASPxGridView>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
    SelectCommand="SELECT USER_Entidad.username, USER_Entidad.PNombre + ' ' + USER_Entidad.SNombre + ' ' + USER_Entidad.PApellido + ' ' + USER_Entidad.SApellido AS Nombre, USER_Entidad.Empresa, USER_Entidad.Celular, aspnet_Membership.Email, aspnet_Membership.IsApproved, aspnet_Membership.IsLockedOut, aspnet_Membership.LastLoginDate, aspnet_Membership.CreateDate FROM aspnet_Membership INNER JOIN aspnet_Users ON aspnet_Membership.UserId = aspnet_Users.UserId INNER JOIN USER_Entidad ON aspnet_Users.UserName = USER_Entidad.username"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
