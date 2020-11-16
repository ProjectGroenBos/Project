<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/Site1.Master" AutoEventWireup="true" CodeBehind="Voorraadmuteren.aspx.cs" Inherits="ProjectGroenBos.Recreatie.Voorraadmuteren" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label1" runat="server" Text="Voorraad muteren" CssClass="labelvoorraadmuteren"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="Zoeken" CssClass="labelzoekenvoorraadmuteren"></asp:Label>
    <asp:TextBox ID="txbZoekenVoorraadmuteren" runat="server" CssClass="txbzoekenvoorraadmuteren"></asp:TextBox>
    <asp:CheckBox ID="CheckBox1" runat="server" CssClass="checkboxleverancier" Text="Leverancier" />
    <asp:CheckBox ID="CheckBox2" runat="server" CssClass="checkboxcategorie" Text="Categorie" />
    <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False" ShowFooter="true" DataKeyNames="PK_Product" ShowHeaderWhenEmpty="true"
        OnRowCommand="gvProduct_RowCommand" OnRowEditing="gvProduct_RowEditing" OnRowCancelingEdit="gvProduct_RowCancelingEdit" OnRowUpdating="gvProduct_RowUpdating" OnRowDeleting="gvProduct_RowDeleting">
        <Columns>

            <asp:TemplateField HeaderText="Artikelnummer">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Naam") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtNaam" Text='<%# Eval("Naam") %>' runat="server" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtNaamFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Product Naam">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Naam") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtNaam" Text='<%# Eval("Naam") %>' runat="server" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtNaamFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Omschrijving">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Omschrijving") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtOmschrijving" Text='<%# Eval("Omschrijving") %>' runat="server" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtOmschrijvingFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Prijs">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Minimale_Voorraad") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtMinimale_Voorraad" Text='<%# Eval("Minimale_Voorraad") %>' runat="server" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtMinimale_VoorraadFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Aantal">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Minimale_Voorraad") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtMinimale_Voorraad" Text='<%# Eval("Minimale_Voorraad") %>' runat="server" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtMinimale_VoorraadFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Minimale Voorraad">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Minimale_Voorraad") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtMinimale_Voorraad" Text='<%# Eval("Minimale_Voorraad") %>' runat="server" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtMinimale_VoorraadFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Minimale Voorraad">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Minimale_Voorraad") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtMinimale_Voorraad" Text='<%# Eval("Minimale_Voorraad") %>' runat="server" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtMinimale_VoorraadFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ImageUrl="~/Img/edit.png" runat="server" CommandName="Edit" ToolTip="Bewerken" Width="20px" Height="20px" />
                    <asp:ImageButton ImageUrl="~/Img/delete.png" runat="server" CommandName="Delete" ToolTip="Verwijderen" Width="20px" Height="20px" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:ImageButton ImageUrl="~/Img/save.png" runat="server" CommandName="Update" ToolTip="Opslaan" Width="20px" Height="20px" />
                    <asp:ImageButton ImageUrl="~/Img/cancel.png" runat="server" CommandName="Cancel" ToolTip="Annuleren" Width="20px" Height="20px" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:ImageButton ImageUrl="~/Img/addnew.png" runat="server" CommandName="AddNew" ToolTip="Toevoegen" Width="20px" Height="20px" />
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </asp:GridView>
    <asp:Button ID="BtnNieuwartikel" runat="server" Text="+ Nieuw artikel" CssClass="buttonnieuwartikel" ForeColor="White" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM [Voorraad]"></asp:SqlDataSource>
</asp:Content>
