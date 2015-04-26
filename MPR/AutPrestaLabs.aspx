<%@ Page Title="Autorizar Prestamo Laboratorios" Language="C#" MasterPageFile="~/MPR/MasterMPR.Master" AutoEventWireup="true"
    CodeBehind="AutPrestaLabs.aspx.cs" Inherits="SisLIJAD.MPR.AutPrestaLabs" %>

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
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function fn_GetAprobJS() {
            fn_GetMail();
            GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Aprobada', SetApr);
            function SetApr(Value) {
                if (Value == 1) {
                    alert('El registro ya ha sido Aprobado');
                    return
                }
                else {
                   
                    HiddenV.Set('Nuevo', 7);
                    HiddenV.Set('Id', GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex()));
                    NewCallback.PerformCallback();
                    fn_EndCallback();
                }
            }
        }
        function fn_GetCancelJS() {
            fn_GetMail();
            GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Cancelada', SetCan);
            function SetCan(Value) {
                if (Value == 1) {
                    alert('La solicitud ya ha sido cancelada');
                    return
                }
                else {
                   
                    HiddenV.Set('Nuevo', 8);
                    HiddenV.Set('Id', GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex()));
                   NewCallback.PerformCallback();
                    fn_EndCallback();
                }
            }
        }
        function mm() {
            fn_GetMail();
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
    <div class="wrapctrl">
        <ul class="ctrlist">
            <li><a class="pure-button green-font" href="javascript:fn_GetAprobJS();" title="Aprobar solicitud">
                <i class="fa fa-check"></i>Aprobar</a></li>
            <li><a class="pure-button red-font" href="javascript:fn_GetCancelJS();" title="Cancelar solicitud">
                <i class="fa fa-ban"></i>Denegar</a></li>
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
    <dx:ASPxTextBox ID="txtMail" runat="server" ClientInstanceName="txtMail" 
        Width="170px" ClientVisible="False">
    </dx:ASPxTextBox>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
<div class="grid">
    <dx:ASPxGridView ID="GridPrincipal" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
        DataSourceID="SDSPrestamos" KeyFieldName="IdPrestLab" SettingsBehavior-AllowFocusedRow="True"
        Width="100%" ClientInstanceName="GridPrincipal" OnCustomCallback="GridPrincipal_CustomCallback">
        <ClientSideEvents DetailRowExpanding="function(s, e) {
	GridPrincipal.SetFocusedRowIndex(e.visibleIndex);
}" />
        <ClientSideEvents DetailRowExpanding="function(s, e) {
	GridPrincipal.SetFocusedRowIndex(e.visibleIndex);
}"></ClientSideEvents>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IdPrestLab" ReadOnly="True" VisibleIndex="0"
                Caption="Id" Width="5%">
                <Settings AutoFilterCondition="Contains" />
                <EditFormSettings Visible="False" />
                <Settings AutoFilterCondition="Contains"></Settings>
                <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Procedimiento" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
                <Settings AutoFilterCondition="Contains"></Settings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DescUbicacion" VisibleIndex="2" Caption="Laboratorio"
                Width="12%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="username" VisibleIndex="3" Width="8%">
                <Settings AutoFilterCondition="Contains" />
                <Settings AutoFilterCondition="Contains"></Settings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="4" Width="8%">
                <Settings AutoFilterCondition="Contains" />
                <Settings AutoFilterCondition="Contains" />
                <Settings AutoFilterCondition="Contains"></Settings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Registrado" ReadOnly="True" VisibleIndex="5"
                Width="8%">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="Requerido" ReadOnly="True" VisibleIndex="6"
                Width="8%">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Horaini" VisibleIndex="7" Caption="H.Inicio"
                Width="7%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="HoraFin" VisibleIndex="8" Caption="H.Fin" Width="6%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Aprobada" VisibleIndex="9" Width="7%">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="Cancelada" VisibleIndex="10" Width="7%">
            </dx:GridViewDataCheckColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
        <SettingsPager AlwaysShowPager="True" PageSize="7">
            <Summary AllPagesText="Paginas: {0} - {1} ({2} items)" Text="Pagina {0} of {1} ({2} items)" />
            <Summary AllPagesText="Paginas: {0} - {1} ({2} items)" Text="Pagina {0} of {1} ({2} items)">
            </Summary>
        </SettingsPager>
        <Settings ShowHeaderFilterButton="True" ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsText EmptyDataRow="No hay datos para mostrar" GroupPanel="Arrastre las columnas aquí" />
        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
        <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" ShowGroupPanel="True">
        </Settings>
        <SettingsText GroupPanel="Arrastre las columnas aqu&#237;" EmptyDataRow="No hay datos para mostrar">
        </SettingsText>
        <SettingsDetail ShowDetailRow="True" AllowOnlyOneMasterRowExpanded="True"></SettingsDetail>
        <Styles>
            <FocusedRow BackColor="#5180BF">
            </FocusedRow>
        </Styles>
        <Templates>
            <DetailRow>
                <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="100%">
                    <TabPages>
                        <dx:TabPage Text="D. Personales">
                            <ContentCollection>
                                <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" ClientIDMode="AutoID" Width="100%"
                                        AutoGenerateColumns="False" DataSourceID="SDSDatosPersonales" OnBeforePerformDataSelect="ASPxGridView1_BeforePerformDataSelect">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Cedula" ShowInCustomizationForm="True" VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nombre" ShowInCustomizationForm="True" VisibleIndex="1">
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
                                        Width="100%">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="CodAsignatura" ShowInCustomizationForm="True"
                                                VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Asignatura" ShowInCustomizationForm="True"
                                                VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NoGrupos" ShowInCustomizationForm="True" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NoEstudiantesGrup" ShowInCustomizationForm="True"
                                                VisibleIndex="3">
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
    </dx:ASPxGridView></div>
    <asp:SqlDataSource ID="SDSPrestamos" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT MPR_Solic_Lab.IdPrestLab, MPR_Solic_Lab.Procedimiento, MPR_Solic_Lab.username, CONVERT (Date, MPR_Solic_Lab.FechaReg) AS Registrado, CONVERT (DATE, MPR_Solic_Lab.FechaReq) AS Requerido, MPR_Solic_Lab.Horaini, MPR_Solic_Lab.HoraFin, MINV_Ubicaciones.DescUbicacion, MPR_Solic_Lab.Aprobada, MPR_Solic_Lab.Cancelada, aspnet_Membership.Email FROM aspnet_Users INNER JOIN aspnet_Membership ON aspnet_Users.UserId = aspnet_Membership.UserId INNER JOIN MPR_Solic_Lab INNER JOIN MINV_Ubicaciones ON MPR_Solic_Lab.IdUbicacion = MINV_Ubicaciones.IdUbicacion ON aspnet_Users.UserName = MPR_Solic_Lab.username WHERE (MPR_Solic_Lab.Enviada = 1) ORDER BY MPR_Solic_Lab.IdPrestLab DESC">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSDatosPersonales" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT Cedula, Nombre FROM MPR_Solic_Lab WHERE (IdPrestLab = @IdPrestLab)">
        <SelectParameters>
            <asp:SessionParameter Name="IdPrestLab" SessionField="IdPrestLab" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSDatosAcademicos" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT CodAsignatura, Asignatura, NoGrupos, NoEstudiantesGrup FROM MPR_Solic_Lab WHERE (IdPrestLab = @IdPrestLab)">
        <SelectParameters>
            <asp:SessionParameter Name="IdPrestLab" SessionField="IdPrestLab" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
