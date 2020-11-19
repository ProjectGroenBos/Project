<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="ReserveringWijzigen.aspx.cs" Inherits="ProjectGroenBos.Reservering.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <h1>Reservering wijzigen</h1>
    <br />
    
    <br />
    <asp:Label ID="Label11" runat="server" Text="Gast nummer:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblGastnummer" runat="server" CssClass="labelsnieuw"></asp:Label>
    
    <br />
    <asp:Label ID="Label1" runat="server" Text="Voornaam:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbVoornaam" runat="server" CssClass="textboxchaos"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="In een naam kunnen geen getallen of leestekens zitten." ControlToValidate="txbVoornaam" ValidationExpression="^[a-zA-Z -]*$"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbVoornaam"></asp:RequiredFieldValidator>
    
    <br />
    <asp:Label ID="Label2" runat="server" Text="Tussenvoegsel:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbTussenvoegsel" runat="server" CssClass="textboxchaos"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="In een tussenvoegsel kunnen alleen letters komen te staan." ControlToValidate="txbTussenvoegsel" ValidationExpression="^[a-zA-Z -]*$"></asp:RegularExpressionValidator>
   
    <br />
    <asp:Label ID="Label3" runat="server" Text="Achternaam" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbAchternaam" runat="server" CssClass="textboxchaos"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="In een achternaam kunnen geen getallen zitten." ControlToValidate="txbAchternaam" ValidationExpression="^[a-zA-Z -]*$"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbAchternaam"></asp:RequiredFieldValidator>
    
    <br />
    <asp:Label ID="Label4" runat="server" Text="E-mail" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbEmail" runat="server" CssClass="textboxchaos"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Email is niet geldig." ControlToValidate="txbEmail" ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" ForeColor="Black"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbEmail"></asp:RequiredFieldValidator>
    
    <br />
    <asp:Label ID="Label5" runat="server" Text="Telefoonnummer" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbTelefoonnummer" runat="server" CssClass="textboxchaos"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Telefoonnummer bestaat uit 11 getallen met een + ervoor." ControlToValidate="txbTelefoonnummer" ValidationExpression="^[0-9]{9}$" ForeColor="Black" Enabled="False"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbTelefoonnummer"></asp:RequiredFieldValidator>
    
    <br />
    <asp:Label ID="Label6" runat="server" Text="Reseveringsnummer:" CssClass="labelsnieuw"></asp:Label>
    <asp:Label ID="lblReserveringsnummer" runat="server" CssClass="labelsnieuw"></asp:Label>
    
    <br />
    <asp:Label ID="Label7" runat="server" Text="Aantal Personen:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbAantalPersonen" runat="server" CssClass="textboxchaos"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Aantal personen is een even getal." ControlToValidate="txbAantalPersonen" ValidationExpression="^([246])$"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbAantalPersonen"></asp:RequiredFieldValidator>
    
    <br />
    <asp:Label ID="Label8" runat="server" Text="Opmerkingen" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbOpmerkingen" runat="server" CssClass="textboxchaos"></asp:TextBox>
    
    <br />
    <asp:Label ID="Label9" runat="server" Text="Aankomstdatum:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbAankomstdatum" runat="server" CssClass="textboxchaos" TextMode="Date"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblAankomstdatum" runat="server" Text="" ></asp:Label>

    <br />
    <asp:Label ID="Label10" runat="server" Text="Vertrekdatum:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbVertrekdatum" runat="server" CssClass="textboxchaos" TextMode="Date"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblVertrekdatum" runat="server" Text="" margin-left="300px"></asp:Label>

    <br />
    <asp:Label ID="Label12" runat="server" Text="Straat:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txtStraat" runat="server" CssClass="textboxchaos"></asp:TextBox>

    <br />
    <asp:Label ID="Label13" runat="server" Text="Huisnummer:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbHuisnummer" runat="server" CssClass="textboxchaos" ></asp:TextBox>

    <br />
    <asp:Label ID="Label14" runat="server" Text="Postcode:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbPostcode" runat="server" CssClass="textboxchaos"></asp:TextBox>

    <br />
    <asp:Label ID="Label15" runat="server" Text="Land:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbLand" runat="server" CssClass="textboxchaos"></asp:TextBox>

    <br />
    <br />
    <br />
    <asp:Button ID="btnWijzigen" runat="server" Text="Wijzigen" CssClass="labelsnieuw" OnClick="btnWijzigen_Click" />
    <br />
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="Nummer,Aankomstdatum,Vertrekdatum,Aantal_personen,GastNummer,Opmerking,Voornaam,Tussenvoegsel,Achternaam,Email,Telefoonnummer,Straatnaam,Huisnummer,Postcode,Land">
    </asp:GridView>
    <br />
    <br />
</asp:Content>
