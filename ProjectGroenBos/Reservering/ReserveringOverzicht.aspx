<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="ReserveringOverzicht.aspx.cs" Inherits="ProjectGroenBos.Reservering.ReserveringAnnuleren" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            left: 75px;
            top: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">


    <div class="container">


        <h1>Reservering overzicht</h1>
        <br />

        Zoek op de achternaam en kijk of diegene een reservering heeft staan om de<br />
        reservering te annuleren als ze bellen of aan de balie staan.<br />

        <br />
        <asp:Label ID="Label1" runat="server" Text="Zoek op: " CssClass="labelsnieuw"></asp:Label>
        <asp:TextBox ID="txbAchternaam" runat="server" CssClass="auto-style1"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Datum tot en met:" CssClass="labelsnieuw"></asp:Label>
        <asp:TextBox ID="txbDatum" runat="server" CssClass="auto-style1" TextMode="Date"></asp:TextBox>
        <br />

        <asp:Button ID="btnZoek" runat="server" Text="Zoek" CssClass="btnUitloggen" OnClick="btnZoek_Click" Style="background-color: #009879; color: #fff" class="btn" />

        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="content-table"  AllowSorting="True" >
            <HeaderStyle ForeColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Nummer" HeaderText="Reservering nummer" />
                <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Telefoonnummer" HeaderText="Telefoonnummer" />
                <asp:BoundField DataField="Aantal personen" HeaderText="Aantal personen" />
                <asp:BoundField DataField="Aankomstdatum" HeaderText="Aankomstdatum" />
                <asp:BoundField DataField="Vertrekdatum" HeaderText="Vertrektaum" />
                
            </Columns>
        </asp:GridView>

        <br />
        <asp:Label ID="lblUitkomst" runat="server" CssClass="labelsnieuw"></asp:Label>
        <br />
        <br />



        <asp:Button ID="btnToWijzigen" runat="server" Text="Wijzigen" CssClass="btnUitloggen" OnClick="btnToWijzigen_Click" Style="background-color: #009879; color: #fff" class="btn" />
        <asp:Button ID="btnToAnnuleren" runat="server" Text="Annuleren" CssClass="btnUitloggen" OnClick="btnToAnnuleren_Click" Style="background-color: #009879; color: #fff" class="btn" />


        <br />

    </div>

</asp:Content>

