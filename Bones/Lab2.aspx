<%@ Page Title="" Language="C#" MasterPageFile="~/MINV/MasterMinv.Master" AutoEventWireup="true"
    CodeBehind="Lab2.aspx.cs" Inherits="SisLIJAD.MPR.Lab2" %>

<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>
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
    <%--  <dx:ASPxMenu ID="ASPxMenu1" runat="server" ClientIDMode="AutoID" 
        HorizontalAlign="Center" VerticalAlign="Middle" Width="100%">
        <Items>
            <dx:MenuItem Text="Inicio">
            </dx:MenuItem>
            <dx:MenuItem Text="Movimientos">
            </dx:MenuItem>
            <dx:MenuItem Text="Ubicaciones">
            </dx:MenuItem>
            <dx:MenuItem Text="Administracion">
            </dx:MenuItem>
        </Items>
    </dx:ASPxMenu>
    --%>
    <div class="wrapctrl">
        <ul class="ctrlist">
            <li><a class="pure-button" href="javascript:fn_NewJS();" title="Nuevo"><i class="fa fa-plus">
            </i> Nuevo</a></li>
            <li><a class="pure-button" href="javascript:fn_EditJS();" title="Editar"><i class="fa fa-pencil-square-o">
            </i> Editar</a></li>
            <li><a class="pure-button pure-button-primary" href="javascript:fn_DeleteJS();" title="Borrar">
                <i class="fa fa-trash"></i> Borrar</a></li>
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
    <dx:ASPxCallback ID="DelCallback" runat="server" ClientInstanceName="DelCallback"
        OnCallback="DelCallback_Callback">
        <ClientSideEvents EndCallback="function(s, e) {
    
fn_EndCallback();

}" />
    </dx:ASPxCallback>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
    <dx:ASPxGridView ID="GridPrincipal" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
        DataSourceID="SDSLaboratorios" KeyFieldName="IdLaboratorio" SettingsBehavior-AllowFocusedRow="True"
        SettingsEditing-Mode="EditForm" Width="100%" ClientInstanceName="GridPrincipal"
        OnCustomCallback="GridPrincipal_CustomCallback">
        <ClientSideEvents FocusedRowChanged="function(s, e) {
GridPrincipal.Focus(GridPrincipal.focusedRowIndex);
GridId = GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex());
}" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IdLaboratorio" ReadOnly="True" VisibleIndex="0"
                Caption="Id" Width="4%">
                <EditFormSettings Visible="False" />
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NomLaboratorio" VisibleIndex="1" Caption="Nombre"
                Width="28%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DescLaboratorio" VisibleIndex="2" Width="40%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Responsable" VisibleIndex="3" ReadOnly="True">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn ShowSelectCheckbox="False" VisibleIndex="4" ClearFilterButton-Text="Limpiar"
                ClearFilterButton-Visible="True">
                <ClearFilterButton Text="Limpiar" Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsPager AlwaysShowPager="True" PageSize="15">
        </SettingsPager>

<SettingsEditing Mode="EditForm"></SettingsEditing>

        <Settings ShowHeaderFilterButton="True" ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsText EmptyDataRow="No hay datos para mostrar" GroupPanel="Arrastre las columnas aquí"
            Title="Estados de materiales" />
        <Styles>
            <FocusedRow BackColor="#5180BF">
            </FocusedRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SDSLaboratorios" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT MPR_Laboratorios.IdLaboratorio, MPR_Laboratorios.NomLaboratorio, MPR_Laboratorios.DescLaboratorio, CAST(USER_Entidad.PNombre AS NVARCHAR) + ' ' + CAST(USER_Entidad.PApellido AS NVARCHAR) AS Responsable FROM MPR_Laboratorios INNER JOIN USER_Entidad ON MPR_Laboratorios.IdEntidad = USER_Entidad.IdEntidad">
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
    <dx:ASPxPopupControl ID="FormPopup" runat="server" ClientInstanceName="FormPopup"
        AllowDragging="True" AllowResize="True" 
        HeaderText="Formulario de registro" Modal="True"
        PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" ShowFooter="True"
        FooterText="Formulario de registro" PopupVerticalAlign="WindowCenter" ClientIDMode="AutoID"
        Height="186px" Width="332px" CloseAction="CloseButton">
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
                            <div>
                                <dx:ASPxLabel ID="lblId" runat="server" Text="Id">
                                </dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtId" runat="server" Width="170px" ClientInstanceName="txtId"
                                    ClientEnabled="true" ReadOnly="True">
                                </dx:ASPxTextBox>
                            </div>
                            <div>
                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Nombre laboratorio">
                                </dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtLab" runat="server" Width="170px" ClientInstanceName="txtLab"
                                    ValidationSettings-ValidationGroup="ControlGroup1">
                                    <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                        SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                        <RegularExpression ErrorText="Informacion Requerida" />
                                        <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Descripción de laboratorio">
                                </dx:ASPxLabel>
                                <dx:ASPxMemo ID="mDesc" runat="server" Height="71px" Width="80%" ClientInstanceName="mDesc"
                                    NullText="Puede añadir una descripción al laboratorio.">
                                    <ValidationSettings ValidationGroup="ControlGroup1">
                                    </ValidationSettings>
                                </dx:ASPxMemo>
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Responsable">
                                </dx:ASPxLabel>
                                <dx:ASPxComboBox ID="cmbEntidad" runat="server" ClientInstanceName="cmbEntidad" DataSourceID="SDSEntidad"
                                    TextField="Responsable" ValueField="IdEntidad">
                                    <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                        SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                        <RegularExpression ErrorText="Informacion Requerida" />
                                        <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SDSEntidad" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
                                    SelectCommand="SELECT IdEntidad, CAST(PNombre AS NVARCHAR) + ' ' + CAST(PApellido AS NVARCHAR) AS Responsable FROM USER_Entidad">
                                </asp:SqlDataSource>
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
                            <div>
                                <p>
                                    <strong>¿Seguro que quiere eliminar el siguiente registro?</strong></p>
                                <dx:ASPxTextBox ID="txtIdD" runat="server" Width="170px" ClientInstanceName="txtIdD"
                                    ClientEnabled="true" ReadOnly="True" Font-Bold="True" 
                                    HorizontalAlign="Center">
                                </dx:ASPxTextBox>
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
