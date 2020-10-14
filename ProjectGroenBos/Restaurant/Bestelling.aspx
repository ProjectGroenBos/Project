<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="Bestelling.aspx.cs" Inherits="ProjectGroenBos.Restaurant.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblSelectedProducts2" runat="server" Text=""></asp:Label>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Restaurant/bestellingopnemen.aspx">terug</asp:HyperLink>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="266px" OnRowDeleting="GridView1_RowDeleting" Width="728px">
        <Columns>
            <asp:BoundField DataField="sno" HeaderText="S. No" />
            <asp:ImageField DataImageUrlField="Afbeelding" HeaderText="Afbeelding">
            </asp:ImageField>
            <asp:BoundField DataField="Naam" HeaderText="Naam" />
            <asp:BoundField DataField="Prijs" HeaderText="Prijs" />
            <asp:BoundField DataField="Hoeveelheid" HeaderText="Hoeveelheid" />
            <asp:BoundField DataField="TotalePrijs" HeaderText="Totale Prijs" />
            <asp:CommandField DeleteText="Verwijder" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>
