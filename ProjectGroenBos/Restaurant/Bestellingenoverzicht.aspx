<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="bestellingenoverzicht.aspx.cs" Inherits="ProjectGroenBos.bestellingenoverzicht" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/Bestellingenoverzicht.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="werkgebied">
        <div class="GdvContainer">
            <asp:GridView class="Gdv1" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
                    <asp:BoundField DataField="Aantal" HeaderText="Aantal" SortExpression="Aantal" />
                    <asp:BoundField DataField="ReserveringsNr" HeaderText="ReserveringsNr" InsertVisible="False" ReadOnly="True" SortExpression="ReserveringsNr" />
                    <asp:BoundField DataField="Ronde" HeaderText="Ronde" SortExpression="Ronde" />

                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                                <asp:LinkButton class="GereedKnop" OnClick="lnkClickMe_Click" runat="server" Text="Gereed" CommandArgument='<%# Eval("Naam") + ";" + Eval("ReserveringsNr") + ";" + Eval("Ronde")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>             
                <HeaderStyle CssClass="GdvHeader"/>
                <RowStyle CssClass="GdvRow"/>
                
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT Item.Naam, Item_RestaurantReservering.Aantal, RestaurantReservering.ID AS ReserveringsNr, Item_RestaurantReservering.Ronde
FROM (Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID 
Where Status = 'Besteld'"></asp:SqlDataSource>
    </div>
</asp:Content>
