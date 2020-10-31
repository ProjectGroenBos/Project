<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="ProjectGroenBos.Reservering.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <br />
    <br />
    <asp:Label ID="Label11" runat="server" Text="Gast nummer:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblGastnummer" runat="server" CssClass="labelsnieuw" ></asp:Label>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Voornaam:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbVoornaam" runat="server" CssClass="textboxchaos"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="In een naam kunnen geen getallen of leestekens zitten." ControlToValidate="txbVoornaam" ValidationExpression="^[a-zA-Z -]*$"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Tussenvoegsel:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbTussenvoegsel" runat="server" CssClass="textboxchaos"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="In een tussenvoegsel kunnen alleen letters komen te staan." ControlToValidate="txbTussenvoegsel" ValidationExpression="^[a-zA-Z -]*$"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Achternaam" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbAchternaam" runat="server" CssClass="textboxchaos"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="In een achternaam kunnen geen getallen zitten." ControlToValidate="txbAchternaam" ValidationExpression="^[a-zA-Z -]*$"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="Label4" runat="server" Text="E-mail" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbEmail" runat="server" CssClass="textboxchaos"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Email is niet geldig." ControlToValidate="txbEmail" ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" ForeColor="Black"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Telefoonnummer" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbTelefoonnummer" runat="server" CssClass="textboxchaos"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Telefoonnummer bestaat uit 9 getallen. De eerste 0 mag u weglaten." ControlToValidate="txbTelefoonnummer" ValidationExpression="^[0-9]{9}$" ForeColor="Black" Enabled="False"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="Label6" runat="server" Text="Reseveringsnummer:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblReserveringsnummer" runat="server"  CssClass="labelsnieuw"></asp:Label>
    <br />
    <asp:Label ID="Label7" runat="server" Text="Aantal Personen:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbAantalPersonen" runat="server" CssClass="textboxchaos"></asp:TextBox>
    <br />
    <asp:Label ID="Label8" runat="server" Text="Opmerkingen" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbOpmerkingen" runat="server" CssClass="textboxchaos"></asp:TextBox>
    <br />
    <asp:Label ID="Label9" runat="server" Text="Aankomstdatum:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbAankomstdatum" runat="server" CssClass="textboxchaos"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txbAankomstdatum" ErrorMessage="Vul Aankomstdatum in als jjjj-mm-dd. Bijvoorbeeld: 2021-06-16" ValidationExpression ="^(19|20){1}\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$" ForeColor="Black" Enabled="False"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="Label10" runat="server" Text="Vertrekdatum:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbVertrekdatum" runat="server" CssClass="textboxchaos"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txbVertrekdatum" ErrorMessage="Vul vertrekdatum in als jjjj-mm-dd. Bijvoorbeeld: 2021-06-16" ValidationExpression ="^(19|20){1}\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$" ForeColor="Black" Enabled="False"></asp:RegularExpressionValidator>
    <br />
    <br />
    <br />
    <asp:Button ID="btnWijzigen" runat="server" Text="Wijzigen" CssClass ="labelsnieuw" OnClick="btnWijzigen_Click" />
    <br />
    <br />
    <br />
</asp:Content>
