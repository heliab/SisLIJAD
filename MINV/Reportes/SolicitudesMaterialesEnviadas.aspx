﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MINV/MasterMinv.Master" AutoEventWireup="true" CodeBehind="SolicitudesMaterialesEnviadas.aspx.cs" Inherits="SisLIJAD.MINV.Reportes.SolicitudesMaterialesEnviadas" %>

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
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="689px">
            <LocalReport ReportPath="MINV\DSRPT\Rpt_PrestamoMatEnviadas.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="SqlDataSource1" 
                        Name="DSMaterialPrestamoSend" />
                </DataSources>
            </LocalReport>
            
        </rsweb:ReportViewer>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
            SelectCommand="SELECT IdPrestamo, Procedimiento, FechaRegistro, FechaPrestar, FechaDevolver, SolicitadoPor, NombCompleto, Asignatura, CodigoAsignatura, Cedula FROM View_PrestaMatAllSend">
        </asp:SqlDataSource>
        
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
