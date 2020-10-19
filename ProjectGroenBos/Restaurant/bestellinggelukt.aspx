<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="bestellinggelukt.aspx.cs" Inherits="ProjectGroenBos.Restaurant.bestellinggelukt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblConfirm" runat="server" Text="Uw bestelling is doorgegeven!"></asp:Label>
<<<<<<< HEAD
    <asp:GridView ID="grvBestelling" runat="server">
    </asp:GridView>
=======
    <asp:GridView ID="grvBestelling" runat="server" AutoGenerateColumns="False" DataKeyNames="ActiviteitNummer,GastNummer" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="ActiviteitNummer" HeaderText="ActiviteitNummer" ReadOnly="True" SortExpression="ActiviteitNummer" />
            <asp:BoundField DataField="GastNummer" HeaderText="GastNummer" ReadOnly="True" SortExpression="GastNummer" />
            <asp:BoundField DataField="Aantal personen" HeaderText="Aantal personen" SortExpression="Aantal personen" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT * FROM [Aanmelding]"></asp:SqlDataSource>
>>>>>>> origin/RestaurantTeam/Kevin
    <asp:Button ID="btnTerug" runat="server" OnClick="btnTerug_Click" Text="Terug" />
</asp:Content>
