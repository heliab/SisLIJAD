<%@ Page Title="" Language="C#" MasterPageFile="~/MPR/MasterMPR.Master" AutoEventWireup="true" CodeBehind="SolicitudesPruebas.aspx.cs" Inherits="SisLIJAD.MPR.SolicitudesPruebas" %>

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
function fn_GetAutRow() {
    GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Autorizado', SetAut);
    function SetAut(Value) {
        if (Value == 1) {
            alert('El registro ya ha sido aprobado y no puede realizar cambios');
            return
        }
        else { fn_AutorizarJS(); }
    }
}

function fn_AutorizarJS() {
    if (confirm("¿Desea autorizar el registro?")) {
        HiddenV.Set('Nuevo', 7);
        HiddenV.Set('Autorizar', fn_GetIdValue());
        NewCallback.PerformCallback();
        fn_EndCallback();
    }
}


function fn_GetPayRow() {
    GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Pagado', SetPay);
    function SetPay(Value) {
        if (Value == 1) {
            alert('El registro ya ha sido pagado');
            return
        }
        else { fn_PayJS(); }
    }
}
function fn_PayJS() {
    if (confirm("¿Desea establecer el registro como pagado?")) {
        HiddenV.Set('Nuevo', 9);
        HiddenV.Set('Pagado', fn_GetIdValue());
        NewCallback.PerformCallback();
        fn_EndCallback();
    }
}

function fn_GetCancelRow() {
    GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Cancelada', SetCancel);
    function SetCancel(Value) {
        if (Value == 1) {
            alert('El registro ya ha sido cancelado y no puede realizar ningún cambio');
            return
        }
        else { fn_CancelSolJS(); }
    }
}

function fn_CancelSolJS() {
    if (confirm("¿Desea descartar la solicitud?")) {
        HiddenV.Set('Nuevo', 8);
        HiddenV.Set('Cancel', fn_GetIdValue());
        NewCallback.PerformCallback();
        fn_EndCallback();
    }
}

function fn_SubNewEntJS() {
    GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Cancelada', SetCancel);
    function SetCancel(Value) {
        if (Value == 1) {
            alert('El registro ya ha sido cancelado y no puede realizar ningún cambio');
            return
        }
        else 
        {
            fn_GetValOnHid();
            cmbTecnic.PerformCallback();
             fn_SubNew2JS();
        }
    }
     
 }
 function fn_SubEditEntJS() {
    GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Cancelada', SetCancel);
    function SetCancel(Value) {
        if (Value == 1) {
            alert('El registro ya ha sido cancelado y no puede realizar ningún cambio');
            return
        }
        else 
          {
             fn_GetValOnHid()
             cmbTecnic.PerformCallback();
             fn_SubEdit2JS();
            }
     }
       
}
function fn_SubDeleteEntJS() {
    GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Cancelada', SetCancel);
    function SetCancel(Value) {
        if (Value == 1) {
            alert('El registro ya ha sido cancelado y no puede realizar ningún cambio');
            return
        }
        else {
            fn_GetValOnHid();
            fn_SubDelete2JS();
            }
    }

}
function fn_GetValOnHid() {
    HiddenV.Set("SessionId", fn_GetIdValue());
}
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
    <div class="menumodulo">
        <dx:ASPxMenu ID="ASPxMenu1" runat="server" AutoSeparators="RootOnly" BorderBetweenItemAndSubMenu="HideRootOnly"
            ClientIDMode="AutoID" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange"
            GutterWidth="0px" ItemSpacing="1px" SeparatorHeight="1px" SeparatorWidth="1px"
            ShowPopOutImages="True" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"
            Font-Bold="True" Font-Size="Small" Width="100%" ForeColor="#333333">
            <SeparatorPaddings Padding="0px" />
            <Items>
                <dx:MenuItem Text="">
                </dx:MenuItem>
                <dx:MenuItem Text="Inicio" NavigateUrl="~/MINV/DefaultMINV.aspx">
                </dx:MenuItem>
                <dx:MenuItem BeginGroup="True" Text="Solicitudes">
                    <Items>
                        <dx:MenuItem Text="Solicitud Pendientes" 
                            NavigateUrl="~/MPR/SolicitudesPruebas.aspx">
                        </dx:MenuItem>
                        <dx:MenuItem Text="Solicitudes Aprobadas">
                        </dx:MenuItem>
                        <dx:MenuItem Text="Historial">
                        </dx:MenuItem>
                    </Items>
                </dx:MenuItem>
                <dx:MenuItem Text="Calculos">
                </dx:MenuItem>
                <dx:MenuItem Text="Resultados">
                </dx:MenuItem>
                <dx:MenuItem Text="Reportes">
                </dx:MenuItem>
                <dx:MenuItem Text="Mantenimiento">
                    <Items>
                        <dx:MenuItem Text="Pruebas" NavigateUrl="~/MPR/Pruebas.aspx">
                        </dx:MenuItem>
                        <dx:MenuItem NavigateUrl="~/MPR/EquiposMaquinarias.aspx" 
                            Text="Equipos y maquinarias">
                        </dx:MenuItem>
                        <dx:MenuItem Text="Tipos de Prueba" NavigateUrl="~/MPR/TiposPrueba.aspx">
                        </dx:MenuItem>
                    </Items>
                </dx:MenuItem>
                <dx:MenuItem Text="">
                </dx:MenuItem>
            </Items>
            <LoadingPanelImage Url="~/App_Themes/SoftOrange/Web/Loading.gif">
            </LoadingPanelImage>
            <ItemStyle DropDownButtonSpacing="8px" ImageSpacing="6px" PopOutImageSpacing="10px" />
            <SubMenuItemStyle>
                <HoverStyle BackColor="#0066CC" ForeColor="#CCCCCC">
                    <Border BorderColor="#0066CC" />
                </HoverStyle>
            </SubMenuItemStyle>
            <SubMenuStyle GutterWidth="0px" />
        </dx:ASPxMenu>
    </div>
    <div class="wrapctrl">
        <ul class="ctrlist">
            <%--<li><a class="pure-button blue-font" href="javascript:fn_NewJS();" title="Nuevo"><i
                class="fa fa-plus"></i>Nuevo</a></li>
            <li><a class="pure-button green-font" href="javascript:fn_EditJS();" title="Editar">
                <i class="fa fa-pencil-square-o"></i>Editar</a></li>
            <li><a class="pure-button red-font" href="javascript:fn_DeleteJS();" title="Borrar">
                <i class="fa fa-trash"></i>Borrar</a></li>--%>
            <li <%--id="leftmar-button"--%>><a class="pure-button green-font" href="javascript:fn_GetAutRow();"
                title="Aprobar"><i class="fa fa-check-square-o"></i>Autorizado</a></li>
            <li><a class="pure-button red-font" href="javascript:fn_GetCancelRow();" title="Aprobar">
                <i class="fa fa-ban"></i>Descartado</a></li>
            <li><a class="pure-button green-font" href="javascript:fn_GetPayRow();" title="Aprobar">
                <i class="fa fa-money"></i>Pagado</a></li>
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
        DataSourceID="SDSSolicitudes" KeyFieldName="IdSolicPrueba" SettingsBehavior-AllowFocusedRow="True"
        Width="100%" ClientInstanceName="GridPrincipal" 
        OnCustomCallback="GridPrincipal_CustomCallback">
        <ClientSideEvents DetailRowExpanding="function(s, e) {
	GridPrincipal.SetFocusedRowIndex(e.visibleIndex);
}" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IdSolicPrueba" ReadOnly="True" 
                VisibleIndex="0" Caption="Id Solicitud" Width="10%">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="HeaderSolicPrueba" VisibleIndex="1" 
                Caption="Descrip. Solicitud" Width="20%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FechaRegistro" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FechaAprobación" 
                VisibleIndex="3" Caption="Fecha Autorizacion/Deneg" Width="14%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Pagado" VisibleIndex="4" Width="8%">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="Autorizado" VisibleIndex="5" Width="8%">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="Cancelada" VisibleIndex="6" Width="8%">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn Caption="Usuario" FieldName="username" 
                VisibleIndex="7" Width="9%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn VisibleIndex="8" Width="0%">
                <ClearFilterButton Text="Limpiar" Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
        <SettingsPager AlwaysShowPager="True" PageSize="15">
            <Summary Text="Página {0} de {1} ({2} items)" />
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
                <dx:ASPxPageControl ID="PageDetallle" runat="server" ActiveTabIndex="1" 
                    ClientIDMode="AutoID" Width="100%">

                    <TabPages>
                        <dx:TabPage Text="Detalle Ensayes">
                            <ContentCollection>
                                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                 <%--<div class="wrapctrl">
                    <ul class="ctrlist">
                        <li><a class="pure-button blue-font" href="javascript:fn_SubNewSolJS();" title="Nuevo">
                            <i class="fa fa-plus"></i>Nuevo</a></li>
                        <li><a class="pure-button green-font" href="javascript:fn_SubEditJSSol();" title="Editar">
                            <i class="fa fa-pencil-square-o"></i>Editar</a></li>
                        <li><a class="pure-button red-font" href="javascript:fn_SubDeleteJS();" title="Borrar">
                            <i class="fa fa-trash"></i>Borrar</a></li>
                    </ul>
                </div>--%>
                <dx:ASPxGridView ID="SubGrid" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
                    ClientInstanceName="SubGrid" DataSourceID="SDSDetSol" OnBeforePerformDataSelect="SubGrid_BeforePerformDataSelect"
                    Width="100%" KeyFieldName="IdDetalle">
                    <TotalSummary>
                        <dx:ASPxSummaryItem FieldName="Duracion" ShowInColumn="Duracion" SummaryType="Sum" />
                    </TotalSummary>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="IdDetalle" ReadOnly="True" 
                            VisibleIndex="0" Width="10%">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NomPrueba" VisibleIndex="1" 
                            Caption="Nombre Ensaye" Width="25%">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ObservPrueba" VisibleIndex="2" 
                            Caption="Observacion">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Duracion" VisibleIndex="3" 
                            Caption="Duración Días Aprox" Width="10%">
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
                        <dx:TabPage Text="Asignación Técnicos">
                            <ContentCollection>
                                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                <div class="wrapctrl">
                    <ul class="ctrlist">
                        <li><a class="pure-button blue-font" href="javascript:fn_SubNewEntJS();" title="Nuevo">
                            <i class="fa fa-plus"></i>Nuevo</a></li>
                        <%--<li><a class="pure-button green-font" href="javascript:fn_SubEditEntJS();" title="Editar">
                            <i class="fa fa-pencil-square-o"></i>Editar</a></li>--%>
                        <li><a class="pure-button red-font" href="javascript:fn_SubDeleteEntJS();" title="Borrar">
                            <i class="fa fa-trash"></i>Borrar</a></li>
                    </ul>
                </div>
                                    <dx:ASPxGridView ID="SubGrid2" runat="server" ClientIDMode="AutoID" 
                                        ClientInstanceName="SubGrid2" Width="100%" AutoGenerateColumns="False" 
                                        DataSourceID="SDSTecnicos" KeyFieldName="IdEntidad">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="IdEntidad" ShowInCustomizationForm="True" 
                                                VisibleIndex="0" Caption="Id Personal" Width="10%">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="TécnicoEncargado" ReadOnly="True" 
                                                ShowInCustomizationForm="True" VisibleIndex="1" Width="40%">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Mensaje" ShowInCustomizationForm="True" 
                                                VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" />
                                        <Settings ShowFilterRow="True" ShowFooter="True" />
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
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SDSSolicitudes" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
          
        
         
         
         SelectCommand="SELECT IdSolicPrueba, HeaderSolicPrueba, FechaRegistro, FechaAprobación, Pagado, Autorizado, Cancelada, username FROM MPR_Solic_Pruebas WHERE (Enviada = 1) ORDER BY IdSolicPrueba DESC">
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="SDSDetSol" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
          
        
        SelectCommand="SELECT CAST(MPR_Det_Sol_Prueba.IdSolPrueba AS NVARCHAR) + '.' + CAST(MPR_Det_Sol_Prueba.IdPrueba AS NVARCHAR) AS IdDetalle, MPR_Prueba.NomPrueba, MPR_Det_Sol_Prueba.ObservPrueba, MPR_Prueba.Duracion FROM MPR_Det_Sol_Prueba INNER JOIN MPR_Prueba ON MPR_Det_Sol_Prueba.IdPrueba = MPR_Prueba.IdPrueba INNER JOIN MPR_Solic_Pruebas ON MPR_Det_Sol_Prueba.IdSolPrueba = MPR_Solic_Pruebas.IdSolicPrueba WHERE (MPR_Det_Sol_Prueba.IdSolPrueba = @IdSolicPrueba)">
         <SelectParameters>
             <asp:SessionParameter Name="IdSolicPrueba" SessionField="IdSolicPrueba" />
         </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSTecnicos" runat="server" 
         ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
         
         SelectCommand="SELECT MPR_Encarg_Prueba.IdEntidad, CAST(USER_Entidad.PNombre AS NVARCHAR) + ' ' + CAST(USER_Entidad.PApellido AS NVARCHAR) AS TécnicoEncargado, MPR_Encarg_Prueba.Mensaje FROM USER_Entidad INNER JOIN MPR_Encarg_Prueba ON USER_Entidad.IdEntidad = MPR_Encarg_Prueba.IdEntidad WHERE (USER_Entidad.IdTipo = 1) AND (MPR_Encarg_Prueba.IdSolicPrueba = @IdSolicPrueba)">
        <SelectParameters>
            <asp:SessionParameter Name="IdSolicPrueba" SessionField="IdSolicPrueba" />
        </SelectParameters>
     </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
 <dx:ASPxPopupControl ID="FormPopup" runat="server" ClientInstanceName="FormPopup"
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
                    Width="100%" OnCallback="SubFillingCallback2_Callback">
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
                                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Id">
                                    </dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtSubId2" runat="server" Width="170px" ClientInstanceName="txtSubId2"
                                        ClientEnabled="true" ReadOnly="True">
                                    </dx:ASPxTextBox>
                                   
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Seleccione técnico a asignar">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cmbTecnic" runat="server" ClientInstanceName="cmbTecnic" 
                                        Width="95%" DataSourceID="SDSEnt" OnCallback="cmbTecnic_Callback" 
                                        TextField="Técnico" ValueField="IdEntidad" >
                                        
                                        <Columns>
                                            <dx:ListBoxColumn Caption="ID" FieldName="IdEntidad" Width="10%" />
                                            <dx:ListBoxColumn Caption="Técnico" FieldName="Técnico" />
                                        </Columns>
                                        
                                     <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup3">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="SDSEnt" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
                                        
                                        
                                        SelectCommand="SELECT IdEntidad, CAST(PNombre AS NVARCHAR) + ' ' + CAST(PApellido AS NVARCHAR) AS Técnico FROM USER_Entidad WHERE (IdTipo = 1) AND (IdEntidad NOT IN (SELECT IdEntidad FROM MPR_Encarg_Prueba WHERE (IdSolicPrueba = @IdSol)))">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="IdSol" SessionField="IdSol" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Añadir mensaje">
                                    </dx:ASPxLabel>
                                    <dx:ASPxMemo ID="memoMen" runat="server" Height="60px" Width="95%" ClientInstanceName="memoMen"
                                        NullText="Puede añadir un mensaje al técnico acá" NullTextStyle-ForeColor="#999999">
                                        <NullTextStyle ForeColor="#999999">
                                        </NullTextStyle>
                                        <ValidationSettings  ValidationGroup="ControlGroup3">
                                            
                                        </ValidationSettings>
                                    </dx:ASPxMemo>
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
                            <strong>¿Seguro que quiere eliminar el registro?</strong></p>
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
