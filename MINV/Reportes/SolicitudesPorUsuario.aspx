﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MINV/MasterMinv.Master" AutoEventWireup="true" CodeBehind="SolicitudesPorUsuario.aspx.cs" Inherits="SisLIJAD.MINV.Reportes.SolicitudesPorUsuario" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="wrapctrl">
        <%--<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>--%>
        <%-- <ul class="ctrlist">
            <li><a class="pure-button green-font" href="PruebasPorUsuario.aspx" onclick="return popitup('PruebasPorUsuario.aspx')"
                title="Publicar"><i class="fa fa-check"></i>Publicar</a></li>
        </ul>--%>
        <div class="BaseForm">
            <div class="row">
                <div class="first">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Seleccione usuario" 
                        Font-Bold="True" Font-Italic="False" Font-Names="Verdana">
                    </dx:ASPxLabel>
                </div>
            </div>
            <div class="row">
                <div class="first">
                    <dx:ASPxComboBox ID="cmbUsuarios" runat="server" ClientInstanceName="cmbUsuarios"
                        ClientIDMode="AutoID" DataSourceID="SqlDataSource2" TextField="username" ValueField="username"
                        ValueType="System.String" Font-Size="Medium" EnableIncrementalFiltering="True">
                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" SetFocusOnError="True"
                            ValidationGroup="ControlGroup1" ErrorTextPosition="Bottom">
                            <RegularExpression ErrorText="Seleccione un usuario" />
                            <RequiredField ErrorText="Seleccione un usuario" IsRequired="True" />
                            <RegularExpression ErrorText="Seleccione un usuario"></RegularExpression>
                            <RequiredField IsRequired="True" ErrorText="Seleccione un usuario"></RequiredField>
                        </ValidationSettings>
                        <Columns>
                            <dx:ListBoxColumn Caption="Usuario" FieldName="username" />
                        </Columns>
                    </dx:ASPxComboBox>
                </div>
                <div class="second">
                    <asp:Button ID="Button1" runat="server" Text="Ver Reporte" OnClick="Button1_Click"
                        CssClass="blue-font pure-button" onclientclick="if (!ASPxClientEdit.ValidateGroup('ControlGroup1'))
                return;" />
                </div>
            </div>
        </div>
    </div>
    <div class="reportframe">
<%--        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="682px" 
            Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Colección)" 
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
            <LocalReport ReportPath="MINV\DSRPT\Rpt_SolicitudesPorUsuario.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DSGetLoanByUser" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>--%>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
            InteractiveDeviceInfos="(Colección)" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
            BorderStyle="Inset" Width="705px">
        </rsweb:ReportViewer>
        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
            SelectCommand="GetLoanMatByUser" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="cmbUsuarios" Name="username" 
                    PropertyName="Value" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
    </div>
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
            
        SelectCommand="SELECT DISTINCT SolicitadoPor as username FROM MINV_Prestamos"></asp:SqlDataSource>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
