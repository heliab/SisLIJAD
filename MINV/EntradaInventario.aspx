<%@ Page Title="" Language="C#" MasterPageFile="~/MINV/MasterMinv.Master" AutoEventWireup="true" CodeBehind="EntradaInventario.aspx.cs" Inherits="SisLIJAD.MINV.EntradaInventario" %>

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
<div class="wrapctrl">
        <ul class="ctrlist">
            <li><a class="pure-button blue-font" href="javascript:fn_NewJS();" title="Nuevo"><i class="fa fa-plus">
            </i> Nuevo</a></li>
            <li><a class="pure-button green-font" href="javascript:fn_EditJS();" title="Editar"><i class="fa fa-pencil-square-o">
            </i> Editar</a></li>
            <li><a class="pure-button red-font" href="javascript:fn_DeleteJS();" title="Borrar"><i class="fa fa-trash"></i> Borrar</a></li>
        </ul>
    </div>
    <dx:ASPxCallback ID="NewCallback" runat="server" ClientInstanceName="NewCallback"
        OnCallback="NewCallback_Callback" ClientIDMode="AutoID">
        <ClientSideEvents EndCallback="function(s, e) {
fn_EndCallback();
}" />
    </dx:ASPxCallback>
    <dx:ASPxHiddenField ID="HiddenV" runat="server" ClientInstanceName="HiddenV">
    </dx:ASPxHiddenField>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
<dx:ASPxGridView ID="GridPrincipal" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
        DataSourceID="SDSTipoUbic" KeyFieldName="IdTipoUb" SettingsBehavior-AllowFocusedRow="True"
        Width="100%" ClientInstanceName="GridPrincipal"
        OnCustomCallback="GridPrincipal_CustomCallback">
        <ClientSideEvents FocusedRowChanged="function(s, e) {
GridPrincipal.Focus(GridPrincipal.focusedRowIndex);
GridId = GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex());
}" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IdTipoUb" ReadOnly="True" VisibleIndex="0"
                Caption="Id" Width="17%">
                <Settings AllowDragDrop="True" AutoFilterCondition="Contains" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DescTipoUB" VisibleIndex="1" 
                Caption="Descripcion Ubicacion">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn VisibleIndex="2" Width="0%">
                <ClearFilterButton Text="Limpiar" Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsPager AlwaysShowPager="True" PageSize="15">
        </SettingsPager>
       <Settings ShowHeaderFilterButton="True" ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsText EmptyDataRow="No hay datos para mostrar" GroupPanel="Arrastre las columnas aquí"/>
        <Styles>
            <FocusedRow BackColor="#5180BF">
            </FocusedRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SDSTipoUbic" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT [IdTipoUb], [DescTipoUB] FROM [MINV_Tipo_Ubic]">
    </asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
<dx:ASPxPopupControl ID="FormPopup" runat="server" ClientInstanceName="FormPopup"
        AllowDragging="True" AllowResize="True" 
        HeaderText="Formulario de registro" Modal="True"
        PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" ShowFooter="True"
        FooterText="Formulario de registro" PopupVerticalAlign="WindowCenter" ClientIDMode="AutoID"
        Height="186px" Width="320px" CloseAction="CloseButton">
        <ClientSideEvents CloseUp="function(s, e) {
	
fn_CleanGroup(1);
}" CloseButtonClick="function(s, e) {
	fn_CleanGroup(1);
}" />
        <ContentStyle BackColor="#F9F9F9">
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <dx:ASPxCallbackPanel ID="FillingCallback" runat="server" ClientInstanceName="FillingCallback"
                    Width="100%" OnCallback="FillingCallback_Callback">
                    <ClientSideEvents EndCallback="function(s, e) {
fn_EndCallback();
}" />
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent1" runat="server">
                        <div class="form">
                            <div>
                                <dx:ASPxLabel ID="lblId" runat="server" Text="Id">
                                </dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtId" runat="server" Width="170px" ClientInstanceName="txtId"
                                    ClientEnabled="true" ReadOnly="True">
                                </dx:ASPxTextBox>
                            </div>
                            <div>
                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Descripción de ubicación">
                                </dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtUbic" runat="server" Width="191px" ClientInstanceName="txtUbic"
                                    ValidationSettings-ValidationGroup="ControlGroup1" 
                                    NullText="Ej. Laboratorios, Oficinas, etc." Height="16px">
                                      <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                        SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                        <RegularExpression ErrorText="Informacion Requerida" />
                                        <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </div>
                            </div>
                            <div>
                                <ul class="frmctrl">
                                    <li><a class="pure-button" href="javascript:fn_SaveJS()" title="Guardar"><i class="fa fa-floppy-o">
                                    </i>Guardar</a></li>
                                    <li><a class="pure-button" href="javascript:fn_CancelJS()" title="Cancelar"><i class="fa fa-times">
                                    </i>Cancelar</a></li>
                                    <li><a class="pure-button" href="javascript:fn_CleanGroup(1);" title="Limpiar"><i
                                        class="fa fa-repeat"></i>Limpiar</a></li>
                                </ul>
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
        FooterText="Formulario borrar" PopupVerticalAlign="WindowCenter" 
        ClientIDMode="AutoID" Width="240px">
        <ContentStyle BackColor="#FFFDFD">
        </ContentStyle>
        <ModalBackgroundStyle BackColor="#E4EFE9">
        </ModalBackgroundStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl4" runat="server">
                            <div class="form">
                            <div>
                                <p>
                                    <strong>¿Seguro que quiere eliminar el siguiente registro?</strong></p>
                                <dx:ASPxTextBox ID="txtIdD" runat="server" Width="170px" ClientInstanceName="txtIdD"
                                    ClientEnabled="true" ReadOnly="True" Font-Bold="True" 
                                    HorizontalAlign="Center">
                                </dx:ASPxTextBox>
                            </div>
                            </div>
                            <div>
                                <ul class="frmctrl">
                                    <li><a class="pure-button" href="javascript:fn_ConfirmDJS()" title="Borrar"><i class="fa fa-trash-o"></i> Borrar</a></li>
                                    <li><a class="pure-button" href="javascript:fn_CancelDJS()" title="Cancelar"><i class="fa fa-times"></i> Cancelar</a></li>
                                </ul>
                           </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
