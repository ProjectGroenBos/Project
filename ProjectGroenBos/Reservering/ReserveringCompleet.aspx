<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="ReserveringCompleet.aspx.cs" Inherits="ProjectGroenBos.Reservering.ReserveringCompleet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <h2>Laatste informatie</h2>
        <br />
        <p>Hier de laatste gegevens voor de klant omtrent de kosten en de reservering.</p>
        <br />
        <table style="text-align: left; margin-left: 5%">
            <tr>
                <td style="width: 20%">
                    <p>Te betalen bedrag</p>
                </td>
                <td style="width: 15%">
                    <asp:Label ID="lblBetalen" runat="server"></asp:Label></td>
                <td style="width: 40%">
            </tr>
            <tr>
                <td style="width: 20%">
                    <p>Te betalen voor aankomst</p>
                </td>
                <td style="width: 15%">
                    <asp:Label ID="lblLater" runat="server"></asp:Label></td>
                <td style="width: 40%">
            </tr>
            <tr>
                <td style="width: 20%">
                    <p>Totaal bedrag</p>
                </td>
                <td style="width: 15%">
                    <asp:Label ID="lblTotaal" runat="server"></asp:Label></td>
                <td style="width: 40%">
            </tr>
        </table>
        <br />
        <table style="text-align: left; margin-left: 5%">
            <tr>
                <td style="width: 20%">Reserveringsnummer</td>
                <td style="width: 20%">
                    <asp:Label ID="lblReservering" runat="server"></asp:Label></td>
                <td style="width: 40%"></td>
            </tr>
            <tr>
                <td style="width: 20%">Aantal personen</td>
                <td style="width: 20%">
                    <asp:Label ID="lblPersonen" runat="server"></asp:Label></td>
                <td style="width: 40%"></td>
            </tr>
            <tr>
                <td style="width: 20%">Aankomstdatum</td>
                <td style="width: 20%">
                    <asp:Label ID="lblAankomst" runat="server"></asp:Label></td>
                <td style="width: 40%"></td>
            </tr>
            <tr>
                <td style="width: 20%">Vertrekdatum</td>
                <td style="width: 20%">
                    <asp:Label ID="lblVertrek" runat="server"></asp:Label></td>
                <td style="width: 40%"></td>
            </tr>
            <tr>
                <td style="width: 20%">Email</td>
                <td style="width: 20%">
                    <asp:Label ID="lblEmail" runat="server"></asp:Label></td>
                <td style="width: 40%"></td>
            </tr>
        </table>
        <br />

        <asp:Button ID="btnBevestigen" runat="server" Click="btnBevestigen_Click1" Text="Bevestigen" OnClick="btnBevestigen_Click" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" />

    </div>
</asp:Content>
