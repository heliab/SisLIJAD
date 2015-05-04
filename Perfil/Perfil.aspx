<%@ Page Title="" Language="C#" MasterPageFile="~/Perfil/PerfilMaster.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="SisLIJAD.Perfil.Perfil" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
<div class="wrapctrl">
        <ul class="ctrlist">
            <li><a class="pure-button blue-font" href="javascript:fn_NewJS();" title="Nuevo"><i
                class="fa fa-user"></i>Editar Datos</a></li>

        </ul>
    </div>
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
                    </div>
                </div>
            </DataRow>
        </Templates>
    </dx:ASPxGridView>
    </div>
    <asp:SqlDataSource ID="SDSEstadoMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
        SelectCommand="SELECT IdEntidad, Empresa, Email, Web, username, PNombre+' '+ SNombre+ ' '+PApellido+' ' + SApellido as Nombre, Celular FROM USER_Entidad WHERE (username = @username)">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
