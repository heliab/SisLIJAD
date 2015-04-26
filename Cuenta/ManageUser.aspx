<%@ Page Title="" Language="C#" MasterPageFile="~/Cuenta/AccountMASTER.Master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="SisLIJAD.Cuenta.ManageUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
    <h2>
       Admisnitrar usauarios</h2>
    <p>
        <asp:Repeater ID="FilteringUI" runat="server" 
            onitemcommand="FilteringUI_ItemCommand">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lnkFilter" 
                                Text='<%# Container.DataItem %>' 
                                CommandName='<%# Container.DataItem %>'></asp:LinkButton>
            </ItemTemplate>
            
            <SeparatorTemplate>|</SeparatorTemplate>
        </asp:Repeater>
    </p>
    <p>
        <asp:GridView ID="UserAccounts" runat="server"
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3">
            <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="UserName" 
                    DataNavigateUrlFormatString="InfoUser.aspx?user={0}" Text="Administrar" />
                <asp:BoundField DataField="UserName" HeaderText="Usuario" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:CheckBoxField DataField="IsApproved" HeaderText="Aprovado?" />
                <asp:CheckBoxField DataField="IsLockedOut" HeaderText="Bloquado?" />
                <asp:CheckBoxField DataField="IsOnline" HeaderText="En linea?" />
                <asp:BoundField DataField="Comment" HeaderText="Comentario" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    </p>
    <p>
        <asp:LinkButton ID="lnkFirst" runat="server" onclick="lnkFirst_Click">&lt;&lt; Inicio</asp:LinkButton> |
        <asp:LinkButton ID="lnkPrev" runat="server" onclick="lnkPrev_Click">&lt; Anterior</asp:LinkButton> |
        <asp:LinkButton ID="lnkNext" runat="server" onclick="lnkNext_Click">Siguiente &gt;</asp:LinkButton> |
        <asp:LinkButton ID="lnkLast" runat="server" onclick="lnkLast_Click">Ultimo &gt;&gt;</asp:LinkButton>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
