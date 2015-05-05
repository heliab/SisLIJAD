<%@ Page Title="Vincular Materiales y Maquinaria" Language="C#" MasterPageFile="~/MPR/MasterMPR.Master" AutoEventWireup="true" CodeBehind="VincularMAteriales.aspx.cs" Inherits="SisLIJAD.MPR.VincularMAteriales" %>

<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
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
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    function fn_SubNewVinJS() {
        fn_GetValOnHid();
        HiddenV.Set("Type", 0);
        fn_SubNewJS();
        cmbMaterial.PerformCallback();
    }
    function fn_SubNewVin2JS() {
        HiddenV.Set("Type", 1);
        fn_GetValOnHid();
        fn_SubNewJS();
        cmbMaterial.PerformCallback();
     }
     function SubEditVinJS() {
         fn_GetValOnHid();
     }
     function fn_GetValOnHid() {
         HiddenV.Set("SessionId", fn_GetIdValue());
     }
     function fn_SubNew3JS() {
         txtSubId3.SetText('Nuevo');
         HiddenV.Set('Nuevo', 13);
         fn_GetValOnHid();
         cmbEquip.PerformCallback();
         SubFormPopup2.Show();
         fn_CleanGroup(1);
     }
     function fn_SubDelete3JS() {
         HiddenV.Set('Nuevo', 14);
         SubGridId3 = SubGrid3.GetRowKey(SubGrid3.GetFocusedRowIndex());
         txtIdD.SetText(SubGridId3);
         DeleteForm.Show();
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
    <dx:ASPxTextBox ID="txtSubId2" runat="server" Width="170px" 
            ClientInstanceName="txtSubId2" ClientVisible="False">
        </dx:ASPxTextBox>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
<div class="grid">
    <dx:ASPxGridView ID="GridPrincipal" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
        DataSourceID="SDSPruebas" KeyFieldName="IdPrueba" SettingsBehavior-AllowFocusedRow="True"
        Width="100%" ClientInstanceName="GridPrincipal" OnCustomCallback="GridPrincipal_CustomCallback">

<Settings ShowFilterRow="True" ShowHeaderFilterButton="True" ShowGroupPanel="True"></Settings>

<SettingsText GroupPanel="Arrastre las columnas aqu&#237;" 
            EmptyDataRow="No hay datos para mostrar"></SettingsText>

        <ClientSideEvents DetailRowExpanding="function(s, e) {
	GridPrincipal.SetFocusedRowIndex(e.visibleIndex);
}" />
        
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IdPrueba" ReadOnly="True" VisibleIndex="0"
                Width="7%" ShowInCustomizationForm="True" SortIndex="0" 
                SortOrder="Descending">
                <EditFormSettings Visible="False" />
<EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nombre Ensaye" FieldName="NomPrueba" VisibleIndex="1"
                Width="17%" ShowInCustomizationForm="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Descripción" FieldName="DescPrueba" VisibleIndex="2"
                Width="21%" ShowInCustomizationForm="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Duración días" FieldName="Duracion" VisibleIndex="3"
                Width="7%" ShowInCustomizationForm="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Ubicación" FieldName="DescUbicacion" 
                VisibleIndex="4" ShowInCustomizationForm="True" Width="15%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Precio" VisibleIndex="5" Caption="Precio" 
                ReadOnly="True" ShowInCustomizationForm="True" Width="10%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tipo Prueba" FieldName="NomTipo" 
                VisibleIndex="6" ShowInCustomizationForm="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="7">
                <ClearFilterButton Text="Limpiar" Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
        <SettingsPager AlwaysShowPager="True" PageSize="15">
        </SettingsPager>
        <Settings ShowHeaderFilterButton="True" ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsText EmptyDataRow="No hay datos para mostrar" GroupPanel="Arrastre las columnas aquí" />

        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />

        <Styles>
            <FocusedRow BackColor="#5180BF">
            </FocusedRow>
        </Styles>
        <Templates>
            <DetailRow>
               <dx:ASPxPageControl ID="PageDetallle" runat="server" ActiveTabIndex="2" 
                    ClientIDMode="AutoID" Width="100%">

                    <TabPages>
                        <dx:TabPage Text="Materiales Cliente">
                            <ContentCollection>
                                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                 <div class="wrapctrl">
                    <ul class="ctrlist">
                        <li><a class="pure-button blue-font" href="javascript:fn_SubNewVinJS();" title="Nuevo">
                            <i class="fa fa-plus"></i>Nuevo</a></li>
                       <%-- <li><a class="pure-button green-font" href="javascript:fn_SubEditJS();" title="Editar">
                            <i class="fa fa-pencil-square-o"></i>Editar</a></li>--%>
                        <li><a class="pure-button red-font" href="javascript:fn_SubDeleteJS();" title="Borrar">
                            <i class="fa fa-trash"></i>Borrar</a></li>
                    </ul>
                </div>
                <dx:ASPxGridView ID="SubGrid" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
                    ClientInstanceName="SubGrid" DataSourceID="SDSDetMatLab" OnBeforePerformDataSelect="SubGrid_BeforePerformDataSelect"
                    Width="100%" KeyFieldName="IdDetalle">
                    <TotalSummary>
                        <dx:ASPxSummaryItem FieldName="Duracion" ShowInColumn="Duracion" SummaryType="Sum" />
                    </TotalSummary>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="IdDetalle" ReadOnly="True" 
                            VisibleIndex="0" Width="14%">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NomMaterial" VisibleIndex="1" 
                            Caption="Material">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="2" Width="10%">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Settings ShowFilterRow="True" ShowFooter="True" />
                    <SettingsText EmptyDataRow="No hay datos para mostrar" FilterBarClear="Limpiar" />
                    <SettingsDetail IsDetailGrid="True" />
                    <Styles>
                        <FocusedRow BackColor="#5180BF">
                        </FocusedRow>
                    </Styles>
                </dx:ASPxGridView>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Materiales Laboratorios">
                            <ContentCollection>
                                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                <div class="wrapctrl">
                    <ul class="ctrlist">
                                 <li><a class="pure-button blue-font" href="javascript:fn_SubNewVin2JS();" title="Nuevo">
                            <i class="fa fa-plus"></i>Nuevo</a></li>
                     <%--   <li><a class="pure-button green-font" href="javascript:fn_SubEditJS();" title="Editar">
                            <i class="fa fa-pencil-square-o"></i>Editar</a></li>--%>
                        <li><a class="pure-button red-font" href="javascript:fn_SubDelete2JS();" title="Borrar">
                            <i class="fa fa-trash"></i>Borrar</a></li>
                    </ul>
                </div>
                                    <dx:ASPxGridView ID="SubGrid2" runat="server" ClientIDMode="AutoID" 
                                        ClientInstanceName="SubGrid2" Width="100%" AutoGenerateColumns="False" 
                                        DataSourceID="SDSDetMatCliente" 
                                        OnBeforePerformDataSelect="SubGrid2_BeforePerformDataSelect" 
                                        KeyFieldName="IdDetalle">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="IdDetalle" ReadOnly="True" 
                                                ShowInCustomizationForm="True" VisibleIndex="0" Width="14%">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Material" FieldName="NomMaterial" 
                                                ShowInCustomizationForm="True" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Cantidad" ShowInCustomizationForm="True" 
                                                VisibleIndex="2" Width="10%">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" />
                                        <Settings ShowFilterRow="True" ShowFooter="True" />
                                        <SettingsDetail IsDetailGrid="True" />
                                        <Styles>
                                            <FocusedRow BackColor="#5180BF">
                                            </FocusedRow>
                                        </Styles>
                                    </dx:ASPxGridView>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Equipos">
                            <ContentCollection>
                                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                 <div class="wrapctrl">
                    <ul class="ctrlist">
                                 <li><a class="pure-button blue-font" href="javascript:fn_SubNew3JS();" title="Nuevo">
                            <i class="fa fa-plus"></i>Nuevo</a></li>
                     <%--   <li><a class="pure-button green-font" href="javascript:fn_SubEditJS();" title="Editar">
                            <i class="fa fa-pencil-square-o"></i>Editar</a></li>--%>
                        <li><a class="pure-button red-font" href="javascript:fn_SubDelete3JS();" title="Borrar">
                            <i class="fa fa-trash"></i>Borrar</a></li>
                    </ul>
                </div>
                                    <dx:ASPxGridView ID="SubGrid3" runat="server" ClientIDMode="AutoID" 
                                        ClientInstanceName="SubGrid3" Width="100%" AutoGenerateColumns="False" 
                                        DataSourceID="SDSEquipos" 
                                        OnBeforePerformDataSelect="SubGrid2_BeforePerformDataSelect" 
                                        KeyFieldName="IdDetalle">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="IdDetalle" ReadOnly="True" 
                                                ShowInCustomizationForm="True" VisibleIndex="0" Width="20%">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Equipo/Maquinaria" FieldName="NomMaq" 
                                                ShowInCustomizationForm="True" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" />
                                        <Settings ShowFilterRow="True" ShowFooter="True" />
                                        <SettingsDetail IsDetailGrid="True" />
                                        <Styles>
                                            <FocusedRow BackColor="#5180BF">
                                            </FocusedRow>
                                        </Styles>
                                    </dx:ASPxGridView>

                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                    </TabPages>

                </dx:ASPxPageControl>
            </DetailRow>
        </Templates>
    </dx:ASPxGridView></div>  
    <asp:SqlDataSource ID="SDSPruebas" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT MPR_Prueba.IdPrueba, MPR_Prueba.NomPrueba, MPR_Prueba.DescPrueba, MPR_Prueba.Duracion, MINV_Ubicaciones.DescUbicacion, 'C$ ' + CAST(MPR_Prueba.Precio AS NVARCHAR) AS Precio, MPR_Tipo_Prueba.NomTipo FROM MPR_Prueba INNER JOIN MPR_Tipo_Prueba ON MPR_Prueba.IdTipoPrueba = MPR_Tipo_Prueba.IdTipoPrueba INNER JOIN MINV_Ubicaciones ON MPR_Prueba.IdUbicacion = MINV_Ubicaciones.IdUbicacion">
    </asp:SqlDataSource>
         <asp:SqlDataSource ID="SDSDetMatLab" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
            
        
        
        SelectCommand="SELECT CAST(MPR_Det_Mat_Prueba.IdPrueba AS NVARCHAR) + '.' + CAST(MPR_Det_Mat_Prueba.IdMaterial AS NVARCHAR) AS IdDetalle, MINV_Materiales.NomMaterial,     CAST(MPR_Det_Mat_Prueba.Cantidad AS nvarchar) + ' ' + CAST(MINV_UnidadM.AbrUnid AS NVARCHAR) AS Cantidad
 FROM MPR_Det_Mat_Prueba INNER JOIN MINV_Materiales ON MPR_Det_Mat_Prueba.IdMaterial = MINV_Materiales.IdMaterial INNER JOIN MINV_UnidadM ON MINV_Materiales.IdUnidad = MINV_UnidadM.IdUnidadM WHERE (MPR_Det_Mat_Prueba.RequeridoPor = 0) AND (MPR_Det_Mat_Prueba.IdPrueba = @IdPrueba)">
         <SelectParameters>
             <asp:SessionParameter Name="IdPrueba" SessionField="IdPrueba" />
         </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSDetMatCliente" runat="server" 
         ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
        
        SelectCommand="SELECT CAST(MPR_Det_Mat_Prueba.IdPrueba AS NVARCHAR) + '.' + CAST(MPR_Det_Mat_Prueba.IdMaterial AS NVARCHAR) AS IdDetalle, MINV_Materiales.NomMaterial, CAST(MPR_Det_Mat_Prueba.Cantidad AS nvarchar) + ' ' + CAST(MINV_UnidadM.AbrUnid AS NVARCHAR) AS Cantidad FROM MPR_Det_Mat_Prueba INNER JOIN MINV_Materiales ON MPR_Det_Mat_Prueba.IdMaterial = MINV_Materiales.IdMaterial INNER JOIN MINV_UnidadM ON MINV_Materiales.IdUnidad = MINV_UnidadM.IdUnidadM WHERE (MPR_Det_Mat_Prueba.RequeridoPor = 1) AND (MPR_Det_Mat_Prueba.IdPrueba = @IdPrueba)">
        <SelectParameters>
            <asp:SessionParameter Name="IdPrueba" SessionField="IdPrueba" />
        </SelectParameters>
     </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSEquipos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
        SelectCommand="SELECT CAST(MPR_Det_Equi_Prueba.IdPrueba AS NVARCHAR) + '.' + CAST(MPR_Det_Equi_Prueba.IdEquipo AS NVARCHAR) AS IdDetalle, MPR_EquipMaquin.NomMaq FROM MPR_Det_Equi_Prueba INNER JOIN MPR_EquipMaquin ON MPR_Det_Equi_Prueba.IdEquipo = MPR_EquipMaquin.IdEquipo">

    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
    <dx:ASPxPopupControl ID="FormPopup" runat="server" ClientInstanceName="FormPopup"
        AllowDragging="True" AllowResize="True" HeaderText="Formulario de registro" Modal="True"
        PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" ShowFooter="True"
        FooterText="Formulario de registro" PopupVerticalAlign="WindowCenter" ClientIDMode="AutoID"
        Height="270px" Width="354px" CloseAction="CloseButton">
        <ClientSideEvents CloseUp="function(s, e) {
fn_CleanGroup(1);
}" />
<ClientSideEvents CloseUp="function(s, e) {
fn_CleanGroup(1);
}"></ClientSideEvents>

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
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Nombre Prueba">
                                    </dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtNom" runat="server" Width="94%" ClientInstanceName="txtNom"
                                        ValidationSettings-ValidationGroup="ControlGroup1">
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
<RegularExpression ErrorText="Informacion Requerida"></RegularExpression>

<RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Descripción de la prueba">
                                    </dx:ASPxLabel>
                                    <dx:ASPxMemo ID="memoDesc" runat="server" ClientInstanceName="memoDesc" Height="71px"
                                        Width="275px" ValidationSettings-ValidationGroup="ControlGroup1" NullText="Puede añadir contenido adicional a la prueba aquí">
                                        <ValidationSettings ValidationGroup="ControlGroup1">
                                        </ValidationSettings>
                                    </dx:ASPxMemo>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Duracion de la prueba (días)">
                                    </dx:ASPxLabel>
                                    <dx:ASPxSpinEdit ID="sCant" ClientInstanceName="sCant" runat="server" Height="22px"
                                        Number="0.0" LargeIncrement="1" Increment="0.1" NullText="0,0" Width="114px"
                                        MaxValue="2147483647">
                                        <SpinButtons ShowLargeIncrementButtons="True">
                                        </SpinButtons>
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxSpinEdit>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Seleccione laboratorio donde se realizará la experimentacion">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cmbUbic" runat="server" ClientInstanceName="cmbUbic" DataSourceID="SDSLabs"
                                        TextField="DescUbicacion" ValueField="IdUbicacion">
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="SDSLabs" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
                                        SelectCommand="SELECT IdUbicacion, DescUbicacion FROM MINV_Ubicaciones WHERE (IdTipoUb = 1)"></asp:SqlDataSource>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Precio moneda local">
                                    </dx:ASPxLabel>
                                    <dx:ASPxSpinEdit ID="sPrecio" ClientInstanceName="sPrecio" runat="server" Height="22px"
                                        Number="0.0" LargeIncrement="1" Increment="0.1" NullText="0,0" Width="114px"
                                        MaxValue="2147483647">
                                        <SpinButtons ShowLargeIncrementButtons="True">
                                        </SpinButtons>
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxSpinEdit>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Tipo Prueba">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cmbTipoPr" runat="server" ClientInstanceName="cmbTipoPr" 
                                        DataSourceID="SDSTipoPr" TextField="NomTipo" ValueField="IdTipoPrueba">
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="SDSTipoPr" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
                                        SelectCommand="SELECT [IdTipoPrueba], [NomTipo] FROM [MPR_Tipo_Prueba] ORDER BY [NomTipo]">
                                    </asp:SqlDataSource>
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
	fn_CleanGroup(3);
}" CloseUp="function(s, e) {
	
fn_CleanGroup(3);
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
                                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Id">
                                    </dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtSubId" runat="server" Width="170px" ClientInstanceName="txtSubId"
                                        ClientEnabled="true" ReadOnly="True">
                                    </dx:ASPxTextBox>
                                    <dx:ASPxHiddenField ID="GridPrVal" runat="server" ClientInstanceName="GridPrVal">
                                    </dx:ASPxHiddenField>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Seleccione Material">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cmbMaterial" runat="server" ClientInstanceName="cmbMaterial" 
                                        Width="95%" DataSourceID="SqlDataSource1" TextField="NomMaterial" 
                                        ValueField="IdMaterial" OnCallback="cmbMaterial_Callback">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Id" FieldName="IdMaterial" Width="10%" />
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
                                        SelectCommand="SELECT IdMaterial, NomMaterial FROM MINV_Materiales WHERE (IdMaterial NOT IN (SELECT IdMaterial FROM MPR_Det_Mat_Prueba WHERE (IdPrueba = @IdPrueba)))">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="IdPrueba" SessionField="IdPrueba" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Seleccione Cantidad">
                                    </dx:ASPxLabel>
                                    <dx:ASPxSpinEdit ID="sCant2" ClientInstanceName="sCant2" runat="server" Height="22px"
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
                            </div>
                            <div>
                                <ul class="frmctrl">
                                    <%--<li><a class="pure-button green-font" href="javascript:fn_SubAddSol();" title="Guardar">
                                        <i class="fa fa-plus-square"></i>Nuevo</a></li>--%>
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
      <dx:ASPxPopupControl ID="SubFormPopup2" runat="server" ClientInstanceName="SubFormPopup2"
        AllowDragging="True" AllowResize="True" HeaderText="Formulario de sub registro"
        Modal="True" PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="True"
        ShowFooter="True" FooterText="Formulario de sub registro" PopupVerticalAlign="WindowCenter"
        ClientIDMode="AutoID" Height="186px" Width="380px" CloseAction="CloseButton">
        <ClientSideEvents CloseUp="function(s, e) {
	
fn_CleanGroup(3);
}" CloseButtonClick="function(s, e) {
	fn_CleanGroup(3);
}" />
        <ClientSideEvents CloseButtonClick="function(s, e) {
	fn_CleanGroup(3);
}" CloseUp="function(s, e) {
	
fn_CleanGroup(3);
}"></ClientSideEvents>
        <ContentStyle BackColor="#F9F9F9">
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
                <dx:ASPxCallbackPanel ID="SubFillingCallback2" runat="server" ClientInstanceName="SubFillingCallback2"
                    Width="100%">
                    <ClientSideEvents EndCallback="function(s, e) {
fn_EndCallback();
}" />
                    <ClientSideEvents EndCallback="function(s, e) {
fn_EndCallback();
}"></ClientSideEvents>
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent3" runat="server">
                            <div class="form">
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Id">
                                    </dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtSubId3" runat="server" Width="170px" ClientInstanceName="txtSubId3"
                                        ClientEnabled="true" ReadOnly="True">
                                    </dx:ASPxTextBox>
                                   
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Seleccione equipo">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cmbEquip" runat="server" ClientInstanceName="cmbEquip" 
                                        Width="95%" DataSourceID="SDSListEquip"  
                                        TextField="NomMaq" ValueField="IdEquipo" OnCallback="cmbEquip_Callback" >
                                        
                                        <Columns>
                                            <dx:ListBoxColumn Caption="ID" FieldName="IdEquipo" Width="10%" />
                                            <dx:ListBoxColumn Caption="Equipo" FieldName="NomMaq" />
                                        </Columns>
                                        
                                     <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup3">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="SDSListEquip" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
                                        
                                        SelectCommand="SELECT IdEquipo, NomMaq FROM MPR_EquipMaquin WHERE (IdEquipo NOT IN (SELECT IdEquipo FROM MPR_Det_Equi_Prueba AS MPR_Det_Equi_Prueba WHERE (IdPrueba = @IdPrueba))) ORDER BY NomMaq">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="IdPrueba" SessionField="IdPrueba" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                
                            </div>
                            <div>
                                <ul class="frmctrl" id="leftmar-button">
                                    <li><a class="pure-button green-font" href="javascript:fn_SubSave2JS();" title="Guardar">
                                        <i class="fa fa-floppy-o"></i>Guardar</a></li>
                                    <li><a class="pure-button red-font" href="javascript:fn_SubCancel2JS();" title="Cancelar">
                                        <i class="fa fa-times"></i>Cancelar</a></li>
                                    <li><a class="pure-button yellow-font" href="javascript:fn_CleanGroup(3);" title="Limpiar">
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
