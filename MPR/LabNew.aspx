<%@ Page Title="" Language="C#" MasterPageFile="~/MPR/MPRMaster.Master" AutoEventWireup="true" CodeBehind="LabNew.aspx.cs" Inherits="SisLIJAD.MPR.Formulario_web1" %>

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

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonsContent" runat="server">
    <dx:ASPxButton ID="btnNew" runat="server" Text="New" ClientIDMode="AutoID">
        <ClientSideEvents Click="function(s, e) {
	fn_Nuevo();
}" />
    </dx:ASPxButton>
    <dx:ASPxButton ID="btnSelect" runat="server" Text="Editar" AutoPostBack="False" 
        ClientIDMode="AutoID" onclick="btnSelect_Click">
        <ClientSideEvents Click="function(s, e) {
	fn_Editar();
}" />
    </dx:ASPxButton>
    <dx:ASPxButton ID="bntDelete" runat="server" Text="Borrar">
    </dx:ASPxButton>
    <dx:ASPxButton ID="btnClear" runat="server" Text="Limpiar" AutoPostBack="False" 
        ClientIDMode="AutoID">
        <ClientSideEvents Click="function(s, e) {
	fn_CleanGroup(1);
}" />
    </dx:ASPxButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FormContent" runat="server">

                            <div>
                                <dx:ASPxLabel ID="lblId" runat="server" Text="Id">
                                </dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtId" runat="server" Width="170px" ClientInstanceName="txtId"
                                    ClientEnabled="true" ReadOnly="True">
                                </dx:ASPxTextBox>
                            </div>
                            <div>
                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Nombre laboratorio">
                                </dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtLab" runat="server" Width="170px" ClientInstanceName="txtLab"
                                    ValidationSettings-ValidationGroup="ControlGroup1">
                                    <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                        SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                        <RegularExpression ErrorText="Informacion Requerida" />
                                        <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>

                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Descripción de laboratorio">
                                 </dx:ASPxLabel>
                                <dx:ASPxMemo ID="mDesc" runat="server" Height="71px" Width="80%"
                                    ClientInstanceName="mDesc" 
                                    NullText="Puede añadir una descripción al laboratorio.">
                                    <ValidationSettings ValidationGroup="ControlGroup1">
                                    </ValidationSettings>
                                </dx:ASPxMemo>
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Responsable">
                                </dx:ASPxLabel>
                                <dx:ASPxComboBox ID="cmbEntidad" runat="server" ClientInstanceName="cmbEntidad" 
                                    DataSourceID="SDSEntidad" TextField="Responsable" ValueField="IdEntidad">
                                 <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                        SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                        <RegularExpression ErrorText="Informacion Requerida" />
                                        <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SDSEntidad" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
                                    SelectCommand="SELECT IdEntidad, CAST(PNombre AS NVARCHAR) + ' ' + CAST(PApellido AS NVARCHAR) AS Responsable FROM USER_Entidad"></asp:SqlDataSource>


                                                           </div>
                            <div>
                                <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" 
                                    AutoPostBack="True" onclick="btnGuardar_Click">

                                    <ClientSideEvents Click="function(s, e) {
                                    if (!ASPxClientEdit.ValidateGroup('ControlGroup1')){
                                        retutn;
                                        }
                                
                                    }" />

                                </dx:ASPxButton>
                                <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {
	                                    fn_ClosePopup(0);
                                    }" />
                                </dx:ASPxButton>
                             </div>
                       
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="GridContent" runat="server">


<dx:ASPxGridView ID="GridPrincipal" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
        DataSourceID="SDSLaboratorios" KeyFieldName="IdLaboratorio" SettingsBehavior-AllowFocusedRow="True"
        SettingsEditing-Mode="EditForm" Width="100%" 
        ClientInstanceName="GridPrincipal" AutoFocusNewRow="true">
        <ClientSideEvents FocusedRowChanged="function(s, e) {

GridPrincipal.Focus(GridPrincipal.focusedRowIndex);
  }" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IdLaboratorio" ReadOnly="True" 
                VisibleIndex="0" Caption="Id" Width="4%">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NomLaboratorio" 
                VisibleIndex="1" Caption="Nombre" Width="28%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DescLaboratorio" VisibleIndex="2" 
                Width="40%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Responsable" 
                VisibleIndex="3" ReadOnly="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn ShowSelectCheckbox="False" VisibleIndex="4" ClearFilterButton-Text="Limpiar" ClearFilterButton-Visible="True">
                <ClearFilterButton Text="Limpiar" Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
        </Columns>

<SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>

        <SettingsPager AlwaysShowPager="True" PageSize="15">
        </SettingsPager>

<SettingsEditing Mode="EditForm"></SettingsEditing>

      <Settings ShowHeaderFilterButton="True" ShowFilterRow="True" 
            ShowGroupPanel="True" />
        <SettingsText EmptyDataRow="No hay datos para mostrar" 
            GroupPanel="Arrastre las columnas aquí" Title="Estados de materiales" />
        <Styles>
            <FocusedRow BackColor="#990000">
            </FocusedRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SDSLaboratorios" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT MPR_Laboratorios.IdLaboratorio, MPR_Laboratorios.NomLaboratorio, MPR_Laboratorios.DescLaboratorio, CAST(USER_Entidad.PNombre AS NVARCHAR) + ' ' + CAST(USER_Entidad.PApellido AS NVARCHAR) AS Responsable FROM MPR_Laboratorios INNER JOIN USER_Entidad ON MPR_Laboratorios.IdEntidad = USER_Entidad.IdEntidad">
    </asp:SqlDataSource>
</asp:Content>
