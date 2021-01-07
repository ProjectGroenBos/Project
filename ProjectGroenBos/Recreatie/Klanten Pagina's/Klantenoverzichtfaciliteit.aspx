<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/Klanten Pagina's/klant2.Master" AutoEventWireup="true" CodeBehind="Klantenoverzichtfaciliteit.aspx.cs" Inherits="ProjectGroenBos.Recreatie.Klantenoverzichtfaciliteit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script>function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }</script>
    <div class="header">Mijn reserveringen faciliteiten</div>
    <asp:GridView ID="Gridviewfaciliteitannuleren" runat="server" AutoGenerateColumns="False" DataKeyNames="Nummer" OnSelectedIndexChanged="Gridviewfaciliteitannuleren_SelectedIndexChanged" CssClass="content-table" GridLines="None">
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
            <asp:BoundField DataField="FaciliteitID" HeaderText="FaciliteitID" SortExpression="FaciliteitID" />
            <asp:BoundField DataField="GastNummer" HeaderText="GastNummer" SortExpression="GastNummer" />
            <asp:BoundField DataField="TijdvakNummer" HeaderText="TijdvakNummer" SortExpression="TijdvakNummer" />
             <asp:CommandField ShowSelectButton="True" ItemStyle-ForeColor="White"  HeaderText="Annuleren" SelectText="Annuleren">
            <ControlStyle BackColor="#C0392B" />
<ItemStyle ForeColor="White"  ></ItemStyle>
            </asp:CommandField>
        </Columns>
    </asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT * FROM [ReserveringFaciliteit] WHERE ([GastNummer] = @GastNummer)">
    <SelectParameters>
        <asp:SessionParameter Name="GastNummer" SessionField="GastNummer" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
      <div id="Popup" class="modal fade" role="dialog">
                 <div class="modal-dialog">

                     <!-- Modal content-->

                     <div class="modal-content">

                         <div class="modal-header">

                             <h4 class="modal-title">Product Verwijderen</h4>

                         </div>

                         <div class="modal-body">

                             <asp:Label ID="Label1" runat="server" Text="Label">Weet u zeker dat u uw reservering wilt annuleren?</asp:Label>
                             <asp:Button ID="BtnDoorgaanproduct" runat="server" Text="Doorgaan"  Style="max-width: 30%; margin-right: 37%; margin-top: 10%; display: inline" class="btn btn-primary btn-lg btn-block" OnClick="BtnDoorgaanproduct_Click"  />
                             <asp:Button ID="BtnAnnulerenProduct" runat="server" Text="Annuleren" Style="max-width: 30%; background-color:indianred; margin-right: auto; margin-top:10%; display: inline" class="btn btn-primary btn-lg btn-block"></asp:button>
                             
                         </div>

                         <div class="modal-footer">

                             

                         </div>

                     </div>

                 </div>

             </div>
</asp:Content>
