<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="Voorraad.aspx.cs" Inherits="recreatie.paginas.Beheer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/stylevoorraad.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label3" runat="server" Text="Zoeken:" CssClass="labelvoorraad"></asp:Label>
    <asp:Image ID="Image2" runat="server" CssClass="imagevoorraad" Height="171px" ImageUrl="~/Recreatie/img/Logo1.png" Width="212px" />
    <asp:TextBox ID="txtZoekbalk" runat="server" Width="300px" placeholder="Zoek op Artikelnaam of Omschrijving..." OnTextChanged="txtZoeken_TextChanged"  AutoPostBack="True" CssClass="textboxvoorraad"></asp:TextBox>
     <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
     <asp:Button ID="btnSelecteren" runat="server" OnClick="btnSelecteren_Click" Text="Producten selecteren" />
    <asp:Button ID="BtnBestellen" runat="server" Text="Bestellen" OnClick="BtnBestellen_Click" />
    <asp:GridView ID="gvVoorraad" runat="server" AutoGenerateColumns="False" AllowSorting="true" OnSorting="OnSorting" ShowFooter="true" DataKeyNames="ID" ShowHeaderWhenEmpty="true"
            OnRowCommand="gvVoorraad_RowCommand" OnRowEditing="gvVoorraad_RowEditing" OnRowCancelingEdit="gvVoorraad_RowCancelingEdit" OnRowUpdating="gvVoorraad_RowUpdating" OnRowDeleting="gvVoorraad_RowDeleting"
            CellPadding="4" ForeColor="#333333" GridLines="none" Width="80%" OnSelectedIndexChanged="gvVoorraad_SelectedIndexChanged" CssClass="content-table" >

          
          

            <Columns>
                <asp:TemplateField HeaderText="Artikelnummer" SortExpression="ID" Visible ="False">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("ID") %>' runat="server"/>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Artikelnaam | Omschrijving " SortExpression="Artikelnaam" >  
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Artikelnaam") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Aantal" SortExpression="Aantal">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Aantal") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="In gebruik" SortExpression="Ingebruik">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Ingebruik") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Beschikbaar" SortExpression="Beschikbaar">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Beschikbaar") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Minimale voorraad" SortExpression="[Minimum voorraad]">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("[Minimum voorraad]") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Product selecteren"  Visible="False">
                    <ItemTemplate>
                        <asp:CheckBox ID="cbGeselecteerd" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
        </Columns>           
        </asp:GridView>
</asp:Content>
