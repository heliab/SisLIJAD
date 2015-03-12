<%@ Page Title="" Language="C#" MasterPageFile="~/MINV/MasterMinv.Master" AutoEventWireup="true" CodeBehind="Existencias.aspx.cs" Inherits="SisLIJAD.MINV.Existencias" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
    <dx:ASPxGridView ID="GridPrincipal" runat="server" 
        ClientInstanceName="GridPrincipal" AutoGenerateColumns="False" 
        ClientIDMode="AutoID" DataSourceID="SDSExsitencias" KeyFieldName="IdMarterial" 
        Width="100%">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IdMarterial" VisibleIndex="0" Width="18%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CodUCA" VisibleIndex="1" Width="18%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Material" FieldName="NomMaterial" 
                VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Existencias" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn VisibleIndex="4" Width="0%">
                <ClearFilterButton Text="Limpiar" Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" />
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <Styles>
            <FocusedRow BackColor="#5180BF">
            </FocusedRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SDSExsitencias" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
        SelectCommand="SELECT MINV_Existencias.IdMarterial, MINV_Materiales.CodUCA, MINV_Materiales.NomMaterial, MINV_Existencias.Existencias FROM MINV_Existencias INNER JOIN MINV_Materiales ON MINV_Existencias.IdMarterial = MINV_Materiales.IdMaterial"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
