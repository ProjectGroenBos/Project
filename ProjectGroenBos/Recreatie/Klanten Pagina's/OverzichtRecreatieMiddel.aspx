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
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
            <asp:BoundField DataField="Categorie" HeaderText="Categorie" SortExpression="Categorie" />
            <asp:BoundField DataField="Huurtarief" HeaderText="Huurtarief" SortExpression="Huurtarief" />
            <asp:CommandField ShowSelectButton="True" ItemStyle-ForeColor="White">
<ItemStyle ForeColor="White"></ItemStyle>
            </asp:CommandField>
        </Columns>

     </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT [Nummer], [Naam], [Omschrijving], [Categorie], [Huurtarief] FROM [vBeschikbareHuuritems]">
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
