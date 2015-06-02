<%@ Page Title="" Language="C#" MasterPageFile="~/MPR/MasterMPR.Master" AutoEventWireup="true" CodeBehind="PruebasPorAprobar.aspx.cs" Inherits="SisLIJAD.MPR.Reportes.PruebasPorAprobar" %>

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
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" InteractiveDeviceInfos="(Colección)" 
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="690px">
            <LocalReport ReportPath="MPR\DSRPT\PruebasporAprobar.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
            
            SelectCommand="SELECT [IdSolicPrueba], [HeaderSolicPrueba], [FechaRegistro], [username], [Pagado], [Enviada], [Pruebas] FROM [View_PruebasporAprobar]">
        </asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
