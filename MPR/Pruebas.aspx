<%@ Page Title="" Language="C#" MasterPageFile="~/MINV/MasterMinv.Master" AutoEventWireup="true"
    CodeBehind="Pruebas.aspx.cs" Inherits="SisLIJAD.MPR.Pruebas" %>

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
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
    <dx:ASPxGridView ID="GridPrincipal" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
        DataSourceID="SDSPruebas" KeyFieldName="IdPrueba" SettingsBehavior-AllowFocusedRow="True"
        Width="100%" ClientInstanceName="GridPrincipal" OnCustomCallback="GridPrincipal_CustomCallback">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IdPrueba" ReadOnly="True" VisibleIndex="0"
                Width="7px" ShowInCustomizationForm="True" SortIndex="0" 
                SortOrder="Descending">
                <EditFormSettings Visible="False" />
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
        <Styles>
            <FocusedRow BackColor="#5180BF">
            </FocusedRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SDSPruebas" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        
        SelectCommand="SELECT MPR_Prueba.IdPrueba, MPR_Prueba.NomPrueba, MPR_Prueba.DescPrueba, MPR_Prueba.Duracion, MINV_Ubicaciones.DescUbicacion, 'C$ ' + CAST(MPR_Prueba.Precio AS NVARCHAR) AS Precio, MPR_Tipo_Prueba.NomTipo FROM MPR_Prueba INNER JOIN MPR_Tipo_Prueba ON MPR_Prueba.IdTipoPrueba = MPR_Tipo_Prueba.IdTipoPrueba INNER JOIN MINV_Ubicaciones ON MPR_Prueba.IdUbicacion = MINV_Ubicaciones.IdUbicacion">
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
