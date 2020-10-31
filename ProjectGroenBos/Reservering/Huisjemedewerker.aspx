<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="Huisjemedewerker.aspx.cs" Inherits="ProjectGroenBos.Reservering.Huisjemedewerker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            margin-left: 5%;
            top: -3px;
            left: -1px;
            width: 690px;
            height: 146px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        &nbsp;&nbsp;
    </p>
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

    <asp:TextBox ID="txbHuisje" runat="server" CssClass="textboxchaos"></asp:TextBox>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Dit huisje bestaat niet." ControlToValidate="txbHuisje" ValidationExpression="^([0-9]{1,2})$" ForeColor="Red"></asp:RegularExpressionValidator>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txbHuisje" ErrorMessage="Dit veld is verplicht." ForeColor="Red"></asp:RequiredFieldValidator>
</p>
    <p>
        &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Nummer" DataSourceID="SqlDataSource1" CssClass="auto-style1">
            <Columns>
                <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
                <asp:BoundField DataField="Maximale bezetting" HeaderText="Maximale bezetting" SortExpression="Maximale bezetting" />
                <asp:BoundField DataField="Borgsom" HeaderText="Borgsom" SortExpression="Borgsom" />
                <asp:BoundField DataField="BungalowtypeCode" HeaderText="BungalowtypeCode" SortExpression="BungalowtypeCode" />
                <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="select bun.Nummer, bun.[Maximale bezetting], bun.Borgsom, bun.BungalowtypeCode, loc.Omschrijving from [dbo].[bungalow] bun inner join [dbo].[Locatie] loc on bun.LocatieNaam = loc.Naam ">
        </asp:SqlDataSource>
    </p>
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
