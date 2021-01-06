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

    <script>$(document).ready(function () {
    var date = date.getDate();
    var maand = date.getMonth();
    var jaar = date.getFullYear();

                $(function () {
                    $("#<%= txbDatum.ClientID %>").datepicker({
                        changeYear: true,
                        changeMonth: true,
                        minDate: new Date(jaar, maand, date),
                        maxDate: 0,
                    });
                });
});

    </script>

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
        <asp:TextBox ID="txbDatum" runat="server" CssClass="auto-style1"></asp:TextBox>
        <br />

        <asp:Button ID="btnZoek" runat="server" Text="Zoek" CssClass="btnUitloggen" OnClick="btnZoek_Click" Style="background-color: #009879; color: #fff" class="btn" />

        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" AutoGenerateSelectButton="True" CssClass="content-table" DataKeyNames="Nummer van reservering" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
            <Columns>
                <asp:BoundField DataField="Nummer van reservering" HeaderText="Nummer van reservering" InsertVisible="False" ReadOnly="True" SortExpression="Nummer van reservering" />
                <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Aantal personen" HeaderText="Aantal personen" SortExpression="Aantal personen" />
                <asp:BoundField DataField="Aankomstdatum" HeaderText="Aankomstdatum" SortExpression="Aankomstdatum" DataFormatString="{0:dd-MM-yyyy}" />
                <asp:BoundField DataField="Vertrekdatum" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Vertrekdatum" SortExpression="Vertrekdatum" />
            </Columns>
            <HeaderStyle ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="select res.Nummer as [Nummer van reservering], gst.Achternaam, gst.Email, res.Aantal_personen as [Aantal personen], res.Aankomstdatum, res.Vertrekdatum from Gast gst inner join Reservering res on gst.Nummer = res.GastNummer inner join Adres adr on adr.GastNummer = gst.Nummer where gst.Achternaam like @zoek and Aankomstdatum &gt;= convert(date, GETDATE()) and Aankomstdatum &lt;= @datum and ReserveringsstatusID != 5 order by res.Nummer">
            <SelectParameters>
                <asp:ControlParameter ControlID="txbAchternaam" Name="zoek" PropertyName="Text" />
                <asp:ControlParameter ControlID="txbDatum" Name="datum" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>

        <br />
        <asp:Label ID="lblUitkomst" runat="server" CssClass="labelsnieuw"></asp:Label>
        <br />
        <br />



        <asp:Button ID="btnToWijzigen" runat="server" Text="Wijzigen" CssClass="btnUitloggen" OnClick="btnToWijzigen_Click" Style="background-color: #009879; color: #fff" class="btn" />
        <asp:Button ID="btnToAnnuleren" runat="server" Text="Annuleren" CssClass="btnUitloggen" OnClick="btnToAnnuleren_Click" Style="background-color: #009879; color: #fff" class="btn" />


        <br />

    </div>

</asp:Content>

