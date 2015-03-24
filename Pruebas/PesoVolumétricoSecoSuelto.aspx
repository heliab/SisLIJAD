<%@ Page Title="" Language="C#" MasterPageFile="~/MPR/MasterMPR.Master" AutoEventWireup="true" CodeBehind="PesoVolumétricoSecoSuelto.aspx.cs" Inherits="SisLIJAD.Pruebas.PesoVolumétricoSecoSuelto" %>

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

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
    <%--<div class="ficha">
    <span><strong>Datos de solicitud</strong></span>
    </div>--%>
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" 
        BackColor="#F3F3F3" ClientIDMode="AutoID" 
        CssFilePath="~/App_Themes/RedLine/{0}/styles.css" CssPostfix="RedLine" 
        HeaderText="Detalles Solicitud">
        <ContentPaddings PaddingBottom="12px" />
<ContentPaddings PaddingBottom="12px"></ContentPaddings>

        <HeaderStyle>
        <Border BorderStyle="None" />
<Border BorderStyle="None"></Border>
        </HeaderStyle>
        <TopLeftCorner Height="6px" Url="~/App_Themes/RedLine/Web/rpTopLeftCorner.png" 
            Width="6px">
        </TopLeftCorner>
        <NoHeaderTopLeftCorner Height="6px" 
            Url="~/App_Themes/RedLine/Web/rpNoHeaderTopLeftCorner.png" 
            Width="6px">
        </NoHeaderTopLeftCorner>
        <TopRightCorner Height="6px" 
            Url="~/App_Themes/RedLine/Web/rpTopRightCorner.png" Width="6px">
        </TopRightCorner>
        <NoHeaderTopRightCorner Height="6px" 
            Url="~/App_Themes/RedLine/Web/rpNoHeaderTopRightCorner.png" 
            Width="6px">
        </NoHeaderTopRightCorner>
        <BottomRightCorner Height="6px" 
            Url="~/App_Themes/RedLine/Web/rpBottomRightCorner.png" Width="6px">
        </BottomRightCorner>
        <BottomLeftCorner Height="6px" 
            Url="~/App_Themes/RedLine/Web/rpBottomLeftCorner.png" Width="6px">
        </BottomLeftCorner>
        <HeaderLeftEdge>
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpHeaderLeftEdge.png" 
                Repeat="NoRepeat" VerticalPosition="bottom" />
<BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpHeaderLeftEdge.png" Repeat="NoRepeat" VerticalPosition="bottom"></BackgroundImage>
        </HeaderLeftEdge>
        <HeaderContent BackColor="#DADADA">
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpHeaderContent.png" 
                Repeat="RepeatX" VerticalPosition="bottom" />
<BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpHeaderContent.png" Repeat="RepeatX" VerticalPosition="bottom"></BackgroundImage>
        </HeaderContent>
        <HeaderRightEdge>
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpHeaderRightEdge.png" 
                Repeat="NoRepeat" VerticalPosition="bottom" />
<BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpHeaderRightEdge.png" Repeat="NoRepeat" VerticalPosition="bottom"></BackgroundImage>
        </HeaderRightEdge>
        <NoHeaderTopEdge BackColor="#F3F3F3">
        </NoHeaderTopEdge>
        <TopEdge>
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpTopEdge.png" />
<BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpTopEdge.png"></BackgroundImage>
        </TopEdge>
        <RightEdge>
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpRightEdge.png" Repeat="RepeatY" />
<BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpRightEdge.png" Repeat="RepeatY"></BackgroundImage>
        </RightEdge>
        <BottomEdge>
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpBottomEdge.png" Repeat="RepeatX" />
<BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpBottomEdge.png" Repeat="RepeatX"></BackgroundImage>
        </BottomEdge>
        <LeftEdge>
            <BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpLeftEdge.png" />
<BackgroundImage ImageUrl="~/App_Themes/RedLine/Web/rpLeftEdge.png"></BackgroundImage>
        </LeftEdge>
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <div class="BaseForm">
                    <div class="row">
                        <div class="first">
                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Id Solicitud">
                            </dx:ASPxLabel>
                            <dx:ASPxLabel ID="lblIdSol" runat="server" Text="" Font-Bold="True">
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
                            <dx:ASPxLabel ID="lblDescripcion" runat="server" Text=""  Font-Bold="True">
                            </dx:ASPxLabel>
                        </div>
                    </div>
                </div>
        
            </dx:PanelContent>
</PanelCollection>
        <Border BorderStyle="None" />

<Border BorderStyle="None"></Border>
    </dx:ASPxRoundPanel>
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
    <dx:ASPxGridView ID="GridPrincipal" runat="server" 
        ClientInstanceName="GridPrincipal" 
        oncustomcallback="GridPrincipal_CustomCallback" Width="100%" 
        AutoGenerateColumns="False" ClientIDMode="AutoID" DataSourceID="SDSEnsayes" 
        KeyFieldName="IdSolPrueba"> <ClientSideEvents DetailRowExpanding="function(s, e) {
	GridPrincipal.SetFocusedRowIndex(e.visibleIndex);
}" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IdSolPrueba" ReadOnly="True" 
                VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="IdPrueba" ReadOnly="True" 
                VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NomPrueba" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ObservPrueba" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="HeaderSolicPrueba" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" />
        <Settings ShowFilterRow="True" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SDSEnsayes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
        SelectCommand="SELECT MPR_Det_Sol_Prueba.IdSolPrueba, MPR_Det_Sol_Prueba.IdPrueba, MPR_Prueba.NomPrueba, MPR_Det_Sol_Prueba.ObservPrueba, MPR_Solic_Pruebas.HeaderSolicPrueba FROM MPR_Det_Sol_Prueba INNER JOIN MPR_Solic_Pruebas ON MPR_Det_Sol_Prueba.IdSolPrueba = MPR_Solic_Pruebas.IdSolicPrueba INNER JOIN MPR_Prueba ON MPR_Det_Sol_Prueba.IdPrueba = MPR_Prueba.IdPrueba WHERE (MPR_Solic_Pruebas.Autorizado = 1) AND (MPR_Det_Sol_Prueba.IdSolPrueba = @IdSolPrueba)">
        <SelectParameters>
            <asp:SessionParameter Name="IdSolPrueba" SessionField="IdSolPrueba" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
