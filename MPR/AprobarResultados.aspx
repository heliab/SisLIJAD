<%@ Page Title="" Language="C#" MasterPageFile="~/MPR/MasterMPR.Master" AutoEventWireup="true" CodeBehind="AprobarResultados.aspx.cs" Inherits="SisLIJAD.MPR.AprobarResultados" %>

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
    function fn_PublishJS() {
        GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Publicada', fn_GetSend);
        function fn_GetSend(Value) {
            if (Value == 1) {
                HiddenV.Set('Enviado', 1);

            }
            else {
                HiddenV.Set('Enviado', 0);
            }
            HiddenV.Set('GridId', fn_GetIdPrValue());
            HiddenV.Set('Nuevo', 7);
            fn_GetMail();
            NewCallback.PerformCallback();
            fn_EndCallback();
            fn_EndCallback();
          } 
    }
    function fn_GetIdPrValue() {
        GridId = GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex());
        return GridId;
    }
    function fn_IrCalculo(e) {
        SubGrid.GetRowValues(SubGrid.GetFocusedRowIndex(), 'IdDetalle;IdPrueba', fn_GetValues);
        function fn_GetValues(val) {
            switch (val[1]) {
                case 1:
                    window.location.href = "/Pruebas/PesoVolumetricoSecoSuelto.aspx?Id=" + val[0] + "&Sol=" + fn_GetIdPrValue() + "&Pr=" + val[1];
                    break;
                case 2: window.location.href = "/Pruebas/PesoVolumetricoSecoCompacto.aspx?Id=" + val[0] + "&Sol=" + fn_GetIdPrValue() + "&Pr=" + val[1];
                    break;
                case 3: window.location.href = "/Pruebas/HumedadAridos.aspx?Id=" + val[0] + "&Sol=" + fn_GetIdPrValue() + "&Pr=" + val[1];
                    break;
                case 5: window.location.href = "/Pruebas/GeFino.aspx?Id=" + val[0] + "&Sol=" + fn_GetIdPrValue() + "&Pr=" + val[1];
                    break;
                case 11: window.location.href = "/Pruebas/GeGrueso.aspx?Id=" + val[0] + "&Sol=" + fn_GetIdPrValue() + "&Pr=" + val[1];
                    break;
                case 13: window.location.href = "/Pruebas/GeaGrueso.aspx?Id=" + val[0] + "&Sol=" + fn_GetIdPrValue() + "&Pr=" + val[1];
                    break;
                case 6: window.location.href = "/Pruebas/?Id=" + val[0];
                    break;
                case 7: window.location.href = "/Pruebas/?Id=" + val[0];
                    break;
            }

        }
    }
   
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
 <div class="wrapctrl">
        <ul class="ctrlist">
            <li><a class="pure-button green-font" href="javascript:fn_PublishJS();" title="Publicar">
                <i class="fa fa-check"></i>Publicar</a></li>
        </ul>
    </div>
 <dx:ASPxCallback ID="NewCallback" runat="server" ClientInstanceName="NewCallback"
        OnCallback="NewCallback_Callback" ClientIDMode="AutoID">
        <ClientSideEvents EndCallback="function(s, e) {
fn_EndCallback();
GridPrincipal.PerformCallback();
}" />
    </dx:ASPxCallback>
    <dx:ASPxHiddenField ID="HiddenV" runat="server" ClientInstanceName="HiddenV">
    </dx:ASPxHiddenField>
    <dx:ASPxTextBox ID="txtMail" runat="server" ClientInstanceName="txtMail" Width="170px"
        ClientVisible="False">
    </dx:ASPxTextBox>
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
                Width="10%">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="HeaderSolicPrueba" VisibleIndex="1" Caption="Descripción Solicitud"
                Width="35%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FechaAprobación" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FechaRegistro" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Usuario" FieldName="username" VisibleIndex="4"
                Width="13%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="5" Width="13%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Publicada" VisibleIndex="6" Width="8%">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewCommandColumn VisibleIndex="7" Width="0%">
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
                <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientIDMode="AutoID"
                    Width="100%">
                    <TabPages>
                        <dx:TabPage Text="Ensayes">
                            <ContentCollection>
                                <dx:ContentControl ID="ContentControl1" runat="server" SupportsDisabledAttribute="True">
                                    <div class="wrapctrl">
                                        <ul class="ctrlist">
                                            <li><a class=" pure-button blue-font" href="javascript:fn_IrCalculo();" title="Nuevo">
                                                <i class="fa fa-external-link"></i>Ir a cálculo</a></li>
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
                                                Width="10%">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NomPrueba" VisibleIndex="1" Caption="Ensaye">
                                                <Settings AutoFilterCondition="Contains" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="ObservPrueba" VisibleIndex="2" Width="40%">
                                                <Settings AutoFilterCondition="Contains" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="IdPrueba" VisibleIndex="3" Width="7%">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Duracion" ShowInCustomizationForm="True" VisibleIndex="4"
                                                Width="8%">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="5" Width="0%">
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
                        <dx:TabPage Text="Encargados">
                            <ContentCollection>
                                <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxGridView ID="SubGrid2" runat="server" ClientIDMode="AutoID" ClientInstanceName="SubGrid2"
                                        Width="100%" AutoGenerateColumns="False" DataSourceID="SDSTecnicos" KeyFieldName="IdEntidad"
                                        OnBeforePerformDataSelect="SubGrid2_BeforePerformDataSelect">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="IdEntidad" ShowInCustomizationForm="True" VisibleIndex="0"
                                                Caption="Id Personal" Width="10%">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="TécnicoEncargado" ReadOnly="True" ShowInCustomizationForm="True"
                                                VisibleIndex="1" Width="40%">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Mensaje" ShowInCustomizationForm="True" VisibleIndex="2">
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
    </div>
    <asp:SqlDataSource ID="SDSSolicitudes" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT DISTINCT MPR_Solic_Pruebas.IdSolicPrueba, MPR_Solic_Pruebas.HeaderSolicPrueba, MPR_Solic_Pruebas.FechaAprobación, MPR_Solic_Pruebas.FechaRegistro, MPR_Solic_Pruebas.username, MPR_Solic_Pruebas.Publicada, aspnet_Membership.Email FROM aspnet_Users INNER JOIN aspnet_Membership ON aspnet_Users.UserId = aspnet_Membership.UserId INNER JOIN MPR_Solic_Pruebas ON aspnet_Users.UserName = MPR_Solic_Pruebas.username WHERE (MPR_Solic_Pruebas.Autorizado = 1) AND (MPR_Solic_Pruebas.Pagado = 1) ORDER BY MPR_Solic_Pruebas.IdSolicPrueba DESC">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSTecnicos" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT MPR_Encarg_Prueba.IdEntidad, CAST(USER_Entidad.PNombre AS NVARCHAR) + ' ' + CAST(USER_Entidad.PApellido AS NVARCHAR) AS TécnicoEncargado, MPR_Encarg_Prueba.Mensaje FROM USER_Entidad INNER JOIN MPR_Encarg_Prueba ON USER_Entidad.IdEntidad = MPR_Encarg_Prueba.IdEntidad WHERE (USER_Entidad.IdTipo = 1) AND (MPR_Encarg_Prueba.IdSolicPrueba = @IdSolicPrueba)">
        <SelectParameters>
            <asp:SessionParameter Name="IdSolicPrueba" SessionField="IdSolicPrueba" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSDetSol" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT CAST(MPR_Det_Sol_Prueba.IdSolPrueba AS NVARCHAR) + '.' + CAST(MPR_Det_Sol_Prueba.IdPrueba AS NVARCHAR) AS IdDetalle, MPR_Prueba.NomPrueba, MPR_Det_Sol_Prueba.IdPrueba,MPR_Det_Sol_Prueba.ObservPrueba, MPR_Prueba.Duracion FROM MPR_Det_Sol_Prueba INNER JOIN MPR_Prueba ON MPR_Det_Sol_Prueba.IdPrueba = MPR_Prueba.IdPrueba INNER JOIN MPR_Solic_Pruebas ON MPR_Det_Sol_Prueba.IdSolPrueba = MPR_Solic_Pruebas.IdSolicPrueba WHERE (MPR_Det_Sol_Prueba.IdSolPrueba = @IdSolicPrueba)">
         <SelectParameters>
             <asp:SessionParameter Name="IdSolicPrueba" SessionField="IdSolicPrueba" />
         </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">


</asp:Content>
