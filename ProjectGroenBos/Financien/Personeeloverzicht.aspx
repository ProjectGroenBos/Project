<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="Personeeloverzicht.aspx.cs" Inherits="ProjectGroenBos.Financien.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%-- Main grid --%>
 <div class="header">Personeellijst</div>
<div class="wrapper">
    <div class="mainpanel">
        <div class="container">
            <h2>Personeelscherm 2020</h2>
            <p>Dit is de indeling van alle werknemers bij recreatiepark Groenbos periode 2020/2021.</p>
        <asp:GridView ID="PersoneelsOverzicht" CssClass="content-table tweedetable" GridLines="None" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:BoundField DataField="Nummer" HeaderText="" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
                <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
                <asp:BoundField DataField="Geboortedatum" ApplyFormatInEditMode="true" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Geboortedatum" SortExpression="Geboortedatum" />
                <asp:BoundField DataField="In_dienst_sinds" ApplyFormatInEditMode="true" DataFormatString="{0:dd/MM/yyyy}" HeaderText="In dienst sinds" SortExpression="In_dienst_sinds" />
                <asp:BoundField DataField="Salaris_per_maand" HeaderText="Salaris" SortExpression="Salaris" />
                <asp:BoundField DataField="Functie" HeaderText="Functie" SortExpression="Functie" />
                <asp:BoundField DataField="Afdeling" HeaderText="Afdeling" SortExpression="Afdeling" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT Med.Nummer, Med.Naam, Med.Geboortedatum, Med.[In dienst sinds] AS In_dienst_sinds, Med.[Salaris per maand] AS Salaris_per_maand, Fun.naam as Functie, Afd.Naam as Afdeling FROM (( dbo.Medewerker Med  inner join dbo.Functie Fun on Med.FunctieID = Fun.ID) inner join dbo.Afdeling Afd on Med.AfdelingID= Afd.ID) where Med.FunctieID= Fun.ID and Med.AfdelingID= Afd.ID" UpdateCommand="UPDATE dbo.Medewerker Med inner join dbo.Functie Fun on Med.FunctieID = Fun.ID inner join dbo.Afdeling Afd on Med.AfdelingID= Afd.ID  SET [Med.Naam] = @Naam, [Geboortedatum] = @Geboortedatum, [In_dienst_sinds] = @In_dienst_sinds, [Salaris_per_maand] = @Salaris_per_maand, [Fun.naam] = @Functie, [Afd.Naam] = @Afdeling WHERE [ID] = @ID ">

            <UpdateParameters>
                <asp:Parameter Name="Naam" type="String" />
                <asp:Parameter Name="Geboortedatum" type="DateTime" />
                <asp:Parameter Name="In_dienst_sinds" type="DateTime" />
                <asp:Parameter Name="Salaris_per_maand" Type="Int32" />
                <asp:Parameter Name="Functie" type="String" />
                <asp:Parameter Name="Afdeling" type="String" />
            </UpdateParameters>

        </asp:SqlDataSource>
        </div>
    </div>

    <%-- side --%>
    <div class="sidepanel">
        <div class="container">
            <asp:Button CssClass="button buttongreen" ID="ButtonToevoegen" runat="server" Text="Toevoegen" OnClick="ButtonToevoegen_Click" />
            <asp:Button CssClass="button buttonred" ID="ButtonVerwijderen" runat="server" Text="Verwijderen" />
        </div>
    </div>
</div>
</asp:Content>
