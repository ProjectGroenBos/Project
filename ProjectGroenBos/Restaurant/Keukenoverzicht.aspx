<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="Keukenoverzicht.aspx.cs" Inherits="ProjectGroenBos.Restaurant.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bestellingenoverzicht.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="header">
        Keuken Overzicht
    </header>

    <div class="cocacontainer">

        <div class="werkgebied">

            <div class="bestellingvak">
                <div class="tafelnummer">
                    <asp:DataList ID="dtlTafelnr" class="DatalistTafelnr" runat="server" DataSourceID="SqlDataSource6">
                        <ItemTemplate>
                            Tafel
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Column1") %>'></asp:Label>
                        </ItemTemplate>

                    </asp:DataList>
                </div>
                <div class="dtlvak">
                    <asp:DataList ID="dtlBestelling1" class="Datalist" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <div class="bestellingrij">
                                <asp:Image ID="imgProduct" class="ProductImg" runat="server" ImageUrl='<%# Eval("Afbeelding") %>' />
                                <asp:Label ID="lblProduct" class="ProductNaam" runat="server" Text='<%# Eval("Naam") %>'></asp:Label>
                                <asp:Label ID="lblX" class="Aantal" runat="server" Text="x"></asp:Label>
                                <asp:Label ID="lblAantal" class="Aantal" runat="server" Text='<%# Eval("Aantal") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <asp:Button ID="btnGereed1" class="gereedknop" runat="server" Text="Gereed" OnClick="btnGereed1_Click" />
            </div>

            <div class="bestellingvak">
                <div class="tafelnummer">
                    <asp:DataList ID="dtlTafelnr0" class="DatalistTafelnr" runat="server" DataSourceID="SqlDataSource7">
                        <ItemTemplate>
                            Tafel
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Column1") %>'></asp:Label>
                        </ItemTemplate>

                    </asp:DataList>
                </div>
                <div class="dtlvak">
                    <asp:DataList ID="dtlBestelling2" class="Datalist" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <div class="bestellingrij">
                                <asp:Image ID="imgProduct" class="ProductImg" runat="server" ImageUrl='<%# Eval("Afbeelding") %>' />
                                <asp:Label ID="lblProduct" class="ProductNaam" runat="server" Text='<%# Eval("Naam") %>'></asp:Label>
                                <asp:Label ID="lblX" class="Aantal" runat="server" Text="x"></asp:Label>
                                <asp:Label ID="lblAantal" class="Aantal" runat="server" Text='<%# Eval("Aantal") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <asp:Button ID="btnGereed2" class="gereedknop" runat="server" Text="Gereed" OnClick="btnGereed2_Click" />
            </div>

            <div class="bestellingvak">
                <div class="tafelnummer">
                    <asp:DataList ID="dtlTafelnr1" class="DatalistTafelnr" runat="server" DataSourceID="SqlDataSource8">
                        <ItemTemplate>
                            Tafel
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Column1") %>'></asp:Label>
                        </ItemTemplate>

                    </asp:DataList>
                </div>
                <div class="dtlvak">
                    <asp:DataList ID="dtlBestelling3" class="Datalist" runat="server" DataSourceID="SqlDataSource3">
                        <ItemTemplate>
                            <div class="bestellingrij">
                                <asp:Image ID="imgProduct" class="ProductImg" runat="server" ImageUrl='<%# Eval("Afbeelding") %>' />
                                <asp:Label ID="lblProduct" class="ProductNaam" runat="server" Text='<%# Eval("Naam") %>'></asp:Label>
                                <asp:Label ID="lblX" class="Aantal" runat="server" Text="x"></asp:Label>
                                <asp:Label ID="lblAantal" class="Aantal" runat="server" Text='<%# Eval("Aantal") %>'></asp:Label>

                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <asp:Button ID="btnGereed3" class="gereedknop" runat="server" Text="Gereed" OnClick="btnGereed3_Click" />
            </div>

            <div class="bestellingvak">
                <div class="tafelnummer">
                    <asp:DataList ID="dtlTafelnr2" class="DatalistTafelnr" runat="server" DataSourceID="SqlDataSource9">
                        <ItemTemplate>
                            Tafel
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Column1") %>'></asp:Label>
                        </ItemTemplate>

                    </asp:DataList>
                </div>
                <div class="dtlvak">
                    <asp:DataList ID="dtlBestelling4" class="Datalist" runat="server" DataSourceID="SqlDataSource4">
                        <ItemTemplate>
                            <div class="bestellingrij">
                                <asp:Image ID="imgProduct" class="ProductImg" runat="server" ImageUrl='<%# Eval("Afbeelding") %>' />
                                <asp:Label ID="lblProduct" class="ProductNaam" runat="server" Text='<%# Eval("Naam") %>'></asp:Label>
                                <asp:Label ID="lblX" class="Aantal" runat="server" Text="x"></asp:Label>
                                <asp:Label ID="lblAantal" class="Aantal" runat="server" Text='<%# Eval("Aantal") %>'></asp:Label>

                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <asp:Button ID="btnGereed4" class="gereedknop" runat="server" Text="Gereed" />
            </div>

            <div class="bestellingvak">
                <div class="tafelnummer">
                    <asp:DataList ID="dtlTafelnr3" class="DatalistTafelnr" runat="server" DataSourceID="SqlDataSource10">
                        <ItemTemplate>
                            Tafel
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Column1") %>'></asp:Label>
                        </ItemTemplate>

                    </asp:DataList>
                </div>
                <div class="dtlvak">
                    <asp:DataList ID="dtlBestelling5" class="Datalist" runat="server" DataSourceID="SqlDataSource5">
                        <ItemTemplate>
                            <div class="bestellingrij">
                                <asp:Image ID="imgProduct" class="ProductImg" runat="server" ImageUrl='<%# Eval("Afbeelding") %>' />
                                <asp:Label ID="lblProduct" class="ProductNaam" runat="server" Text='<%# Eval("Naam") %>'></asp:Label>
                                <asp:Label ID="lblX" class="Aantal" runat="server" Text="x"></asp:Label>
                                <asp:Label ID="lblAantal" class="Aantal" runat="server" Text='<%# Eval("Aantal") %>'></asp:Label>

                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <asp:Button ID="btnGereed5" class="gereedknop" runat="server" Text="Gereed" />
            </div>




            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT *
        FROM (Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID
        WHERE Status = 'Besteld' AND Type != 'Drank' AND Item_RestaurantReservering.Ronde = (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT *
        FROM (Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID
        WHERE Status = 'Besteld' AND Type != 'Drank' AND Item_RestaurantReservering.Ronde = 
        (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;
        (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld'))"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT *
        FROM (Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID
        WHERE Status = 'Besteld' AND Type != 'Drank' AND Item_RestaurantReservering.Ronde = 
        (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;(SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;
        (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld')))"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT *
        FROM (Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID
        WHERE Status = 'Besteld' AND Type != 'Drank' AND Item_RestaurantReservering.Ronde = 
        (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;(SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;
        (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;(SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld'))))"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT *
        FROM (Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID
        WHERE Status = 'Besteld' AND Type != 'Drank' AND Item_RestaurantReservering.Ronde = 
        (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;(SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;
        (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;(SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;(SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld')))))"></asp:SqlDataSource>




            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT MAX(Item_RestaurantReservering.Tafelnr)       FROM (Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID
        WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde = (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT MAX(Item_RestaurantReservering.Tafelnr)       FROM (Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID
        WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde = 
        (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;
        (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld'))"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT MAX(Item_RestaurantReservering.Tafelnr)       FROM (Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID
        WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde = 
        (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;(SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;
        (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld')))"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT MAX(Item_RestaurantReservering.Tafelnr)       FROM (Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID
        WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde = 
        (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;(SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;
        (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;(SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld'))))"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT MAX(Item_RestaurantReservering.Tafelnr)       FROM (Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID
        WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde = 
        (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;(SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;
        (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;(SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde &gt;(SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld')))))"></asp:SqlDataSource>

        </div>
    </div>
</asp:Content>
