<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/Site1.Master" AutoEventWireup="true" CodeBehind="ProductPaginaInzien.aspx.cs" Inherits="ProjectGroenBos.Recreatie.ProductPaginaInzien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="header">Productpagina Inzien</div>
    <asp:Label ID="LblZoekenInactiefmakenproductpagina" runat="server" Text="Zoeken:" CssClass="labelzoekenProductpaginainzien"></asp:Label>
    <asp:TextBox ID="TxbZoekenproductpagina" runat="server" CssClass="textboxzoekenProductpaginainactief" OnTextChanged="TxbZoekenproductpagina_TextChanged"></asp:TextBox>
    
    <asp:RadioButton ID="RdbLeverancier" Text="Leverancier" runat="server" GroupName="Productzoeken" CssClass="ckbLeverancierProductpaginainactief"/>
    <asp:RadioButton ID="RdbCategorie" Text="Categorie" runat="server" GroupName="Productzoeken" CssClass="ckbCategorieProductpaginainactief"/>
    <asp:GridView ID="GVProductpagInzien" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="content-table6" DataKeyNames="Nummer" ForeColor="#333333" GridLines="None" ShowFooter="True" OnSelectedIndexChanged="GVProductpagInzien_SelectedIndexChanged" OnSorting="GVProductpagInzien_Sorting">
         <Columns>

             <asp:TemplateField HeaderText="Artikelnummer" SortExpression="Nummer" Visible="true" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label ID ="Label1" Text='<%# Eval("Nummer") %>'  runat="server"/>

                 </ItemTemplate>

<HeaderStyle ForeColor="White"></HeaderStyle>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Artikelnaam" SortExpression="Artikelnaam" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Artikelnaam") %>' runat="server" />

                 </ItemTemplate>

<HeaderStyle ForeColor="White"></HeaderStyle>

             </asp:TemplateField>

             <asp:TemplateField HeaderText="Omschrijving" SortExpression="Omschrijving" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Omschrijving") %>' runat="server"/>

                 </ItemTemplate>

<HeaderStyle ForeColor="White"></HeaderStyle>
                 </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Prijs" SortExpression="Prijs" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Prijs") %>' runat="server"/>

                 </ItemTemplate>

<HeaderStyle ForeColor="White"></HeaderStyle>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Aantal" SortExpression="Aantal" HeaderStyle-ForeColor="White" >

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Aantal") %>' runat="server"/>

                 </ItemTemplate>

<HeaderStyle ForeColor="White"></HeaderStyle>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Minimum Voorraad" SortExpression="[Minimum voorraad]" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("[Minimum voorraad]") %>' runat="server"/>

                 </ItemTemplate>

<HeaderStyle ForeColor="White"></HeaderStyle>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Naam Leverancier" SortExpression="[Naam Leverancier]" HeaderStyle-ForeColor="White" >

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("[Naam Leverancier]") %>' runat="server"/>

                 </ItemTemplate>

<HeaderStyle ForeColor="White"></HeaderStyle>

             </asp:TemplateField>

             <asp:TemplateField HeaderText="Categorie" SortExpression="Categorie" HeaderStyle-ForeColor="White" >

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Categorie") %>' runat="server"/>

                 </ItemTemplate>

<HeaderStyle ForeColor="White"></HeaderStyle>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Huurtarief" SortExpression="Huurtarief" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Huurtarief") %>' runat="server"/>

                 </ItemTemplate>

<HeaderStyle ForeColor="White"></HeaderStyle>

             </asp:TemplateField>
            
             
             </Columns>
             </asp:GridView>
    <asp:Button ID="BtnProductpaginaInzienWijzigen" runat="server" Text="Wijzigen" CssClass="BtnProductpaginaInzienWijzigen" OnClick="BtnProductpaginaInzienWijzigen_Click1" />
    <asp:Button ID="BtnProductpaginaInzieninactief" runat="server" Text="Inactief maken" OnClick="BtnProductpaginaInzieninactief_Click" CssClass="BtnProductpaginaInzieninactief"/>
</asp:Content>
