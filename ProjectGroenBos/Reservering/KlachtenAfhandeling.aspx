<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="KlachtenAfhandeling.aspx.cs" Inherits="ProjectGroenBos.Reservering.KlachtenAfhandeling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <h1>Klachten pagina</h1>
        <br />
        
        <table>
            <tr>
                <td><asp:RadioButton ID="rdbBezoeker" runat="server" Text=" Geen bestaande gast" GroupName="rdbGastCheck" CssClass="labelsnieuw" AutoPostBack="True"></asp:RadioButton></td>
                <td><asp:RadioButton ID="rdbGast" runat="server" Text=" Bestaande gast" GroupName="rdbGastCheck" CssClass="labelsnieuw" Checked="True" AutoPostBack="True"></asp:RadioButton></td>
            </tr>
        </table>

      <br />

        <table style="text-align: left; margin-left: 5%">
            <tr>
                <td style="width: 15%">
                    <asp:Label CssClass="labelsnieuw" runat="server" Text="Gastnummer"></asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbGastnummer" CssClass="textboxchaos" runat="server"></asp:TextBox></td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbGastnummer" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Gastnummer mag alleen uit cijfers bestaan." ControlToValidate="txbGastnummer" ValidationExpression="^[0-9]*$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">
                    <asp:Label CssClass="labelsnieuw" runat="server" Text="Voornaam"></asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbVoornaam" CssClass="textboxchaos" runat="server"></asp:TextBox></td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbVoornaam" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="In een naam kunnen geen getallen of leestekens zitten met uitzondering op (-)." ControlToValidate="txbVoornaam" ValidationExpression="^[a-zA-Z -]*$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">
                    <asp:Label CssClass="labelsnieuw" runat="server" Text="Tussenvoegsel"></asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbTussenvoegsel" CssClass="textboxchaos" runat="server"></asp:TextBox></td>
                <td style="width: 40%">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="In een naam kunnen geen getallen of leestekens zitten met uitzondering op (-)." ControlToValidate="txbTussenvoegsel" ValidationExpression="^[a-zA-Z -]*$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">
                    <asp:Label CssClass="labelsnieuw" runat="server" Text="Achternaam"></asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbAchternaam" CssClass="textboxchaos" runat="server"></asp:TextBox></td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbAchternaam" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="In een naam kunnen geen getallen of leestekens zitten met uitzondering op (-)." ControlToValidate="txbAchternaam" ValidationExpression="^[a-zA-Z -]*$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">
                    <asp:Label CssClass="labelsnieuw" runat="server" Text="E-mail"></asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbEmail" CssClass="textboxchaos" runat="server"></asp:TextBox></td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Email is niet geldig." ControlToValidate="txbEmail" ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">
                    <asp:Label CssClass="labelsnieuw" runat="server" Text="Categorie"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:DropDownList ID="ddlCategorie" CssClass="textboxchaos" runat="server">
                        <asp:ListItem Text="--Selecteer--"></asp:ListItem>
                        <asp:ListItem Text="Personeel" Value="Personeel"></asp:ListItem>
                        <asp:ListItem Text="Accommodatie" Value="Accomodatie"></asp:ListItem>
                        <asp:ListItem Text="Activiteiten" Value="Activiteiten"></asp:ListItem>
                        <asp:ListItem Text="Restaurant" Value="Restaurant"></asp:ListItem>
                        <asp:ListItem Text="Overig" Value="Overig"></asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlCategorie"
                        ErrorMessage="Selecteer is geen geldige waarde." InitialValue="--Selecteer--" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 15%">
                    <asp:Label CssClass="labelsnieuw" runat="server" Text="Klacht"></asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbKlacht" CssClass="textboxchaos" runat="server" TextMode="MultiLine" Height="200px" Width="300px"></asp:TextBox></td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txbKlacht"
                        ErrorMessage="Dit veld is verplicht." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 15%"></td>
                <td style="width: 15%"></td>
                <td style="width: 40%"></td>
            </tr>
            <tr>
                <td style="width: 15%"></td>
                <td style="width: 15%"></td>
                <td style="width: 40%"></td>
            </tr>


        </table>

        <asp:Button ID="btnVerzenden" CssClass="btnUitloggen" runat="server" Text="Verzenden" OnClick="btnVerzenden_Click" Style="background-color: #009879; color: #fff" class="btn" />

    </div>
</asp:Content>
