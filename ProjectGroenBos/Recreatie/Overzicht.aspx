<%@ Page Language="C#" MasterPageFile="Site1.Master"  AutoEventWireup="true" CodeBehind="Overzicht.aspx.cs" Inherits="ProjectGroenBos.Recreatie.Overzicht" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <link href="CSS/styleoverzicht.css" rel="stylesheet" />
</asp:Content>
<asp:content id="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
            <asp:Label ID="lblActiviteiten" runat="server" Text="Geplande Activiteiten" CssClass="lblgeplandeactiviteiten"></asp:Label>
            <asp:Label ID="lblDatum" runat="server" Text="Datum:" CssClass="lbldatum"></asp:Label>
            <asp:Label ID="lbldatumNu" runat="server" Text="" CssClass="lbldatumnu"></asp:Label>
            <asp:Button ID="backwards" runat="server" CssClass="vorigeknop" OnClick="OnButtonPress" Text="&lt;" />

            <asp:CheckBox ID="CbWeekOverzicht" runat="server" AutoPostBack="True" OnCheckedChanged="CbWeekOverzicht_CheckedChanged" Text="WeekOverzicht" CssClass="weekcb" />

            <asp:Button ID="Forward" runat="server" CssClass="volgendeknop" OnClick="OnButtonPress" Text="&gt;" />

<<<<<<< HEAD
            <asp:GridView ID="gvActiveiten" runat="server" DataSourceID="SqlDataSource1" Height="215px" Width="1302px" CssClass="gridviewoverzicht">
=======
            <asp:GridView ID="gvActiveiten" runat="server" DataSourceID="SqlDataSource1" Height="215px" Width="1302px" CssClass="gridviewoverzicht" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Weeknummer" HeaderText="Weeknummer" ReadOnly="True" SortExpression="Weeknummer" />
                    <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
                    <asp:BoundField DataField="Locatie" HeaderText="Locatie" SortExpression="Locatie" />
                    <asp:BoundField DataField="Specificatie" HeaderText="Specificatie" SortExpression="Specificatie" />
                    <asp:BoundField DataField="Inschrijfkosten" HeaderText="Inschrijfkosten" SortExpression="Inschrijfkosten" />
                    <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
                    <asp:BoundField DataField="Begintijd" HeaderText="Begintijd" SortExpression="Begintijd" />
                    <asp:BoundField DataField="Eindtijd" HeaderText="Eindtijd" SortExpression="Eindtijd" />
                    <asp:BoundField DataField="Maximaal aantal" HeaderText="Maximaal aantal" SortExpression="Maximaal aantal" />
                    <asp:BoundField DataField="Naam_Medewerker" HeaderText="Naam_Medewerker" SortExpression="Naam_Medewerker" />
                </Columns>
>>>>>>> develop
                <EmptyDataTemplate>
                    <div>Er zijn geen activiteiten op deze dag gepland.</div>
                </EmptyDataTemplate>
            </asp:GridView>
<<<<<<< HEAD
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT datepart (week, dbo.Activiteit.Datum)AS  Weeknummer, dbo.Activiteit.Naam , dbo.Faciliteit.Omschrijving AS Locatie,dbo.Activiteit.Locatie AS Specificatie, dbo.Activiteit.Inschrijfkosten,
=======
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT datepart (week, dbo.Activiteit.Datum)AS  Weeknummer, dbo.Activiteit.Naam , dbo.Faciliteit.Omschrijving AS Locatie,dbo.Activiteit.Locatie AS Specificatie, dbo.Activiteit.Inschrijfkosten,
>>>>>>> develop
 dbo.Activiteit.Datum, dbo.Activiteit.Begintijd, dbo.Activiteit.Eindtijd, dbo.Activiteit.[Maximaal aantal], dbo.Medewerker.Naam as Naam_Medewerker
 FROM dbo.Activiteit
 JOIN dbo.Faciliteit on dbo.Activiteit.FaciliteitID = dbo.Faciliteit.ID
 JOIN dbo.Medewerker on dbo.Activiteit.MedewerkerID = dbo.Medewerker.Nummer
 WHERE datediff(day, getdate(),dbo.Activiteit.Datum) = 0"></asp:SqlDataSource>
</asp:content>