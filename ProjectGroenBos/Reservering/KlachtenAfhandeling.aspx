<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="KlachtenAfhandeling.aspx.cs" Inherits="ProjectGroenBos.Reservering.KlachtenAfhandeling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <h1>Klachten pagina</h1>

    <br />
    <br />

    <asp:RadioButton ID="rdbBezoeker" runat="server" Text="Geen bestaande gast" GroupName="rdbGastCheck" CssClass="labelsnieuw" AutoPostBack="True"></asp:RadioButton>

    <br />

    <asp:RadioButton ID="rdbGast" runat="server" Text="Bestaande gast" GroupName="rdbGastCheck" CssClass="labelsnieuw" Checked="True" AutoPostBack="True"></asp:RadioButton>

    <br />
    <br />

    <asp:Label CssClass="labelsnieuw" runat="server" Text="Gastnummer"></asp:Label>
    <asp:TextBox ID="txbGastnummer" CssClass="textboxchaos" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Gastnummer mag alleen uit cijfers bestaan." ControlToValidate="txbGastnummer" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbGastnummer"></asp:RequiredFieldValidator>

    <br />
    <br />

    <asp:Label CssClass="labelsnieuw" runat="server" Text="Voornaam"></asp:Label>
    <asp:TextBox ID="txbVoornaam" CssClass="textboxchaos" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="In een naam kunnen geen getallen of leestekens zitten met uitzondering op (-)." ControlToValidate="txbVoornaam" ValidationExpression="^[a-zA-Z -]*$"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbVoornaam"></asp:RequiredFieldValidator>

    <br />
    <br />

    <asp:Label CssClass="labelsnieuw" runat="server" Text="Tussenvoegsel"></asp:Label>
    <asp:TextBox ID="txbTussenvoegsel" CssClass="textboxchaos" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="In een naam kunnen geen getallen of leestekens zitten met uitzondering op (-)." ControlToValidate="txbTussenvoegsel" ValidationExpression="^[a-zA-Z -]*$"></asp:RegularExpressionValidator>

    <br />
    <br />

    <asp:Label CssClass="labelsnieuw" runat="server" Text="Achternaam"></asp:Label>
    <asp:TextBox ID="txbAchternaam" CssClass="textboxchaos" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="In een naam kunnen geen getallen of leestekens zitten met uitzondering op (-)." ControlToValidate="txbAchternaam" ValidationExpression="^[a-zA-Z -]*$"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbAchternaam"></asp:RequiredFieldValidator>

    <br />
    <br />

    <asp:Label CssClass="labelsnieuw" runat="server" Text="E-mail"></asp:Label>
    <asp:TextBox ID="txbEmail" CssClass="textboxchaos" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Email is niet geldig." ControlToValidate="txbEmail" ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" ForeColor="Black"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbEmail"></asp:RequiredFieldValidator>

    <br />
    <br />
    <br />

    <asp:Label CssClass="labelsnieuw" runat="server" Text="Categorie"></asp:Label>
    <asp:DropDownList ID="ddlCategorie" CssClass="textboxchaos" runat="server">
        <asp:ListItem Text="--Selecteer--"></asp:ListItem>
        <asp:ListItem Text="Personeel" Value="Personeel"></asp:ListItem>
        <asp:ListItem Text="Accommodatie" Value="Accomodatie"></asp:ListItem>
        <asp:ListItem Text="Activiteiten" Value="Activiteiten"></asp:ListItem>
        <asp:ListItem Text="Restaurant" Value="Restaurant"></asp:ListItem>
        <asp:ListItem Text="Overig" Value="Overig"></asp:ListItem>
    </asp:DropDownList>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlCategorie"
        ErrorMessage="Dit veld is verplicht." InitialValue="--Selecteer--"></asp:RequiredFieldValidator>



    <br />
    <br />
    <br />

    <asp:Label CssClass="labelsnieuw" runat="server" Text="Klacht"></asp:Label>

    <br />

    <asp:TextBox ID="txbKlacht" CssClass="textboxchaos" runat="server" TextMode="MultiLine" Height="200px" Width="300px"></asp:TextBox>

    <br />
    <br />

    <asp:Button ID="btnVerzenden" CssClass="textboxbtn" runat="server" Text="Verzenden" OnClick="btnVerzenden_Click" />

</asp:Content>
