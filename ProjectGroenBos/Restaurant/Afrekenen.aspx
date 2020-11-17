<%@ Page Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="Afrekenen.aspx.cs" Inherits="ProjectGroenBos.Restaurant.Afrekenen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/Afrekenen.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="werkgebied">
        <asp:Label ID="lblBetalen" runat="server" Text="betalen"></asp:Label>
        <asp:Label ID="lbltafel" runat="server" Text="Tafel"></asp:Label>
            <div class="GdvContainer">
            <asp:GridView class="Gdv1" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="ReserveringsNr" HeaderText="ReserveringsNr" InsertVisible="False" ReadOnly="True" SortExpression="ReserveringsNr" />
                    <asp:BoundField DataField="Ronde" HeaderText="Ronde" SortExpression="Ronde" />
                    <asp:BoundField DataField="Ronde" HeaderText="Prijs" SortExpression="Prijs" />

                </Columns>             
                <HeaderStyle CssClass="GdvHeader"/>
                <RowStyle CssClass="GdvRow"/>
                
            </asp:GridView>
        </div>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT Item_RestaurantReservering.Aantal, RestaurantReservering.ID AS ReserveringsNr, Item_RestaurantReservering.Ronde
FROM (Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID
"></asp:SqlDataSource>

        <asp:Label ID="lblTotaal" runat="server" Text="Totaal"></asp:Label>
        <asp:Label ID="lblPrijs" runat="server" Text="€ 0,00"></asp:Label>
        <asp:Button ID="btnRekening" runat="server" Text="Op rekening" />
        <asp:Button ID="btnBetalen" runat="server" Text="Betalen" />
    </div>
</asp:Content>
