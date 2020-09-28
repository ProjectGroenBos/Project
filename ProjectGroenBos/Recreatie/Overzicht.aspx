﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Overzicht.aspx.cs" Inherits="ProjectGroenBos.Recreatie.Overzicht" %>

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
                        
                        <li class="selected"><a href="overzicht.aspx">Home</a></li>
                        <li><a href="#">Beheer</a></li>
                        <li><a href="#">Documentatie</a></li>
                  
                        <li class="uitloggen"><a href="#">Uitloggen</a></li>
                    </ul>
                </nav>
            </div>

            <div class="werkgebied">
            
            
            
            </div>
        </div>

        <script src="js/app.js"></script>


        <div id="lvActiviteitenSchema">
            <asp:Label ID="lblActiviteiten" runat="server" CssClass="lblactiviteit" Text="Geplande Activiteiten" ></asp:Label>
            <asp:Label ID="lblDatum" runat="server" CssClass="lbldatum" Text="Datum:"></asp:Label>
            <asp:Label ID="lbldatumNu" runat="server" CssClass="lbldatumnu" Text=""></asp:Label>

             
            
            <asp:Button ID="backwards" runat="server" CssClass="vorigeknop" OnClick="OnButtonPress" Text="&lt;" />
            <asp:Button ID="Forward" runat="server" CssClass="volgendeknop" OnClick="OnButtonPress" Text="&gt;" />

            <asp:CheckBox ID="CbWeekOverzicht" runat="server" CssClass="weekcb" AutoPostBack="True" OnCheckedChanged="CbWeekOverzicht_CheckedChanged" Text="WeekOverzicht" />

            <asp:Label ID="lblOverzicht" runat="server" CssClass="lbloverzicht" Text="Overzicht"></asp:Label>

            <asp:GridView ID="gvActiveiten" runat="server" AutoGenerateColumns="False" Height="215px" Width="1302px" DataSourceID="SqlDataSource1">
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
