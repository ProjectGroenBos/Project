<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Financien/Financien.Master" CodeBehind="WebForm5.aspx.cs" Inherits="ProjectGroenBos.Financien.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Main grid --%>
    <div class="header">Personeellijst</div>
    <div class="container">
        <h2>Personeelscherm 2020</h2>
        <p>Dit is de indeling van alle werknemers bij recreatiepark Groenbos periode 2020/2021.</p>

        <asp:GridView ID="gvPersoneelsOverzicht" DataKeyNames="Nummer" CssClass="content-table tweedetable" GridLines="None" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
                <asp:BoundField DataField="Betalen_aan" HeaderText="Betalen_aan" SortExpression="Betalen_aan" />
                <asp:BoundField DataField="Totaal_bedrag" HeaderText="Totaal_bedrag" SortExpression="Totaal_bedrag" />
                <asp:BoundField DataField="Reeds_betaald" HeaderText="Reeds_betaald" SortExpression="Reeds_betaald" />
                <asp:BoundField DataField="Termijn" HeaderText="Termijn" SortExpression="Termijn" />
                <asp:BoundField DataField="Omschrijving_betaalcondities" HeaderText="Omschrijving_betaalcondities" SortExpression="Omschrijving_betaalcondities" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Nummer], [Betalen aan] AS Betalen_aan, [Totaal bedrag] AS Totaal_bedrag, [Reeds betaald] AS Reeds_betaald, [Termijn], [Omschrijving betaalcondities] AS Omschrijving_betaalcondities FROM [Crediteurenfactuur]">

        </asp:SqlDataSource>
    </div>

    </asp:Content>