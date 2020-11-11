<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="ReserveringAnnuleren.aspx.cs" Inherits="ProjectGroenBos.Reservering.ReserveringAnnulerenSherm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <br />
    <br />
    <asp:Label ID="Label11" runat="server" Text="Gast nummer:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblGastnummer" runat="server" CssClass="labelsnieuw" ></asp:Label>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Voornaam:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblVoornaam" runat="server" CssClass="labelsnieuw"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
    <asp:Label ID="Label2" runat="server" Text="Tussenvoegsel:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblTussenvoegsel" runat="server" CssClass="labelsnieuw"></asp:Label>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Achternaam" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblAchternaam" runat="server" CssClass="labelsnieuw"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
    <asp:Label ID="Label4" runat="server" Text="E-mail" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblEmail" runat="server" CssClass="labelsnieuw"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <br />
    <asp:Label ID="Label5" runat="server" Text="Telefoonnummer" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblTelefoonnummer" runat="server" CssClass="labelsnieuw"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <br />
    <asp:Label ID="Label6" runat="server" Text="Reseveringsnummer:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblReserveringsnummer" runat="server"  CssClass="labelsnieuw"></asp:Label>
    <br />
    <asp:Label ID="Label7" runat="server" Text="Aantal Personen:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblAantalPersonen" runat="server" CssClass="labelsnieuw"></asp:Label>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    <asp:Label ID="Label8" runat="server" Text="Opmerkingen" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblOpmerkingen" runat="server" CssClass="labelsnieuw"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<br />
    <asp:Label ID="Label9" runat="server" Text="Aankomstdatum:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblAankomstdatum" runat="server" CssClass="labelsnieuw"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
    <asp:Label ID="Label10" runat="server" Text="Vertrekdatum:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblVertrekdatum" runat="server" CssClass="labelsnieuw"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
    <asp:GridView ID="GridView1" runat="server" CssClass="labelsnieuw">
    </asp:GridView>
    <br />
    <br />
    <asp:Button ID="btnverwijderen" runat="server" Text="Verwijderen" CssClass ="labelsnieuw" OnClick="btnWijzigen_Click" />
    <br />
    <br />
    <br />
</asp:Content>
