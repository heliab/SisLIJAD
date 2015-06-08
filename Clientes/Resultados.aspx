<%@ Page Title="Resultados" Language="C#" MasterPageFile="~/Clientes/ClientesMASTER.Master" AutoEventWireup="true" CodeBehind="Resultados.aspx.cs" Inherits="SisLIJAD.Clientes.Resultados" %>

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

    function fn_IrCalculo(e) {
        SubGrid.GetRowValues(SubGrid.GetFocusedRowIndex(), 'IdDetalle;IdPrueba', fn_GetValues);
        function fn_GetValues(val) {
            switch (val[1]) {
                case 1:
                    window.location.href = "/Clientes/Results/PesoVolumetricoSecoSueltoRes.aspx?Id=" + val[0] + "&Sol=" + fn_GetIdPrValue() + "&Pr=" + val[1];
                    break;
                case 2: window.location.href = "/Clientes/Results/PesoVolumetricoSecoCompactoRes.aspx?Id=" + val[0] + "&Sol=" + fn_GetIdPrValue() + "&Pr=" + val[1];
                    break;
                case 3: window.location.href = "/Clientes/Results/HumedadAridosRes.aspx?Id=" + val[0] + "&Sol=" + fn_GetIdPrValue() + "&Pr=" + val[1];
                    break;
                case 4: window.location.href = "/Clientes/Results/HumedadAridosRes.aspx?Id=" + val[0] + "&Sol=" + fn_GetIdPrValue() + "&Pr=" + val[1];
                    break;
                case 5: window.location.href = "/Clientes/Results/GeFinoRes.aspx?Id=" + val[0] + "&Sol=" + fn_GetIdPrValue() + "&Pr=" + val[1];
                    break;
                case 6: window.location.href = "/Clientes/Results/HumedadAridosRes.aspx?Id=" + val[0] + "&Sol=" + fn_GetIdPrValue() + "&Pr=" + val[1];
                    break;
                case 7: window.location.href = "/Clientes/Results/PorcentAbsFinoRes.aspx?Id=" + val[0] + "&Sol=" + fn_GetIdPrValue() + "&Pr=" + val[1];
                    break;
                case 8: window.location.href = "/Clientes/Results/HumedadAridosRes.aspx?Id=" + val[0] + "&Sol=" + fn_GetIdPrValue() + "&Pr=" + val[1];
                    break;
                case 11: window.location.href = "/Clientes/Results/GEGruesoRes.aspx?Id=" + val[0] + "&Sol=" + fn_GetIdPrValue() + "&Pr=" + val[1];
                    break;
                case 12: window.location.href = "/Clientes/Results/GEssGruesoRes.aspx?Id=" + val[0] + "&Sol=" + fn_GetIdPrValue() + "&Pr=" + val[1];
                    break;
                case 13: window.location.href = "/Clientes/Results/GeaGruesoRes.aspx?Id=" + val[0] + "&Sol=" + fn_GetIdPrValue() + "&Pr=" + val[1];
                    break;
                case 6: window.location.href = "/Pruebas/?Id=" + val[0];
                    break;
                case 7: window.location.href = "/Pruebas/?Id=" + val[0];
                    break;
            }

        }
    }
    function fn_GetIdPrValue() {
        GridId = GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex());
        return GridId;
    }
 
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
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
            <dx:GridViewDataTextColumn FieldName="IdSolicPrueba" ReadOnly="True" VisibleIndex="0"
                Caption="Id Solicitud" Width="14%">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="HeaderSolicPrueba" VisibleIndex="1" 
                Caption="Descripcion Solicitud">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FechaRegistro" VisibleIndex="2" 
                Width="20%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Usuario" FieldName="username" VisibleIndex="3"
                Width="13%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn VisibleIndex="4" Width="0%">
                <ClearFilterButton Text="Limpiar" Visible="True">
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
                        <li><a class=" pure-button blue-font" href="javascript:fn_IrCalculo();" title="Nuevo">
                            <i class="fa fa-external-link"></i>Ver resultado</a></li>
                    </ul>
                </div>
                <dx:ASPxGridView ID="SubGrid" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
                    ClientInstanceName="SubGrid" DataSourceID="SDSDetSol" OnBeforePerformDataSelect="SubGrid_BeforePerformDataSelect"
                    Width="100%" KeyFieldName="IdDetalle">
                    <TotalSummary>
                        <dx:ASPxSummaryItem FieldName="Duracion" ShowInColumn="Duracion" SummaryType="Sum" />
                    </TotalSummary>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="IdDetalle" ReadOnly="True" VisibleIndex="0"
                            Width="9%">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NomPrueba" VisibleIndex="1" Caption="Nombre Ensaye"
                            Width="35%">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ObservPrueba" VisibleIndex="2" Caption="Observacion">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="IdPrueba" VisibleIndex="3"
                            Width="10%">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Duracion" VisibleIndex="4" Width="10%">
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
            </DetailRow>
        </Templates>
    </dx:ASPxGridView>
    </div>
    <asp:SqlDataSource ID="SDSSolicitudes" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"

        SelectCommand="SELECT IdSolicPrueba, HeaderSolicPrueba, FechaRegistro, username FROM MPR_Solic_Pruebas WHERE (username = @username) AND (Publicada = 1) ORDER BY IdSolicPrueba DESC">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSDetSol" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        
        SelectCommand="SELECT CAST(MPR_Det_Sol_Prueba.IdSolPrueba AS NVARCHAR) + '.' + CAST(MPR_Det_Sol_Prueba.IdPrueba AS NVARCHAR) AS IdDetalle, MPR_Prueba.NomPrueba, MPR_Det_Sol_Prueba.ObservPrueba, MPR_Det_Sol_Prueba.IdPrueba, MPR_Prueba.Duracion FROM MPR_Det_Sol_Prueba INNER JOIN MPR_Prueba ON MPR_Det_Sol_Prueba.IdPrueba = MPR_Prueba.IdPrueba INNER JOIN MPR_Solic_Pruebas ON MPR_Det_Sol_Prueba.IdSolPrueba = MPR_Solic_Pruebas.IdSolicPrueba WHERE (MPR_Det_Sol_Prueba.IdSolPrueba = @IdSolicPrueba)">
        <SelectParameters>
            <asp:SessionParameter Name="IdSolicPrueba" SessionField="IdSolicPrueba" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
