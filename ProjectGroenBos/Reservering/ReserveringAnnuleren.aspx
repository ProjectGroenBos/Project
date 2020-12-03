<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="ReserveringAnnuleren.aspx.cs" Inherits="ProjectGroenBos.Reservering.ReserveringAnnulerenSherm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <h1>Reservering annuleren</h1>
    <br />
    <br />
    <asp:Label ID="Label11" runat="server" Text="Gast nummer:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblGastnummer" runat="server" CssClass="labelsnieuw"></asp:Label>

    <br />
    <asp:Label ID="Label1" runat="server" Text="Voornaam:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblVoornaam" runat="server" CssClass="labelsnieuw"></asp:Label>

    <br />
    <asp:Label ID="Label2" runat="server" Text="Tussenvoegsel:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblTussenvoegsel" runat="server" CssClass="labelsnieuw"></asp:Label>

    <br />
    <asp:Label ID="Label3" runat="server" Text="Achternaam" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblAchternaam" runat="server" CssClass="labelsnieuw"></asp:Label>

    <br />
    <asp:Label ID="Label4" runat="server" Text="E-mail" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblEmail" runat="server" CssClass="labelsnieuw"></asp:Label>

    <br />
    <asp:Label ID="Label5" runat="server" Text="Telefoonnummer" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblTelefoonnummer" runat="server" CssClass="labelsnieuw"></asp:Label>

    <br />
    <asp:Label ID="Label6" runat="server" Text="Reseveringsnummer:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblReserveringsnummer" runat="server" CssClass="labelsnieuw"></asp:Label>

    <br />
    <asp:Label ID="Label7" runat="server" Text="Aantal Personen:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblAantalPersonen" runat="server" CssClass="labelsnieuw"></asp:Label>

    <br />
    <asp:Label ID="Label8" runat="server" Text="Opmerkingen" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblOpmerkingen" runat="server" CssClass="labelsnieuw"></asp:Label>

    <br />
    <asp:Label ID="Label9" runat="server" Text="Aankomstdatum:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblAankomstdatum" runat="server" CssClass="labelsnieuw"></asp:Label>

    <br />
    <asp:Label ID="Label10" runat="server" Text="Vertrekdatum:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblVertrekdatum" runat="server" CssClass="labelsnieuw"></asp:Label>

    <br />
    <asp:Label ID="Label12" runat="server" Text="Straat:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblStraat" runat="server" CssClass="labelsnieuw"></asp:Label>

    <br />
    <asp:Label ID="Label13" runat="server" Text="huisnummer:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblHuisnummer" runat="server" CssClass="labelsnieuw"></asp:Label>

    <br />
    <asp:Label ID="Label14" runat="server" Text="Postcode:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblPostcode" runat="server" CssClass="labelsnieuw"></asp:Label>

    <br />
    <asp:Label ID="Label15" runat="server" Text="Land:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblLand" runat="server" CssClass="labelsnieuw"></asp:Label>

    <br />
    <asp:Label ID="Label16" runat="server" Text="Totaalprijs" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblPrijs" runat="server" CssClass="labelsnieuw"></asp:Label>

    <br />
        <asp:Label ID="lblTotaalText" runat="server" CssClass="labelsnieuw" Text="Bedrag te storten"></asp:Label>
        <asp:Label ID="lblStorten" runat="server" CssClass="labelsnieuw"></asp:Label>

    <br />
    <asp:Button ID="btnverwijderen" runat="server" Text="Annuleren" CssClass="labelsnieuw" OnClick="btnWijzigen_Click" />
    <br />
    <br />

    <asp:GridView ID="GridView1" runat="server" CssClass="content-table" DataKeyNames="GastNummer,Voornaam,Tussenvoegsel,Achternaam,Email,Telefoonnummer,Nummer,Aantal_personen,Aankomstdatum,Vertrekdatum,Opmerking,Straatnaam,Huisnummer,Postcode,Land">
    </asp:GridView>

    <br />
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="gridv" DataKeyNames="Aanbetaling,Totaalprijs,Verschil,Nummer" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Aanbetaling" HeaderText="Aanbetaling" ReadOnly="True" SortExpression="Aanbetaling" />
            <asp:BoundField DataField="Totaalprijs" HeaderText="Totaalprijs" ReadOnly="True" SortExpression="Totaalprijs" />
            <asp:BoundField DataField="Verschil" HeaderText="Verschil" ReadOnly="True" SortExpression="Verschil" />
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="True" SortExpression="Nummer" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT * FROM [Verschil] WHERE ([Nummer] = @Nummer)">
        <SelectParameters>
            <asp:SessionParameter Name="Nummer" SessionField="reserveringsnummer" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
