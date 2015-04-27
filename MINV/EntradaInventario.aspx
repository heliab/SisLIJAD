<%@ Page Title="Entradas" Language="C#" MasterPageFile="~/MINV/MasterMinv.Master" AutoEventWireup="true"
    CodeBehind="EntradaInventario.aspx.cs" Inherits="SisLIJAD.MINV.EntradaInventario" %>

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
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function fn_NewDetEntry() {
            GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Aprobado', SetAprob);
            function SetAprob(Value) {
                if (Value == 1) {
                    alert('El registro ya ha sido aprobado y no puede realizar cambios');
                    return
                }
                else {
                    GridPrVal.Set("MValue", fn_GetIdValue());
                    fn_SubNewJS();
                }
            }
        }
        function fn_EditDetEntry() {
//            if (fn_GetIdValue() == null) {
//                alert('Debe seleciconar un registro');
//            }
//            else {

                GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Aprobado', SetAprob);
                function SetAprob(Value) {
                    if (Value == 1) {
                        alert('El registro ya ha sido aprobado y no puede realizar cambios');
                        return
                    }
                    else {
                        fn_SubEditJS();
                    }
                }
            }
//        }
        function fn_SubAdd2() {
            if (!ASPxClientEdit.ValidateGroup('ControlGroup2')) {
                retutn;
            }
            NewCallback.PerformCallback();
            fn_CleanGroup(2);
            GridPrincipal.PerformCallback();
            cmbMaterial.PerformCallback();
        }
        function fn_DeleteDetEntry() {
            if (fn_GetIdValue() == null) {
                alert('Debe seleciconar un registro');
            }
            else {
                GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Aprobado', SetAprob);
                function SetAprob(Value) {
                    if (Value == 1) {
                        alert('El registro ya ha sido aprobado y no puede realizar cambios');
                        return
                    }
                    else {
                        fn_SubDeleteJS();
                    }
                }
            }
        }


       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
    <div class="wrapctrl">
        <ul class="ctrlist">
            <li><a class="pure-button blue-font" href="javascript:fn_NewJS();" title="Nuevo"><i
                class="fa fa-plus"></i>Nuevo</a></li>
            <li><a class="pure-button green-font" href="javascript:fn_EditJS();" title="Editar">
                <i class="fa fa-pencil-square-o"></i>Editar</a></li>
            <li><a class="pure-button red-font" href="javascript:fn_DeleteJS();" title="Borrar">
                <i class="fa fa-trash"></i>Borrar</a></li>
            <li id="leftmar-button"><a class="pure-button green-font" href="javascript:GetAprobRow()"
                title="Aprobar"><i class="fa fa-check-square-o"></i>Aprobar</a></li>
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
        DataSourceID="SDSEntradas" KeyFieldName="IdEntrada" SettingsBehavior-AllowFocusedRow="True"
        Width="100%" ClientInstanceName="GridPrincipal" OnCustomCallback="GridPrincipal_CustomCallback">
        <ClientSideEvents FocusedRowChanged="function(s, e) {
GridPrincipal.Focus(GridPrincipal.focusedRowIndex);
}" DetailRowExpanding="function(s, e) {
	GridPrincipal.SetFocusedRowIndex(e.visibleIndex);
}" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IdEntrada" ReadOnly="True" VisibleIndex="0"
                Width="10%" SortIndex="0" SortOrder="Descending">
                <Settings AutoFilterCondition="Contains" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EntryHeader" VisibleIndex="1" Caption="Encabezado Entrada"
                Width="20%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PNombre" VisibleIndex="2" Caption="Proveedor"
                Width="12%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="FechaEntrada" VisibleIndex="3">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="HoraRecep" VisibleIndex="4" Caption="Hora Entrada">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Recibido" VisibleIndex="5" Caption="Recibido por"
                Width="15%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Observacion" VisibleIndex="6" Width="20%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Aprobado" VisibleIndex="7" Width="7%">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewCommandColumn VisibleIndex="8" Width="0%">
                <ClearFilterButton Text="Limpiar" Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsPager AlwaysShowPager="True" PageSize="15">
        </SettingsPager>
        <Settings ShowHeaderFilterButton="True" ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsText EmptyDataRow="No hay datos para mostrar" GroupPanel="Arrastre las columnas aquí" />
        <SettingsDetail ShowDetailRow="True" AllowOnlyOneMasterRowExpanded="True" />
        <Styles>
            <FocusedRow BackColor="#5180BF">
            </FocusedRow>
        </Styles>
        <Templates>
            <DetailRow>
                <div class="wrapctrl">
                    <ul class="ctrlist">
                        <li><a class="pure-button blue-font" href="javascript:fn_NewDetEntry();" title="Nuevo">
                            <i class="fa fa-plus"></i>Nuevo</a></li>
                        <li><a class="pure-button green-font" href="javascript:fn_EditDetEntry();" title="Editar">
                            <i class="fa fa-pencil-square-o"></i>Editar</a></li>
                        <li><a class="pure-button red-font" href="javascript:fn_DeleteDetEntry();" title="Borrar">
                            <i class="fa fa-trash"></i>Borrar</a></li>
                    </ul>
                </div>
                <dx:ASPxGridView ID="SubGrid" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
                    ClientInstanceName="SubGrid" DataSourceID="SDSActivos" OnBeforePerformDataSelect="SubGrid_BeforePerformDataSelect"
                    Width="100%" KeyFieldName="IdDetalle">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="IdDetalle" ReadOnly="True" 
                            VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NomMaterial" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="DescEstado" 
                            VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ObservMaterial" 
                            VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="IdUbicEspec" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Settings ShowFilterRow="True" />
                    <SettingsText EmptyDataRow="No hay datos para mostrar" FilterBarClear="Limpiar" />
                    <SettingsDetail IsDetailGrid="True" />
                    <Styles>
                        <FocusedRow BackColor="#5180BF">
                        </FocusedRow>
                    </Styles>
                </dx:ASPxGridView>
            </DetailRow>
        </Templates>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SDSEntradas" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT MINV_Entradas.IdEntrada, MINV_Entradas.EntryHeader, USER_Entidad.PNombre, MINV_Entradas.FechaEntrada, MINV_Entradas.HoraRecep, ent.PNombre AS Recibido, MINV_Entradas.Observacion, MINV_Entradas.Aprobado FROM MINV_Entradas INNER JOIN USER_Entidad ON MINV_Entradas.IdEntidad = USER_Entidad.IdEntidad INNER JOIN USER_Entidad AS ent ON MINV_Entradas.RecepcionadoPor = ent.IdEntidad">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSActivos" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        
        SelectCommand="SELECT CAST(MINV_Det_Entradas.IdEntrada AS NVARCHAR) + '.' + CAST(MINV_Det_Entradas.IdMaterial AS NVARCHAR) AS IdDetalle, MINV_Materiales.NomMaterial, MINV_EstadoMateriales.DescEstado, MINV_Det_Entradas.ObservMaterial, MINV_Det_Entradas.Cantidad, MINV_Det_Entradas.IdUbicEspec FROM MINV_Det_Entradas INNER JOIN MINV_EstadoMateriales ON MINV_Det_Entradas.IdEstado = MINV_EstadoMateriales.IdEstado INNER JOIN MINV_Materiales ON MINV_Det_Entradas.IdMaterial = MINV_Materiales.IdMaterial WHERE (MINV_Det_Entradas.IdEntrada = @IdEntrada)">
        <SelectParameters>
            <asp:SessionParameter Name="IdEntrada" SessionField="IdEntrada" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
    <dx:ASPxPopupControl ID="FormPopup" runat="server" ClientInstanceName="FormPopup"
        AllowDragging="True" AllowResize="True" HeaderText="Formulario de registro" Modal="True"
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
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Encabezado de entrada">
                                    </dx:ASPxLabel>
                                    <dx:ASPxMemo ID="memoEntra" runat="server" ClientInstanceName="memoEntra" Height="61px"
                                        Width="224px" ValidationSettings-ValidationGroup="ControlGroup1">
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxMemo>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Seleccione Proveedor">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cmbProveedor" runat="server" ClientInstanceName="cmbProveedor"
                                        DataSourceID="SDSProveedor" TextField="PNombre" ValueField="IdEntidad">
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="SDSProveedor" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
                                        SelectCommand="SELECT IdEntidad, PNombre FROM USER_Entidad WHERE (IdTipo = 2)">
                                    </asp:SqlDataSource>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Fecha de Entrada">
                                    </dx:ASPxLabel>
                                    <dx:ASPxDateEdit ID="deFecha" runat="server" ClientInstanceName="deFecha">
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Hora entrada">
                                    </dx:ASPxLabel>
                                    <dx:ASPxLabel ID="lbhora" runat="server" Text="Hora">
                                    </dx:ASPxLabel>
                                    <dx:ASPxTimeEdit ID="teHora" runat="server" ClientIDMode="AutoID" ClientInstanceName="teHora"
                                        ValidationSettings-ValidationGroup="ControlGroup1" Height="0px" Width="163px">
                                        <ValidationSettings ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxTimeEdit>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Recepcionado por">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cmbPersonal" runat="server" ClientInstanceName="cmbPersonal"
                                        DataSourceID="SDSEnt" TextField="PNombre" ValueField="IdEntidad">
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="SDSEnt" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
                                        SelectCommand="SELECT IdEntidad, PNombre FROM USER_Entidad WHERE (IdTipo = 1)">
                                    </asp:SqlDataSource>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Observaciones">
                                    </dx:ASPxLabel>
                                    <dx:ASPxMemo ID="memoObser" runat="server" ClientInstanceName="memoObser" Height="59px"
                                        Width="214px">
                                        <ValidationSettings ValidationGroup="ControlGroup1">
                                        </ValidationSettings>
                                    </dx:ASPxMemo>
                                </div>
                            </div>
                            <div>
                                <ul class="frmctrl">
                                    <li><a class="pure-button green-font" href="javascript:fn_SaveJS()" title="Guardar">
                                        <i class="fa fa-floppy-o"></i>Guardar</a></li>
                                    <li><a class="pure-button red-font" href="javascript:fn_CancelJS()" title="Cancelar">
                                        <i class="fa fa-times"></i>Cancelar</a></li>
                                    <li><a class="pure-button yellow-font" href="javascript:fn_CleanGroup(1);" title="Limpiar">
                                        <i class="fa fa-repeat"></i>Limpiar</a></li>
                                </ul>
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="SubFormPopup" runat="server" ClientInstanceName="SubFormPopup"
        AllowDragging="True" AllowResize="True" HeaderText="Formulario de sub registro"
        Modal="True" PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="True"
        ShowFooter="True" FooterText="Formulario de sub registro" PopupVerticalAlign="WindowCenter"
        ClientIDMode="AutoID" Height="186px" Width="380px" CloseAction="CloseButton">
        <ClientSideEvents CloseUp="function(s, e) {
	
fn_CleanGroup(2);
}" CloseButtonClick="function(s, e) {
	fn_CleanGroup(2);
}" />
        <ClientSideEvents CloseButtonClick="function(s, e) {
	fn_CleanGroup(2);
}" CloseUp="function(s, e) {
	
fn_CleanGroup(2);
}"></ClientSideEvents>
        <ContentStyle BackColor="#F9F9F9">
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <dx:ASPxCallbackPanel ID="SubFillingCallback" runat="server" ClientInstanceName="SubFillingCallback"
                    Width="100%" OnCallback="SubFillingCallback_Callback">
                    <ClientSideEvents EndCallback="function(s, e) {
fn_EndCallback();
}" />
                    <ClientSideEvents EndCallback="function(s, e) {
fn_EndCallback();
}"></ClientSideEvents>
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent2" runat="server">
                            <div class="form">
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Id">
                                    </dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtSubId" runat="server" Width="170px" ClientInstanceName="txtSubId"
                                        ClientEnabled="true" ReadOnly="True">
                                    </dx:ASPxTextBox>
                                    <dx:ASPxHiddenField ID="GridPrVal" runat="server" ClientInstanceName="GridPrVal">
                                    </dx:ASPxHiddenField>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Seleccione Ubicacion">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cmbUbicaciones" runat="server" ClientInstanceName="cmbUbicaciones"
                                        DataSourceID="SDSUbicacion" TextField="DescUbicacion" 
                                        ValueField="IdUbicacion" EnableIncrementalFiltering="True">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                    cmbSubUbic.PerformCallback();
                                    }" />
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Id" FieldName="IdUbicacion" Width="5%" />
                                            <dx:ListBoxColumn Caption="Tipo/Ubic" FieldName="DescUbicacion" Width="95%" />
                                        </Columns>
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup2">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="SDSUbicacion" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
                                        
                                        
                                        SelectCommand="SELECT IdUbicacion, DescUbicacion FROM MINV_Ubicaciones ORDER BY DescUbicacion, IdTipoUb"></asp:SqlDataSource>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Seleccione Ubicacion Especifica">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cmbSubUbic" runat="server" ClientInstanceName="cmbSubUbic" DataSourceID="SDSSubUbic"
                                        TextField="EspecUbic" ValueField="IdUbicEspec" OnCallback="cmbSubUbic_Callback"
                                        EnableIncrementalFiltering="True">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	cmbMaterial.PerformCallback();
}" ButtonClick="function(s, e) {
	cmbMaterial.PerformCallback();
}" />
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Id" FieldName="IdUbicEspec" Width="5%" />
                                            <dx:ListBoxColumn Caption="Ubicaciones" FieldName="EspecUbic" Width="95%" />
                                        </Columns>
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup2">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="SDSSubUbic" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
                                        SelectCommand="SELECT MINV_Ubic_Espec.IdUbicEspec, MINV_Ubic_Espec.EspecUbic FROM MINV_Ubic_Espec INNER JOIN MINV_Ubicaciones ON MINV_Ubic_Espec.IdUbicacion = MINV_Ubicaciones.IdUbicacion WHERE (MINV_Ubic_Espec.IdUbicacion = @IdUbicacion)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cmbUbicaciones" Name="IdUbicacion" 
                                                PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Seleccione material">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cmbMaterial" runat="server" ClientInstanceName="cmbMaterial"
                                        DataSourceID="SDSMaterial" TextField="NomMaterial" ValueField="IdMaterial" TextFormatString="{0}; {1}"
                                        OnCallback="cmbMaterial_Callback" EnableIncrementalFiltering="True" 
                                        Width="171px">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Id" FieldName="IdMaterial" />
                                            <dx:ListBoxColumn Caption="Material" FieldName="NomMaterial" />
                                        </Columns>
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup2">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="SDSMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
                                        
                                        SelectCommand="SELECT IdMaterial, NomMaterial FROM MINV_Materiales WHERE (IdMaterial NOT IN (SELECT IdMaterial FROM MINV_Det_Entradas WHERE (MINV_Det_Entradas.IdUbicEspec = @IdUbicEspec)))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cmbSubUbic" Name="IdUbicEspec" PropertyName="Value" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Observaciones material">
                                    </dx:ASPxLabel>
                                    <dx:ASPxMemo ID="memoOb" ClientInstanceName="memoOb" runat="server" Height="51px"
                                        Width="259px">
                                        <ValidationSettings ValidationGroup="ControlGroup2">
                                        </ValidationSettings>
                                    </dx:ASPxMemo>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Estado  Material">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cmbEstado" runat="server" ClientInstanceName="cmbEstado" DataSourceID="SDSEst"
                                        TextField="DescEstado" ValueField="IdEstado">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Id" FieldName="IdEstado" />
                                            <dx:ListBoxColumn Caption="Estado" FieldName="DescEstado" />
                                        </Columns>
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup2">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="SDSEst" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
                                        SelectCommand="SELECT [IdEstado], [DescEstado] FROM [MINV_EstadoMateriales]">
                                    </asp:SqlDataSource>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Cantidad">
                                    </dx:ASPxLabel>
                                    <dx:ASPxSpinEdit ID="sCant" ClientInstanceName="sCant" runat="server" Height="22px"
                                        Number="0.0" LargeIncrement="1" Increment="0.1" NullText="0,0" Width="114px"
                                        MaxValue="2147483647">
                                        <SpinButtons ShowLargeIncrementButtons="True">
                                        </SpinButtons>
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup2">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxSpinEdit>
                                </div>
                                <%--<div>
                                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Moneda">
                                </dx:ASPxLabel>
                                <dx:ASPxComboBox ID="cmbMoneda" runat="server" ClientInstanceName="cmbMoneda" 
                                    DataSourceID="SDSTM" TextField="DescTipoM" ValueField="IdTipoMoneda" >
                                    <Columns>
                                        <dx:ListBoxColumn Caption="Id" FieldName="IdTipoMoneda" />
                                        <dx:ListBoxColumn Caption="Moneda" FieldName="DescTipoM" />
                                    </Columns>
                                 <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                        SetFocusOnError="True" ValidationGroup="ControlGroup2">
                                         <RegularExpression ErrorText="Informacion Requerida" />
                                        <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SDSTM" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
                                    SelectCommand="SELECT [IdTipoMoneda], [DescTipoM] FROM [MSCOMP_Tipo_Moneda]">
                                
                                </asp:SqlDataSource>
                            
                            </div>--%>
                            </div>
                            <div>
                                <ul class="frmctrl">
                                    <li><a class="pure-button green-font" href="javascript:fn_SubAdd2()" title="Guardar">
                                        <i class="fa fa-plus-square"></i>Nuevo</a></li>
                                    <li><a class="pure-button green-font" href="javascript:fn_SubSaveJS()" title="Guardar">
                                        <i class="fa fa-floppy-o"></i>Guardar</a></li>
                                    <li><a class="pure-button red-font" href="javascript:fn_SubCancelJS()" title="Cancelar">
                                        <i class="fa fa-times"></i>Cancelar</a></li>
                                    <li><a class="pure-button yellow-font" href="javascript:fn_CleanGroup(2);" title="Limpiar">
                                        <i class="fa fa-repeat"></i>Limpiar</a></li>
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
        FooterText="Formulario borrar" PopupVerticalAlign="WindowCenter" ClientIDMode="AutoID"
        Width="240px">
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
                            ClientEnabled="true" ReadOnly="True" Font-Bold="True" HorizontalAlign="Center">
                        </dx:ASPxTextBox>
                    </div>
                </div>
                <div>
                    <ul class="frmctrl">
                        <li><a class="pure-button" href="javascript:fn_ConfirmDJS()" title="Borrar"><i class="fa fa-trash-o">
                        </i>Borrar</a></li>
                        <li><a class="pure-button" href="javascript:fn_CancelDJS()" title="Cancelar"><i class="fa fa-times">
                        </i>Cancelar</a></li>
                    </ul>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
