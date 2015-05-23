<%@ Page Title="Solicitudes de Materiales" Language="C#" MasterPageFile="~/MINV/MasterMinv.Master" AutoEventWireup="true" CodeBehind="SolicitudesMateriales.aspx.cs" Inherits="SisLIJAD.MINV.SolicitudesMateriales" %>

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
    function fn_NewDetSolJS() {
        GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Enviado', SetEnv);
        function SetEnv(Value) {
            if (Value == 1) {
                //alert('El registro ya ha sido aprobado y no puede realizar cambios');
                fn_AprobMes(5);
                return
            }
            else {
                fn_GetValOnHid();
                cmbMateriales.PerformCallback();
                fn_SubNewJS();
            }
        }
    }
    function fn_EditSolJS() {
        GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Enviado', SetEnv);
        function SetEnv(Value) {
            if (Value == 1) {
                //alert('El registro ya ha sido enviado y no puede realizar cambios');
                fn_AprobMes(5);
                return
            }
            else {
                fn_GetValOnHid();
                cmbMateriales.PerformCallback();
                fn_SubEditJS();
            }
        }
    }
    function fn_EditSolicJS() {
        GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Enviado', SetEnv);
        function SetEnv(Value) {
            if (Value == 1) {
                //alert('El registro ya ha sido enviado y no puede realizar cambios');
                fn_AprobMes(5);
                return
            }
            else {
                //                fn_GetValOnHid();
                //                cmbMateriales.PerformCallback();
                fn_EditJS();
            }
        }
    }
    function fn_DeleteSolicJS() {
        GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Aprobado', SetAprob);
        function SetAprob(Value) {
            if (Value == 1) {
                //alert('El registro ya ha sido aprobado y no puede realizar cambios');
                fn_AprobMes(2);
                return
            }
            else {
                fn_DeleteJS();
            }
        }
    }
    function fn_DeleteDetSolJS() {
        GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Enviado', SetEnv);
        function SetEnv(Value) {
            if (Value == 1) {
                //alert('El registro ya ha sido enviado y no puede realizar cambios');
                fn_AprobMes(5);
                return
            }
            else {
                fn_SubDeleteJS();
            }
        }
    }
    function fn_GetSendJS() {
        GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Enviado', SetEnv);
        function SetEnv(Value) {
            if (Value == 1) {
                // alert('El registro ya ha sido enviado');
                fn_AprobMes(6);
                return
            }
            else {
                fn_SendJS();
            }
        }
    }
    function fn_SendJS() {
        //            if (confirm("¿Desea enviar la solicitud a los laboratorios?\nEl proceso no tiene retroceso!")) {
        //                HiddenV.Set('Nuevo', 6);
        //                HiddenV.Set('Enviar', fn_GetIdValue());
        //                NewCallback.PerformCallback();
        //                fn_EndCallback();
        //                alert('Su solicitud fue enviada con exito');
        //            }
        //        }
        swal({
            title: "Importante",
            text: "¿Desea enviar la solicitud a los laboratorios?\nEl proceso no tiene retroceso!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#2CA259",
            confirmButtonText: "Si, Enviar!",
            cancelButtonText: "Cancelar",
            closeOnConfirm: false
        },
            function () {
                HiddenV.Set('Nuevo', 6);
                HiddenV.Set('Enviar', fn_GetIdValue());
                NewCallback.PerformCallback();
                fn_EndCallback();
                swal("Enviada!", "Su solicitud fue enviada con exito.", "success");
            });
            fn_EndCallback();
    }

    function fn_SubAddSol() {
        fn_GetValOnHid();
        fn_SubAdd();
        cmbMateriales.PerformCallback();

    }
    function fn_GetValOnHid() {
        HiddenGridPr.Set("SessionId", GridIdx = GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex()));
    }
//    function fn_GetAprobJS(){
//     GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Aprobado', SetApr);
//        function SetApr(Value) {
//            if (Value == 1) {
//                HiddenV.Set('Estado', 1);
//            }
//            else {
//                HiddenV.Set('Estado', 0);
//            }
//            HiddenV.Set('Nuevo', 7);
//            HiddenV.Set('Aprobar', fn_GetIdValue());
//            NewCallback.PerformCallback();
//            fn_EndCallback();
//            swal('Estado de solicitud cambiado');
//        }
//    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
    <div class="wrapctrl">
        <ul class="ctrlist">
            <li><a class="pure-button blue-font" href="javascript:fn_NewJS();" title="Nuevo"><i
                class="fa fa-plus"></i>Agregar</a></li>
            <li><a class="pure-button green-font" href="javascript:fn_EditSolicJS();" title="Editar">
                <i class="fa fa-pencil-square-o"></i>Editar</a></li>
            <li><a class="pure-button red-font" href="javascript:fn_DeleteSolicJS();" title="Borrar">
                <i class="fa fa-trash"></i>Borrar</a></li>
            <li><a class="pure-button green-font" href="javascript:fn_GetSendJS();" title="Enviar solicitud">
                <i class="fa fa-paper-plane-o"></i>Enviar</a></li>
           <%-- <li><a class="pure-button green-font" href="javascript:fn_GetAprobJS();" title="Aprobar solicitud">
                <i class="fa fa-check"></i>Aprobar</a></li>--%>
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
<div class="grid">
  <dx:ASPxGridView ID="GridPrincipal" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
            DataSourceID="SDSPrestamos" KeyFieldName="IdPrestamo" SettingsBehavior-AllowFocusedRow="True"
            Width="100%" ClientInstanceName="GridPrincipal" OnCustomCallback="GridPrincipal_CustomCallback">
            <ClientSideEvents DetailRowExpanding="function(s, e) {
	GridPrincipal.SetFocusedRowIndex(e.visibleIndex);}" FocusedRowChanged="function(s, e) {
GridPrincipal.Focus(GridPrincipal.focusedRowIndex);
GridId = GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex())
}
" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="IdPrestamo" ReadOnly="True" 
                    VisibleIndex="0" ShowInCustomizationForm="True" Width="7%">
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Procedimiento" VisibleIndex="1" 
                    ShowInCustomizationForm="True" Width="40%">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaPrestamo" ReadOnly="True" 
                    VisibleIndex="2" ShowInCustomizationForm="True">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FechaDevolucion" ReadOnly="True" 
                    VisibleIndex="3" ShowInCustomizationForm="True">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="SolicitadoPor" VisibleIndex="4" 
                    ShowInCustomizationForm="True">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="Enviado" VisibleIndex="5" 
                    ShowInCustomizationForm="True" Width="10%">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="Aprobado" VisibleIndex="6" 
                    ShowInCustomizationForm="True" Width="10%">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewCommandColumn VisibleIndex="7" Width="0%">
                    <ClearFilterButton Text="Limpiar" Visible="True">
                    </ClearFilterButton>
                </dx:GridViewCommandColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
            <SettingsPager AlwaysShowPager="True" PageSize="15">
                <Summary AllPagesText="Paginas: {0} - {1} ({2} items)" Text="Pagina {0} of {1} ({2} items)" />
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
                    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" 
                        Width="100%">
                        <TabPages>
                            <dx:TabPage Text="Materiales">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl1" runat="server" SupportsDisabledAttribute="True">
                                        <div class="wrapctrl">
                                            <ul class="ctrlist">
                                                <li><a class="pure-button blue-font" href="javascript:fn_NewDetSolJS();" title="Nuevo">
                                                    <i class="fa fa-plus"></i>Agregar</a></li>
                                                <li><a class="pure-button green-font" href="javascript:fn_EditSolJS();" title="Editar">
                                                    <i class="fa fa-pencil-square-o"></i>Editar</a></li>
                                                <li><a class="pure-button red-font" href="javascript:fn_DeleteDetSolJS();" title="Borrar">
                                                    <i class="fa fa-trash"></i>Borrar</a></li>
                                            </ul>
                                        </div>
                                        <dx:ASPxGridView ID="SubGrid" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
                                            ClientInstanceName="SubGrid" DataSourceID="DetPrestamo" OnBeforePerformDataSelect="SubGrid_BeforePerformDataSelect"
                                            Width="100%" KeyFieldName="CodDetalle">
                                             <Columns>
                                                <dx:GridViewDataTextColumn FieldName="CodDetalle" ReadOnly="True" ShowInCustomizationForm="True"
                                                    VisibleIndex="0" Width="7%">
                                                    <Settings AutoFilterCondition="Contains" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="NomMaq" ShowInCustomizationForm="True"
                                                    VisibleIndex="1" Caption="Nombre Maquinaria">
                                                    <Settings AutoFilterCondition="Contains" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Modelo" ShowInCustomizationForm="True" 
                                                    VisibleIndex="2">
                                                    <Settings AutoFilterCondition="Contains" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Marca" ShowInCustomizationForm="True" 
                                                    VisibleIndex="3">
                                                    <Settings AutoFilterCondition="Contains" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Cantidad" ShowInCustomizationForm="True"
                                                    VisibleIndex="4" Width="10%">
                                                    <Settings AutoFilterCondition="Contains" />
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="5" 
                                                     Width="0%">
                                                     <ClearFilterButton Text="Limpiar" Visible="True">
                                                     </ClearFilterButton>
                                                 </dx:GridViewCommandColumn>
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
                            <dx:TabPage Text="D. Personales">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" ClientIDMode="AutoID" Width="100%"
                                            AutoGenerateColumns="False" DataSourceID="SDSDatosPersonales" 
                                            OnBeforePerformDataSelect="ASPxGridView1_BeforePerformDataSelect" 
                                            KeyFieldName="Cedula">
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Cedula" ShowInCustomizationForm="True" 
                                                    VisibleIndex="0" Width="20%">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="NombCompleto"
                                                    ShowInCustomizationForm="True" VisibleIndex="1" ReadOnly="True">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsPager Visible="False">
                                            </SettingsPager>
                                            <SettingsDetail IsDetailGrid="True" />
                                        </dx:ASPxGridView>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="D.Academicos">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl3" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
                                            DataSourceID="SDSDatosAcademicos" OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect"
                                            Width="100%" KeyFieldName="CodigoAsignatura">
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="CodigoAsignatura" ShowInCustomizationForm="True"
                                                    VisibleIndex="0" Width="20%">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Asignatura" ShowInCustomizationForm="True"
                                                    VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:ASPxGridView>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
                </DetailRow>
            </Templates>
        </dx:ASPxGridView>
    </div>
    <asp:SqlDataSource ID="SDSPrestamos" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT IdPrestamo, Procedimiento, CONVERT(Date,FechaPrestar)as FechaPrestamo, CONVERT(Date,FechaDevolver) as FechaDevolucion, SolicitadoPor, Enviado,Aprobado FROM MINV_Prestamos WHERE (SolicitadoPor = @username) ORDER BY IdPrestamo DESC">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DetPrestamo" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        
        SelectCommand="SELECT CAST(MINV_Det_Prestamo.IdDetPrest AS NVARCHAR) + '.' + CAST(MINV_Det_Prestamo.IdPrestamo AS NVARCHAR) + '.' + CAST(MINV_Det_Prestamo.IdEquipo AS NVARCHAR) AS CodDetalle, MINV_Det_Prestamo.Cantidad, MPR_EquipMaquin.NomMaq, MPR_EquipMaquin.Modelo, MPR_EquipMaquin.Marca FROM MINV_Prestamos INNER JOIN MINV_Det_Prestamo ON MINV_Prestamos.IdPrestamo = MINV_Det_Prestamo.IdPrestamo INNER JOIN MPR_EquipMaquin ON MINV_Det_Prestamo.IdEquipo = MPR_EquipMaquin.IdEquipo WHERE (MINV_Prestamos.IdPrestamo = @IdPrestamo)">
        <SelectParameters>
            <asp:SessionParameter Name="IdPrestamo" SessionField="IdPrestamo" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSDatosPersonales" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        
        SelectCommand="SELECT MINV_Prestamos.Cedula, USER_Entidad.PNombre + ' ' + USER_Entidad.SNombre + ' ' + USER_Entidad.PApellido + ' ' + USER_Entidad.SApellido AS NombCompleto FROM MINV_Prestamos INNER JOIN USER_Entidad ON MINV_Prestamos.SolicitadoPor = USER_Entidad.username WHERE (MINV_Prestamos.IdPrestamo = @IdPrestamo)">
        <SelectParameters>
            <asp:SessionParameter Name="IdPrestamo" SessionField="IdPrestamo" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSDatosAcademicos" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT CodigoAsignatura, Asignatura FROM MINV_Prestamos WHERE (IdPrestamo = @IdPrestamo)">
        <SelectParameters>
            <asp:SessionParameter Name="IdPrestamo" SessionField="IdPrestamo" />
        </SelectParameters>
    </asp:SqlDataSource>  

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
     <dx:ASPxPopupControl ID="FormPopup" runat="server" ClientInstanceName="FormPopup"
        AllowDragging="True" AllowResize="True" HeaderText="Formulario de registro" Modal="True"
        PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" ShowFooter="True"
        FooterText="Formulario de registro" PopupVerticalAlign="WindowCenter" ClientIDMode="AutoID"
        Height="449px" Width="428px" CloseAction="CloseButton">
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
                               
                                    <div class="row">
                                        <div class="first">
                                            <div>
                                                <dx:ASPxLabel ID="lblId" runat="server" Text="Id">
                                                </dx:ASPxLabel>
                                                <dx:ASPxTextBox ID="txtId" runat="server" Width="100px" ClientInstanceName="txtId"
                                                    ClientEnabled="true" ReadOnly="True">
                                                </dx:ASPxTextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                  
                                        <div>
                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Describa el procedimiento a realizar">
                                            </dx:ASPxLabel>
                                            <dx:ASPxMemo ID="mProc" runat="server" Height="71px" Width="100%" ClientInstanceName="mProc">
                                                <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" SetFocusOnError="True"
                                                    ValidationGroup="ControlGroup1" ErrorTextPosition="Bottom">
                                                    <RegularExpression ErrorText="Informacion Requerida" />
                                                    <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                                    <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                                    <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                                </ValidationSettings>
                                            </dx:ASPxMemo>
                                        </div>

                                     <div class="BaseForm">
                                    <div class="row">
                                        <div class="first">
                                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha que requerirá los materiales">
                                            </dx:ASPxLabel>
                                            <dx:ASPxDateEdit ID="deFeIni" runat="server" ClientInstanceName="deFeIni">
                                                <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" SetFocusOnError="True"
                                                    ValidationGroup="ControlGroup1" ErrorTextPosition="Bottom">
                                                    <RegularExpression ErrorText="Informacion Requerida" />
                                                    <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                                    <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                                    <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>
                                        </div>
                                        <div class="second">
                                            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Fecha de devolución">
                                            </dx:ASPxLabel>
                                            <dx:ASPxDateEdit ID="deFefin" runat="server" ClientInstanceName="deFefin">
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
                                        <div class="first">
                                            <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Código de la asignatura">
                                            </dx:ASPxLabel>
                                            <dx:ASPxTextBox ID="txtCod" runat="server" Width="170px" ClientSideName="txtCod">
                                                <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" SetFocusOnError="True"
                                                    ValidationGroup="ControlGroup1" ErrorTextPosition="Bottom">
                                                    <RegularExpression ErrorText="Informacion Requerida" />
                                                    <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                                    <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                                    <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </div>
                                        <div class="second">
                                            <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Nombre de la asignatura">
                                            </dx:ASPxLabel>
                                            <dx:ASPxTextBox ID="txtAsig" runat="server" Width="180px" ClientSideName="txtAsig">
                                                <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" SetFocusOnError="True"
                                                    ValidationGroup="ControlGroup1" ErrorTextPosition="Bottom">
                                                    <RegularExpression ErrorText="Informacion Requerida" />
                                                    <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                                    <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                                    <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="first">
                                            <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Ingrese Cedula Identidad">
                                            </dx:ASPxLabel>
                                            <dx:ASPxTextBox ID="txtCed" runat="server" Width="170px" ClientSideName="txtCed">
                                                <MaskSettings Mask="000-000000-000A" />
                                                <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" SetFocusOnError="True"
                                                    ValidationGroup="ControlGroup1" ErrorTextPosition="Bottom">
                                                    <RegularExpression ErrorText="Informacion Requerida" />
                                                    <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                                    <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                                    <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <ul class="frmctrl centerctrl">
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
                                        Width="95%" DataSourceID="SDSMateriales" TextField="Equipo" ValueField="Id"
                                        OnCallback="cmbMateriales_Callback">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Material" FieldName="Equipo" />
                                        </Columns>
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup2">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="SDSMateriales" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"                           
                                        SelectCommand="SELECT IdEquipo as Id, NomMaq as Equipo FROM MPR_EquipMaquin WHERE (IdEquipo NOT IN (SELECT IdEquipo FROM MINV_Det_Prestamo WHERE (IdPrestamo = @IdPrestamo))) AND (Prestamo = 1)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="IdPrestamo" SessionField="IdPrestamo" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Cantidad requerida">
                                    </dx:ASPxLabel>
                                    <dx:ASPxSpinEdit ID="sCant" ClientInstanceName="sCant" runat="server" Height="22px"
                                        Number="0" LargeIncrement="1" Increment="1" NullText="0" Width="114px" MaxValue="2147483647">
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
                                    <li><a class="pure-button button-green white-font" href="javascript:fn_SubAddSol();"
                                        title="Guardar"><i class="fa fa-plus-square"></i>Nuevo</a></li>
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