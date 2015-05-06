<%@ Page Title="" Language="C#" MasterPageFile="~/Tecnicos/TecnicosMASTER.Master" AutoEventWireup="true" CodeBehind="Rpt_EquipReq.aspx.cs" Inherits="SisLIJAD.Tecnicos.Reportes.Rpt_EquipReq" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="reportframe">
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="642px">
        </rsweb:ReportViewer>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
