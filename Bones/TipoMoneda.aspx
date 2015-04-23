﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SICOM/MasterSICOM.Master" AutoEventWireup="true" CodeBehind="TipoMoneda.aspx.cs" Inherits="SisLIJAD.SICOM.TipoMoneda" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">

    <div>
        <dx:ASPxButton ID="btnNew" runat="server" Text="Nuevo" AutoPostBack="False" ClientIDMode="AutoID">
            <ClientSideEvents Click="function(s, e) {
fn_New();
 ASPxClientEdit.ClearGroup('ControlGroup1');
}" />
        </dx:ASPxButton>
        
    </div>
    <dx:ASPxButton ID="btnSelect" runat="server" Text="Editar"
        ClientIDMode="AutoID" onclick="btnSelect_Click" AutoPostBack="true">
    </dx:ASPxButton>
    <dx:ASPxButton ID="btnDelete" runat="server" Text="Borrar" 
        ClientIDMode="AutoID" AutoPostBack="False">
        <ClientSideEvents Click="function(s, e) {
	fn_ShowDelete()
}" />
    </dx:ASPxButton>
    <dx:ASPxHiddenField ID="HiddenV" runat="server" ClientInstanceName="HiddenV">
                                </dx:ASPxHiddenField>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">

    <dx:ASPxGridView ID="GridPrincipal" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
        DataSourceID="SDSTipoMoneda" KeyFieldName="IdTipoMoneda" SettingsBehavior-AllowFocusedRow="True"
        SettingsEditing-Mode="EditForm" Width="100%" 
        ClientInstanceName="GridPrincipal">
        <ClientSideEvents FocusedRowChanged="function(s, e) {

GridId = GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex());
txtId.SetText(GridId);
  }" />
        <Columns>
            <dx:GridViewDataTextColumn Caption="Id" FieldName="IdTipoMoneda" ReadOnly="True" 
                VisibleIndex="0" Width="4%">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Moneda" FieldName="DescTipoM" 
                VisibleIndex="1">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
        <SettingsPager AlwaysShowPager="True" PageSize="15">
        </SettingsPager>

       <Settings ShowHeaderFilterButton="True" ShowFilterRow="True" />
        <SettingsText EmptyDataRow="No hay datos para mostrar" 
            GroupPanel="Arrastre las columnas aquí" Title="Estados de materiales" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SDSTipoMoneda" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT [IdTipoMoneda],[DescTipoM] FROM [BDLabs].[dbo].[MSCOMP_Tipo_Moneda]">
    </asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">

<dx:ASPxPopupControl ID="FormPopup" runat="server" ClientInstanceName="FormPopup"
        AllowDragging="True" AllowResize="True" HeaderText="Formulario de registro" Modal="True"
        PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" ShowFooter="True"
        FooterText="Formulario de registro" PopupVerticalAlign="WindowCenter" ClientIDMode="AutoID">
        <ClientSideEvents CloseUp="function(s, e) {
	GridId = GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex());
    txtId.SetText(GridId); 
fn_CleanGroup1(1);
}" />
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <dx:ASPxCallbackPanel ID="FillingCallback" runat="server" ClientInstanceName="FillingCallback"
                    Width="100%">
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent1" runat="server">
                            <div>
                                <dx:ASPxLabel ID="lblId" runat="server" Text="Id">
                                </dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtId" runat="server" Width="170px" ClientInstanceName="txtId"
                                    ClientEnabled="true" ReadOnly="True">
                                </dx:ASPxTextBox>
                            </div>
                            <div>
                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Nombre del servicio">
                                </dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtNombTM" runat="server" Width="170px" ClientInstanceName="txtNombTM"
                                    ValidationSettings-ValidationGroup="ControlGroup1">
                                    <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                        SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                        <RegularExpression ErrorText="Informacion Requerida" />
                                        <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                                                           </div>
                            <div>
                                <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" AutoPostBack="True" OnClick="btnGuardar_Click">

                                    <ClientSideEvents Click="function(s, e) {
                                    if (!ASPxClientEdit.ValidateGroup('ControlGroup1')){
                                        retutn;
                                        }
                                    fn_ClosePopup(1);
                                    }" />

                                </dx:ASPxButton>
                                <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {
	                                    fn_ClosePopup(0);
                                    }" />
                                </dx:ASPxButton>
                             </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <dx:ASPxPopupControl ID="DeleteForm" runat="server" ClientInstanceName="DeleteForm"
        AllowDragging="True" AllowResize="True" HeaderText="Formulario borrar" Modal="True"
        PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" ShowFooter="True"
        FooterText="Formulario borrar" PopupVerticalAlign="WindowCenter" ClientIDMode="AutoID">
        <ClientSideEvents CloseUp="function(s, e) {
	GridId = GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex());
    txtId.SetText(GridId); 
fn_CleanGroup1(1);
}" />
        <ContentStyle BackColor="#FFFDFD">
        </ContentStyle>
        <ModalBackgroundStyle BackColor="#E4EFE9">
        </ModalBackgroundStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl4" runat="server">
                <dx:ASPxCallbackPanel ID="DeleteCallback" runat="server" ClientInstanceName="DeleteCallback"
                    Width="100%">
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent4" runat="server">
                            <div>
                            <p><strong>¿Seguro que quiere eliminar el siguiente registro?</strong></p>
                                
                                <dx:ASPxTextBox ID="txtIdD" runat="server" Width="170px" ClientInstanceName="txtIdD"
                                    ClientEnabled="true" ReadOnly="True" Font-Bold="True">
                                </dx:ASPxTextBox>
                            </div>
                           
                            <div>
                                <dx:ASPxButton ID="btnConfirmD" runat="server" Text="Confirmar" 
                                    OnClick="btnConfirmD_Click">
                                     <ClientSideEvents Click="function(s, e) {
	fn_ClosePopup(2);
}" />
                                     </dx:ASPxButton>
                                <dx:ASPxButton ID="btnCancelarD" runat="server" Text="Cancelar">
                                    <ClientSideEvents Click="function(s, e) {
fn_ClosePopup(2);
}" />
                                </dx:ASPxButton>
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>