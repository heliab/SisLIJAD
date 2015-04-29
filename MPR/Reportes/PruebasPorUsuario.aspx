<%@ Page Title="" Language="C#" MasterPageFile="~/MPR/MasterMPR.Master" AutoEventWireup="true"
    CodeBehind="PruebasPorUsuario.aspx.cs" Inherits="SisLIJAD.MPR.Reportes.PruebasPorUsuario" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function popitup(url) {
	newwindow=window.open(url,'name','height=400,width=800');
	if (window.focus) {newwindow.focus()}
	return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="wrapctrl">
        <%--<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>--%>
        <ul class="ctrlist">
            <li><a class="pure-button green-font" href="PruebasPorUsuario.aspx" onclick="return popitup('PruebasPorUsuario.aspx')"  title="Publicar">
                <i class="fa fa-check"></i>Publicar</a></li>
        </ul>
        <asp:Button ID="Button1" runat="server" Text="Ver Reporte" OnClick="Button1_Click"
            CssClass="blue-font" />
        <dx:ASPxComboBox ID="cmbUsuarios" runat="server" ClientInstanceName="cmbUsuarios"
            ClientIDMode="AutoID" DataSourceID="SqlDataSource2" TextField="username" ValueField="username"
            ValueType="System.String" Font-Size="Medium">
            <Columns>
                <dx:ListBoxColumn Caption="Usuario" FieldName="username" />
            </Columns>
        </dx:ASPxComboBox>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
            SelectCommand="SELECT DISTINCT username FROM MPR_Solic_Pruebas"></asp:SqlDataSource>
    </div>
    <div class="reportframe">
        <rsweb:ReportViewer ID="rvPruebasxUsuario" runat="server" Font-Names="Verdana" Font-Size="8pt"
            InteractiveDeviceInfos="(Colección)" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
            BorderStyle="Inset" Width="642px">
        </rsweb:ReportViewer>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
            SelectCommand="GetTestByUser" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="cmbUsuarios" Name="username" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
