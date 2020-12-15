<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/Site1.Master" AutoEventWireup="true" CodeBehind="ProductPagina.aspx.cs" Inherits="ProjectGroenBos.Recreatie.ProductPagina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Productpagina </div>
        <asp:GridView ID="GridView1" runat="server" CssClass="content-table2" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames ="Nummer"  DataSourceID="SqlDataSource1" AllowSorting="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowCommand="GridView1_RowCommand" OnRowUpdated="GridView1_RowUpdated" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="true" SortExpression="Nummer" HeaderStyle-ForeColor="White">
<HeaderStyle ForeColor="White"></HeaderStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="Artikelnaam" SortExpression="Artikelnaam">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbArtikelnaam" runat="server" Text='<%# Bind("Artikelnaam") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TbArtikelnaam"></asp:RequiredFieldValidator>
<%--                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="TbArtikelnaam"></asp:RegularExpressionValidator>--%>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Artikelnaam") %>'></asp:Label>

                    </ItemTemplate>
                    <HeaderStyle ForeColor="White" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Omschrijving" SortExpression="Omschrijving">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbOmschrijving" runat="server" Text='<%# Bind("Omschrijving") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TbOmschrijving" Display="Dynamic"></asp:RequiredFieldValidator>
<%--                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" Display="Dynamic" ControlToValidate="TbOmschrijving"></asp:RegularExpressionValidator>--%>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Omschrijving") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="White" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Prijs" SortExpression="Prijs">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbPrijs" runat="server" Text='<%# Bind("Prijs") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TbPrijs" Display="Dynamic"></asp:RequiredFieldValidator>
<%--                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="TbPrijs" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Prijs") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="White" />
                </asp:TemplateField>
                <asp:BoundField DataField="Aantal" HeaderText="Aantal" ReadOnly="true" SortExpression="Aantal" HeaderStyle-ForeColor="White">
<HeaderStyle ForeColor="White"></HeaderStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="MinimumVoorraad" SortExpression="MinimumVoorraad">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbMinVoorraad" runat="server" Text='<%# Bind("MinimumVoorraad") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" Display="Dynamic" ControlToValidate="TbMinVoorraad"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("MinimumVoorraad") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="White" />
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Naam Leverancier" SortExpression="NaamLeverancier" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlLeverancier" runat="server" DataSourceID="SqlDataSource1" DataTextField="Naam" DataValueField="ID" SelectedValue='<%# Bind("LeverancierID") %>' AutoPostBack="True" OnSelectedIndexChanged="ddlLeverancier_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [ID], [Naam] FROM [Leverancier]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Label ID="Label1" runat="server" Text='<%# Bind("NaamLeverancier") %>'></asp:Label>
                    </ItemTemplate>
                    
<HeaderStyle ForeColor="White"></HeaderStyle>
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

<HeaderStyle ForeColor="White"></HeaderStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Huurtarief" SortExpression="Huurtarief">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbHuurtarief" runat="server" Text='<%# Bind("Huurtarief") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="TbHuurtarief" Display="Dynamic"></asp:RequiredFieldValidator>
<%--                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="TbHuurtarief" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                        </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Huurtarief") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="White" />
                </asp:TemplateField>
                
                <asp:BoundField DataField="LeverancierID" HeaderText="LeverancierID" ReadOnly="true" SortExpression="LeverancierID" Visible ="false" />
                <asp:BoundField DataField="CategorieID" HeaderText="CategorieID" ReadOnly="true" SortExpression="CategorieID" Visible ="false"/>
                <asp:CommandField ShowEditButton="True" ItemStyle-ForeColor="White" >
<ItemStyle ForeColor="White"></ItemStyle>
                </asp:CommandField>
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
