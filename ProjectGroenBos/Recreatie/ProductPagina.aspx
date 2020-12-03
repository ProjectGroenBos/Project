<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/Site1.Master" AutoEventWireup="true" CodeBehind="ProductPagina.aspx.cs" Inherits="ProjectGroenBos.Recreatie.ProductPagina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Productpagina </div>
        <asp:GridView ID="GridView1" runat="server" CssClass="content-table2" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames ="Nummer"  DataSourceID="SqlDataSource1" AllowSorting="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowCommand="GridView1_RowCommand" OnRowUpdated="GridView1_RowUpdated" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="true" SortExpression="Nummer" HeaderStyle-ForeColor="White"/>
                <asp:BoundField DataField="Artikelnaam" HeaderText="Artikelnaam" SortExpression="Artikelnaam" HeaderStyle-ForeColor="White"/>
                <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" HeaderStyle-ForeColor="White"/>
                <asp:BoundField DataField="Prijs" HeaderText="Prijs" SortExpression="Prijs" HeaderStyle-ForeColor="White"/>
                <asp:BoundField DataField="Aantal" HeaderText="Aantal" ReadOnly="true" SortExpression="Aantal" HeaderStyle-ForeColor="White"/>
                <asp:BoundField DataField="MinimumVoorraad" HeaderText="MinimumVoorraad" SortExpression="MinimumVoorraad" HeaderStyle-ForeColor="White"/>
                
                <asp:TemplateField HeaderText="Naam Leverancier" SortExpression="NaamLeverancier" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlLeverancier" runat="server" DataSourceID="SqlDataSource1" DataTextField="Naam" DataValueField="ID" SelectedValue='<%# Bind("LeverancierID") %>' AutoPostBack="True" OnSelectedIndexChanged="ddlLeverancier_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [ID], [Naam] FROM [Leverancier]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Label ID="Label1" runat="server" Text='<%# Bind("NaamLeverancier") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Categorie" SortExpression="Categorie" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlCategorie" runat="server" DataSourceID="SqlDataSource2" DataTextField="Omschrijving" DataValueField="ID" SelectedValue='<%# Bind("CategorieID") %>' AutoPostBack="True" OnSelectedIndexChanged="ddlCategorie_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [ID], [Omschrijving] FROM [Categorie]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Label ID="Label1" runat="server" Text='<%# Bind("Categorie") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="Huurtarief" HeaderText="Huurtarief" SortExpression="Huurtarief" HeaderStyle-ForeColor="White"/>
                <asp:BoundField DataField="LeverancierID" HeaderText="LeverancierID" ReadOnly="true" SortExpression="LeverancierID" Visible ="false" />
                <asp:BoundField DataField="CategorieID" HeaderText="CategorieID" ReadOnly="true" SortExpression="CategorieID" Visible ="false"/>
                <asp:CommandField ShowEditButton="True" ItemStyle-ForeColor="White" />
            </Columns>
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT Nummer, Artikelnaam, Omschrijving, Prijs, Aantal, [Minimum voorraad] AS 'MinimumVoorraad', [Naam Leverancier] AS 'NaamLeverancier', Categorie, Huurtarief, LeverancierID, CategorieID FROM vRecreatieProductpagina
" UpdateCommand="update [dbo].[Voorraad] set [LeverancierID] = @LeverancierID, [Naam] = @Artikelnaam, [Omschrijving] = @Omschrijving, [Prijs] = @Prijs, [Minimum voorraad] = @MinimumVoorraad WHERE  Voorraad.ID = @Nummer

update [dbo].[Huuritem] set [CategorieID] = @CategorieID, [Prijs] = @Huurtarief WHERE Huuritem.VoorraadID = @Nummer">
            <UpdateParameters>
                <asp:ControlParameter
                    Name="LeverancierID"
                    ControlID="LeverancierID"
                    PropertyName="Value" />
                <asp:Parameter Name="Artikelnaam" />
                <asp:Parameter Name="Omschrijving" />
                <asp:Parameter Name="Prijs" />
                <asp:Parameter Name="MinimumVoorraad" />
                <asp:Parameter Name="Nummer" />
                <asp:ControlParameter
                    Name="CategorieID"
                    ControlID="CategorieID"
                    PropertyName="Value" />
                <asp:Parameter Name="Huurtarief" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
        
    

    <asp:TextBox ID="txtProductZoeken" runat="server" AutoPostBack="True" OnTextChanged="txtProductZoeken_TextChanged" CssClass="Textboxproductpaginawijzigen"></asp:TextBox>
        
        
    

    <asp:HiddenField ID="CategorieID" runat="server" />
    <asp:Button ID="btnZoeken" runat="server" OnClick="btnZoeken_Click" Text="Zoeken" CssClass="buttonproductpaginawijzigen"/>
    <asp:RadioButton ID="rdbLeverancier" runat="server" Text="Leverancier" Groupname="Zoeken" CssClass="RDBproductpaginawijzigenLeverancier" />
    <asp:HiddenField ID="LeverancierID" runat="server" />
        
        
    

    <asp:RadioButton ID="rdbCategorie" runat="server" Text="Categorie" GroupName="Zoeken" CssClass="RDBproductpaginawijzigencategorie"/>
            
        
    

</asp:Content>
