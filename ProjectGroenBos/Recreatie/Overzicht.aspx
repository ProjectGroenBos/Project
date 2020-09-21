<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Overzicht.aspx.cs" Inherits="ProjectGroenBos.Recreatie.Overzicht" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Groenbos</title>
    <link rel="stylesheet" href="CSS/Main.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="navigator">
                <a href="Start.apsx">
                    <img src="img/Logo6.png" class="logo"></a>
                <nav>
                    <ul>
                        <li><a href="start.aspx">Home</a></li>
                        <li class="selected"><a href="overzicht.aspx">Overzicht</a></li>
                        <li><a href="#">Bestellingen</a></li>
                        <li><a href="#">Keuken</a></li>
                        <li><a href="#">Reserveringen</a></li>
                        <li class="uitloggen"><a href="#">Uitloggen</a></li>
                    </ul>
                </nav>
            </div>

            <div class="werkgebied">
            </div>
        </div>

        <script src="js/app.js"></script>


        <div id="lvActiviteitenSchema">
            <asp:Label ID="lblActiviteiten" runat="server" Text="Geplande Activiteiten"></asp:Label>
            <asp:Label ID="lblDatum" runat="server" Text="Datum:"></asp:Label>
            <asp:Label ID="lbldatumNu" runat="server" Text=""></asp:Label>
            <asp:Button ID="backwards" runat="server" OnClick="OnButtonPress" Text="&lt;" />
            <asp:Button ID="Forward" runat="server" Height="27px" OnClick="OnButtonPress" Text="&gt;" />

            <asp:CheckBox ID="CbWeekOverzicht" runat="server" AutoPostBack="True" OnCheckedChanged="CbWeekOverzicht_CheckedChanged" Text="WeekOverzicht" />

            <asp:GridView ID="gvActiveiten" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
                    <asp:BoundField DataField="Locatie" HeaderText="Locatie" SortExpression="Locatie" />
                    <asp:BoundField DataField="RecreatieprogrammaDatum" DataFormatString="{0:dd/MM/yyyy}" HeaderText="RecreatieprogrammaDatum" SortExpression="RecreatieprogrammaDatum" />
                    <asp:BoundField DataField="Tijd" HeaderText="Tijd" SortExpression="Tijd" />
                    <asp:BoundField DataField="Maximaal aantal" HeaderText="Maximaal aantal" SortExpression="Maximaal aantal" />
                    <asp:BoundField DataField="FaciliteitID" HeaderText="FaciliteitID" SortExpression="FaciliteitID" />
                </Columns>
                <EmptyDataTemplate>
                    <div align="center">Er zijn geen activiteiten op deze dag gepland.</div>
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select dbo.Activiteit.Naam , dbo.Activiteit.Locatie,dbo.Recreatieprogramma_Activiteit.RecreatieprogrammaDatum, dbo.Activiteit.Tijd, dbo.Activiteit.[Maximaal aantal], dbo.Activiteit.FaciliteitID

 from dbo.Activiteit

 join dbo.Recreatieprogramma_Activiteit on  dbo.Activiteit.Nummer = dbo.Recreatieprogramma_Activiteit.ActiviteitNummer
"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
