<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/Site1.Master" AutoEventWireup="true" CodeBehind="ProductPagina.aspx.cs" Inherits="ProjectGroenBos.Recreatie.ProductPagina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Productpagina<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM vRecreatieProductpagina" UpdateCommand="UPDATE [dbo.Huuritem] SET [Artikelnaam] = @Artikelnaam, [Omschrijving] = @Omschrijving, [Prijs] = @Prijs, [Aantal] = @Aantal, [Minimum voorraad] = @MinimumVoorraad, [Naam Leverancier] = @NaamLeverancier, [Categorie] =  @Categorie, [Huurtarief] = @Huurtarief WHERE Nummer = @Nummer">
        <UpdateParameters>
            <asp:Parameter Name="Artikelnaam" />
            <asp:Parameter Name="Omschrijving" />
            <asp:Parameter Name="Prijs" />
            <asp:Parameter Name="Aantal" />
            <asp:Parameter Name="MinimumVoorraad" />
            <asp:Parameter Name="NaamLeverancier" />
            <asp:Parameter Name="Categorie" />
            <asp:Parameter Name="Huurtarief" />
            <asp:Parameter Name="Nummer" />
        </UpdateParameters>
        </asp:SqlDataSource>

        <asp:HiddenField ID="LeverancierID" runat="server"  Value='' />
        <asp:HiddenField ID="CategorieID" runat="server"  Value='' />

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="content-table2" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="Nummer" HeaderText="Nummer" SortExpression="Nummer" />
                <asp:BoundField DataField="Artikelnaam" HeaderText="Artikelnaam" SortExpression="Artikelnaam" />
                <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
                <asp:BoundField DataField="Prijs" HeaderText="Prijs" SortExpression="Prijs" />
                <asp:BoundField DataField="Aantal" HeaderText="Aantal" SortExpression="Aantal" />
                <asp:BoundField DataField="Minimum voorraad" HeaderText="Minimum voorraad" SortExpression="Minimum voorraad" />
                <asp:BoundField DataField="Naam Leverancier" HeaderText="Naam Leverancier" SortExpression="Naam Leverancier" />
                <asp:TemplateField HeaderText="Categorie" SortExpression="Categorie">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlCategorie" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Categorie" SelectedValue='<%# Bind("Categorie") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [ID], [Omschrijving] FROM [Categorie]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Categorie") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Huurtarief" HeaderText="Huurtarief" SortExpression="Huurtarief" />
            </Columns>
        </asp:GridView>
    </div>


</asp:Content>
