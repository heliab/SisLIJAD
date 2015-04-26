<%@ Page Title="" Language="C#" MasterPageFile="~/Pruebas/PruebasMaster.Master" AutoEventWireup="true"
    CodeBehind="PesoVolumetricoSecoSuelto.aspx.cs" Inherits="SisLIJAD.Pruebas.PesoVolumetricoSecoSuelto" %>

<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
    <div class="BaseForm wraptitle">
        <div class="row">
            <div class="first">
                <div class="Titulo2">
                    PVSS
                </div>
            </div>
            <div>
                <ul class="ctrlist2 ctrleft">
                    <li><a class="pure-button blue-font" href="javascript:fn_NewJS();" title="Nuevo"><i
                        class="fa fa-list"></i>Checklist</a></li>
                    <li><a class="pure-button green-font" href="javascript:fn_EditJS();" title="Editar">
                        <i class="fa fa-search"></i>Ver ficha</a></li>
                </ul>
            </div>
        </div>
    </div>
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" BackColor="#F3F3F3"
        ClientIDMode="AutoID" CssFilePath="~/App_Themes/RedLine/{0}/styles.css" CssPostfix="RedLine"
        HeaderText="Detalles Solicitud">
        <ContentPaddings PaddingBottom="12px" />
        <ContentPaddings PaddingBottom="12px"></ContentPaddings>
        <HeaderStyle>
            <Border BorderStyle="None" />
            <Border BorderStyle="None"></Border>
        </HeaderStyle>
        <TopLeftCorner Height="6px" Url="~/App_Themes/RedLine/Web/rpTopLeftCorner.png" Width="6px">
        </TopLeftCorner>
        <NoHeaderTopLeftCorner Height="6px" Url="~/App_Themes/RedLine/Web/rpNoHeaderTopLeftCorner.png"
            Width="6px">
        </NoHeaderTopLeftCorner>
        <TopRightCorner Height="6px" Url="~/App_Themes/RedLine/Web/rpTopRightCorner.png"
            Width="6px">
        </TopRightCorner>
        <NoHeaderTopRightCorner Height="6px" Url="~/App_Themes/RedLine/Web/rpNoHeaderTopRightCorner.png"
            Width="6px">
        </NoHeaderTopRightCorner>
        <BottomRightCorner Height="6px" Url="~/App_Themes/RedLine/Web/rpBottomRightCorner.png"
            Width="6px">
        </BottomRightCorner>
        <BottomLeftCorner Height="6px" Url="~/App_Themes/RedLine/Web/rpBottomLeftCorner.png"
            Width="6px">
        </BottomLeftCorner>
        <HeaderLeftEdge>
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpHeaderLeftEdge.png" Repeat="NoRepeat"
                VerticalPosition="bottom" />
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpHeaderLeftEdge.png" Repeat="NoRepeat"
                VerticalPosition="bottom"></BackgroundImage>
        </HeaderLeftEdge>
        <HeaderContent BackColor="#DADADA">
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpHeaderContent.png" Repeat="RepeatX"
                VerticalPosition="bottom" />
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpHeaderContent.png" Repeat="RepeatX"
                VerticalPosition="bottom"></BackgroundImage>
        </HeaderContent>
        <HeaderRightEdge>
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpHeaderRightEdge.png" Repeat="NoRepeat"
                VerticalPosition="bottom" />
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpHeaderRightEdge.png" Repeat="NoRepeat"
                VerticalPosition="bottom"></BackgroundImage>
        </HeaderRightEdge>
        <NoHeaderTopEdge BackColor="#F3F3F3">
        </NoHeaderTopEdge>
        <TopEdge>
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpTopEdge.png" />
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpTopEdge.png"></BackgroundImage>
        </TopEdge>
        <RightEdge>
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpRightEdge.png" Repeat="RepeatY" />
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpRightEdge.png" Repeat="RepeatY">
            </BackgroundImage>
        </RightEdge>
        <BottomEdge>
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpBottomEdge.png" Repeat="RepeatX" />
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpBottomEdge.png" Repeat="RepeatX">
            </BackgroundImage>
        </BottomEdge>
        <LeftEdge>
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpLeftEdge.png" />
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpLeftEdge.png"></BackgroundImage>
        </LeftEdge>
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <%--<div class="BaseForm">
                    <div class="row">
                        <div class="first">
                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Id Solicitud">
                            </dx:ASPxLabel>
                            <dx:ASPxLabel ID="lblIdSol" runat="server" Text='<%# Eval("IdDetalle")%>' Font-Bold="True">
                            </dx:ASPxLabel>
                        </div>
                        <div class="Second">
                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Id Ensaye" >
                            </dx:ASPxLabel>
                            <dx:ASPxLabel ID="lblIdEnsaye" runat="server" Text="" Font-Bold="True">
                            </dx:ASPxLabel>
                        </div>
                        <div class="third">
                            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Descripción Solicitud">
                            </dx:ASPxLabel>
                            <dx:ASPxLabel ID="lblDescSol" runat="server" Text=""  Font-Bold="True">
                            </dx:ASPxLabel>
                        </div>
                    </div>
                    <div class="row">
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Descripción Solicitud">
                            </dx:ASPxLabel>
                            <dx:ASPxLabel ID="lblDesc" runat="server" Text=""  Font-Bold="True">
                            </dx:ASPxLabel>
                    </div>
                </div>--%>
                <dx:ASPxGridView ID="GridFicha" runat="server" ClientInstanceName="GridFicha" AutoGenerateColumns="False"
                    DataSourceID="SDSPruebaFicha" Width="100%" KeyFieldName="IdDetalle">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="IdDetalle" ReadOnly="True" ShowInCustomizationForm="True"
                            VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="HeaderSolicPrueba" ShowInCustomizationForm="True"
                            VisibleIndex="1" Caption="Descripción Solicitud" Width="25%">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NomPrueba" ShowInCustomizationForm="True" VisibleIndex="2"
                            Caption="Ensaye" Width="25%">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ObservPrueba" ShowInCustomizationForm="True"
                            VisibleIndex="3" Caption="Observación Cliente">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowGroup="False" AllowFocusedRow="True" />
                    <SettingsPager Visible="False">
                    </SettingsPager>
                    <Settings GridLines="None" />
                    <Styles>
                        <Header>
                            <Border BorderStyle="Groove" />
                        </Header>
                        <Row Cursor="auto">
                        </Row>
                        <FocusedRow BackColor="White" ForeColor="Black">
                        </FocusedRow>
                    </Styles>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SDSPruebaFicha" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
                    SelectCommand="SELECT CAST(MPR_Det_Sol_Prueba.IdSolPrueba AS NVARCHAR) + '.' + CAST(MPR_Det_Sol_Prueba.IdPrueba AS NVARCHAR) AS IdDetalle, MPR_Prueba.NomPrueba, MPR_Det_Sol_Prueba.ObservPrueba, MPR_Solic_Pruebas.HeaderSolicPrueba FROM MPR_Det_Sol_Prueba INNER JOIN MPR_Solic_Pruebas ON MPR_Det_Sol_Prueba.IdSolPrueba = MPR_Solic_Pruebas.IdSolicPrueba INNER JOIN MPR_Prueba ON MPR_Det_Sol_Prueba.IdPrueba = MPR_Prueba.IdPrueba WHERE (MPR_Solic_Pruebas.Autorizado = 1) AND (CAST(MPR_Det_Sol_Prueba.IdSolPrueba AS NVARCHAR) + '.' + CAST(MPR_Det_Sol_Prueba.IdPrueba AS NVARCHAR) = @Id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Id" QueryStringField="Id" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </dx:PanelContent>
        </PanelCollection>
        <Border BorderStyle="None" />
        <Border BorderStyle="None"></Border>
    </dx:ASPxRoundPanel>
    <dx:ASPxCallback ID="NewCallback" runat="server" ClientInstanceName="NewCallback"
        OnCallback="NewCallback_Callback" ClientIDMode="AutoID">
        <ClientSideEvents EndCallback="function(s, e) {
fn_EndCallbackForTest();
}" />
    </dx:ASPxCallback>
    <dx:ASPxHiddenField ID="HiddenV" runat="server" ClientInstanceName="HiddenV">
    </dx:ASPxHiddenField>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
    <div class="BaseForm wraptitle">
        <div class="row">
            <div class="first">
                <div class="Titulo2">
                    Resultados
                </div>
            </div>
            <%--<div class="BaseForm">
                    <div class="row">
                        <div class="first">
                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Id Solicitud">
                            </dx:ASPxLabel>
                            <dx:ASPxLabel ID="lblIdSol" runat="server" Text='<%# Eval("IdDetalle")%>' Font-Bold="True">
                            </dx:ASPxLabel>
                        </div>
                        <div class="Second">
                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Id Ensaye" >
                            </dx:ASPxLabel>
                            <dx:ASPxLabel ID="lblIdEnsaye" runat="server" Text="" Font-Bold="True">
                            </dx:ASPxLabel>
                        </div>
                        <div class="third">
                            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Descripción Solicitud">
                            </dx:ASPxLabel>
                            <dx:ASPxLabel ID="lblDescSol" runat="server" Text=""  Font-Bold="True">
                            </dx:ASPxLabel>
                        </div>
                    </div>
                    <div class="row">
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Descripción Solicitud">
                            </dx:ASPxLabel>
                            <dx:ASPxLabel ID="lblDesc" runat="server" Text=""  Font-Bold="True">
                            </dx:ASPxLabel>
                    </div>
                </div>--%>
        </div>
    </div>
    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientIDMode="AutoID"
        Width="100%">
        <TabPages>
            <dx:TabPage Text="PVSS/Vol.">
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                        <div class="wrapctrl">
                            <ul class="ctrlist">
                                <li><a class="pure-button blue-font" href="javascript:fn_NewMainTest();" title="Peso seco unitario suelto con Volumen definido">
                                    <i class="fa fa-plus"></i>PVSS/Vol.</a></li>
                                <li><a class="pure-button green-font" href="javascript:fn_EditTestJS();" title="Editar">
                                    <i class="fa fa-pencil-square-o"></i>Editar</a></li>
                                <li><a class="pure-button red-font" href="javascript:fn_DeleteTestJS();" title="Borrar">
                                    <i class="fa fa-trash"></i>Borrar</a></li>
                            </ul>
                        </div>
                        <dx:ASPxGridView ID="GridResultados" runat="server" ClientInstanceName="GridResultados"
                            OnCustomCallback="GridResultados_CustomCallback" Width="100%" AutoGenerateColumns="False"
                            ClientIDMode="AutoID" DataSourceID="SDSEnsayes" KeyFieldName="Codigo">
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="Codigo" ReadOnly="True" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="FechaEmisionIndiv" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="C29_G" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="C29_T" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="C29_V" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="C29_M_Result" VisibleIndex="5">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <SettingsPager AlwaysShowPager="True" PageSize="5">
                                <Summary AllPagesText="Páginas: {0} - {1} ({2} items)" Text="Página {0} of {1} ({2} items)" />
                            </SettingsPager>
                            <Settings ShowFilterRow="True" />
                            <SettingsText EmptyDataRow="No hay resultados que mostrar" />
                            <Styles>
                                <FocusedRow BackColor="#5180BF">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="PVSS/FC">
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                        <div class="wrapctrl">
                            <ul class="ctrlist">
                                <li><a class="pure-button blue-font" href="javascript:fn_NewMainTest2();" title="Peso seco unitario suelto con Factor de medida">
                                    <i class="fa fa-plus"></i>PVSS/FC</a></li>
                                <li><a class="pure-button green-font" href="javascript:fn_EditTestJS2();" title="Editar">
                                    <i class="fa fa-pencil-square-o"></i>Editar</a></li>
                                <li><a class="pure-button red-font" href="javascript:fn_DeleteTestJS2();" title="Borrar">
                                    <i class="fa fa-trash"></i>Borrar</a></li>
                            </ul>
                        </div>
                        <dx:ASPxGridView ID="GridResultados2" runat="server" ClientInstanceName="GridResultados2"
                            OnCustomCallback="GridResultados2_CustomCallback" Width="100%" AutoGenerateColumns="False"
                            ClientIDMode="AutoID" DataSourceID="SDSEnsayes2" KeyFieldName="Codigo">
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="Codigo" ReadOnly="True" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="FechaEmisionIndiv" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="C29_G" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="C29_T" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="C29_F" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="C29_M_Result" VisibleIndex="5">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <SettingsPager AlwaysShowPager="True" PageSize="5">
                                <Summary AllPagesText="Páginas: {0} - {1} ({2} items)" Text="Página {0} of {1} ({2} items)" />
                            </SettingsPager>
                            <Settings ShowFilterRow="True" />
                            <SettingsText EmptyDataRow="No hay resultados que mostrar" />
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
    <asp:SqlDataSource ID="SDSEnsayes" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT CAST(MPR_Solic_Pruebas.IdSolicPrueba AS NVARCHAR) + '.' + CAST(MPR_Prueba.IdPrueba AS NVARCHAR) + '.' + CAST(MPR_Det_Result_Prueba.IdCalc AS NVARCHAR) AS Codigo, MPR_Det_Result_Prueba.FechaEmisionIndiv, MPR_Det_Result_Prueba.C29_G, MPR_Det_Result_Prueba.C29_T, MPR_Det_Result_Prueba.C29_V, MPR_Det_Result_Prueba.C29_M_Result FROM MPR_Solic_Pruebas INNER JOIN MPR_Det_Result_Prueba ON MPR_Solic_Pruebas.IdSolicPrueba = MPR_Det_Result_Prueba.IdSolicPrueba INNER JOIN MPR_Prueba ON MPR_Det_Result_Prueba.IdPrueba = MPR_Prueba.IdPrueba WHERE (MPR_Solic_Pruebas.Autorizado = 1) AND (MPR_Solic_Pruebas.IdSolicPrueba = @Sol) AND (MPR_Prueba.IdPrueba = @Pr) AND (MPR_Det_Result_Prueba.Variante=1)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Sol" QueryStringField="Sol" />
            <asp:QueryStringParameter Name="Pr" QueryStringField="Pr" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSEnsayes2" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT CAST(MPR_Solic_Pruebas.IdSolicPrueba AS NVARCHAR) + '.' + CAST(MPR_Prueba.IdPrueba AS NVARCHAR) + '.' + CAST(MPR_Det_Result_Prueba.IdCalc AS NVARCHAR) AS Codigo, MPR_Det_Result_Prueba.FechaEmisionIndiv, MPR_Det_Result_Prueba.C29_G, MPR_Det_Result_Prueba.C29_T, MPR_Det_Result_Prueba.C29_F, MPR_Det_Result_Prueba.C29_M_Result FROM MPR_Solic_Pruebas INNER JOIN MPR_Det_Result_Prueba ON MPR_Solic_Pruebas.IdSolicPrueba = MPR_Det_Result_Prueba.IdSolicPrueba INNER JOIN MPR_Prueba ON MPR_Det_Result_Prueba.IdPrueba = MPR_Prueba.IdPrueba WHERE (MPR_Solic_Pruebas.Autorizado = 1) AND (MPR_Solic_Pruebas.IdSolicPrueba = @Sol) AND (MPR_Prueba.IdPrueba = @Pr) AND (MPR_Det_Result_Prueba.Variante=2)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Sol" QueryStringField="Sol" />
            <asp:QueryStringParameter Name="Pr" QueryStringField="Pr" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
    <dx:ASPxPopupControl ID="FormPopup" runat="server" ClientInstanceName="FormPopup"
        AllowDragging="True" AllowResize="True" HeaderText="Formulario de calculo" Modal="True"
        PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" ShowFooter="True"
        FooterText="Formulario de registro" PopupVerticalAlign="WindowCenter" ClientIDMode="AutoID"
        Height="200px" Width="420px" CloseAction="CloseButton">
        <ClientSideEvents CloseUp="function(s, e) {
fn_CleanGroup(1);
fn_CleanGroup(-1);
}" />
        <ClientSideEvents CloseUp="function(s, e) {
fn_CleanGroup(1);
fn_CleanGroup(-1);
}"></ClientSideEvents>
        <ContentStyle BackColor="#F9F9F9">
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <dx:ASPxCallbackPanel ID="FillingCallback" runat="server" ClientInstanceName="FillingCallback"
                    Width="100%" OnCallback="FillingCallback_Callback" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                    CssPostfix="Aqua" LoadingPanelImagePosition="Top" LoadingPanelText="Cargando&amp;hellip;">
                    <LoadingPanelImage Url="~/App_Themes/Aqua/Web/Loading.gif">
                    </LoadingPanelImage>
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent1" runat="server">
                            <div class="form">
                                <div class="BaseForm">
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
                                    <div class="row">
                                        <div class="first">
                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Peso del material suelto y recipiente">
                                            </dx:ASPxLabel>
                                            <dx:ASPxSpinEdit ID="sG" ClientInstanceName="sG" runat="server" Number="0.0" LargeIncrement="1"
                                                Increment="0.1" NullText="0" Width="160px" MaxValue="2147483647">
                                                <SpinButtons ShowLargeIncrementButtons="True">
                                                </SpinButtons>
                                                <ClientSideEvents NumberChanged="function(s, e) {
	                                                                                 ASPxClientEdit.ClearGroup('ControlGroupR');
                                                                                }" />
                                                <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" SetFocusOnError="True"
                                                    ValidationGroup="ControlGroup1" ErrorTextPosition="Bottom">
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
                                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Peso del recipiente">
                                            </dx:ASPxLabel>
                                            <dx:ASPxSpinEdit ID="sT" ClientInstanceName="sT" runat="server" Number="0.0" LargeIncrement="1"
                                                Increment="0.1" NullText="0" Width="160px" MaxValue="2147483647">
                                                <SpinButtons ShowLargeIncrementButtons="True">
                                                </SpinButtons>
                                                 <ClientSideEvents NumberChanged="function(s, e) {
	                                                                                 ASPxClientEdit.ClearGroup('ControlGroupR');
                                                                                }" />
                                                <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" SetFocusOnError="True"
                                                    ValidationGroup="ControlGroup1" ErrorTextPosition="Bottom">
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
                                            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Volumen del recipiente">
                                            </dx:ASPxLabel>
                                            <dx:ASPxSpinEdit ID="sV" ClientInstanceName="sV" runat="server" Number="0.0" LargeIncrement="1"
                                                Increment="0.1" NullText="0" Width="160px" MaxValue="2147483647">
                                                <SpinButtons ShowLargeIncrementButtons="True">
                                                </SpinButtons>
                                                 <ClientSideEvents NumberChanged="function(s, e) {
	                                                            ASPxClientEdit.ClearGroup('ControlGroupR');
                                                        }" />
                                                <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" SetFocusOnError="True"
                                                    ValidationGroup="ControlGroup1" ErrorTextPosition="Bottom">
                                                    <RegularExpression ErrorText="Informacion Requerida" />
                                                    <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                                    <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                                    <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                                </ValidationSettings>
                                            </dx:ASPxSpinEdit>
                                        </div>
                                        <div class="second">
                                            <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Resultado">
                                            </dx:ASPxLabel>
                                            <dx:ASPxTextBox ID="txtResult" runat="server" Width="125px" ClientInstanceName="txtResult"
                                                ReadOnly="True">
                                                <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" SetFocusOnError="True"
                                                    ValidationGroup="ControlGroupR" ErrorTextPosition="Bottom">
                                                    <RegularExpression ErrorText="Informacion Requerida" />
                                                    <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                                    <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                                    <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                                </ValidationSettings>
                                                <Border BorderWidth="1px" />
                                            </dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <%--<hr noshade="noshade" />--%>
                            <div>
                                <ul class="frmctrl">
                                    <li><a class="pure-button button-green white-font" href="javascript:fn_CalcJS()"
                                        title="Guardar"><i class="fa fa-calculator"></i>Calcular</a></li>
                                    <li><a class="pure-button green-font" href="javascript:fn_SaveTestJS()" title="Guardar">
                                        <i class="fa fa-floppy-o"></i>Guardar</a></li>
                                    <li><a class="pure-button red-font" href="javascript:fn_CancelTestJS()" title="Cancelar">
                                        <i class="fa fa-times"></i>Cancelar</a></li>
                                    <li><a class="pure-button yellow-font" href="javascript:fn_CleanTestPopup(1);" title="Limpiar">
                                        <i class="fa fa-repeat"></i>Limpiar</a></li>
                                </ul>
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="FormPopup2" runat="server" ClientInstanceName="FormPopup2"
        AllowDragging="True" AllowResize="True" HeaderText="Formulario de calculo" Modal="True"
        PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" ShowFooter="True"
        FooterText="Formulario de registro" PopupVerticalAlign="WindowCenter" ClientIDMode="AutoID"
        Height="200px" Width="420px" CloseAction="CloseButton">
        <ClientSideEvents CloseUp="function(s, e) {
fn_CleanGroup(1);
fn_CleanGroup(-1);
}" />
        <ClientSideEvents CloseUp="function(s, e) {
fn_CleanGroup(1);
fn_CleanGroup(-1);
}"></ClientSideEvents>
        <ContentStyle BackColor="#F9F9F9">
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <dx:ASPxCallbackPanel ID="FillingCallback2" runat="server" ClientInstanceName="FillingCallback2"
                    Width="100%" OnCallback="FillingCallback2_Callback" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                    CssPostfix="Aqua" LoadingPanelImagePosition="Top">
                    <LoadingPanelImage Url="~/App_Themes/Aqua/Web/Loading.gif">
                    </LoadingPanelImage>
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent2" runat="server">
                            <div class="form">
                                <div class="BaseForm">
                                    <div class="row">
                                        <div class="first">
                                            <div>
                                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Id">
                                                </dx:ASPxLabel>
                                                <dx:ASPxTextBox ID="txtId2" runat="server" Width="100px" ClientInstanceName="txtId2"
                                                    ClientEnabled="true" ReadOnly="True">
                                                </dx:ASPxTextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="first">
                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Peso del material suelto y recipiente">
                                            </dx:ASPxLabel>
                                            <dx:ASPxSpinEdit ID="sG2" ClientInstanceName="sG2" runat="server" Number="0.0" LargeIncrement="1"
                                                Increment="0.1" NullText="0" Width="160px" MaxValue="2147483647">
                                                <SpinButtons ShowLargeIncrementButtons="True">
                                                </SpinButtons>
                                                <ClientSideEvents NumberChanged="function(s, e) {ASPxClientEdit.ClearGroup('ControlGroupR');}
                                      " />
                                                <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" SetFocusOnError="True"
                                                    ValidationGroup="ControlGroup1" ErrorTextPosition="Bottom">
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
                                            <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Peso del recipiente">
                                            </dx:ASPxLabel>
                                            <dx:ASPxSpinEdit ID="sT2" ClientInstanceName="sT2" runat="server" Number="0.0" LargeIncrement="1"
                                                Increment="0.1" NullText="0" Width="160px" MaxValue="2147483647">
                                                <SpinButtons ShowLargeIncrementButtons="True">
                                                </SpinButtons>
                                                <ClientSideEvents NumberChanged="function(s, e) {
	ASPxClientEdit.ClearGroup('ControlGroupR');
}" />
                                                <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" SetFocusOnError="True"
                                                    ValidationGroup="ControlGroup1" ErrorTextPosition="Bottom">
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
                                               <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Factor de medida">
                                                </dx:ASPxLabel>
                                                <dx:ASPxSpinEdit ID="sF" ClientInstanceName="sF" runat="server" Number="0.0" LargeIncrement="1"
                                                    Increment="0.1" NullText="0" Width="160px" MaxValue="2147483647">
                                                    <spinbuttons showlargeincrementbuttons="True">
                                                 </spinbuttons>
                                                    <ClientSideEvents NumberChanged="function(s, e) {
	ASPxClientEdit.ClearGroup('ControlGroupR');
}" />
                                                    <validationsettings enablecustomvalidation="True" errordisplaymode="Text" setfocusonerror="True"
                                                        validationgroup="ControlGroup1" errortextposition="Bottom">
                                                     <RegularExpression ErrorText="Informacion Requerida" />
                                                     <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                                     <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                                     <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                                 </validationsettings>
                                                </dx:ASPxSpinEdit>
                                        </div>
                                        <div class="second">
                                            <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Resultado">
                                            </dx:ASPxLabel>
                                            <dx:ASPxTextBox ID="txtResult2" runat="server" Width="125px" ClientInstanceName="txtResult2"
                                                ReadOnly="True">
                                                <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" SetFocusOnError="True"
                                                    ValidationGroup="ControlGroupR" ErrorTextPosition="Bottom">
                                                    <RegularExpression ErrorText="Informacion Requerida" />
                                                    <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
                                                    <RegularExpression ErrorText="Informacion Requerida"></RegularExpression>
                                                    <RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                                </ValidationSettings>
                                                <Border BorderWidth="1px" />
                                            </dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div>
                                <ul class="frmctrl">
                                    <li><a class="pure-button button-green white-font" href="javascript:fn_CalcJS2()"
                                        title="Guardar"><i class="fa fa-calculator"></i>Calcular</a></li>
                                    <li><a class="pure-button green-font" href="javascript:fn_SaveTestJS2()" title="Guardar">
                                        <i class="fa fa-floppy-o"></i>Guardar</a></li>
                                    <li><a class="pure-button red-font" href="javascript:fn_CancelTestJS()" title="Cancelar">
                                        <i class="fa fa-times"></i>Cancelar</a></li>
                                    <li><a class="pure-button yellow-font" href="javascript:fn_CleanTestPopup(1);" title="Limpiar">
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
                        <li><a class="pure-button" href="javascript:fn_ConfirmDJS2()" title="Borrar"><i class="fa fa-trash-o">
                        </i>Borrar</a></li>
                        <li><a class="pure-button" href="javascript:fn_CancelDJS()" title="Cancelar"><i class="fa fa-times">
                        </i>Cancelar</a></li>
                    </ul>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
