<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/Site1.Master" AutoEventWireup="true" CodeBehind="VoorraadAfboeken.aspx.cs" Inherits="ProjectGroenBos.Recreatie.VoorraadAfboeken" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:TextBox ID="txbAfboekenZoeken" runat="server" OnTextChanged="txbAfboekenZoeken_TextChanged"></asp:TextBox>
    <asp:Label ID="Label2" runat="server" Text="Zoeken"></asp:Label>
    
    <asp:GridView ID="GvAfboeken" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="content-table" DataKeyNames="ID" ForeColor="#333333" GridLines="None" ShowFooter="True" ShowHeaderWhenEmpty="True" Width="80%" OnRowCancelingEdit="GvAfboeken_RowCancelingEdit" OnRowCommand="GvAfboeken_RowCommand" OnRowDeleting="GvAfboeken_RowDeleting" OnRowEditing="GvAfboeken_RowEditing" OnRowUpdating="GvAfboeken_RowUpdating" OnSelectedIndexChanged="GvAfboeken_SelectedIndexChanged" OnSorting="OnSorting">
        <Columns>
            <asp:TemplateField HeaderText="Artikelnummer" SortExpression="ID" Visible="true" >
                <ItemTemplate>
                    <asp:Label ID ="Label1" Text='<%# Eval("ID") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Artikelnaam | Omschrijving" SortExpression="Artikelnaam" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Artikelnaam") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Prijs" SortExpression="Prijs" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Prijs") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Aantal" SortExpression="Aantal" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Aantal") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Minimum Voorraad" SortExpression="Minimumvoorraad" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Minimum voorraad") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Naam Leverancier" SortExpression="Leverancier" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Naam Leverancier") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Huurtarief" SortExpression="Huurtarief" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Huurtarief") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Product selecteren"  Visible="true">
                    <ItemTemplate>
                        <asp:CheckBox ID="cbGeselecteerd" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>
        
</asp:Content>
