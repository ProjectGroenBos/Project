<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="ReserveringCompleet.aspx.cs" Inherits="ProjectGroenBos.Reservering.ReserveringCompleet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <h2>Laatste informatie</h2>
        <br />
        <p>Hier de laatste gegevens voor de klant omtrent de kosten en de reservering.</p>
        <br />

        <asp:Label ID="lblReservering" runat="server"></asp:Label>

        
        <br />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Reserveringsnummer" DataSourceID="SqlDataSource1" CssClass="content-table">
            <Columns>
                <asp:BoundField DataField="Reserveringsnummer" HeaderText="Reserveringsnummer" InsertVisible="False" ReadOnly="True" SortExpression="Reserveringsnummer" />
                <asp:BoundField DataField="Nu te betalen bedrag" HeaderText="Nu te betalen bedrag" ReadOnly="True" SortExpression="Nu te betalen bedrag" />
                <asp:BoundField DataField="Te betalen voor aankomst" HeaderText="Te betalen voor aankomst" ReadOnly="True" SortExpression="Te betalen voor aankomst" />
                <asp:BoundField DataField="Totaal te betalen" HeaderText="Totaal te betalen" ReadOnly="True" SortExpression="Totaal te betalen" />
                <asp:BoundField DataField="Aantal personen" HeaderText="Aantal personen" SortExpression="Aantal personen" />
                <asp:BoundField DataField="Aankomstdatum" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Aankomstdatum" SortExpression="Aankomstdatum" />
                <asp:BoundField DataField="Vertrekdatum" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Vertrekdatum" SortExpression="Vertrekdatum" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT Reservering.Nummer as [Reserveringsnummer], (ReserveringTransacties.Totaal) as [Nu te betalen bedrag], (ReserveringTotaalPrijs.TotaalPrijs - ReserveringTransacties.Ontvangsten) as [Te betalen voor aankomst], 
				  ReserveringTotaalPrijs.TotaalPrijs as [Totaal te betalen], Reservering.Aantal_personen as [Aantal personen], Reservering.Aankomstdatum, 
				  Reservering.Vertrekdatum, Gast.Email

FROM     Debiteurenfactuur INNER JOIN  
				  Reservering on Reservering.Nummer = Debiteurenfactuur.ReserveringNummer INNER JOIN
                  Gast ON Reservering.GastNummer = Gast.Nummer INNER JOIN
                  ReserveringTotaalPrijs on Gast.Nummer = ReserveringTotaalPrijs.Nummer INNER JOIN
                  ReserveringTransacties on Debiteurenfactuur.Nummer = ReserveringTransacties.Debiteurenfactuurnummer
WHERE Reservering.Nummer = @Reserveringsnummer	">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblReservering" Name="Reserveringsnummer" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:Button ID="btnBevestigen" runat="server" Click="btnBevestigen_Click1" Text="Bevestigen" OnClick="btnBevestigen_Click" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" />

    </div>
</asp:Content>
