<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="bestellingenoverzicht.aspx.cs" Inherits="ProjectGroenBos.bestellingenoverzicht" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:GridView ID="GridView1" runat="server" Height="367px" Width="575px">
     </asp:GridView>
     <asp:Button ID="btnBestellingGereed" runat="server" Text="Bestelling gereed" />
     <asp:Button ID="btnWijzigen" runat="server" Text="Wijzigen" />
     <link rel="stylesheet" href=" css/Bestellingenoverzicht.css" >





















</asp:Content>
