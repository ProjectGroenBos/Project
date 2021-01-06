<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="ReserveringAanmaken.aspx.cs" Inherits="ProjectGroenBos.Reservering.ReserveringAanmaken" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <script type="text/javascript">
            $(function () {
                var date = new Date();
                var currentMonth = date.getMonth(); // huidige maand
                var currentDate = date.getDate(); // huidige datum
                var currentYear = date.getFullYear(); // dit jaar
                $("#<%= txbAankomstdatum.ClientID %>").datepicker({
                    changeMonth: true, // Hierdoor kan de gebruiker de maand veranderen
                    changeYear: true, // Hierdoor kan de gebruiker het jaar veranderen
                    minDate: new Date(currentYear, currentMonth, currentDate),
                    dateFormat: 'dd/mm/yy',
                    beforeShowDay: function (date) {
                        if (date.getDay() == 0 || date.getDay() == 2 || date.getDay() == 3 || date.getDay() == 4 || date.getDay() == 6) {
                            return [false, ''];
                        } else {
                            return [true, ''];
                        }
                    }
                });
            });

            $(function () {
                var date = new Date();
                var currentMonth = date.getMonth(); // huidige maand
                var currentDate = date.getDate(); // huidige datum
                var currentYear = date.getFullYear(); // dit jaar
                $("#<%= txbVertrekdatum.ClientID %>").datepicker({
                    changeMonth: true, // Hierdoor kan de gebruiker de maand veranderen
                    changeYear: true, // Hierdoor kan de gebruiker het jaar veranderen
                    minDate: new Date(currentYear, currentMonth, currentDate),
                    dateFormat: 'dd/mm/yy',
                    beforeShowDay: function (date) {
                        if (date.getDay() == 0 || date.getDay() == 2 || date.getDay() == 3 || date.getDay() == 4 || date.getDay() == 6) {
                            return [false, ''];
                        } else {
                            return [true, ''];
                        }
                    }
                });
            });




        </script>

        <h1>Reserveringsgegevens invullen</h1>

        <table>
            <tr>
                <td style="width:15%">
                    <asp:Label ID="Label5" runat="server" Text="Gastnummer" CssClass="labelsnieuw"></asp:Label></td>
                <td style="width:15%">
                    <asp:Label ID="lblGastnummer" runat="server" Text="" CssClass="textboxchaos"></asp:Label></td>
                <td style="width:40%"></td>
            </tr>
            <tr>
                <td style="width:15%">
                    <asp:Label ID="Label2" runat="server" Text="Aantal personen" CssClass="labelsnieuw"></asp:Label></td>
                <td style="width:15%">
                    <asp:TextBox ID="txbAantalPersonen" runat="server" CssClass="textboxchaos"></asp:TextBox></td>
                <td style="width:40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbAantalPersonen" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width:15%">
                    <asp:Label ID="Label3" runat="server" Text="Aankomstdatum" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width:15%">
                    <asp:TextBox ID="txbAankomstdatum" runat="server" CssClass="textboxchaos"></asp:TextBox>
                    </td>
                <td style="width:40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbAankomstdatum" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width:15%">
                    <asp:Label ID="Label1" runat="server" Text="Vertrekdatum" CssClass="labelsnieuw"></asp:Label></td>
                <td style="width:15%">
                    <asp:TextBox ID="txbVertrekdatum" runat="server" CssClass="textboxchaos"></asp:TextBox></td>
                <td style="width:40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbVertrekdatum" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width:15%" >
                    <asp:Label ID="Label6" runat="server" Text="Opmerkingen" CssClass="labelsnieuw"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txbOpmerking" runat="server" CssClass="textboxchaos"></asp:TextBox></td>
                <td style="width:40%"></td>
            </tr>
            <tr>
                <td style="width:15%">
                    <asp:Label ID="Label4" runat="server" Text="Bungalownummer" CssClass="labelsnieuw"></asp:Label></td>
                <td style="width:15%">
                    <asp:Label ID="lblHuisjenummer" runat="server" Text="" CssClass="textboxchaos"></asp:Label></td>
                <td style="width:40%"></td>
            </tr>
        </table>




        <br />
        <asp:Button ID="btnZoek" runat="server" Text="Zoek bungalow" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" OnClick="btnZoek_Click" />
        <asp:Button ID="btnAanmaken" runat="server" Text="Aanmaken" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" OnClick="btnAanmaken_Click" />
        <asp:Button ID="btnTerug" runat="server" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" OnClick="btnTerug_Click" Text="Terug" />
        <br />
        <br />
        <asp:Label ID="lblUitkomst" runat="server"></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server" CssClass="content-table" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True" AutoGenerateSelectButton="True">
            <HeaderStyle ForeColor="White" />
        </asp:GridView>


        <asp:GridView ID="GridView2" runat="server" CssClass="content-table" AutoGenerateColumns="False" DataKeyNames="Voornaam,Tussenvoegsel,Achternaam,Geboortedatum,Email">
            <Columns>
                <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" />
                <asp:BoundField DataField="Tussenvoegsel" HeaderText="Tussenvoegsel" />
                <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" />
               <asp:BoundField DataField="Geboortedatum" HeaderText="Geboortedatum" />
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
