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
        <ContentPaddings PaddingBottom="6px" PaddingTop="3px" />
        <HeaderStyle BackColor="#DEDEDE">
        <Border BorderStyle="None" />
        <BorderLeft BorderStyle="None" />
        <BorderRight BorderStyle="None" />
        <BorderBottom BorderStyle="None" />
        </HeaderStyle>
        <TopLeftCorner Height="5px" Url="~/Images/ASPxRoundPanel/552374105/TopLeftCorner.png" 
            Width="5px">
        </TopLeftCorner>
        <NoHeaderTopLeftCorner Height="5px" 
            Url="~/Images/ASPxRoundPanel/552374105/NoHeaderTopLeftCorner.png" 
            Width="5px">
        </NoHeaderTopLeftCorner>
        <TopRightCorner Height="5px" 
            Url="~/Images/ASPxRoundPanel/552374105/TopRightCorner.png" Width="5px">
        </TopRightCorner>
        <NoHeaderTopRightCorner Height="5px" 
            Url="~/Images/ASPxRoundPanel/552374105/NoHeaderTopRightCorner.png" 
            Width="5px">
        </NoHeaderTopRightCorner>
        <BottomRightCorner Height="5px" 
            Url="~/Images/ASPxRoundPanel/552374105/BottomRightCorner.png" Width="5px">
        </BottomRightCorner>
        <BottomLeftCorner Height="5px" 
            Url="~/Images/ASPxRoundPanel/552374105/BottomLeftCorner.png" Width="5px">
        </BottomLeftCorner>
        <HeaderLeftEdge>
            <BackgroundImage ImageUrl="~/Images/ASPxRoundPanel/552374105/HeaderLeftEdge.png" 
                Repeat="NoRepeat" VerticalPosition="bottom" HorizontalPosition="left" />
        </HeaderLeftEdge>
        <HeaderContent>
            <BackgroundImage ImageUrl="~/Images/ASPxRoundPanel/552374105/HeaderContent.png" 
                Repeat="RepeatX" VerticalPosition="bottom" HorizontalPosition="left" />
        </HeaderContent>
        <HeaderRightEdge>
            <BackgroundImage ImageUrl="~/Images/ASPxRoundPanel/552374105/HeaderRightEdge.png" 
                Repeat="NoRepeat" VerticalPosition="bottom" HorizontalPosition="right" />
        </HeaderRightEdge>
        <NoHeaderTopEdge BackColor="#F3F3F3">
        </NoHeaderTopEdge>
        <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
      <div class="BaseForm">
            <div class="HalfLeft">
                 <label class="InnerCtrl" for="male">Label</label>
                 <input class="InnerCtrl" type="text" name="fname">
            </div>
            <div class="HalfRight">
                 <label class="InnerCtrl" for="male">Label2</label>
                 <input class="InnerCtrl" type="text" name="fname">
            </div>
            <div class="HalfMiddle">
                <div class="InnerMid">
                <label class="InnerCtrl" for="male">Label2</label>
                 <input class="InnerCtrlMid" type="text" name="fname">
                </div>
            </div>
          <div class="HalfMiddle">
              <div class="FrmBtnWrapper">
                <input type="submit" value="Cancel">
                <input type="submit" value="Guardar">
              </div>
          </div>
        </div>
            </dx:PanelContent>
</PanelCollection>
        <Border BorderStyle="Solid" BorderColor="#8B8B8B" BorderWidth="1px" />
    </dx:ASPxRoundPanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
