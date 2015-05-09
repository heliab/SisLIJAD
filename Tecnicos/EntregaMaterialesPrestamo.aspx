<%@ Page Title="Entrega de materiales" Language="C#" MasterPageFile="~/Tecnicos/TecnicosMASTER.Master" AutoEventWireup="true" CodeBehind="EntregaMaterialesPrestamo.aspx.cs" Inherits="SisLIJAD.Tecnicos.EntregaMaterialesPrestamo" %>
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
    function fn_GetEntregaJS() {
        SubGrid.GetRowValues(SubGrid.GetFocusedRowIndex(), 'Prestado', SetEntr);
        function SetEntr(Value) {
           if (Value == 1) {
            HiddenV.Set('Prestado', 1);
            
        }
           else {
               HiddenV.Set('Prestado', 0);
           }
           HiddenV.Set('Nuevo', 7);
           HiddenV.Set('SubGridId', SubGrid.GetRowKey(SubGrid.GetFocusedRowIndex()));
           NewCallback.PerformCallback();
           GridPrincipal.PerformCallback();
        }
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
            DataSourceID="SDSPrestamos" KeyFieldName="IdPrestamo" SettingsBehavior-AllowFocusedRow="True"
            Width="100%" ClientInstanceName="GridPrincipal" OnCustomCallback="GridPrincipal_CustomCallback">
            <ClientSideEvents DetailRowExpanding="function(s, e) {
	GridPrincipal.SetFocusedRowIndex(e.visibleIndex);
}" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="IdPrestamo" ReadOnly="True" VisibleIndex="0"
                    Width="9%" ToolTip="Cod Prestamo">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Procedimiento" VisibleIndex="1">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaPrestamo" ReadOnly="True" VisibleIndex="2"
                    Width="16%">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FechaDevolucion" ReadOnly="True" VisibleIndex="3"
                    Width="16%">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="SolicitadoPor" VisibleIndex="4" Width="12%">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FechaRegistro" VisibleIndex="5" Width="10%">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="Aprobado" VisibleIndex="6" Width="7%">
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
                    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="100%">
                        <TabPages>
                            <dx:TabPage Text="Materiales">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl1" runat="server" SupportsDisabledAttribute="True">
                                        <div class="wrapctrl">
                                            <ul class="ctrlist">
                                                <li><a class="pure-button green-font" href="javascript:fn_GetEntregaJS();" title="Aprobar solicitud">
                                                    <i class="fa fa-check-square"></i>Entregar/Recibir</a></li>
                                            </ul>
                                        </div>
                                        <dx:ASPxGridView ID="SubGrid" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
                                            ClientInstanceName="SubGrid" DataSourceID="DetPrestamo" OnBeforePerformDataSelect="SubGrid_BeforePerformDataSelect"
                                            Width="100%" KeyFieldName="CodDetalle">
                                            <TotalSummary>
                                                <dx:ASPxSummaryItem FieldName="Duracion" ShowInColumn="Duracion" SummaryType="Sum" />
                                            </TotalSummary>
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="CodDetalle" ReadOnly="True" ShowInCustomizationForm="True"
                                                    VisibleIndex="0" Width="12%">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="NomMaterial" ShowInCustomizationForm="True"
                                                    VisibleIndex="1" Caption="Material">
                                                    <Settings AutoFilterCondition="Contains" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="CodUCA" ShowInCustomizationForm="True" VisibleIndex="2"
                                                    Caption="Codigo UCA" Width="12%">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Marca" ShowInCustomizationForm="True" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Cantidad" ShowInCustomizationForm="True" VisibleIndex="4"
                                                    Width="12%">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataCheckColumn FieldName="Prestado" ShowInCustomizationForm="True" VisibleIndex="5"
                                                    Width="9%">
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="6" Width="0%">
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
                                            AutoGenerateColumns="False" DataSourceID="SDSDatosPersonales" OnBeforePerformDataSelect="ASPxGridView1_BeforePerformDataSelect"
                                            KeyFieldName="Cedula">
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Cedula" ShowInCustomizationForm="True" VisibleIndex="0"
                                                    Width="24%">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="NombCompleto" ShowInCustomizationForm="True"
                                                    VisibleIndex="1" Caption="Nombre Solicitante">
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
        SelectCommand="SELECT IdPrestamo, Procedimiento, CONVERT (Date, FechaPrestar) AS FechaPrestamo, CONVERT (Date, FechaDevolver) AS FechaDevolucion, SolicitadoPor, FechaRegistro, Aprobado FROM MINV_Prestamos WHERE (Aprobado = 1) ORDER BY IdPrestamo DESC">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DetPrestamo" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        
        SelectCommand="SELECT CAST(MINV_Det_Prestamo.IdDetPrest AS NVARCHAR) + '.' + CAST(MINV_Det_Prestamo.IdPrestamo AS NVARCHAR) + '.' + CAST(MINV_Det_Prestamo.IdMaterial AS NVARCHAR) AS CodDetalle, MINV_Materiales.NomMaterial, MINV_Materiales.CodUCA, MINV_Materiales.Marca, MINV_Det_Prestamo.Cantidad, MINV_Det_Prestamo.Prestado FROM MINV_Prestamos INNER JOIN MINV_Det_Prestamo ON MINV_Prestamos.IdPrestamo = MINV_Det_Prestamo.IdPrestamo INNER JOIN MINV_Materiales ON MINV_Det_Prestamo.IdMaterial = MINV_Materiales.IdMaterial WHERE (MINV_Prestamos.IdPrestamo = @IdPrestamo)">
        <SelectParameters>
            <asp:SessionParameter Name="IdPrestamo" SessionField="IdPrestamo" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSDatosPersonales" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        
    SelectCommand="SELECT NombCompleto, Cedula FROM MINV_Prestamos WHERE (IdPrestamo = @IdPrestamo)">
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
<%--C R E A D O P O R H A N I E L L O P E Z--%>
</asp:Content>
