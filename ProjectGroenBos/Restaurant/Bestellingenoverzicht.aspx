<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="Bestellingenoverzicht.aspx.cs" Inherits="ProjectGroenBos.Restaurant.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="btnWijzigen" runat="server" Height="34px" Text="wijzigen" Width="82px" />
    <asp:Button ID="btnBestellingGereed" runat="server" Text="Bestelling gereed" />
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" Height="195px" Width="521px">
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <link rel="stylesheet" href="css/bestellingenoverzicht.css">
    </asp:Content>
