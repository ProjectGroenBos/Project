<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/Site1.Master" AutoEventWireup="true" CodeBehind="InactiefmakenProductpagina.aspx.cs" Inherits="ProjectGroenBos.Recreatie.InactiefmakenProductpagina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <div class="header">Product pagina inactief maken</div>
    <asp:Label ID="LblZoekenInactiefmakenproductpagina" runat="server" Text="Zoeken:" CssClass="labelzoekenProductpaginainactief"></asp:Label>
    <asp:TextBox ID="txbZoekenProductpaginainactief" runat="server" OnTextChanged="txbZoekenProductpaginainactief_TextChanged" CssClass="textboxzoekenProductpaginainactief"></asp:TextBox>
    <asp:CheckBox ID="CkbLeverancierproductpagina" runat="server" Text="Leverancier" CssClass="ckbLeverancierProductpaginainactief" />
    <asp:CheckBox ID="CkbCategorieproductpagina" runat="server" Text="Categorie" CssClass="ckbCategorieProductpaginainactief" />

    <asp:GridView ID="GVProductpaginaInactiefMaken" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="content-table5" DataKeyNames="Nummer" ForeColor="#333333" GridLines="None" ShowFooter="True" OnSorting="GVProductpaginaInactiefMaken_Sorting1" OnSelectedIndexChanged="GVProductpaginaInactiefMaken_SelectedIndexChanged1">
         <Columns>

             <asp:TemplateField HeaderText="Artikelnummer" SortExpression="Nummer" Visible="true" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label ID ="Label1" Text='<%# Eval("Nummer") %>'  runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Artikelnaam" SortExpression="Artikelnaam" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Artikelnaam") %>' runat="server" />

                 </ItemTemplate>

             </asp:TemplateField>

             <asp:TemplateField HeaderText="Omschrijving" SortExpression="Omschrijving" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Omschrijving") %>' runat="server"/>

                 </ItemTemplate>
                 </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Prijs" SortExpression="Prijs" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Prijs") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Aantal" SortExpression="Aantal" HeaderStyle-ForeColor="White" >

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Aantal") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Minimum Voorraad" SortExpression="[Minimum voorraad]" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("[Minimum voorraad]") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Naam Leverancier" SortExpression="[Naam Leverancier]" HeaderStyle-ForeColor="White" >

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("[Naam Leverancier]") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>

             <asp:TemplateField HeaderText="Categorie" SortExpression="Categorie" HeaderStyle-ForeColor="White" >

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Categorie") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Huurtarief" SortExpression="Huurtarief" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Huurtarief") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>

             <asp:CommandField ShowSelectButton="True" ItemStyle-ForeColor="White" HeaderText="Inactief maken">
<ItemStyle ForeColor="White"></ItemStyle>
            </asp:CommandField>
              </Columns>
    </asp:GridView>

    <div id="Popup" class="modal fade" role="dialog">
                 <div class="modal-dialog">

                     <!-- Modal content-->

                     <div class="modal-content">

                         <div class="modal-header">

                             <h4 class="modal-title">Product Verwijderen</h4>

                         </div>

                         <div class="modal-body">

                             <asp:Label ID="Label1" runat="server" Text="Label">Weet u zeker dat u deze product inactief wilt maken?</asp:Label>
                             <asp:Button ID="BtnDoorgaanproduct" runat="server" Text="Doorgaan"  Style="max-width: 30%; margin-right: 37%; margin-top: 10%; display: inline" class="btn btn-primary btn-lg btn-block" OnClick="BtnDoorgaanproduct_Click1"  />
                             <asp:Button ID="BtnAnnulerenProduct" runat="server" Text="Annuleren" Style="max-width: 30%; background-color:indianred; margin-right: auto; margin-top:10%; display: inline" class="btn btn-primary btn-lg btn-block"></asp:button>
                             
                         </div>

                         <div class="modal-footer">

                             

                         </div>

                     </div>

                 </div>

             </div>
    
    </asp:Content>

