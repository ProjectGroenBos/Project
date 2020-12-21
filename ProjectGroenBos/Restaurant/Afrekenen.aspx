<%@ Page Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="Afrekenen.aspx.cs" Inherits="ProjectGroenBos.Restaurant.Afrekenen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/Afrekenen.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="werkgebied">
        <asp:Label ID="lblBetalen" class="paginatitel" runat="server" Text="Afrekenen"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lbltafel" CssClass="lblTafel" runat="server" Text="Tafel"></asp:Label>
        <%--<asp:Label ID="lblnummer" CssClass="lblTafel" runat="server" Text="0"></asp:Label> --%>
            <div class="Factuurregelbak">
            <asp:GridView class="GvOrder" ID="GvOrder" runat="server" AutoGenerateColumns="False" DataSourceID="factuurregels" AllowSorting="True" GridLines="None" DataKeyNames="Hoeveel,Prijs,Item_ID">
                <Columns>
                    <asp:BoundField DataField="Hoeveel" HeaderText="Hoeveel" SortExpression="Hoeveel" >
                     </asp:BoundField>
                    <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" >
                     </asp:BoundField>
                    <asp:BoundField DataField="Prijs" HeaderText="Prijs" SortExpression="Prijs">
                     </asp:BoundField>
                    <asp:BoundField DataField="RegelTotaal" HeaderText="RegelTotaal" ReadOnly="True" SortExpression="RegelTotaal" />
                    <asp:BoundField DataField="Item_ID" HeaderText="Item_ID" SortExpression="Item_ID" Visible="False">
                     </asp:BoundField>

                </Columns>             
                <HeaderStyle CssClass="GdvHeader"/>
                <RowStyle CssClass="GdvRow"/>
                
            </asp:GridView>
        </div>
         <asp:SqlDataSource ID="factuurregels" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" ></asp:SqlDataSource>


        <%--Het totaal bedrag zichtbaar maken--%>
        <%--<asp:Label ID="LblKostenTotaal" runat="server" Text="€ "></asp:Label>--%>
            <asp:GridView class="Gdvtotaal" ID="GridViewTotaal" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceTotaal" AllowSorting="True" GridLines="None" DataKeyNames="TotaalBedrag">
                <Columns>
                    <asp:BoundField DataField="Totaalbedrag" HeaderText="Totaalbedrag" ReadOnly="True" SortExpression="Totaalbedrag" />
                </Columns>
            </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceTotaal" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" ></asp:SqlDataSource>

        <div class="btnbak">
            <asp:Button ID="btnRekening" CssClass="buttongreen" runat="server" Text="Op rekening" OnClick="btnRekening_Click" />
            <asp:Button ID="btnBetalen" CssClass="buttongreen" runat="server" Text="Pin" OnClick="btnBetalen_Click" />
            <asp:Button ID="BtnContant" CssClass="buttongreen" runat="server" Text="Contant" OnClick="btnContant_Click" />
        </div>
        <asp:Label ID="LblSucces" runat="server"></asp:Label>
    </div>
</asp:Content>
