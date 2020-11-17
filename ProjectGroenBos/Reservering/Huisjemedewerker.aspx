<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="Huisjemedewerker.aspx.cs" Inherits="ProjectGroenBos.Reservering.Huisjemedewerker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1>Reservering aanmaken</h1>
    <br />
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -
        Let tijdens het reserveren op de volgende punten:
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        - De klant mag maximaal een week reserveren
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        - De datums moeten als volgt ingevuld worden: jjjj-mm-dd.
    </p>
    <p>
        &nbsp;
    </p>


     <p>   <asp:Label ID="lblAantalPersonen" runat="server" Text="Aantal personen" CssClass="labelsnieuw"></asp:Label>

    <asp:TextBox ID="txbAantalPersonen" runat="server" TextChanged="txbAantalPersonen_TextChanged" AutoPostBack="True" CssClass="textboxchaos"></asp:TextBox>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Aantal personen moet een even getal zijn." ControlToValidate="txbAantalPersonen" ValidationExpression="([246]{1})" ForeColor="Red"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbAantalPersonen" ErrorMessage="Dit veld is verplicht." ForeColor="Red"></asp:RequiredFieldValidator>
</p>

       <p> <asp:Label ID="lblAankomstdatum" runat="server" Text="Aankomstdatum" CssClass="labelsnieuw"></asp:Label>

    <asp:TextBox ID="txbAankomstdatum" runat="server" CssClass="textboxchaos" TextMode="Date"></asp:TextBox>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Datum moet ingevult zijn als jjjj-mm-dd. Voorbeeld: 2021-13-02." ControlToValidate="txbAankomstdatum" ValidationExpression="^(19|20){1}\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$" ForeColor="Red"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txbAankomstdatum" ErrorMessage="Dit veld is verplicht." ForeColor="Red"></asp:RequiredFieldValidator>
</p>
      <p>  <asp:Label ID="lblVertrekdatum" runat="server" Text="Vertrekdatum" CssClass="labelsnieuw"></asp:Label>

    <asp:TextBox ID="txbVertrekdatum" runat="server" CssClass="textboxchaos" TextMode="Date"></asp:TextBox>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Datum moet ingevult zijn als jjjj-mm-dd. Voorbeeld: 2021-13-02." ControlToValidate="txbVertrekdatum" ValidationExpression="^(19|20){1}\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$" ForeColor="Red"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txbVertrekdatum" ErrorMessage="Dit veld is verplicht." ForeColor="Red"></asp:RequiredFieldValidator>
</p>
      <p>  <asp:Label ID="lblHuisje" runat="server" Text="Huisjenummer" CssClass="labelsnieuw"></asp:Label>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

          <asp:Label ID="lblHuisjeNummer" runat="server" CssClass="textboxchaos"></asp:Label>
</p>
    
    <p>  
        <asp:Label ID="label5" runat="server" CssClass="labelsnieuw" Text="Totaal bedrag"></asp:Label>
        <asp:Label ID="lblTotaal" runat="server" CssClass="textboxchaos"></asp:Label>
</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="bntZoekHuis" runat="server" OnClick="bntZoekHuis_Click" Text="Zoek Huis" CssClass ="textboxbtn" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" CssClass ="gridv" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        </asp:GridView>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;
    </p>
    <p>

        <asp:Button ID="btnBevestigen" runat="server" OnClick="btnBevestigen_Click" Text="Bevestigen" CssClass="textboxbtn" />

    </p>
    <p>

        &nbsp;</p>
    <p>

        &nbsp;</p>
    <p>

        &nbsp;</p>
    <p>

        &nbsp;</p>
</asp:Content>
