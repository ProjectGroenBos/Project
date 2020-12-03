<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/Site1.Master" AutoEventWireup="true" CodeBehind="Voorraadmuteren.aspx.cs" Inherits="ProjectGroenBos.Recreatie.Voorraadmuteren" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

 </asp:Content>

 <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="header">Voorraad Muteren</div>
 
 



     <asp:Label ID="Label2" runat="server" Text="Zoeken" CssClass="labelzoekenvooraadmutatie"></asp:Label>

     <asp:TextBox ID="txbZoekenVoorraadmuteren" runat="server" CssClass="TextboxzoekenVooraadmutatie" OnTextChanged="txbZoekenVoorraadmuteren_TextChanged1"></asp:TextBox>

     <asp:CheckBox ID="ckbLeverancier" runat="server" CssClass="checkboxleverancierVoorraadmutatie" Text=" Leverancier" />

     </asp:GridView>
 
    <asp:Button ID="btnOpboeken" runat="server" Text="Opboeken" CssClass="ButtonOpboekenknop" ForeColor="White" />

     <asp:Button ID="btnAfboeken" runat="server" OnClick="btnAfboeken_Click" Text="Afboeken" CssClass="ButtonAfboekenknop" ForeColor="White" />
 
    <asp:GridView ID="GvMuteren" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="content-table" DataKeyNames="Nummer" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GvMuteren_RowCancelingEdit" OnRowCommand="GvMuteren_RowCommand" OnRowDeleting="GvMuteren_RowDeleting" OnRowEditing="GvMuteren_RowEditing" OnRowUpdating="GvMuteren_RowUpdating" OnSelectedIndexChanged="GvMuteren_SelectedIndexChanged" OnSorting="OnSorting" ShowFooter="True" ShowHeaderWhenEmpty="True" Width="80%">





         <Columns>

             <asp:TemplateField HeaderText="Artikelnummer" SortExpression="Nummer" Visible="true" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label ID ="Label1" Text='<%# Eval("Nummer") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Artikelnaam | Omschrijving" SortExpression="Artikelnaam" HeaderStyle-ForeColor="White" >

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Artikelnaam") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Prijs" SortExpression="Prijs" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Prijs") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Aantal" SortExpression="Aantal" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Aantal") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Minimum Voorraad" SortExpression="[Minimum voorraad]" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("[Minimum voorraad]") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Naam Leverancier" SortExpression="[Naam Leverancier]" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("[Naam Leverancier]") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Huurtarief" SortExpression="Huurtarief" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Huurtarief") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>

         </Columns>

     </asp:GridView>
 
 
 
    </asp:Content>