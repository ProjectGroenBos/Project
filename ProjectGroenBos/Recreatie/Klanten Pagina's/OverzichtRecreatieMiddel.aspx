<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/Klanten Pagina's/klant2.Master" AutoEventWireup="true" CodeBehind="OverzichtRecreatieMiddel.aspx.cs" Inherits="ProjectGroenBos.Recreatie.Klanten_Pagina_s.OverzichtRecreatieMiddel" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script>function openModal(modalnaam) {
             $(modalnaam).modal('show');
         }</script>
    <div class="header">Reserveren Recreatie Middel</div>
     <br />
        <asp:Label ID="label1" runat="server" Text="Begin Datum:"></asp:Label>
     <asp:TextBox ID="Begindatum" runat="server" TextMode="Date"></asp:TextBox>
    <asp:Label ID="label3" runat="server" Text="Eind Datum:"></asp:Label>
     <asp:TextBox ID="Einddatumsofzo" runat="server" TextMode="Date"></asp:TextBox>
    <asp:GridView ID="GvAanmeldenRecreatieMiddel" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="content-table" ForeColor="#333333" GridLines="None" ShowFooter="True" ShowHeaderWhenEmpty="True" Width="80%" AllowPaging="True" OnSelectedIndexChanged="GvAanmeldenRecreatieMiddel_SelectedIndexChanged" DataKeyNames="Nummer">
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" HeaderStyle-ForeColor="White" SortExpression="Nummer" Visible="False">
            <HeaderStyle ForeColor="White" />
            </asp:BoundField>
            <asp:BoundField DataField="Artikelnaam" HeaderText="Artikelnaam" HeaderStyle-ForeColor="White"  SortExpression="Artikelnaam" >
            <HeaderStyle ForeColor="White" />
            </asp:BoundField>
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" HeaderStyle-ForeColor="White"  SortExpression="Omschrijving" >
            <HeaderStyle ForeColor="White" />
            </asp:BoundField>
            <asp:BoundField DataField="Prijs" HeaderText="Prijs" HeaderStyle-ForeColor="White" SortExpression="Prijs" Visible="False" >
            <HeaderStyle ForeColor="White" />
            </asp:BoundField>
            <asp:BoundField DataField="Aantal" HeaderText="Aantal" HeaderStyle-ForeColor="White"  SortExpression="Aantal" Visible="False" >
            <HeaderStyle ForeColor="White" />
            </asp:BoundField>
            <asp:BoundField DataField="Minimum voorraad" HeaderText="Minimum voorraad" HeaderStyle-ForeColor="White" SortExpression="Minimum voorraad" Visible="False" >
            <HeaderStyle ForeColor="White" />
            </asp:BoundField>
            <asp:BoundField DataField="Naam Leverancier" HeaderText="Naam Leverancier" HeaderStyle-ForeColor="White" SortExpression="Naam Leverancier" Visible="False" >
            <HeaderStyle ForeColor="White" />
            </asp:BoundField>
            <asp:BoundField DataField="Categorie" HeaderText="Categorie" HeaderStyle-ForeColor="White" SortExpression="Categorie" >
            <HeaderStyle ForeColor="White" />
            </asp:BoundField>
            <asp:BoundField DataField="Huurtarief" HeaderText="Huurtarief" HeaderStyle-ForeColor="White"  SortExpression="Huurtarief" >
            <HeaderStyle ForeColor="White" />
            </asp:BoundField>
            <asp:BoundField DataField="LeverancierID" HeaderText="LeverancierID" HeaderStyle-ForeColor="White"  SortExpression="LeverancierID" Visible="False" >
            <HeaderStyle ForeColor="White" />
            </asp:BoundField>
                 <asp:BoundField DataField="CategorieID" HeaderText="CategorieID" SortExpression="CategorieID" Visible="False" />
            <asp:CommandField ShowSelectButton="True" ItemStyle-ForeColor="White" SelectText="Selecteer" >
            <ItemStyle ForeColor="White"></ItemStyle>
             </asp:CommandField>
            
        </Columns>

     </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT [Artikelnaam], [Omschrijving], [Categorie], [Huurtarief], [Nummer] FROM [vRecreatieProductpagina] WHERE ([Nummer] = @Nummer)">
         <SelectParameters>
             <asp:ControlParameter ControlID="GvAanmeldenRecreatieMiddel" Name="Nummer" PropertyName="SelectedValue" Type="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>
     <br />
   

    <div id="Popup" class="modal fade" role="dialog">

                 <div class="modal-dialog">

                     <!-- Modal content-->

                     <div class="modal-content">

                         <div class="modal-header">

                             <h4 class="modal-title">Reserveren Recreatie Middel</h4>

                         </div>

                         <div class="modal-body">

                             <asp:Label ID="Label2" runat="server" Text="Weet u zeker dat u dit recreatie middel wilt selecteren?"></asp:Label>
                          
                             
                             

                      
                             


                               
                         </div>

                         <div class="modal-footer">

                             <asp:Button ID="btnAanmelden" runat="server" Style="max-width: 80%; margin-left: auto; margin-right: auto;" class="btn btn-primary btn-lg btn-block" Text="Aanmelden" OnClick="btnAanmelden_Click"/>
                             <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>



                         </div>


                     </div>

                 </div>

             </div>
</asp:Content>
