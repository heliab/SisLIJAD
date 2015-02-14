<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetValue.aspx.cs" Inherits="SisLIJAD.GetValue" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Id">
        </dx:ASPxLabel>
        <dx:ASPxTextBox ID="txtId" runat="server" Width="170px" ClientInstanceName="txtId" ClientEnabled="false">
        </dx:ASPxTextBox>
       <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Load" 
        ClientIDMode="AutoID" AutoPostBack="False">
        <ClientSideEvents Click="function(s, e) { IdRegistro = RegistrosGrid.GetRowKey(RegistrosGrid.GetFocusedRowIndex());
            alert(IdRegistro);
            document.getElementById('txtId').value = IdRegistro;
            txtId.SetText(0);
            }"
	     />
    </dx:ASPxButton>
        <asp:TextBox ID="txtId1" runat="server"></asp:TextBox>
    </div>
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
            ClientIDMode="AutoID" DataSourceID="SqlDataSource1" KeyFieldName="IdEstado" Caption="RegistrosGrid" ClientInstanceName="RegistrosGrid">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="IdEstado" ReadOnly="True" 
                    VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DescEstado" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" />
        </dx:ASPxGridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>" 
            SelectCommand="SELECT [IdEstado], [DescEstado] FROM [MINV_EstadoMateriales]">
        </asp:SqlDataSource>


    </div>
    </form>
</body>
</html>
