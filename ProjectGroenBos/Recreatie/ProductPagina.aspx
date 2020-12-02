<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/Site1.Master" AutoEventWireup="true" CodeBehind="ProductPagina.aspx.cs" Inherits="ProjectGroenBos.Recreatie.ProductPagina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Productpagina </div>
        <asp:GridView ID="GridView1" runat="server" CssClass="content-table2" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="true" SortExpression="Nummer" />
                <asp:BoundField DataField="Artikelnaam" HeaderText="Artikelnaam" ReadOnly="true" SortExpression="Artikelnaam" />
                <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" ReadOnly="true" SortExpression="Omschrijving" />
                <asp:BoundField DataField="Prijs" HeaderText="Prijs" ReadOnly="true" SortExpression="Prijs" />
                <asp:BoundField DataField="Aantal" HeaderText="Aantal" ReadOnly="true" SortExpression="Aantal" />
                <asp:BoundField DataField="MinimumVoorraad" HeaderText="MinimumVoorraad" ReadOnly="true" SortExpression="MinimumVoorraad" />
                <asp:TemplateField HeaderText="NaamLeverancier" SortExpression="NaamLeverancier">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlLeverancier" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="NaamLeverancier" DataValueField="ID" SelectedValue='<%# Bind("LeverancierID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [ID], [Naam] FROM [Leverancier]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("NaamLeverancier") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Categorie" HeaderText="Categorie" ReadOnly="true" SortExpression="Categorie" />
                <asp:BoundField DataField="Huurtarief" HeaderText="Huurtarief" ReadOnly="true" SortExpression="Huurtarief" />
                <asp:BoundField DataField="LeverancierID" HeaderText="LeverancierID" ReadOnly="true" SortExpression="LeverancierID" />
                <asp:BoundField DataField="CategorieID" HeaderText="CategorieID" ReadOnly="true" SortExpression="CategorieID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT Nummer, Artikelnaam, Omschrijving, Prijs, Aantal, [Minimum voorraad] AS 'MinimumVoorraad', [Naam Leverancier] AS 'NaamLeverancier', Categorie, Huurtarief, LeverancierID, CategorieID FROM vRecreatieProductpagina
" UpdateCommand="update [dbo].[Huuritem] set [Artikelnaam]= @Artikelnaam , [Omschrijving] = @Omschrijving, [Prijs] = @Prijs, [Aantal] = @Aantal, [Minimum voorraad] = @MinimumVoorraad, [Naam Leverancier] = NaamLeverancier, [Categorie] = @Categorie, [Huurtarief] = @Huurtarief, [LeverancierID] = @LeverancierID, [CategorieID] = @CategorieID Where Nummer = @Nummer">
            <UpdateParameters>
                <asp:Parameter Name="Artikelnaam" />
                <asp:Parameter Name="Omschrijving" />
                <asp:Parameter Name="Prijs" />
                <asp:Parameter Name="Aantal" />
                <asp:Parameter Name="MinimumVoorraad" />
                <asp:ControlParameter
                    Name="LeverancierNaam"
                    ControlID="LeverancierID"
                    PropertyName="Value" />
                <asp:Parameter Name="ID" />
                <asp:Parameter Name="Categorie" />
                <asp:Parameter Name="Huurtarief" />
                <asp:Parameter Name="LeverancierID" />
                <asp:Parameter Name="CategorieID" />
                <asp:Parameter Name="Nummer" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="LeverancierID" runat="server" />
        <asp:HiddenField ID="CategorieID" runat="server" />
        
    

</asp:Content>
