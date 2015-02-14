<%@ Page Title="" Language="C#" MasterPageFile="~/MINVMASTER.Master" AutoEventWireup="true"
    CodeBehind="EstadoMAteriales.aspx.cs" Inherits="SisLIJAD.MINV.EstadoMAteriales" %>

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
    <dx:ASPxCallbackPanel ID="FormCallback" runat="server" ClientInstanceName="FormCallback"
        ClientIDMode="AutoID">
        <PanelCollection>
            <dx:PanelContent ID="PanelContent1" runat="server">
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
    <div>
        <dx:ASPxButton ID="btnInsert" runat="server" Text="Nuevo" AutoPostBack="False" ClientIDMode="AutoID">
            <ClientSideEvents Click="function(s, e) {
fn_New();
 ASPxClientEdit.ClearGroup('ControlGroup1');
}" />
        </dx:ASPxButton>
        
    </div>
    <dx:ASPxButton ID="btnSelect" runat="server" Text="Editar" AutoPostBack="False"
        ClientIDMode="AutoID" onclick="btnSelect_Click">
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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="GridPrincipal" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
        DataSourceID="SDSEstadoMateriales" KeyFieldName="IdEstado" SettingsBehavior-AllowFocusedRow="True"
        SettingsEditing-Mode="EditForm" Width="100%" ClientInstanceName="GridPrincipal">
        <ClientSideEvents FocusedRowChanged="function(s, e) {

GridId = GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex());
txtId.SetText(GridId);
  }" />
        <Columns>
            <dx:GridViewDataTextColumn Caption="Id" FieldName="IdEstado" ReadOnly="True" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Descripcion" FieldName="DescEstado" VisibleIndex="1"
                Width="90%">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
        <SettingsPager AlwaysShowPager="True" PageSize="15">
        </SettingsPager>
        <SettingsEditing Mode="EditForm"></SettingsEditing>
        <Settings ShowHeaderFilterButton="True" />
        <SettingsText EmptyDataRow="No hay datos para mostrar" 
            GroupPanel="Arrastre las columnas aquí" Title="Estados de materiales" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SDSEstadoMateriales" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT DISTINCT [IdEstado], [DescEstado] FROM [MINV_EstadoMateriales]">
    </asp:SqlDataSource>
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
                        <dx:PanelContent ID="PanelContent2" runat="server">
                            <div>
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Id">
                                </dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtId" runat="server" Width="170px" ClientInstanceName="txtId"
                                    ClientEnabled="true" ReadOnly="True">
                                </dx:ASPxTextBox>
                            </div>
                            <div>
                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Descripcion">
                                </dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtDesc" runat="server" Width="170px" ClientInstanceName="txtDesc"
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
                                <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar">
                                    <ClientSideEvents Click="function(s, e) {
	                                    fn_ClosePopup(0);
                                    }" />
                                </dx:ASPxButton>
                                <dx:ASPxButton ID="clr" runat="server" Text="Clear" AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {
	                                    txtId.SetText('Nuevo');
                                     ASPxClientEdit.ClearGroup('ControlGroup1');
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
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientInstanceName="FillingCallback"
                    Width="100%">
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent3" runat="server">
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
