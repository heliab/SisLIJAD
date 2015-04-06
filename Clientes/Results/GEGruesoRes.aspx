<%@ Page Title="" Language="C#" MasterPageFile="~/Clientes/ClientesMASTER.Master" AutoEventWireup="true" CodeBehind="GEGruesoRes.aspx.cs" Inherits="SisLIJAD.Clientes.Results.GEGruesoRes" %>

<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
<div class="BaseForm wraptitle">
        <div class="row">
            <div class="first">
                <div class="Titulo2">
                    Gravedad Especifica Corriente Agregado Grueso
                </div>
            </div>
            <div>
                <ul class="ctrlist2 ctrleft">
                    <li><a class="pure-button blue-font" href="javascript:fn_NewJS();" title="Nuevo"><i
                        class="fa fa-list"></i>Checklist</a></li>
                    <li><a class="pure-button green-font" href="javascript:fn_EditJS();" title="Editar">
                        <i class="fa fa-search"></i>Ver ficha</a></li>
                </ul>
            </div>
        </div>
    </div>

    </dx:ASPxCallback>
    <dx:ASPxHiddenField ID="HiddenV" runat="server" ClientInstanceName="HiddenV">
    </dx:ASPxHiddenField>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
<dx:ASPxGridView ID="GridResultados" runat="server" ClientInstanceName="GridResultados"
            OnCustomCallback="GridResultados_CustomCallback" Width="100%" AutoGenerateColumns="False"
            ClientIDMode="AutoID" DataSourceID="SDSEnsayes" KeyFieldName="Codigo">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Codigo" ReadOnly="True" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FechaEmisionIndiv" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="C127_A_Ge" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="C127_B_Ge" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="C127_C_Ge" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="C127_OD_Result" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPager AlwaysShowPager="True" PageSize="5">
                <Summary AllPagesText="Páginas: {0} - {1} ({2} items)" Text="Página {0} of {1} ({2} items)" />
            </SettingsPager>
            <Settings ShowFilterRow="True" />
            <SettingsText EmptyDataRow="No hay resultados que mostrar" />
            <Styles>
                <FocusedRow BackColor="#5180BF">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SDSEnsayes" runat="server" ConnectionString="<%$ ConnectionStrings:BDLabsConnectionString %>"
              SelectCommand="SELECT CAST(MPR_Solic_Pruebas.IdSolicPrueba AS NVARCHAR) + '.' + CAST(MPR_Prueba.IdPrueba AS NVARCHAR) + '.' + CAST(MPR_Det_Result_Prueba.IdCalc AS NVARCHAR) AS Codigo, MPR_Det_Result_Prueba.FechaEmisionIndiv, MPR_Det_Result_Prueba.C127_A_Ge, MPR_Det_Result_Prueba.C127_B_Ge, MPR_Det_Result_Prueba.C127_C_Ge, MPR_Det_Result_Prueba.C127_OD_Result FROM MPR_Solic_Pruebas INNER JOIN MPR_Det_Result_Prueba ON MPR_Solic_Pruebas.IdSolicPrueba = MPR_Det_Result_Prueba.IdSolicPrueba INNER JOIN MPR_Prueba ON MPR_Det_Result_Prueba.IdPrueba = MPR_Prueba.IdPrueba WHERE (MPR_Solic_Pruebas.Autorizado = 1) AND (MPR_Solic_Pruebas.IdSolicPrueba = @Sol) AND (MPR_Prueba.IdPrueba = @Pr)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Sol" QueryStringField="Sol" />
                <asp:QueryStringParameter Name="Pr" QueryStringField="Pr" />
            </SelectParameters>
        </asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
