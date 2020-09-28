<%@ Page Language="C#" MasterPageFile="Site1.Master"  AutoEventWireup="true" CodeBehind="Overzicht.aspx.cs" Inherits="ProjectGroenBos.Recreatie.Overzicht" %>


<asp:content id="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div id="lvActiviteitenSchema">
            <asp:Label ID="lblActiviteiten" runat="server" Text="Geplande Activiteiten" CssClass="lblgeplandeactiviteiten"></asp:Label>
            <asp:Label ID="lblDatum" runat="server" Text="Datum:"></asp:Label>
            <asp:Label ID="lbldatumNu" runat="server" Text=""></asp:Label>
            <asp:Button ID="backwards" runat="server" CssClass="vorigeknop" OnClick="OnButtonPress" Text="&lt;" />
            <asp:Button ID="Forward" runat="server" CssClass="volgendeknop" OnClick="OnButtonPress" Text="&gt;" />

            <asp:CheckBox ID="CbWeekOverzicht" runat="server" AutoPostBack="True" OnCheckedChanged="CbWeekOverzicht_CheckedChanged" Text="WeekOverzicht" />

            <asp:GridView ID="gvActiveiten" runat="server" AutoGenerateColumns="True" DataSourceID="SqlDataSource1" Height="215px" Width="1302px">
                <EmptyDataTemplate>
                    <div align="center">Er zijn geen activiteiten op deze dag gepland.</div>
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select datepart (week, dbo.Activiteit.Datum)as Weeknummer, dbo.Activiteit.Naam , dbo.Faciliteit.Omschrijving as Locatie,dbo.Activiteit.Locatie as Specificatie, dbo.Activiteit.Inschrijfkosten,
 dbo.Activiteit.Datum, dbo.Activiteit.Begintijd, dbo.Activiteit.Eindtijd, dbo.Activiteit.[Maximaal aantal]
 
 from dbo.Activiteit
 join dbo.Faciliteit on dbo.Activiteit.FaciliteitID = dbo.Faciliteit.ID
 where datediff(week, getdate(),dbo.Activiteit.Datum) = 0"></asp:SqlDataSource></div>
</asp:content>