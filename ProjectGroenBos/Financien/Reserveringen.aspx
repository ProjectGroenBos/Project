<%@ Page Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="Reserveringen.aspx.cs" Inherits="ProjectGroenBos.Financien.Reserveringen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="header">Reserveringen</div>
    <div class="container">
        <h2>Reserveringen-overzicht</h2>
        <p>Dit is een overzicht van alle reserveringen bij recreatiepark Groenbos.</p>
    
    
         <asp:GridView ID="gvReserveringen" DataKeyNames="Nummer" CssClass="content-table tweedetable" GridLines="None" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource6">
            <Columns>
                <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" SortExpression="Nummer" ReadOnly="True" />
                <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" ReadOnly="True" />
                <asp:BoundField DataField="Totaalprijs" HeaderText="Totaalprijs" SortExpression="Totaalprijs" DataFormatString="€ {0:n} " />
                <asp:BoundField DataField="Aankomstdatum" HeaderText="Aankomstdatum" SortExpression="Aankomstdatum" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="BtnUitklap" Text="+" runat="server" />
                    </ItemTemplate>
                 </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT Reservering.Nummer, Reservering.Totaal_prijs AS Totaalprijs, Isnull(Gast.Voornaam,' ') +' '+ Isnull(Gast.Tussenvoegsel,' ')+' '+ Isnull(Gast.Achternaam,' ') AS Naam, Reservering.Aankomstdatum FROM Reservering INNER JOIN Gast ON Reservering.GastNummer = Gast.Nummer"></asp:SqlDataSource>
        <br />
    </div>
</asp:Content>