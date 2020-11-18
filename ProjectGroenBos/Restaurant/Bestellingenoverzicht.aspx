<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="Bestellingenoverzicht.aspx.cs" Inherits="ProjectGroenBos.Restaurant.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bestellingenoverzicht.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="werkgebied">
        <h1 class="paginatitel">Bestellingen overzicht</h1>

        <div class="bestellingvak">
            <div class="tafelnummer">
                <asp:Label ID="lblTafelnr1" runat="server" Text="Tafelnr"></asp:Label>
            </div>
            <asp:DataList ID="dtlBestelling1" class="Datalist" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="bestellingrij">
                        <asp:Image ID="imgProduct1" class="ProductImg" runat="server" ImageUrl='<%# Eval("Afbeelding") %>' />
                        <asp:Label ID="lblProduct1" class="ProductNaam" runat="server" Text='<%# Eval("Naam") %>'></asp:Label>
                        <asp:Label ID="lblX1" class="Aantal" runat="server" Text="x"></asp:Label>
                        <asp:Label ID="lblAantal1" class="Aantal" runat="server" Text='<%# Eval("Aantal") %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <div class="gereed">

            </div>
        </div>




        <div class="bestellingvak">
            <div class="tafelnummer">
                <asp:Label ID="lblTafelnr2" runat="server" Text="Tafelnr"></asp:Label>
            </div>
            <asp:DataList ID="dtlBestelling2" class="Datalist" runat="server" DataSourceID="SqlDataSource2">
                <ItemTemplate>
                    <div class="bestellingrij">
                        <asp:Image ID="imgProduct1" class="ProductImg" runat="server" ImageUrl='<%# Eval("Afbeelding") %>' />
                        <asp:Label ID="lblProduct1" class="ProductNaam" runat="server" Text='<%# Eval("Naam") %>'></asp:Label>
                        <asp:Label ID="lblX1" class="Aantal" runat="server" Text="x"></asp:Label>
                        <asp:Label ID="lblAantal1" class="Aantal" runat="server" Text='<%# Eval("Aantal") %>'></asp:Label>
                        
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>




        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT *
        FROM (Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID
        WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde = (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld')"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT *
        FROM (Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID
        WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde = 
        (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;
        (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld'))"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>

    </div>
</asp:Content>
