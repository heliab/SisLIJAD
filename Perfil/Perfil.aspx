<%@ Page Title="" Language="C#" MasterPageFile="~/Perfil/PerfilesMaster.Master" AutoEventWireup="true"
    CodeBehind="Perfil.aspx.cs" Inherits="SisLIJAD.Perfil.Perfil" %>

<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
<div class="wrapctrl">
        <ul class="ctrlist">
            <li><a class="pure-button blue-font" href="javascript:fn_ChangeProfileJS();" title="Nuevo"><i
                class="fa fa-user"></i>Editar Datos</a></li>
        </ul>
    </div>
           <dx:ASPxCallback ID="NewCallback" runat="server" ClientInstanceName="NewCallback"
        OnCallback="NewCallback_Callback" ClientIDMode="AutoID">
        <ClientSideEvents EndCallback="function(s, e) {
fn_EndCallback();
}" />
    </dx:ASPxCallback>
    <dx:ASPxHiddenField ID="HiddenV" runat="server" ClientInstanceName="HiddenV">
    </dx:ASPxHiddenField>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
    <div class="grid">
    
    <dx:ASPxGridView ID="GridPrincipal" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
        DataSourceID="SDSEstadoMaterial" KeyFieldName="IdEntidad" SettingsBehavior-AllowFocusedRow="True"
        Width="100%" ClientInstanceName="GridPrincipal" 
        OnCustomCallback="GridPrincipal_CustomCallback" 
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">

<Settings ShowColumnHeaders="False" ShowFilterRow="false"></Settings>

        <SettingsText GroupPanel="Arrastre las columnas aqu&#237;" EmptyDataRow="No hay datos para mostrar">
</SettingsText>
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Nombre Completo" FieldName="Nombre" ReadOnly="True"
                VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="IdEntidad" ReadOnly="True" Visible="False"
                VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Celular" VisibleIndex="3" Width="7%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="4" Width="10%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Emrpesa/Universidad" FieldName="Empresa" VisibleIndex="2"
                Width="15%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Web" VisibleIndex="5" Width="15%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="username" Visible="False" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
        </Columns>

<SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>

        <SettingsPager AlwaysShowPager="True" PageSize="15" ShowDefaultImages="False" 
            Visible="False">
            <AllButton Text="All">
            </AllButton>
            <NextPageButton Text="Next &gt;">
            </NextPageButton>
            <PrevPageButton Text="&lt; Prev">
            </PrevPageButton>
        </SettingsPager>

        <Settings ShowFilterRow="False" />
        <SettingsText EmptyDataRow="No hay datos para mostrar" GroupPanel="Arrastre las columnas aquí" />
        <Images SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
            <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
            </LoadingPanelOnStatusBar>
            <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
            </LoadingPanel>
        </Images>
        <ImagesFilterControl>
            <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
            </LoadingPanel>
        </ImagesFilterControl>
        <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
            CssPostfix="PlasticBlue">
            <FocusedRow BackColor="#F2F2F2" Font-Size="Large" ForeColor="Black">
            </FocusedRow>
            <Header ImageSpacing="10px" SortingImageSpacing="10px">
            </Header>
        </Styles>
        <StylesEditors>
            <CalendarHeader Spacing="11px">
            </CalendarHeader>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
        <Templates>
            <DataRow>
                <div class="wrapctrl">
                    <h3>
                        Datos Personales</h3>
                </div>
                <hr />
                <div class="BaseForm blackfont">
                    <div class="row">
                        <div>
                            Nombre</div>
                    </div>
                    <div class="row">
                        <div class="first">
                            <b>
                                <%# Eval("Nombre") %></b>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="BaseForm blackfont">
                    <div class="row">
                        <div class="first">
                            <div>
                                Celular</div>
                            <b>
                                <%# Eval("Celular") %></b>
                        </div>
                        <div class="Second">
                            <div>
                                E-mail</div>
                            <b>
                                <%# Eval("Email") %></b>
                        </div>
                        <div class="third">
                            <div>
                                Web</div>
                            <b>
                                <%# Eval("Web") %></b>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="BaseForm blackfont">
                    <div class="row">
                        <div>
                            Organizacion</div>
                    </div>
                    <div class="row">
                        <div class="first">
                            <b>
                                <%# Eval("Empresa") %></b>
                        </div>
                        <div class="second">
                             <div>
                                Rol Solicitado</div>
                            <b>
                                <%# Eval("ReqRole") %></b>
                        </div>
                    </div>
                </div>
            </DataRow>
        </Templates>
    </dx:ASPxGridView>
    </div>
    <asp:SqlDataSource ID="SDSEstadoMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        
        SelectCommand="SELECT USER_Entidad.IdEntidad, USER_Entidad.ReqRole,USER_Entidad.Empresa, USER_Entidad.Web, USER_Entidad.username, USER_Entidad.PNombre + ' ' + USER_Entidad.SNombre + ' ' + USER_Entidad.PApellido + ' ' + USER_Entidad.SApellido AS Nombre, USER_Entidad.Celular, aspnet_Membership.Email FROM USER_Entidad INNER JOIN aspnet_Users ON USER_Entidad.username = aspnet_Users.UserName INNER JOIN aspnet_Membership ON aspnet_Users.UserId = aspnet_Membership.UserId WHERE (USER_Entidad.username = @username)">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
    <dx:ASPxPopupControl ID="FormPopup" runat="server" ClientInstanceName="FormPopup"
    AllowDragging="True" AllowResize="True" HeaderText="Actualizacion de perfil" Modal="True"
    PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" ShowFooter="True"
    FooterText="Actualizacion de perfil" PopupVerticalAlign="TopSides" ClientIDMode="AutoID"
    Height="197px" Width="360px" CloseAction="CloseButton">
    <ClientSideEvents CloseUp="function(s, e) {
fn_CleanGroup(1);
}" />
<ClientSideEvents CloseUp="function(s, e) {
fn_CleanGroup(1);
}"></ClientSideEvents>

    <ContentStyle BackColor="#F9F9F9">
    </ContentStyle>
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
            <dx:ASPxCallbackPanel ID="FillingCallback" runat="server" ClientInstanceName="FillingCallback"
                Width="100%" OnCallback="FillingCallback_Callback">
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server">
                        <div class="form">
                            <%--<div>
                                <dx:ASPxLabel ID="lblId" runat="server" Text="Id">
                                </dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtId" runat="server" Width="170px" ClientInstanceName="txtId"
                                    ClientEnabled="true" ReadOnly="True">
                                </dx:ASPxTextBox>
                            </div>--%>
                            <div class="BaseForm">
                                <div class="row">
                                    <div class="first">
                                        <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Primer Nombre">
                                        </dx:ASPxLabel>
                                         <dx:ASPxTextBox ID="txtPNom" runat="server" Width="199px" ClientInstanceName="txtPNom"
                                        ValidationSettings-ValidationGroup="ControlGroup1">
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
<RegularExpression ErrorText="Informacion Requerida"></RegularExpression>

<RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                    </div>
                                </div>
                                <div class="row">
                                <div class="first">
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Segundo Nombre">
                                        </dx:ASPxLabel>
                                         <dx:ASPxTextBox ID="txtSNom" runat="server" Width="199px" ClientInstanceName="txtSNom"
                                        ValidationSettings-ValidationGroup="ControlGroup1">
                                       
<ValidationSettings ValidationGroup="ControlGroup1"></ValidationSettings>
                                       
                                    </dx:ASPxTextBox>
                                    </div>
                                </div>
                                <div class="row">
                                <div class="first">
                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Primer Apellido">
                                        </dx:ASPxLabel>
                                         <dx:ASPxTextBox ID="txtPApel" runat="server" Width="199px" ClientInstanceName="txtPApel"
                                        ValidationSettings-ValidationGroup="ControlGroup1">
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
<RegularExpression ErrorText="Informacion Requerida"></RegularExpression>

<RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                    </div>
                                </div>
                                <div class="row">
                                <div class="first">
                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Segundo Apellido">
                                        </dx:ASPxLabel>
                                         <dx:ASPxTextBox ID="txtSApel" runat="server" Width="199px" ClientInstanceName="txtSApel"
                                        ValidationSettings-ValidationGroup="ControlGroup1">
                                       
<ValidationSettings ValidationGroup="ControlGroup1"></ValidationSettings>
                                       
                                    </dx:ASPxTextBox>
                                    </div>
                                </div>
                               <%-- El email lo estoy obteniendo de membership--%>
                                <%--<div class="row">
                                <div class="first">
                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Email">
                                        </dx:ASPxLabel>
                                         <dx:ASPxTextBox ID="txtMail" runat="server" Width="199px" ClientInstanceName="txtMail"
                                        ValidationSettings-ValidationGroup="ControlGroup1">
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                              <RegularExpression ErrorText="Ingrese un email Valido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Ingrese Email Valido" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                    </div>
                                </div>--%>
                                <div class="row">
                                <div class="first">
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Celular">
                                        </dx:ASPxLabel>
                                         <dx:ASPxTextBox ID="txtCel" runat="server" Width="199px" ClientInstanceName="txtCel"
                                        ValidationSettings-ValidationGroup="ControlGroup1">
                                             <MaskSettings Mask="0000-0000" />
<MaskSettings Mask="0000-0000"></MaskSettings>

                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
<RegularExpression ErrorText="Informacion Requerida"></RegularExpression>

<RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                    </div>
                                </div>
                                <div class="row">
                                <div class="first">
                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Organizacion">
                                        </dx:ASPxLabel>
                                         <dx:ASPxTextBox ID="txtEmpresa" runat="server" Width="199px" ClientInstanceName="txtEmpresa"
                                        ValidationSettings-ValidationGroup="ControlGroup1">
                                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                            SetFocusOnError="True" ValidationGroup="ControlGroup1">
                                            <RegularExpression ErrorText="Informacion Requerida" />
                                            <RequiredField ErrorText="Informacion Requerida" IsRequired="True" />
<RegularExpression ErrorText="Informacion Requerida"></RegularExpression>

<RequiredField IsRequired="True" ErrorText="Informacion Requerida"></RequiredField>
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                    </div>
                                </div>
    <div class="row">
        <div class="first">
            <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Web">
            </dx:ASPxLabel>
            <dx:ASPxTextBox ID="txtWeb" runat="server" Width="199px" ClientInstanceName="txtWeb"
                ValidationSettings-ValidationGroup="ControlGroup1">
<ValidationSettings ValidationGroup="ControlGroup1"></ValidationSettings>
            </dx:ASPxTextBox>
        </div>
    </div>
    <div class="row">
        <div class="first">
            <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Rol Solicitado">
            </dx:ASPxLabel>
            <dx:ASPxComboBox runat="server" ID="cmbRol" Width="199px" ClientInstanceName="cmbRol"
                ValidationSettings-ValidationGroup="ControlGroup1">
                <Items>
                    <dx:ListEditItem Text="Usuario Uca" Value="Usuario Uca" />
                    <dx:ListEditItem Text="Cliente" Value="Cliente" />
                    <dx:ListEditItem Text="Técnico" Value="Técnico" />
                </Items>
<ValidationSettings ValidationGroup="ControlGroup1"></ValidationSettings>
            </dx:ASPxComboBox>
        </div>
    </div>
    </div>
    </div>
    <div>
        <ul class="frmctrl centerctrl">
            <li><a class="pure-button green-font" href="javascript:fn_SaveProfileJS()" title="Guardar">
                <i class="fa fa-floppy-o"></i>Guardar</a></li>
                                    <li><a class="pure-button red-font" href="javascript:fn_CancelJS()" title="Cancelar"><i class="fa fa-times">
                                    </i>Cancelar</a></li>
                                    <li><a class="pure-button yellow-font" href="javascript:fn_CleanGroup(1);" title="Limpiar"><i
                                        class="fa fa-repeat"></i>Limpiar</a></li>
                                </ul>
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>

