<%@ Page Title="Solicitud Laboratorios" Language="C#" MasterPageFile="~/PEUCA/MasterPREUCA.Master" AutoEventWireup="true" CodeBehind="SolicitudLaboratorios.aspx.cs" Inherits="SisLIJAD.PEUCA.SolicitudLaboratorios"%>

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
    function fn_EditSolJS() {
        GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Enviada', SetEnv);
        function SetEnv(Value) {
            if (Value == 1) {
                alert('El registro ya ha sido enviado y no puede realizar cambios');
                return
            }
            else {
                fn_EditJS();
                fn_EndCallback();
            }
        } 
    }
    function fn_DeleteSolJS() {
        GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Enviada', SetEnv);
        function SetEnv(Value) {
            if (Value == 1) {
                alert('La solicitud ya ha sido enviada y no puede realizar cambios');
                return
            }
            else {
                fn_DeleteJS();
                fn_EndCallback();
            }
        } 
    }
    function fn_GetSendJS() {
        GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Enviada', SetEnv);
        function SetEnv(Value) {
            if (Value == 1) {
                alert('El registro ya ha sido aprobado y no puede realizar cambios');
                return
            }
            else {
                if (confirm("Desear enviar la solicitud?.")) {
                    fn_SendSolJS();
                } 
            }
        } 
    }

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
    <div class="wrapctrl">
        <ul class="ctrlist">
            <li><a class="pure-button blue-font" href="javascript:fn_NewJS();" title="Nuevo"><i
                class="fa fa-plus"></i>Agregar</a></li>
            <li><a class="pure-button green-font" href="javascript:fn_EditSolJS();" title="Editar">
                <i class="fa fa-pencil-square-o"></i>Editar</a></li>
            <li><a class="pure-button red-font" href="javascript:fn_DeleteSolJS();" title="Borrar">
                <i class="fa fa-trash"></i>Borrar</a></li>
            <li><a class="pure-button green-font" href="javascript:fn_GetSendJS();" title="Enviar solicitud">
                <i class="fa fa-paper-plane-o"></i>Enviar</a></li>
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
        DataSourceID="SDSPrestamos" KeyFieldName="IdPrestLab" SettingsBehavior-AllowFocusedRow="True"
        Width="100%" ClientInstanceName="GridPrincipal" 
        OnCustomCallback="GridPrincipal_CustomCallback">
        <ClientSideEvents DetailRowExpanding="function(s, e) {
	GridPrincipal.SetFocusedRowIndex(e.visibleIndex);
}" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IdPrestLab" ReadOnly="True" 
                VisibleIndex="0" Caption="Id Prestamo" Width="7%">
                <Settings AutoFilterCondition="Contains" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Procedimiento" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="username" VisibleIndex="2" 
                Caption="Usuario">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Registrado" ReadOnly="True" 
                VisibleIndex="3" Width="10%">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="Requerido" ReadOnly="True" 
                VisibleIndex="4" Width="10%">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Horaini" VisibleIndex="5" 
                Caption="H.Inicio" Width="6%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="HoraFin" VisibleIndex="6" Caption="H.Fin" 
                Width="6%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DescUbicacion" VisibleIndex="7" 
                Caption="Laboratorio" Width="10%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Enviada" VisibleIndex="8" Width="7%">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="Aprobada" VisibleIndex="9" Width="7%">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="Cancelada" VisibleIndex="10" Width="7%">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewCommandColumn VisibleIndex="11" Width="0%">
                <ClearFilterButton Text="Limpiar" Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
        <SettingsPager AlwaysShowPager="True" PageSize="7">
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
                <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" 
                    Width="100%">
                    <TabPages>
                         <dx:TabPage Text="D. Personales">
                            <ContentCollection>
                                <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" ClientIDMode="AutoID" 
                                        Width="100%" AutoGenerateColumns="False" DataSourceID="SDSDatosPersonales" 
                                        OnBeforePerformDataSelect="ASPxGridView1_BeforePerformDataSelect">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Cedula" ShowInCustomizationForm="True" 
                                                VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn 
                                                FieldName="Nombre" ShowInCustomizationForm="True" VisibleIndex="1">
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

                                    <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" 
                                        ClientIDMode="AutoID" DataSourceID="SDSDatosAcademicos" 
                                        OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect" Width="100%">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="CodAsignatura" 
                                                ShowInCustomizationForm="True" VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Asignatura" 
                                                ShowInCustomizationForm="True" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NoGrupos" ShowInCustomizationForm="True" 
                                                VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NoEstudiantesGrup" 
                                                ShowInCustomizationForm="True" VisibleIndex="3">
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
        SelectCommand="SELECT MPR_Solic_Lab.IdPrestLab, MPR_Solic_Lab.Procedimiento, MPR_Solic_Lab.username, CONVERT (Date, MPR_Solic_Lab.FechaReg) AS Registrado, CONVERT (DATE, MPR_Solic_Lab.FechaReq) AS Requerido, MPR_Solic_Lab.Horaini, MPR_Solic_Lab.HoraFin, MINV_Ubicaciones.DescUbicacion, MPR_Solic_Lab.Enviada, MPR_Solic_Lab.Aprobada, MPR_Solic_Lab.Cancelada FROM MPR_Solic_Lab INNER JOIN MINV_Ubicaciones ON MPR_Solic_Lab.IdUbicacion = MINV_Ubicaciones.IdUbicacion WHERE (MPR_Solic_Lab.username = @username) ORDER BY MPR_Solic_Lab.IdPrestLab DESC">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSDatosPersonales" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        
        SelectCommand="SELECT USER_Entidad.PNombre + ' ' + USER_Entidad.SNombre + ' ' + USER_Entidad.PApellido + ' ' + USER_Entidad.SApellido AS Nombre, MPR_Solic_Lab.Cedula FROM MPR_Solic_Lab INNER JOIN USER_Entidad ON MPR_Solic_Lab.username = USER_Entidad.username WHERE (MPR_Solic_Lab.IdPrestLab = @IdPrestLab)">
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

    <dx:ASPxPopupControl ID="FormPopup" runat="server" ClientInstanceName="FormPopup"
        AllowDragging="True" AllowResize="True" 
        HeaderText="Formulario de registro" Modal="True"
        PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" ShowFooter="True"
        FooterText="Formulario de registro" PopupVerticalAlign="WindowCenter" ClientIDMode="AutoID"
        Height="430px" Width="380px" CloseAction="CloseButton">
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
                                            <dx:ASPxMemo ID="mProc" runat="server" Height="68px" Width="90%" 
                                                ClientInstanceName="mProc">
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
                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Cod. Asignatura">
                                        </dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtCodAsig" runat="server" Width="170px" 
                                            ClientInstanceName="txtCodAsig">
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
                                        <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Nombre de la asignatura">
                                        </dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtAsig" runat="server" Width="170px" ClientInstanceName="txtAsig">
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
                                        <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Seleccione el laboratorio">
                                        </dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cmbLabs" runat="server" ClientInstanceName="cmbLabs" 
                                            DataSourceID="SDSLabs" TextField="Laboratotio" ValueField="IdLaboratorio" 
                                            Width="170px">
                                            <Columns>
                                                <dx:ListBoxColumn Caption="Id" FieldName="IdLaboratorio" />
                                                <dx:ListBoxColumn Caption="Laboratorio" FieldName="Laboratotio" />
                                            </Columns>
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" SetFocusOnError="True"
                                                    ValidationGroup="ControlGroup1" ErrorTextPosition="Bottom">
                                                    <RegularExpression ErrorText="Informacion Requerida" />
                                                    <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                                    <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                                    <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                                </ValidationSettings>
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="SDSLabs" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
                                            SelectCommand="SELECT IdUbicacion AS IdLaboratorio, DescUbicacion AS Laboratotio FROM MINV_Ubicaciones WHERE (IdTipoUb = 1)"></asp:SqlDataSource>
                                    </div>
                                        <div class="second">
                                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha que requeriere el laboratorio">
                                            </dx:ASPxLabel>
                                            <dx:ASPxDateEdit ID="deFeReq" runat="server" ClientInstanceName="deFeReq" 
                                                Width="170px">
                                                <CalendarProperties TodayButtonText="Hoy">
                                                </CalendarProperties>
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
                                          <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Hora de inicio de la actividad">
                                          </dx:ASPxLabel>
                                      <dx:ASPxTimeEdit ID="teHora" runat="server" ClientIDMode="AutoID" ClientInstanceName="teHora"
                                        ValidationSettings-ValidationGroup="ControlGroup1" Height="0px" Width="170px">
                                        <ValidationSettings ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxTimeEdit>
                                      </div>
                                      <div class="second">
                                          <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Hora fin">
                                          </dx:ASPxLabel>
                                      <dx:ASPxTimeEdit ID="teHoraFin" runat="server" ClientIDMode="AutoID" ClientInstanceName="teHoraFin"
                                        ValidationSettings-ValidationGroup="ControlGroup1" Height="0px" Width="170px">
                                        <ValidationSettings ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxTimeEdit>
                                      </div>
                                      </div>

                                      <div class="row">
                                      <div class="first">
                                          <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="No Grupos">
                                          </dx:ASPxLabel>
                                          <dx:ASPxSpinEdit ID="sGrup" runat="server" Number="0" LargeIncrement="1"
                                                Increment="1" NullText="0" Width="170px" MaxValue="2147483647" 
                                              ClientInstanceName="sGrup">
                                           <ValidationSettings ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                          </dx:ASPxSpinEdit>
                                      </div>
                                      <div class="second">
                                          <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Estudiantes por grupo">
                                          </dx:ASPxLabel>
                                          <dx:ASPxSpinEdit ID="seEstGrup" runat="server" Number="0" LargeIncrement="1"
                                                Increment="1" NullText="0" Width="170px" MaxValue="2147483647" 
                                              ClientInstanceName="seEstGrup">
                                           <ValidationSettings ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                            <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                            <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                          </dx:ASPxSpinEdit>
                                      </div>
                                      </div>

                                      <div class="row">
<div class="first">
                                            <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Ingrese Cedula Identidad">
                                            </dx:ASPxLabel>
                                            <dx:ASPxTextBox ID="txtCed" runat="server" Width="170px" ClientSideName="txtCed">
                                                <MaskSettings Mask="000-000000-0000" />
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
