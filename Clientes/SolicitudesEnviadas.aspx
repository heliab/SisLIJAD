<%@ Page Title="Soicitdes Enviadas" Language="C#" MasterPageFile="~/Clientes/ClientesMASTER.Master" AutoEventWireup="true" CodeBehind="SolicitudesEnviadas.aspx.cs" Inherits="SisLIJAD.Clientes.SolicitudesEnviadas" %>

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
    function fn_SubNewSolJS() {
        fn_GetValOnHid();
        cmbPrueba.PerformCallback();
        fn_SubNewJS();
    }

    function fn_SubEditJSSol() {
        fn_GetValOnHid();
        cmbPrueba.PerformCallback();
        fn_SubEditJS();
    }

    function fn_SubAddSol() {
        fn_GetValOnHid();
        fn_SubAdd();
        cmbPrueba.PerformCallback();

    }
    function fn_GetValOnHid() {
        HiddenV.Set("SessionId", fn_GetIdValue());
    }
    function fn_EnviarSolJS() {
        if (confirm("¿Desea enviar la solicitud a los laboratorios?\nEl proceso no tiene retroceso!")) {
            HiddenV.Set('Nuevo', 6);
            HiddenV.Set('Enviar', fn_GetIdValue());
            NewCallback.PerformCallback();
            fn_EndCallback();
            alert('Su solicitud fue enviada con exito\nPuede ver las solicitudes enviada en la sección Solicitud-> Solicitudes Enviadas');
        }
    }
     
     
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
<div class="wrapctrl">
        <%--<ul class="ctrlist">
            <li><a class="pure-button blue-font" href="javascript:fn_NewJS();" title="Nuevo"><i
                class="fa fa-search-plus"></i> Reporte</a></li>
            <li><a class="pure-button green-font" href="javascript:fn_EditJS();" title="Editar">
                <i class="fa fa-clipboard"></i> Ver</a></li>
           
        </ul>--%>
        <div class="Titulo2">Solicitudes Enviadas</div>
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
<div class="grid">
    <dx:ASPxGridView ID="GridPrincipal" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
        DataSourceID="SDSSolicitudes" KeyFieldName="IdSolicPrueba" SettingsBehavior-AllowFocusedRow="True"
        Width="100%" ClientInstanceName="GridPrincipal" OnCustomCallback="GridPrincipal_CustomCallback">
        <ClientSideEvents DetailRowExpanding="function(s, e) {
	GridPrincipal.SetFocusedRowIndex(e.visibleIndex);
}" />
        <Columns>
            <dx:GridViewDataTextColumn Caption="Id Solicitud" FieldName="IdSolicPrueba" 
                ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="12%">
                <Settings AutoFilterCondition="Contains" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Descripción Prueba" 
                FieldName="HeaderSolicPrueba" ShowInCustomizationForm="True" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="username" ShowInCustomizationForm="True" 
                VisibleIndex="2" Width="8%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FechaRegistro" 
                ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Autorizado" 
                ShowInCustomizationForm="True" VisibleIndex="4" Width="7%">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewCommandColumn VisibleIndex="5" Width="0%">
                <ClearFilterButton Text="Limpíar" Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
        <SettingsPager AlwaysShowPager="True" PageSize="15">
            <Summary Text="Página {0} de {1} ({2} items)" />
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
            <div class="wrapctrl">
                        <ul class="ctrlist">
                            <li><a class="pure-button blue-font" href="javascript:fn_VerMaterialesJS();" title="Reporte">
                                <i class="fa fa-clipboard"></i>Reporte</a></li>
                        </ul>
                    </div>
                <dx:ASPxGridView ID="SubGrid" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
                    ClientInstanceName="SubGrid" DataSourceID="SDSDetSol" KeyFieldName="IdPrueba"
                    OnBeforePerformDataSelect="SubGrid_BeforePerformDataSelect" Width="100%">
                    <TotalSummary>
                        <dx:ASPxSummaryItem FieldName="Duracion" ShowInColumn="Duracion" SummaryType="Sum" />
                    </TotalSummary>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="IdDetalle" ReadOnly="True" ShowInCustomizationForm="True"
                            VisibleIndex="0" Width="10%">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Nombre Ensaye" FieldName="NomPrueba" ShowInCustomizationForm="True"
                            VisibleIndex="1" Width="30%">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Observacion" FieldName="ObservPrueba" ShowInCustomizationForm="True"
                            VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Duración Días Aprox" FieldName="Duracion" ShowInCustomizationForm="True"
                            VisibleIndex="3" Width="10%">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Settings ShowFilterRow="True" ShowFooter="True" />
                    <SettingsText EmptyDataRow="No hay datos para mostrar" FilterBarClear="Limpiar" />
                    <SettingsDetail IsDetailGrid="True" ShowDetailRow="True" />
                    <Styles>
                        <FocusedRow BackColor="#5180BF">
                        </FocusedRow>
                    </Styles>
                    <Templates>
                        <DetailRow>
                            <div class="BaseForm wraptitle">
                                <div class="row">
                                    <div class="first">
                                        <div class="Titulo2">
                                            Materiales Requeridos
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
                                DataSourceID="SDSMaterialesRequeridos" KeyFieldName="MaterialesRequerido" OnBeforePerformDataSelect="ASPxGridView1_BeforePerformDataSelect"
                                Width="100%">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="MaterialesRequerido" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Cantidad" ReadOnly="True" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior AllowFocusedRow="True" />
                                    <SettingsPager PageSize="5">
                                        <Summary AllPagesText="Pag: {0} - {1} ({2} items)" Text="Pag {0} of {1} ({2} items)" />
                                    </SettingsPager>
                                    <Settings ShowFooter="True" />
                                    <SettingsDetail IsDetailGrid="True" />
                                    <Styles>
                                        <FocusedRow BackColor="#5180BF">
                                        </FocusedRow>
                                    </Styles>
                                </dx:ASPxGridView>
                            </DetailRow>
                    </Templates>
                </dx:ASPxGridView>
            </DetailRow>
        </Templates>
    </dx:ASPxGridView>
    </div>
    <asp:SqlDataSource ID="SDSSolicitudes" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
     SelectCommand="SELECT IdSolicPrueba, HeaderSolicPrueba, username, FechaRegistro, Autorizado FROM MPR_Solic_Pruebas WHERE (username = @username) AND (Enviada = 1) 
ORDER BY IdSolicPrueba DESC">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSDetSol" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT CAST(MPR_Det_Sol_Prueba.IdSolPrueba AS NVARCHAR) + '.' + CAST(MPR_Det_Sol_Prueba.IdPrueba AS NVARCHAR) AS IdDetalle, MPR_Prueba.NomPrueba, MPR_Det_Sol_Prueba.ObservPrueba, MPR_Prueba.Duracion,MPR_Prueba.IdPrueba  FROM MPR_Det_Sol_Prueba INNER JOIN MPR_Prueba ON MPR_Det_Sol_Prueba.IdPrueba = MPR_Prueba.IdPrueba INNER JOIN MPR_Solic_Pruebas ON MPR_Det_Sol_Prueba.IdSolPrueba = MPR_Solic_Pruebas.IdSolicPrueba WHERE (MPR_Det_Sol_Prueba.IdSolPrueba = @IdSolicPrueba)">
        <SelectParameters>
            <asp:SessionParameter Name="IdSolicPrueba" SessionField="IdSolicPrueba" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSMaterialesRequeridos" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT MINV_Materiales.NomMaterial AS MaterialesRequerido, CAST(MPR_Det_Mat_Prueba.Cantidad AS NVARCHAR) + ' ' + CAST(MINV_UnidadM.NomUnidadM AS NVARCHAR) AS Cantidad FROM MINV_UnidadM INNER JOIN MINV_Materiales ON MINV_UnidadM.IdUnidadM = MINV_Materiales.IdUnidad INNER JOIN MPR_Det_Mat_Prueba ON MINV_Materiales.IdMaterial = MPR_Det_Mat_Prueba.IdMaterial INNER JOIN MPR_Det_Sol_Prueba ON MPR_Det_Mat_Prueba.IdPrueba = MPR_Det_Sol_Prueba.IdPrueba WHERE (MPR_Det_Mat_Prueba.RequeridoPor = 0) AND (MPR_Det_Mat_Prueba.IdPrueba = @IdPrueba) GROUP BY MINV_Materiales.NomMaterial, MINV_UnidadM.NomUnidadM, MPR_Det_Mat_Prueba.Cantidad">
        <SelectParameters>
            <asp:SessionParameter Name="IdPrueba" SessionField="IdPrueba" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
<%--    <dx:ASPxPopupControl ID="FormPopup" runat="server" ClientInstanceName="FormPopup"
        AllowDragging="True" AllowResize="True" 
        HeaderText="Formulario de registro" Modal="True"
        PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" ShowFooter="True"
        FooterText="Formulario de registro" PopupVerticalAlign="WindowCenter" ClientIDMode="AutoID"
        Height="206px" Width="558px" CloseAction="CloseButton">
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
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Descripción de Solicitud">
                                    </dx:ASPxLabel>
                                    <dx:ASPxMemo ID="memoDesc" runat="server" ClientInstanceName="memoDesc" Height="63px"
                                        Width="467px" ValidationSettings-ValidationGroup="ControlGroup1" 
                                         NullText="Añada la descripción de su solicitud aquí">
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxMemo>
                                </div>
                                <div><i>*Agregue luego a su solicitud, los ensayes que requiere</i></div>
                            </div>
                                <div>
                                    <ul class="frmctrl">
                                        <li><a class="pure-button green-font" href="javascript:fn_SaveJS()" title="Guardar">
                                            <i class="fa fa-floppy-o"></i>Guardar y agreagar pruebas</a></li>
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
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Id">
                                    </dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtSubId" runat="server" Width="170px" ClientInstanceName="txtSubId"
                                        ClientEnabled="true" ReadOnly="True">
                                    </dx:ASPxTextBox>
                                    <dx:ASPxHiddenField ID="GridPrVal" runat="server" ClientInstanceName="GridPrVal">
                                    </dx:ASPxHiddenField>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Seleccione Prueba">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cmbPrueba" runat="server" ClientInstanceName="cmbPrueba" 
                                        Width="95%" DataSourceID="SDSPruebas" TextField="NomPrueba" 
                                        ValueField="IdPrueba" OnCallback="cmbPrueba_Callback">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Id" FieldName="IdPrueba" Width="10%" />
                                            <dx:ListBoxColumn Caption="Prueba" FieldName="NomPrueba" />
                                        </Columns>
                                     <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup2">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="SDSPruebas" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
                                        
                                        SelectCommand="SELECT IdPrueba, NomPrueba FROM MPR_Prueba WHERE (IdPrueba NOT IN (SELECT IdPrueba FROM MPR_Det_Sol_Prueba WHERE (IdSolPrueba = @IdSol)))">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="IdSol" SessionField="IdSol" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Observación adicional">
                                    </dx:ASPxLabel>
                                    <dx:ASPxMemo ID="memoOb" ClientInstanceName="memoOb" runat="server" Height="30px"
                                        Width="95%" 
                                        NullText="Puede añadir información adicional a cada prueba aquí">
                                         <NullTextStyle Font-Italic="True" ForeColor="Gray">
                                         </NullTextStyle>
                                         <ValidationSettings ValidationGroup="ControlGroup2">
                                        </ValidationSettings>
                                    </dx:ASPxMemo>
                                </div>
                            </div>
                            <div>
                                <ul class="frmctrl">
                                    <li><a class="pure-button green-font" href="javascript:fn_SubAddSol();" title="Guardar">
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
                            <strong>¿Seguro que quiere eliminar la solicitud?</strong></p>
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
    </dx:ASPxPopupControl>--%>

</asp:Content>
