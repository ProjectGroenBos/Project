<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="bestellingenoverzicht.aspx.cs" Inherits="ProjectGroenBos.bestellingenoverzicht" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <link href="css/opnemenbestelling.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:GridView ID="GridView1" runat="server" Height="494px" Width="771px" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Style="margin-right: 62%">
        <Columns>
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="Aantal" HeaderText="Aantal" SortExpression="Aantal" />
            <asp:BoundField DataField="ReserveringsNr" HeaderText="ReserveringsNr" InsertVisible="False" ReadOnly="True" SortExpression="ReserveringsNr" />
            <asp:BoundField DataField="Ronde" HeaderText="Ronde" SortExpression="Ronde" />

            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton OnClick="lnkClickMe_Click"
                        runat="server" Text="Gereed" CommandArgument='<%# Eval("Naam") + ";" + Eval("ReserveringsNr") + ";" + Eval("Ronde")%>' />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT Item.Naam, Item_RestaurantReservering.Aantal, RestaurantReservering.ID AS ReserveringsNr, Item_RestaurantReservering.Ronde
FROM (Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID 
Where Status = 'Besteld'"></asp:SqlDataSource>
</asp:Content>
