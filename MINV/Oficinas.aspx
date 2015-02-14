<%@ Page Title="" Language="C#" MasterPageFile="~/MINV/MasterMinv.Master" AutoEventWireup="true" CodeBehind="Oficinas.aspx.cs" Inherits="SisLIJAD.MINV.Oficinas" %>
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
    <dx:ASPxButton ID="btnSelect" runat="server" Text="Editar" AutoPostBack="False"
        ClientIDMode="AutoID" onclick="btnSelect_Click">
    </dx:ASPxButton>
    <dx:ASPxButton ID="btnDelete" runat="server" Text="Borrar" 
        ClientIDMode="AutoID" AutoPostBack="False">
        <ClientSideEvents Click="function(s, e) {
	fn_ShowDelete()
}" />
    </dx:ASPxButton>

    <dx:ASPxHiddenField ID="HiddenV" runat="server" ClientInstanceName="HiddenV"></dx:ASPxHiddenField>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">

<dx:ASPxGridView ID="GridPrincipal" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
        DataSourceID="SDSOficinas" KeyFieldName="IdOficina" SettingsBehavior-AllowFocusedRow="True"
        SettingsEditing-Mode="EditForm" Width="100%" 
        ClientInstanceName="GridPrincipal">
        <ClientSideEvents FocusedRowChanged="function(s, e) {

GridId = GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex());
txtId.SetText(GridId);
  }" />
        <Columns>
            <dx:GridViewCommandColumn ShowSelectCheckbox="False" VisibleIndex="0" Width="0%" ClearFilterButton-Visible="True" ClearFilterButton-Text="Limpiar">
                <ClearFilterButton Text="Limpiar" Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="IdOficina" ReadOnly="True" 
                VisibleIndex="1" Caption="Id" Width="5%">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NomOficina" 
                VisibleIndex="2" Caption="Oficina" Width="28%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DescOficina" VisibleIndex="3" 
                Caption="Descripción">
            </dx:GridViewDataTextColumn>
            
        </Columns>
        <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
        <SettingsPager AlwaysShowPager="True" PageSize="15">
        </SettingsPager>

       <Settings ShowHeaderFilterButton="True" ShowFilterRow="True" 
            ShowGroupPanel="True" />
        <SettingsText EmptyDataRow="No hay datos para mostrar" 
            GroupPanel="Arrastre las columnas aquí" Title="Estados de materiales" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SDSOficinas" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT [IdOficina], [NomOficina], [DescOficina] FROM [MINV_Oficina]">
    </asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">

<dx:ASPxPopupControl ID="FormPopup" runat="server" ClientInstanceName="FormPopup"
        AllowDragging="True" AllowResize="True" 
        HeaderText="Formulario de registro" Modal="True"
        PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" ShowFooter="True"
        FooterText="Formulario de registro" PopupVerticalAlign="WindowCenter" 
        ClientIDMode="AutoID" Height="186px" Width="298px">
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
                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Nombre Oficina">
                                </dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtOfic" runat="server" Width="170px" ClientInstanceName="txtOfic"
                                    ValidationSettings-ValidationGroup="ControlGroup1">
                                    <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                        SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                        <RegularExpression ErrorText="Informacion Requerida" />
                                        <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>

                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Descripción de oficina">
                                 </dx:ASPxLabel>
                                <dx:ASPxMemo ID="mDesc" runat="server" Height="71px" Width="80%" ClientInstanceName="mDesc"
                                    NullText="Puede añadir una descripción a la oficina.">
                                    <ValidationSettings ValidationGroup="ControlGroup1">
                                    </ValidationSettings>
                                </dx:ASPxMemo>


                            </div>
                            <div>
                                <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" AutoPostBack="True"
                                    OnClick="btnGuardar_Click">

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
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel3" runat="server" ClientInstanceName="DeleteCallback"
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
                                <dx:ASPxButton ID="btnConfirmD" runat="server" Text="Confirmar" OnClick="btnConfirmD_Click">
                                    
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
