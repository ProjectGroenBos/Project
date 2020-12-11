<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="KlantWijzigen.aspx.cs" Inherits="ProjectGroenBos.Reservering.KlantWijzigen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">


        <h2>Persoonsgegevens:</h2>
        <table>

            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label13" runat="server" Text="Gastnummer: " CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:Label ID="lblGastnummer" runat="server" CssClass="textboxchaos"></asp:Label>
                </td>
                <td style="width: 40%"></td>
            </tr>

            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label2" runat="server" Text="Voornaam:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbVoornaam" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td style="width: 40%"></td>
            </tr>

            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label3" runat="server" Text="Tussenvoegsel:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbTussenvoegsel" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td style="width: 40%"></td>
            </tr>

            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label4" runat="server" Text="Achternaam:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbAchternaam" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td style="width: 40%"></td>
            </tr>

            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label5" runat="server" Text="Geboortedatum:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbGeboortedatum" runat="server" CssClass="textboxchaos" TextMode="Date"></asp:TextBox>
                </td>
                <td style="width: 40%"></td>
            </tr>

            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label12" runat="server" CssClass="labelsnieuw" Text="IBAN:"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbIBAN" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td style="width: 40%"></td>
            </tr>

        </table>
        <h2>Contactgegevens:</h2>
        <table>
            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label6" runat="server" Text="Telefoonnumer:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbTelefoonnummer" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td style="width: 40%"></td>
            </tr>

            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label7" runat="server" Text="E-mail:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbEmail" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td style="width: 40%"></td>
            </tr>


        </table>

        <h2>Adresgegevens:</h2>
        <table>
            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label8" runat="server" Text="Straatnaam:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbStraatnaam" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td style="width: 40%"></td>
            </tr>

            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label9" runat="server" Text="Huisnummer + Toevoegingen:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbHuisnummer" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td style="width: 40%"></td>
            </tr>
            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label10" runat="server" Text="Postcode:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbPostcode" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td style="width: 40%"></td>
            </tr>
            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label11" runat="server" Text="Woonplaats:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbWoonplaats" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td style="width: 40%"></td>
            </tr>
        </table>

        <br />
        <br />
        <br />
        <asp:Button ID="btnWijzigen" runat="server" Text="Wijzigen" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" />

    </div>
</asp:Content>
