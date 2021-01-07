<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="GastWijzigen.aspx.cs" Inherits="ProjectGroenBos.Reservering.KlantWijzigen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 15%;
            height: 22px;
        }

        .auto-style2 {
            width: 40%;
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        
        <h2>Gast wijzigen</h2>
        <p>Vul hier de gegevens van de gast in om deze in de database neer te zetten.</p>
        <h2>Persoonsgegevens:</h2>
        <p></p>
        <table style="text-align: left; margin-left: 5%">

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
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txbVoornaam" ErrorMessage="Dit veld is verplicht." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txbVoornaam" ErrorMessage="Alleen letters gebruiken a.u.b." ValidationExpression="^[a-zA-Z -]*$" ForeColor="Red"  Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label3" runat="server" Text="Tussenvoegsel:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbTussenvoegsel" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td style="width: 40%">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txbTussenvoegsel" ErrorMessage="In een tussenvoegsel kunnen geen cijfers zitten." ValidationExpression="^[a-zA-Z -]*$" ForeColor="Red"  Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label4" runat="server" Text="Achternaam:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txbAchternaam" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txbAchternaam" ErrorMessage="Dit veld is verplicht." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txbAchternaam" ErrorMessage="Alleen letters gebruiken a.u.b." ValidationExpression="^[a-zA-Z -]*$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label5" runat="server" Text="Geboortedatum:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbGeboortedatum" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbGeboortedatum" ErrorMessage="Dit veld is verplicht." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txbGeboortedatum" ErrorMessage="U bent geen 18 jaar oud." ForeColor="Red"  Display="Dynamic"></asp:CustomValidator>
                </td>
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
        <br />
        <h2>Contactgegevens:</h2>
        <br />
        <table style="text-align: left; margin-left: 5%">
            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label6" runat="server" Text="Telefoonnummer:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbTelefoonnummer" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txbTelefoonnummer" ErrorMessage="Dit veld is verplicht." ForeColor="Red"  Display="Dynamic"></asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txbTelefoonnummer" ErrorMessage="Eerste 0 weglaten en 9 cijfers gebruiken." ValidationExpression="^[0-9]{9}$" ForeColor="Red"  Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label7" runat="server" Text="E-mail:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbEmail" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txbEmail" ErrorMessage="Dit veld is verplicht." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txbEmail" ErrorMessage="Email is niet geldig" ValidationExpression="[a-z0-9!#$%&'+/=?^_`{|}~-]+(?:.[a-z0-9!#$%&'+/=?^_`{|}~-]+)@(?:[a-z0-9](?:[a-z0-9-][a-z0-9])?.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" ForeColor="Red"  Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>


        </table>
        <br />
        <h2>Adresgegevens:</h2>
        <br />
        <table style="text-align: left; margin-left: 5%">
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
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Er moet een land geselecteerd zijn." ValidateEmptyText="True" ForeColor="Red" Display="Dynamic"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label11" runat="server" Text="Woonplaats:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbWoonplaats" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txbWoonplaats" ErrorMessage="Dit veld is verplicht." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txbWoonplaats" ErrorMessage="Alleen letters gebruiken a.u.b." ValidationExpression="^[a-zA-Z -]*$" ForeColor="Red"  Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label8" runat="server" Text="Straat:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txbStraatnaam" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txbStraatnaam" ErrorMessage="Dit veld is verplicht." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txbStraatnaam" ErrorMessage="Alleen letters gebruiken a.u.b." ValidationExpression="^[a-zA-Z -]*$" ForeColor="Red"  Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label9" runat="server" Text="Huisnummer + Toevoegingen:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbHuisnummer" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txbHuisnummer" ErrorMessage="Dit veld is verplicht." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txbHuisnummer" ErrorMessage="Huisnummer bestaat uit getallen en letters." ValidationExpression="^([0-9]+ ?[a-zA-Z]?)$" ForeColor="Red"  Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label10" runat="server" Text="Postcode:" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbPostcode" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txbPostcode" ErrorMessage="Dit veld is verplicht." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="txbPostcode"  Display="Dynamic" ErrorMessage="Postcode niet geldig i.c.m. het land." ForeColor="Red" OnServerValidate="CustomValidator3_ServerValidate"></asp:CustomValidator>
                </td>
            </tr>


        </table>

        <br />
        <asp:Label ID="lblUitkomst" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnWijzigen" runat="server" Text="Wijzigen" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" OnClick="btnWijzigen_Click" />

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
