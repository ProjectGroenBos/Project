<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/Site1.Master" AutoEventWireup="true" CodeBehind="Voorraadmuteren.aspx.cs" Inherits="ProjectGroenBos.Recreatie.Voorraadmuteren" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Label ID="Label1" runat="server" Text="Voorraad muteren" CssClass="labelvoorraadmuteren"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="Zoeken" CssClass="labelzoekenvoorraadmuteren"></asp:Label>
    <asp:TextBox ID="txbZoekenVoorraadmuteren" runat="server" CssClass="txbzoekenvoorraadmuteren"></asp:TextBox>
    <asp:CheckBox ID="CheckBox1" runat="server" CssClass="checkboxleverancier" Text="Leverancier" />
    <asp:CheckBox ID="CheckBox2" runat="server" CssClass="checkboxcategorie" Text="Categorie" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridviewvoorraadmuteren" DataKeyNames="ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Aantal" HeaderText="Aantal" SortExpression="Aantal" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="Prijs" HeaderText="Prijs" SortExpression="Prijs" />
            <asp:BoundField DataField="BTW tariefID" HeaderText="BTW tariefID" SortExpression="BTW tariefID" />
            <asp:BoundField DataField="Minimum voorraad" HeaderText="Minimum voorraad" SortExpression="Minimum voorraad" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
        </Columns>
    </asp:GridView>
    <asp:Button ID="BtnNieuwartikel" runat="server" Text="+ Nieuw artikel" CssClass="buttonnieuwartikel" ForeColor="White" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM [Voorraad]"></asp:SqlDataSource>
</asp:Content>
