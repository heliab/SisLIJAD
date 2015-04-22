<%@ Page Title="" Language="C#" MasterPageFile="~/SICOM/MasterSICOM.Master" AutoEventWireup="true" CodeBehind="SolicCompMaterial.aspx.cs" Inherits="SisLIJAD.SICOM.SolicCompMaterial" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
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
<%@ Register assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function fn_SubAddMat() {
        fn_GetValOnHid();
        fn_SubAdd();
        cmbMateriales.PerformCallback();

    }
    function fn_NewDetSolJS() {
                fn_GetValOnHid();
                cmbMateriales.PerformCallback();
                fn_SubNewJS();
            }
            function fn_EditSolJS() {
                GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Aprobado', SetApr);
                fn_GetValOnHid();
                cmbMateriales.PerformCallback();
                fn_SubEditJS();

            }
              function fn_GetValOnHid() {
        HiddenGridPr.Set("SessionId", GridId = GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex()));
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
    <div class="wrapctrl">
        <ul class="ctrlist">
            <li><a class="pure-button blue-font" href="javascript:fn_NewJS();" title="Nuevo">
                            <i class="fa fa-plus"></i>Agregar</a></li>
                        <li><a class="pure-button green-font" href="javascript:fn_EditJS();" title="Editar">
                            <i class="fa fa-pencil-square-o"></i>Editar</a></li>
                        <li><a class="pure-button red-font" href="javascript:fn_DeleteJS();" title="Borrar">
                            <i class="fa fa-trash"></i>Borrar</a></li>
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
        DataSourceID="SDSSolicitudMateriales" KeyFieldName="IdSolic_Comp" SettingsBehavior-AllowFocusedRow="True"
        Width="100%" ClientInstanceName="GridPrincipal"
        OnCustomCallback="GridPrincipal_CustomCallback">
        <ClientSideEvents DetailRowExpanding="function(s, e) {
	GridPrincipal.SetFocusedRowIndex(e.visibleIndex);
}" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IdSolic_Comp" ReadOnly="True"
                VisibleIndex="0" Caption="Id Solicitud" Width="12%">
                <Settings AutoFilterCondition="Contains" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="HeaderSolic" VisibleIndex="1"
                Caption="Descripción Solicitud">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="FechARecibir"
                VisibleIndex="2" Caption="Fecha requerida" Width="13%">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Empresa" VisibleIndex="3"
                Caption="Proveedor">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Moneda" FieldName="DescTipoM"
                VisibleIndex="4" Width="8%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn VisibleIndex="5" Width="0%">
                <ClearFilterButton Text="Limpiar" Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
        <SettingsPager AlwaysShowPager="True" PageSize="15">
            <Summary AllPagesText="Paginas: {0} - {1} ({2} items)"
                Text="Pagina {0} of {1} ({2} items)" />
        </SettingsPager>
        <Settings ShowHeaderFilterButton="True" ShowFilterRow="True"
            ShowGroupPanel="True" />
        <SettingsText EmptyDataRow="No hay datos para mostrar" GroupPanel="Arrastre las columnas aquí" />
        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
        <Styles>
            <FocusedRow BackColor="#5180BF">
            </FocusedRow>
        </Styles>
        <Templates>
            <DetailRow>
            <div class="wrapctrl">
                    <ul class="ctrlist">
                        <li><a class="pure-button blue-font" href="javascript:fn_NewDetSolJS();" title="Nuevo">
                            <i class="fa fa-plus"></i>Agregar</a></li>
                        <li><a class="pure-button green-font" href="javascript:fn_EditSolJS();" title="Editar">
                            <i class="fa fa-pencil-square-o"></i>Editar</a></li>
                        <li><a class="pure-button red-font" href="javascript:fn_SubDeleteJS();" title="Borrar">
                            <i class="fa fa-trash"></i>Borrar</a></li>
                    </ul>
                </div>
                <dx:ASPxGridView ID="SubGrid" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
                    ClientInstanceName="SubGrid" DataSourceID="SDSDetCompra" OnBeforePerformDataSelect="SubGrid_BeforePerformDataSelect"
                    Width="100%" KeyFieldName="IdDetalle">
                    <TotalSummary>
                        <dx:ASPxSummaryItem FieldName="NomMaterial" ShowInColumn="Material"
                            SummaryType="Count" DisplayFormat="Cantidad Materiales {0}" />
                        <dx:ASPxSummaryItem DisplayFormat="Total {0}" FieldName="Precio"
                            ShowInColumn="Precio Total" SummaryType="Sum" />
                    </TotalSummary>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="IdDetalle" ReadOnly="True" 
                            VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Material" FieldName="NomMaterial" 
                            VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Precio"
                            VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PrecioIndividual"
                            VisibleIndex="4" ReadOnly="True">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <SettingsPager>
                        <Summary AllPagesText="Pag: {0} - {1} ({2} items)"
                            Text="Pagina {0} of {1} ({2} items)" />
                    </SettingsPager>
                    <Settings ShowFilterRow="True" ShowFooter="True" />
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
    <asp:SqlDataSource ID="SDSSolicitudMateriales" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        
        SelectCommand="SELECT MSCOMP_Solic_Compras.IdSolic_Comp, MSCOMP_Solic_Compras.HeaderSolic, MSCOMP_Solic_Compras.FechARecibir, MSCOMP_Tipo_Moneda.DescTipoM, USER_Entidad.Empresa FROM MSCOMP_Solic_Compras INNER JOIN MSCOMP_Tipo_Moneda ON MSCOMP_Solic_Compras.IdMoneda = MSCOMP_Tipo_Moneda.IdTipoMoneda INNER JOIN USER_Entidad ON MSCOMP_Solic_Compras.IdEntidad = USER_Entidad.IdEntidad ORDER BY MSCOMP_Solic_Compras.IdSolic_Comp DESC">
            </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSDetCompra" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT CAST(MSCOMP_Solicitud_Mat.IdSolic_Comp AS NVARCHAR) + '.' + CAST(MSCOMP_Solicitud_Mat.IdMaterial AS NVARCHAR) AS IdDetalle, MINV_Materiales.NomMaterial, MSCOMP_Solicitud_Mat.Cantidad, MSCOMP_Solicitud_Mat.Precio, MSCOMP_Solicitud_Mat.Precio / MSCOMP_Solicitud_Mat.Cantidad AS PrecioIndividual FROM MINV_Materiales INNER JOIN MSCOMP_Solicitud_Mat ON MINV_Materiales.IdMaterial = MSCOMP_Solicitud_Mat.IdMaterial WHERE (MSCOMP_Solicitud_Mat.IdSolic_Comp = @IdSolic_Comp) ORDER BY IdDetalle DESC">
        <SelectParameters>
            <asp:SessionParameter Name="IdSolic_Comp" SessionField="IdSolic_Comp" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
    <dx:ASPxPopupControl ID="FormPopup" runat="server" ClientInstanceName="FormPopup"
        AllowDragging="True" AllowResize="True"
        HeaderText="Formulario de registro" Modal="True"
        PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" ShowFooter="True"
        FooterText="Formulario de registro" PopupVerticalAlign="WindowCenter" ClientIDMode="AutoID"
        Height="197px" Width="360px" CloseAction="CloseButton">
        <ClientSideEvents CloseUp="function(s, e) {
fn_CleanGroup(1);
}" />
        <ContentStyle BackColor="#F9F9F9">
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <dx:ASPxCallbackPanel ID="FillingCallback" runat="server" ClientInstanceName="FillingCallback"
                    Width="100%" OnCallback="FillingCallback_Callback">
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
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Descripción Servicio">
                                    </dx:ASPxLabel>
                                    <dx:ASPxMemo ID="memoServ" runat="server" ClientInstanceName="memoServ" Height="78px"
                                        Width="97%">
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxMemo>
                                </div>
                                <div class="BaseForm">

                                    <div class="row">
                                    <div class="first">
                                     <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Seleccione proveedor">
                                            </dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cmbProveedor" runat="server"
                                            ClientInstanceName="cmbProveedor" DataSourceID="SDSProveedor"
                                            TextField="Empresa" ValueField="IdEntidad"
                                            EnableIncrementalFiltering="True">
                                         <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" SetFocusOnError="True"
                                                    ValidationGroup="ControlGroup1" ErrorTextPosition="Bottom">
                                                    <RegularExpression ErrorText="Informacion Requerida" />
                                                    <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                                    <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                                    <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                                </ValidationSettings>
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="SDSProveedor" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
                                            SelectCommand="SELECT IdEntidad, Empresa FROM USER_Entidad WHERE (IdTipo = 2)"></asp:SqlDataSource>

                                    </div>
                                    <%--<Copyrights H A N I E L L O P E Z> Creador del sistema--%>
                                    </div>
                               <div class="row">
                               <div class="first">
                                    <dx:ASPxLabel ID="ASPxLabel80" runat="server" Text="Fecha compra requerida">
                                            </dx:ASPxLabel>
                                    <dx:ASPxDateEdit ID="deFeReq" runat="server" ClientInstanceName="deFeReq">
                                            <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" SetFocusOnError="True"
                                                    ValidationGroup="ControlGroup1" ErrorTextPosition="Bottom">
                                                    <RegularExpression ErrorText="Informacion Requerida" />
                                                    <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                                    <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                                    <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>
                                            </div>
                               </div>
                                <div class="row">
                                      <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Moneda">
                                            </dx:ASPxLabel>
                                            <dx:ASPxComboBox ID="cmbTipoMo" runat="server" ClientInstanceName="cmbTipoMo"
                                                DataSourceID="SDSCurrency" TextField="DescTipoM" ValueField="IdTipoMoneda">
                                             <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                                    SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                                    <RegularExpression ErrorText="Informacion Requerida" />
                                                    <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                                    <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                                    <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="SDSCurrency" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
                                                SelectCommand="SELECT [IdTipoMoneda], [DescTipoM] FROM [MSCOMP_Tipo_Moneda]"></asp:SqlDataSource>
                                     </div>
                                      </div>
                                </div>

                         <div>
                                <ul class="frmctrl">
                                    <li><a class="pure-button green-font" href="javascript:fn_SaveJS()" title="Guardar"><i class="fa fa-floppy-o">
                                    </i>Guardar</a></li>
                                    <li><a class="pure-button red-font" href="javascript:fn_CancelJS()" title="Cancelar"><i class="fa fa-times">
                                    </i>Cancelar</a></li>
                                    <li><a class="pure-button yellow-font" href="javascript:fn_CleanGroup(1);" title="Limpiar"><i
                                        class="fa fa-repeat"></i>Limpiar</a></li>
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
                                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Id">
                                    </dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtSubId" runat="server" Width="170px" ClientInstanceName="txtSubId"
                                        ClientEnabled="true" ReadOnly="True">
                                    </dx:ASPxTextBox>
                                    </div>
                                <dx:ASPxHiddenField ID="HiddenGridPr" runat="server" ClientInstanceName="HiddenGridPr">
                                </dx:ASPxHiddenField>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Seleccione Material">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cmbMateriales" runat="server" ClientInstanceName="cmbMateriales"
                                        Width="95%" DataSourceID="SDSMateriales" TextField="NomMaterial"
                                        ValueField="IdMaterial" OnCallback="cmbMateriales_Callback" 
                                        EnableIncrementalFiltering="True">

                                        <Columns>
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
                                    <asp:SqlDataSource ID="SDSMateriales" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
                                        SelectCommand="SELECT IdMaterial, NomMaterial FROM MINV_Materiales WHERE (IdMaterial NOT IN (SELECT IdMaterial FROM MSCOMP_Solicitud_Mat WHERE (IdSolic_Comp = @IdSolic_Comp)))">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="IdSolic_Comp" SessionField="IdSolic_Comp" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Cantidad requerida">
                                    </dx:ASPxLabel>
                                    <dx:ASPxSpinEdit ID="sCant" ClientInstanceName="sCant" runat="server" Height="22px"
                                        Number="0.0" LargeIncrement="1" Increment="0.1" NullText="0,0" Width="114px"
                                        MaxValue="2147483647">

                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup2">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxSpinEdit>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Costo Total"></dx:ASPxLabel>
                                    <dx:ASPxSpinEdit ID="sCosto" ClientInstanceName="sCosto" runat="server" Height="22px"
                                        Number="0.0" LargeIncrement="1" Increment="0.1" NullText="0,0" Width="114px"
                                        MaxValue="2147483647">
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup2">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxSpinEdit>
                                </div>
                            </div>
                            <div>
                                <ul class="frmctrl">
                                    <li><a class="pure-button button-green white-font" href="javascript:fn_SubAddMat();" title="Guardar">
                                        <i class="fa fa-plus-square"></i>Nuevo</a></li>
                                    <li><a class="pure-button green-font" href="javascript:fn_SubSaveJS();" title="Guardar">
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
