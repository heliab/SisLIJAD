<%@ Page Title="" Language="C#" MasterPageFile="~/SICOM/MasterSICOM.Master" AutoEventWireup="true" CodeBehind="SolicitudServicios.aspx.cs" Inherits="SisLIJAD.SICOM.Reportes.SolicitudServicios" %>

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
                        ClientIDMode="AutoID" DataSourceID="SqlDataSource1" 
                        TextField="Descripcion" ValueField="Id"
                        ValueType="System.String" Font-Size="Medium" 
                        EnableIncrementalFiltering="True" Width="350px">
                        <Columns>
                            <dx:ListBoxColumn Caption="Id" FieldName="Id" Width="7%" />
                            <dx:ListBoxColumn Caption="Solicitud" FieldName="Descripcion" />
                        </Columns>
                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" SetFocusOnError="True"
                            ValidationGroup="ControlGroup1" ErrorTextPosition="Bottom">
                            <RegularExpression ErrorText="Seleccione una solicitud" />
                            <RequiredField ErrorText="Seleccione una solicitud" IsRequired="True" />
                            <RegularExpression ErrorText="Seleccione una solicitud"></RegularExpression>
                            <RequiredField IsRequired="True" ErrorText="SSeleccione una solicitud"></RequiredField>
                        </ValidationSettings>
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

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
            SelectCommand="SELECT DISTINCT IdSolic_Comp as Id, DescContrat as Descripcion FROM MSCOMP_Det_Solicitud_Serv">
        </asp:SqlDataSource>

        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
            InteractiveDeviceInfos="(Colección)" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
            BorderStyle="Inset" Width="642px">
        </rsweb:ReportViewer>
        
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
