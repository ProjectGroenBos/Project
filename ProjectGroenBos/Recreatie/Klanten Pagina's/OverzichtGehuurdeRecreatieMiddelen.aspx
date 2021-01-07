<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/Klanten Pagina's/klant2.Master" AutoEventWireup="true" CodeBehind="OverzichtGehuurdeRecreatieMiddelen.aspx.cs" Inherits="ProjectGroenBos.Recreatie.Klanten_Pagina_s.OverzichtGehuurdeRecreatieMiddelen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>        function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }</script>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Nummer" DataSourceID="SqlDataSource1" Height="217px" Width="954px" AutoGenerateSelectButton="True" OnSelectedIndexChanged="Aids" CssClass="content-table" GridLines="None">
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
            <asp:BoundField DataField="Categorie" HeaderText="Categorie" SortExpression="Categorie" />
            <asp:BoundField DataField="Totaal_Prijs" HeaderText="Totaal_Prijs" SortExpression="Totaal_Prijs" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT [Nummer], [Naam], [Omschrijving], [Categorie], [Totaal Prijs] AS Totaal_Prijs FROM [vOverzichtMijnHuuritems] WHERE ([GastNummer] = @GastNummer)">
        <SelectParameters>
            <asp:SessionParameter Name="GastNummer" SessionField="GastNummer" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
 <div id="Popup" class="modal fade" role="dialog">

                 <div class="modal-dialog">

                     <!-- Modal content-->

                     <div class="modal-content">

                         <div class="modal-header">

                             <h4 class="modal-title">Reserveren recreatie middel</h4>

                         </div>

                         <div class="modal-body">

                             <asp:Label ID="Label2" runat="server" Text="Weet u zeker dat u deze reservering wilt annuleren?"></asp:Label>
                       
                               
                         </div>

                         <div class="modal-footer">

                             <asp:Button ID="btnAnnuleren" runat="server" Style="max-width: 80%; margin-left: auto; margin-right: auto;" class="btn btn-primary btn-lg btn-block" Text="Doorgaan" OnClick="btnAnnuleren_Click"/>
                             <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>



                         </div>


                     </div>

                 </div>

             </div>
</asp:Content>

