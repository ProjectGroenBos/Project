<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="TransactieHistory.aspx.cs" Inherits="ProjectGroenBos.Financien.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Transactie Historie</div>
    <div class="container" runat="server">
        <asp:GridView ID="gvTransacties" CssClass="content-table eerstetable" runat="server" AutoGenerateColumns="False" DataKeyNames="Kenmerk" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Kenmerk" HeaderText="Kenmerk" InsertVisible="False" ReadOnly="True" SortExpression="Kenmerk" />
                <asp:BoundField DataField="Datum" DataFormatString="{0:d}" HeaderText="Datum" SortExpression="Datum" />
                <asp:BoundField DataField="Aan" HeaderText="Aan" SortExpression="Aan" />
                <asp:BoundField DataField="Bedrag" HeaderText="Bedrag" SortExpression="Bedrag" />
                <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
                <asp:BoundField DataField="DebiteurenfactuurNummer" HeaderText="DebiteurenfactuurNummer" SortExpression="DebiteurenfactuurNummer" />
                <asp:BoundField DataField="CrediteurenfactuurNummer" HeaderText="CrediteurenfactuurNummer" SortExpression="CrediteurenfactuurNummer" />
                <asp:BoundField DataField="BankrekeningBanknummer" HeaderText="BankrekeningBanknummer" SortExpression="BankrekeningBanknummer" />
                <asp:BoundField DataField="PersoneelNummer" HeaderText="PersoneelNummer" SortExpression="PersoneelNummer" />
                <asp:BoundField DataField="TypeID" HeaderText="TypeID" SortExpression="TypeID" />
                <asp:BoundField DataField="Type Transactie" HeaderText="Type Transactie" SortExpression="Type Transactie" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="Select Transactie.*, Type.Omschrijving AS 'Type Transactie' from Transactie
INNER JOIN Type ON Transactie.TypeID = Type.ID
Order By Datum DESC"></asp:SqlDataSource>
    </div>
</asp:Content>
