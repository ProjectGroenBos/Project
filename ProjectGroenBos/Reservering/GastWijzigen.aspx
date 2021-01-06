<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="GastWijzigen.aspx.cs" Inherits="ProjectGroenBos.Reservering.KlantWijzigen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <script type="text/javascript">
            <%--$(function () {
                var date = new Date();
                var currentMonth = date.getMonth(); // huidige maand
                var currentDate = date.getDate(); // huidige datum
                var currentYear = date.getFullYear(); // dit jaar
                $("#<%= txbGeboortedatum.ClientID %>").datepicker({
                    changeMonth: true, // Hierdoor kan de gebruiker de maand veranderen
                    changeYear: true, // Hierdoor kan de gebruiker het jaar veranderen
                    maxDate: new Date(currentYear, currentMonth, currentDate),
                    dateFormat: 'dd/mm/yy',
                    beforeShowDay: function (date) {
                        if (date.getDay() == 0 || date.getDay() == 1 || date.getDay() == 2 || date.getDay() == 3 || date.getDay() == 4 || date.getDay() == 5 || date.getDay() == 6)
                        {
                    return [true, ''];
                } else {
                    return [false, ''];
                }
            }
                });
            });--%>

            <%--$(document).ready(function () {
                var date = new Date();
                var currentMonth = date.getMonth(); // huidige maand
                var currentDate = date.getDate(); // huidige datum
                var currentYear = date.getFullYear(); // dit jaar
                $(function () {
                    $("#<%= txbGeboortedatum.ClientID %>").datepicker();
                    maxDate: new Date(currentYear, currentMonth, currentDate),
                });
            }) --%>

            $(document).ready(function () {
                $(function () {
                    $("#<%= txbGeboortedatum.ClientID %>").datepicker({
                        changeYear: true,
                        changeMonth: true,
                        minDate: '10/19/1940',
                        maxDate: 0,
                    });
                });
            });

            //$(document).ready(function () {
            //    ('#txbGeboortedatum').datepicker({
            //        changeMonth: true,
            //        changeYear: true,
            //        minDate: '10/19/2016',
            //        maxDate: '+14D',
            //    })
            //});
        </script>
        +-
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
                    <asp:TextBox ID="txbGeboortedatum" runat="server" CssClass="textboxchaos" >></asp:TextBox>
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
            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label1" runat="server" Text="Land" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="textboxchaos">
                        <asp:ListItem>--Selecteer--</asp:ListItem>
                        <asp:ListItem>Nederland(+31)</asp:ListItem>
                        <asp:ListItem>Duitsland(+49)</asp:ListItem>
                        <asp:ListItem>Frankrijk(+33)</asp:ListItem>
                        <asp:ListItem>België(+32)</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="width: 40%">
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Er moet een land geselecteerd zijn." ValidateEmptyText="True" CssClass="validators" Display="Dynamic"></asp:CustomValidator>
                </td>
            </tr>
        </table>

        <br />
        <br />
        <br />
        <asp:Button ID="btnWijzigen" runat="server" Text="Wijzigen" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" OnClick="btnWijzigen_Click" OnClientClick="return confirm('Reservering is gewijzigd.');"/>

        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Huisnummer,Postcode" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Geboortedatum" HeaderText="Geboortedatum" SortExpression="Geboortedatum" DataFormatString="{0:dd-MM-yyyy}" />
                <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
                <asp:BoundField DataField="Tussenvoegsel" HeaderText="Tussenvoegsel" SortExpression="Tussenvoegsel" />
                <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" />
                <asp:BoundField DataField="Telefoonnummer" HeaderText="Telefoonnummer" SortExpression="Telefoonnummer" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="IBAN" HeaderText="IBAN" SortExpression="IBAN" />
                <asp:BoundField DataField="Straatnaam" HeaderText="Straatnaam" SortExpression="Straatnaam" />
                <asp:BoundField DataField="Huisnummer" HeaderText="Huisnummer" ReadOnly="True" SortExpression="Huisnummer" />
                <asp:BoundField DataField="Postcode" HeaderText="Postcode" SortExpression="Postcode" ReadOnly="True" />
                <asp:BoundField DataField="Land" HeaderText="Land" SortExpression="Land" />
                <asp:BoundField DataField="Woonplaats" HeaderText="Woonplaats" SortExpression="Woonplaats" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT Gast.Geboortedatum, Gast.Voornaam, Gast.Tussenvoegsel, Gast.Achternaam, Gast.Telefoonnummer, Gast.Email, Gast.IBAN, Adres.Straatnaam, Adres.Huisnummer, Adres.Postcode, Adres.Land, Adres.Woonplaats
FROM     Gast INNER JOIN
                  Adres ON Gast.Nummer = Adres.GastNummer
                  where Gast.Nummer = @nummer">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblGastnummer" Name="nummer" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
