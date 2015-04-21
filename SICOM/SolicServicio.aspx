<%@ Page Title="" Language="C#" MasterPageFile="~/SICOM/MasterSICOM.Master" AutoEventWireup="true" CodeBehind="SolicServicio.aspx.cs" Inherits="SisLIJAD.SICOM.SolicServicio" %>
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
        DataSourceID="SDSTipoServicio" KeyFieldName="IdSolic_Comp" SettingsBehavior-AllowFocusedRow="True"
        Width="100%" ClientInstanceName="GridPrincipal" 
        OnCustomCallback="GridPrincipal_CustomCallback">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IdSolic_Comp" 
                ReadOnly="True" VisibleIndex="0" Caption="Id Solicitud" Width="12%">
                <Settings AutoFilterCondition="Contains" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DescContrat" 
                VisibleIndex="1" Caption="Descripción Servicio" Width="40%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Precio" VisibleIndex="2" ReadOnly="True" 
                Width="125px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="FechaReq" ReadOnly="True" 
                VisibleIndex="3" Width="15%">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Proveedor" 
                VisibleIndex="4">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn VisibleIndex="5" Width="0%">
                <ClearFilterButton Text="Limpiar" Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
        <SettingsPager AlwaysShowPager="True" PageSize="15">
        </SettingsPager>
        <Settings ShowHeaderFilterButton="True" ShowFilterRow="True" 
            ShowGroupPanel="True" />
        <SettingsText EmptyDataRow="No hay datos para mostrar" GroupPanel="Arrastre las columnas aquí" />
        <Styles>
            <FocusedRow BackColor="#5180BF">
            </FocusedRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SDSTipoServicio" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        
        
        
        SelectCommand="SELECT MSCOMP_Det_Solicitud_Serv.IdSolic_Comp, MSCOMP_Det_Solicitud_Serv.DescContrat, CAST(MSCOMP_Det_Solicitud_Serv.Precio as NVARCHAR) + '  ' +CAST(MSCOMP_Tipo_Moneda.DescTipoM as NVARCHAR) as Precio, CONVERT (DATE, MSCOMP_Det_Solicitud_Serv.FechaReq) AS FechaReq, USER_Entidad.Empresa AS Proveedor  FROM MSCOMP_Det_Solicitud_Serv INNER JOIN USER_Entidad ON MSCOMP_Det_Solicitud_Serv.IdEntidad = USER_Entidad.IdEntidad INNER JOIN MSCOMP_Tipo_Moneda ON MSCOMP_Det_Solicitud_Serv.IdTipoMoneda = MSCOMP_Tipo_Moneda.IdTipoMoneda">
    </asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
<dx:ASPxPopupControl ID="FormPopup" runat="server" ClientInstanceName="FormPopup"
        AllowDragging="True" AllowResize="True" 
        HeaderText="Formulario de registro" Modal="True"
        PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" ShowFooter="True"
        FooterText="Formulario de registro" PopupVerticalAlign="WindowCenter" ClientIDMode="AutoID"
        Height="197px" Width="360px" CloseAction="CloseButton">
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
                                <div>
                                    <dx:ASPxLabel ID="lblId" runat="server" Text="Id">
                                    </dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtId" runat="server" Width="170px" ClientInstanceName="txtId"
                                        ClientEnabled="true" ReadOnly="True">
                                    </dx:ASPxTextBox>
                                </div>
                                <div>
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Descripción Servicio">
                                    </dx:ASPxLabel>
                                    <dx:ASPxMemo ID="memoServ" runat="server" ClientInstanceName="memoServ" Height="78px"
                                        Width="97%">
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxMemo>
                                </div>
                                <div class="BaseForm">
                                    <div class="row">
                                        <div class="first">
                                            <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Costo">
                                            </dx:ASPxLabel>
                                            <dx:ASPxSpinEdit ID="sCant" ClientInstanceName="sCant" runat="server" Height="22px"
                                                 Number="0.0" LargeIncrement="1" Increment="0.1" NullText="0,0"  Width="114px" MaxValue="2147483647">
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
                                        <div class="second">
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Moneda">
                                            </dx:ASPxLabel>
                                            <dx:ASPxComboBox ID="cmbTipoMo" runat="server" ClientInstanceName="cmbTipoMo" 
                                                DataSourceID="SDSCurrency" TextField="DescTipoM" Width="90px" 
                                                ValueField="IdTipoMoneda">
                                             <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                                    SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                                    <RegularExpression ErrorText="Informacion Requerida" />
                                                    <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                                    <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                                    <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="SDSCurrency" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
                                                SelectCommand="SELECT [IdTipoMoneda], [DescTipoM] FROM [MSCOMP_Tipo_Moneda]"></asp:SqlDataSource>

                                        </div>
                                    </div>
                                    <div class="row">
                                    
                                    </div>
                                   
                                    <div class="first">
                                     <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Seleccione proveedor">
                                            </dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cmbProveedor" runat="server" 
                                            ClientInstanceName="cmbProveedor" DataSourceID="SDSProveedor" 
                                            TextField="Empresa" ValueField="IdEntidad">
                                         <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" SetFocusOnError="True"
                                                    ValidationGroup="ControlGroup1" ErrorTextPosition="Bottom">
                                                    <RegularExpression ErrorText="Informacion Requerida" />
                                                    <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                                    <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                                    <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                                </ValidationSettings>
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="SDSProveedor" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
                                            SelectCommand="SELECT IdEntidad, Empresa FROM USER_Entidad WHERE (IdTipo = 2)"></asp:SqlDataSource>

                                    </div>
                                    <div class="second">
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha de contratacion">
                                            </dx:ASPxLabel>
                                    <dx:ASPxDateEdit ID="deFeReq" runat="server" ClientInstanceName="deFeReq">
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
        FooterText="Formulario borrar" PopupVerticalAlign="WindowCenter" ClientIDMode="AutoID"
        Width="238px">
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
