<%@ Page Title="" Language="C#" MasterPageFile="~/MINV/MasterMinv.Master" AutoEventWireup="true" CodeBehind="Ubicaciones.aspx.cs" Inherits="SisLIJAD.MINV.Ubicaciones" %>

<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxNavBar" TagPrefix="dx" %>

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
    <script type="text/javascript">
        function fn_NewSubUbica() {
            HiddenV.Set("Session", fn_GetIdValue());
            cmbUbic.PerformCallback();
            fn_SubNewJS();
        }

       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
    <dx:ASPxMenu ID="ASPxMenu1" runat="server" AutoSeparators="RootOnly" 
        BorderBetweenItemAndSubMenu="HideRootOnly" ClientIDMode="AutoID" 
        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        GutterWidth="0px" ItemSpacing="1px" 
        SeparatorHeight="1px" SeparatorWidth="1px" ShowPopOutImages="True" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
        Font-Bold="True" Font-Size="Small" Width="100%" >
        <SeparatorPaddings Padding="0px" />
        <Items>
<dx:MenuItem Text=""></dx:MenuItem>
            <dx:MenuItem Text="Inicio" NavigateUrl="~/MINV/Default1.aspx">
            </dx:MenuItem>
            <dx:MenuItem BeginGroup="True" Text="Solicitudes">
                <Items>
                    <dx:MenuItem Text="Prestamos">
                    </dx:MenuItem>
                </Items>
            </dx:MenuItem>
            <dx:MenuItem Text="Registros">
                <Items>
                    <dx:MenuItem Text="Entradas">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Salidas">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Transferencias">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Ajustes Inventario">
                    </dx:MenuItem>
                </Items>
            </dx:MenuItem>
            <dx:MenuItem Text="Reportes">
            </dx:MenuItem>
            <dx:MenuItem Text="Mantenimiento">
                <Items>
                    <dx:MenuItem Text="Tipo Ubicaciones">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Ubicaciones Especificas">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Estado de Materiales">
                    </dx:MenuItem>
                </Items>
            </dx:MenuItem>
            <dx:MenuItem Text="">
            </dx:MenuItem>
        </Items>
        <LoadingPanelImage Url="~/App_Themes/SoftOrange/Web/Loading.gif">
        </LoadingPanelImage>
        <ItemStyle DropDownButtonSpacing="8px" ImageSpacing="6px" 
            PopOutImageSpacing="10px" />
        <SubMenuItemStyle>
            <HoverStyle BackColor="#0066CC">
                <Border BorderColor="#0066CC" />
            </HoverStyle>
        </SubMenuItemStyle>
        <SubMenuStyle GutterWidth="0px" />
    </dx:ASPxMenu>
<div class="wrapctrl">
        <ul class="ctrlist">
            <li><a class="pure-button blue-font" href="javascript:fn_NewJS();" title="Nuevo"><i class="fa fa-plus">
            </i> Nuevo</a></li>
            <li><a class="pure-button green-font" href="javascript:fn_EditJS();" title="Editar"><i class="fa fa-pencil-square-o">
            </i> Editar</a></li>
            <li><a class="pure-button red-font" href="javascript:fn_DeleteJS();" title="Borrar">
                <i class="fa fa-trash"></i> Borrar</a></li>
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
        DataSourceID="SDSUbic" SettingsBehavior-AllowFocusedRow="True" KeyFieldName="IdUbicacion"
        SettingsEditing-Mode="EditForm" Width="100%" ClientInstanceName="GridPrincipal"
        OnCustomCallback="GridPrincipal_CustomCallback" Font-Size="Small">
        <ClientSideEvents FocusedRowChanged="function(s, e) {
GridPrincipal.CollapseAllDetailRows();
GridPrincipal.Focus(GridPrincipal.focusedRowIndex);
}" DetailRowExpanding="function(s, e) {
	GridPrincipal.SetFocusedRowIndex(e.visibleIndex);
}" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IdUbicacion" ReadOnly="True" 
                VisibleIndex="0" Caption="Id" Width="10%" SortIndex="0" 
                SortOrder="Descending">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DescUbicacion" VisibleIndex="1" Caption="Descripcion">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DescTipoUB" VisibleIndex="2" Caption="Tipo Ubicacion" Width="22%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewCommandColumn VisibleIndex="2" Width="0%">
                <ClearFilterButton Text="Limpiar" Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsPager AlwaysShowPager="True" PageSize="15">
        </SettingsPager>

<SettingsEditing Mode="EditForm"></SettingsEditing>

        <Settings ShowHeaderFilterButton="True" ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsText EmptyDataRow="No hay datos para mostrar" GroupPanel="Arrastre las columnas aquí"/>
        <SettingsDetail ShowDetailRow="True" />
        <Styles>
            <FocusedRow BackColor="#5180BF">
            </FocusedRow>
        </Styles>
        <Templates>
            <DetailRow>
            <div>
                <ul class="frmctrl">
                                    <li><a class="pure-button blue-font" href="javascript:fn_NewSubUbica()" title="Nuevo"><i class="fa fa-plus">
                                    </i> Nuevo</a></li>
                                    <li><a class="pure-button green-font" href="javascript:fn_SubEditJS()" title="Editar"><i class="fa fa-pencil-square-o">
                                    </i> Editar</a></li>
                                    <li><a class="pure-button red-font" href="javascript:fn_SubDeleteJS();" title="Borrar"><i
                                        class="fa fa-trash"></i> Borrar</a></li>
                                </ul>
            </div>
                <dx:ASPxGridView ID="SubGrid" runat="server" AutoGenerateColumns="False" 
                    ClientIDMode="AutoID" DataSourceID="SDSUbicEspec" 
                    Width="100%" ClientInstanceName="SubGrid" Font-Size="Small" 
                    KeyFieldName="IdEspec" 
                    onbeforeperformdataselect="SubGrid_BeforePerformDataSelect">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Id" FieldName="IdEspec" ReadOnly="True" 
                            VisibleIndex="0" Width="14%">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Ubicacion Especifica" FieldName="EspecUbic" 
                            VisibleIndex="1">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn VisibleIndex="2" Width="0%">
                            <ClearFilterButton Text="Limpiar" Visible="True">
                            </ClearFilterButton>
                        </dx:GridViewCommandColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Settings ShowFilterRow="True" />
                    <SettingsText EmptyDataRow="No hay datos para mostrar" />
                    <SettingsDetail IsDetailGrid="True" />
                    <Styles>
                        <FocusedRow BackColor="#5180BF">
                        </FocusedRow>
                    </Styles>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SDSUbicEspec" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
                    SelectCommand="SELECT CAST(IdUbicacion AS NVARCHAR) + '.' + CAST(IdUbicEspec AS NVARCHAR) AS IdEspec, EspecUbic FROM MINV_Ubic_Espec WHERE (IdUbicacion = @IdUbicacion)">
                    <SelectParameters>
                        <asp:SessionParameter Name="IdUbicacion" SessionField="IdUbicacion" />
                    </SelectParameters>
    </asp:SqlDataSource>
            </DetailRow>
        </Templates>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SDSUbic" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT MINV_Ubicaciones.IdUbicacion, MINV_Ubicaciones.DescUbicacion, MINV_Tipo_Ubic.DescTipoUB FROM MINV_Ubicaciones INNER JOIN MINV_Tipo_Ubic ON MINV_Ubicaciones.IdTipoUb = MINV_Tipo_Ubic.IdTipoUb">
    </asp:SqlDataSource>
        
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
    <dx:ASPxPopupControl ID="FormPopup" runat="server" ClientInstanceName="FormPopup"
        AllowDragging="True" AllowResize="True" 
        HeaderText="Formulario de registro" Modal="True"
        PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" ShowFooter="True"
        FooterText="Formulario de registro" PopupVerticalAlign="WindowCenter" ClientIDMode="AutoID"
        Height="186px" Width="320px" CloseAction="CloseButton">
        <ClientSideEvents CloseUp="function(s, e) {

fn_CleanGroup(1);
}" CloseButtonClick="function(s, e) {
	fn_CleanGroup(1);
}" />
        <ContentStyle BackColor="#F9F9F9">
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <dx:ASPxCallbackPanel ID="FillingCallback" runat="server" ClientInstanceName="FillingCallback"
                    Width="100%" OnCallback="FillingCallback_Callback">
                    <ClientSideEvents EndCallback="function(s, e) {
fn_EndCallback();
}" />
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
                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Nombre de ubicación">
                                </dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtUbic" runat="server" Width="191px" ClientInstanceName="txtUbic"
                                    ValidationSettings-ValidationGroup="ControlGroup1" 
                                    NullText="Ej. Laboratorio Hidraulica,etc" Height="16px">
                                    <NullTextStyle BackColor="#F3F3F3">
                                    </NullTextStyle>
                                    <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                        SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                        <RegularExpression ErrorText="Informacion Requerida" />
                                        <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Tipo de ubicación">
                                </dx:ASPxLabel>
                                <dx:ASPxComboBox ID="cmbTipoUbic" runat="server" 
                                    ClientInstanceName="cmbTipoUbic" DataSourceID="SDSTipoUbic"
                                    TextField="Tipo" ValueField="Id">
                                    <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                        SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                        <RegularExpression ErrorText="Informacion Requerida" />
                                        <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SDSTipoUbic" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
                                    SelectCommand="SELECT IdTipoUb AS Id, DescTipoUB AS Tipo FROM MINV_Tipo_Ubic">
                                </asp:SqlDataSource>
                            </div>
                            </div>
                            <div>
                                <ul class="frmctrl">
                                    <li><a class="pure-button green-font" href="javascript:fn_SaveJS()" title="Guardar"><i class="fa fa-floppy-o">
                                    </i>Guardar</a></li>
                                    <li><a class="pure-button red-font" href="javascript:fn_CancelJS()" title="Cancelar"><i class="fa fa-times">
                                    </i>Cancelar</a></li>
                                    <li><a class="pure-button yellow-font" href="javascript:fn_CleanGroup(1);" title="Limpiar"><i
                                        class="fa fa-repeat"></i>Limpiar</a></li>
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
        FooterText="Formulario borrar" PopupVerticalAlign="WindowCenter" 
        ClientIDMode="AutoID" Width="240px">
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
                                    ClientEnabled="true" ReadOnly="True" Font-Bold="True" 
                                    HorizontalAlign="Center">
                                </dx:ASPxTextBox>
                            </div>
                            </div>
                            <div>
                                <ul class="frmctrl">
                                    <li><a class="pure-button" href="javascript:fn_ConfirmDJS()" title="Borrar"><i class="fa fa-trash-o"></i> Borrar</a></li>
                                    <li><a class="pure-button" href="javascript:fn_CancelDJS()" title="Cancelar"><i class="fa fa-times"></i> Cancelar</a></li>
                                </ul>
                           </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>


    <dx:ASPxPopupControl ID="SubFormPopup" runat="server" ClientInstanceName="SubFormPopup"
        AllowDragging="True" AllowResize="True" 
        HeaderText="Formulario de subregistro" Modal="True"
        PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" ShowFooter="True"
        FooterText="Formulario de subregistro" PopupVerticalAlign="WindowCenter" ClientIDMode="AutoID"
        Height="186px" Width="320px" CloseAction="CloseButton">
        <ClientSideEvents CloseUp="function(s, e) {
	
fn_CleanGroup(1);
}" CloseButtonClick="function(s, e) {
	fn_CleanGroup(1);
}" />
        <ContentStyle BackColor="#F9F9F9">
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <dx:ASPxCallbackPanel ID="SubFillingCallback" runat="server" ClientInstanceName="SubFillingCallback"
                    Width="100%" OnCallback="SubFillingCallback_Callback">
                    <ClientSideEvents EndCallback="function(s, e) {
fn_EndCallback();
}" />
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent2" runat="server">
                        <div class="form">
                            <div>
                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Id">
                                </dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtSubId" runat="server" Width="170px" ClientInstanceName="txtSubId"
                                    ClientEnabled="true" ReadOnly="True">
                                </dx:ASPxTextBox>
                            </div>
                            <div>
                                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Nombre de ubicación">
                                </dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtUbicEs" runat="server" Width="195px" ClientInstanceName="txtUbicEs"
                                    ValidationSettings-ValidationGroup="ControlGroup1" 
                                    NullText="Ej. Estante,etc" Height="18px">
                                    <NullTextStyle BackColor="#F3F3F3">
                                    </NullTextStyle>
                                    <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                        SetFocusOnError="True" ValidationGroup="ControlGroup2">
                                        <RegularExpression ErrorText="Informacion Requerida" />
                                        <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Ubicación">
                                </dx:ASPxLabel>
                                <dx:ASPxComboBox ID="cmbUbic" runat="server" ClientInstanceName="cmbUbic" DataSourceID="SDSUbica"
                                    TextField="Ubicacion" ValueField="Id" OnCallback="cmbUbic_Callback" 
                                    DropDownStyle="DropDown">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SDSUbica" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
                                    
                                    SelectCommand="SELECT IdUbicacion AS Id, DescUbicacion AS Ubicacion FROM MINV_Ubicaciones WHERE (IdUbicacion = @IdUbicacion)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="IdUbicacion" SessionField="IdUb" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            </div>
                            <div>
                                <ul class="frmctrl">
                                    <li><a class="pure-button green-font" href="javascript:fn_SubSaveJS()" title="Guardar"><i class="fa fa-floppy-o">
                                    </i>Guardar</a></li>
                                    <li><a class="pure-button red-font" href="javascript:fn_SubCancelJS()" title="Cancelar"><i class="fa fa-times">
                                    </i>Cancelar</a></li>
                                    <li><a class="pure-button yellow-font" href="javascript:fn_CleanGroup(2);" title="Limpiar"><i
                                        class="fa fa-repeat"></i>Limpiar</a></li>
                                </ul>
                            </div>
                          
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
