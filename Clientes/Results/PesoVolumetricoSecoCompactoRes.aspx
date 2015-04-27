﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Clientes/ClientesMASTER.Master" AutoEventWireup="true" CodeBehind="PesoVolumetricoSecoCompactoRes.aspx.cs" Inherits="SisLIJAD.Clientes.Results.PesoVolumetricoSecoCompactoRes" %>

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
                    PVSC
                </div>
            </div>
            <div class="Second">
                <ul class="ctrlist2 ctrleft">
                    <%--<li><a class="pure-button blue-font" href="javascript:fn_NewJS();" title="Nuevo"><i
                        class="fa fa-list"></i>Checklist</a></li>--%>
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
            <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
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
        </div>
    </div>
    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientIDMode="AutoID"
        Width="100%">
        <TabPages>
            <dx:TabPage Text="PVSC/Vol.">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server" SupportsDisabledAttribute="True">
                        
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
            <dx:TabPage Text="PVSC/FC">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">
                        
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
        
        SelectCommand="SELECT CAST(MPR_Solic_Pruebas.IdSolicPrueba AS NVARCHAR) + '.' + CAST(MPR_Prueba.IdPrueba AS NVARCHAR) + '.' + CAST(MPR_Det_Result_Prueba.IdCalc AS NVARCHAR) AS Codigo, MPR_Det_Result_Prueba.FechaEmisionIndiv, MPR_Det_Result_Prueba.C29_G, MPR_Det_Result_Prueba.C29_T, MPR_Det_Result_Prueba.C29_V, MPR_Det_Result_Prueba.C29_M_Result FROM MPR_Solic_Pruebas INNER JOIN MPR_Det_Result_Prueba ON MPR_Solic_Pruebas.IdSolicPrueba = MPR_Det_Result_Prueba.IdSolicPrueba INNER JOIN MPR_Prueba ON MPR_Det_Result_Prueba.IdPrueba = MPR_Prueba.IdPrueba WHERE (MPR_Solic_Pruebas.Autorizado = 1) AND (MPR_Solic_Pruebas.IdSolicPrueba = @Sol) AND (MPR_Prueba.IdPrueba = @Pr) AND (MPR_Det_Result_Prueba.Variante=3)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Sol" QueryStringField="Sol" />
            <asp:QueryStringParameter Name="Pr" QueryStringField="Pr" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSEnsayes2" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
         SelectCommand="SELECT CAST(MPR_Solic_Pruebas.IdSolicPrueba AS NVARCHAR) + '.' + CAST(MPR_Prueba.IdPrueba AS NVARCHAR) + '.' + CAST(MPR_Det_Result_Prueba.IdCalc AS NVARCHAR) AS Codigo, MPR_Det_Result_Prueba.FechaEmisionIndiv, MPR_Det_Result_Prueba.C29_G, MPR_Det_Result_Prueba.C29_T, MPR_Det_Result_Prueba.C29_F, MPR_Det_Result_Prueba.C29_M_Result FROM MPR_Solic_Pruebas INNER JOIN MPR_Det_Result_Prueba ON MPR_Solic_Pruebas.IdSolicPrueba = MPR_Det_Result_Prueba.IdSolicPrueba INNER JOIN MPR_Prueba ON MPR_Det_Result_Prueba.IdPrueba = MPR_Prueba.IdPrueba WHERE (MPR_Solic_Pruebas.Autorizado = 1) AND (MPR_Solic_Pruebas.IdSolicPrueba = @Sol) AND (MPR_Prueba.IdPrueba = @Pr) AND (MPR_Det_Result_Prueba.Variante=4)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Sol" QueryStringField="Sol" />
            <asp:QueryStringParameter Name="Pr" QueryStringField="Pr" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
