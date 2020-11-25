<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="ReserveringAanmaken.aspx.cs" Inherits="ProjectGroenBos.Reservering.ReserveringAanmaken" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

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

    <br />
    <asp:Label ID="Label5" runat="server" Text="Gastnummer" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblGastnummer" runat="server" Text="" CssClass="textboxchaos"></asp:Label>

    <br />
    <asp:Label ID="Label2" runat="server" Text="Aantal personen" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbAantalPersonen" runat="server" CssClass="textboxchaos"></asp:TextBox>

    <br />
    <asp:Label ID="Label3" runat="server" Text="Aankomstdatum" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbAankomstdatum" runat="server" CssClass="textboxchaos"></asp:TextBox>

    <br />
    <asp:Label ID="Label1" runat="server" Text="Vertrekdatum" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbVertrekdatum" runat="server" CssClass="textboxchaos"></asp:TextBox>

    <br />
    <asp:Label ID="Label4" runat="server" Text="Huisjenummer" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblHuisjenummer" runat="server" Text="" CssClass="textboxchaos"></asp:Label>

    <asp:GridView ID="GridView1" runat="server" CssClass="content-table"></asp:GridView>

</asp:Content>
