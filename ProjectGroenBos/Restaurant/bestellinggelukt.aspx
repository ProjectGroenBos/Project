<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="bestellinggelukt.aspx.cs" Inherits="ProjectGroenBos.Restaurant.bestellinggelukt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblConfirm" runat="server" Text="Uw bestelling is doorgegeven!"></asp:Label>
    <asp:GridView ID="grvBestelling" runat="server">
    </asp:GridView>
    <asp:Button ID="btnTerug" runat="server" OnClick="btnTerug_Click" Text="Terug" />
</asp:Content>
