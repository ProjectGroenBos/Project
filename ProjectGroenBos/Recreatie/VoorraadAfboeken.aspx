﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/Site1.Master" AutoEventWireup="true" CodeBehind="VoorraadAfboeken.aspx.cs" Inherits="ProjectGroenBos.Recreatie.VoorraadAfboeken" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script>function openModal(modalnaam) {
             $(modalnaam).modal('show');
         }</script>

 </asp:Content>

 <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="header">Voorraad Afboeken</div>


     <asp:Label ID="Label2" runat="server" Text="Zoeken" CssClass="labelzoekafboeken"></asp:Label>


     <asp:Button ID="btnAfboeken" runat="server" Text="Afboeken" OnClick="btnAfboeken_Click" class="btn" data-toggle="modal" data-target="#Popup" CssClass="buttonAfboekenVoorraadmuteren" ForeColor="White"/>


     <asp:TextBox ID="txbAfboekenZoeken" runat="server" OnTextChanged="txbAfboekenZoeken_TextChanged" CssClass="textboxafboekenzoeken"></asp:TextBox>


     <asp:CheckBox ID="ckbLeverancier" runat="server" Text="Leverancier" CssClass="ckbleverancierVAfboeken" />
     <asp:CheckBox ID="ckbCategorie" runat="server" Text="Categorie" CssClass="ckbcategorieVAfboeken" />


     <asp:GridView ID="GvAfboeken" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="content-table" DataKeyNames="Nummer" ForeColor="#333333" GridLines="None" ShowFooter="True" ShowHeaderWhenEmpty="True" Width="80%" OnRowCancelingEdit="GvAfboeken_RowCancelingEdit" OnRowCommand="GvAfboeken_RowCommand" OnRowDeleting="GvAfboeken_RowDeleting" OnRowEditing="GvAfboeken_RowEditing" OnRowUpdating="GvAfboeken_RowUpdating" OnSelectedIndexChanged="GvAfboeken_SelectedIndexChanged" OnSorting="OnSorting">

         <Columns>

             <asp:TemplateField HeaderText="Artikelnummer" SortExpression="Nummer" Visible="true" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label ID ="Label1" Text='<%# Eval("Nummer") %>'  runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Artikelnaam | Omschrijving" SortExpression="Artikelnaam" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Artikelnaam") %>' runat="server" />

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
 
            <asp:TemplateField HeaderText="Product selecteren"  Visible="true">

                     <ItemTemplate>

                         <asp:CheckBox ID="cbGeselecteerd" runat="server" />

                     </ItemTemplate>

                 </asp:TemplateField>

         </Columns>

     </asp:GridView>


     <div id="Popup" class="modal fade" role="dialog">

                 <div class="modal-dialog">

                     <!-- Modal content-->

                     <div class="modal-content">

                         <div class="modal-header">

                             <h4 class="modal-title">Afboeken</h4>

                         </div>

                         <div class="modal-body">

                             <asp:GridView ID="GvVoorraadAfboeken" runat="server" AutoGenerateColumns="False" ShowFooter="true" DataKeyNames="Nummer" ShowHeaderWhenEmpty="true"

                              CellPadding="4" ForeColor="#333333" GridLines="none" Width="80%" CssClass="content-table">
 
          

                              <Columns>

                                 <asp:TemplateField HeaderText="Artikelnummer" SortExpression="Nummer" Visible ="False" >

                                     <ItemTemplate>

                                     <asp:Label Text='<%# Eval("Nummer") %>' runat="server"/>

                                     </ItemTemplate>


                                     <ItemTemplate>  

                                         <asp:Label ID="Label1" runat="server" Text='<%# Bind("Nummer") %>'></asp:Label>  

                                     </ItemTemplate>   


                                 </asp:TemplateField>


 
                

                                  <asp:TemplateField HeaderText="Artikelnaam | Omschrijving " SortExpression="Artikelnaam" >  

                                      <ItemTemplate>

                                          <asp:Label Text='<%# Eval("Artikelnaam") %>' runat="server" />

                                      </ItemTemplate>

                                  </asp:TemplateField>

                

                                  <asp:TemplateField HeaderText="Aantal">

                                      <ItemTemplate>

                                          <asp:TextBox ID="tbAantal" runat="server" Width =" 100%" ></asp:TextBox>

                                      </ItemTemplate>

                                  </asp:TemplateField>
 
                                 <asp:TemplateField HeaderText="Reden">

                                      <ItemTemplate>

                                          <asp:DropDownList ID="ddlReden" runat="server" DataSourceID="SqlDataSource" DataTextField="Omschrijving" DataValueField="ID"></asp:DropDownList>

                                          <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [ID], [Omschrijving] FROM [Reden]"></asp:SqlDataSource>

                                      </ItemTemplate>

                                  </asp:TemplateField>
 
                                 <asp:TemplateField HeaderText="Opmerking">

                                      <ItemTemplate>

                                          <asp:TextBox ID="tbOpmerking" runat="server" MaxLength="230" Width ="80%" Height ="80%" Style="margin: 10px"></asp:TextBox>

                                      </ItemTemplate>

                                  </asp:TemplateField>

                              </Columns>           

                             </asp:GridView>


                               <asp:Button ID="BtnVoorraadAfboeken" runat="server" Style="max-width: 80%; margin-left: auto; margin-right: auto;" class="btn btn-primary btn-lg btn-block" Text="Afboeken" OnClick="btnAfboeken2_Click"/>

                         </div>

                         <div class="modal-footer">

                             <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>

                         </div>

                     </div>

                 </div>

             </div>

 </asp:Content>