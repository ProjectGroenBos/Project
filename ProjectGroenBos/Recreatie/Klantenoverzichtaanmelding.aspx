<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/klant2.Master" AutoEventWireup="true" CodeBehind="Klantenoverzichtaanmelding.aspx.cs" Inherits="ProjectGroenBos.Recreatie.Klantenoverzichtaanmelding" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Aanmelding Annuleren</div>

   <asp:GridView ID="gvAanmeldingAnnuleren" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="content-table2" DataKeyNames="GastNummer,ActiviteitNummer" ForeColor="#333333" GridLines="None" ShowFooter="True" DataSourceID="SqlDataSource1" >
         <Columns>

             <asp:BoundField DataField="GastNummer" HeaderText="GastNummer" ReadOnly="True" SortExpression="GastNummer" />
             <asp:BoundField DataField="Nummer" HeaderText="Nummer" SortExpression="Nummer" />
             <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
             <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
             <asp:BoundField DataField="Begintijd" HeaderText="Begintijd" SortExpression="Begintijd" />
             <asp:BoundField DataField="Eindtijd" HeaderText="Eindtijd" SortExpression="Eindtijd" />
             <asp:BoundField DataField="Begeleider" HeaderText="Begeleider" SortExpression="Begeleider" />
             <asp:BoundField DataField="Inschrijfkosten" HeaderText="Inschrijfkosten" SortExpression="Inschrijfkosten" />
             <asp:BoundField DataField="ActiviteitNummer" HeaderText="ActiviteitNummer" ReadOnly="True" SortExpression="ActiviteitNummer" />
              </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM [vAanmeldingen] WHERE ([GastNummer] = @GastNummer)">
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

                             <asp:Label ID="Label1" runat="server" Text="Label">Weet u zeker dat u deze aanmelding wilt opzeggen?</asp:Label>
                             <asp:Button ID="btnDoorgaan" runat="server" Text="Doorgaan"  Style="max-width: 30%; margin-right: 37%; margin-top: 10%; display: inline" class="btn btn-primary btn-lg btn-block" OnClick="BtnDoorgaanproduct_Click1"  />
                             <asp:Button ID="btnAnnuleren" runat="server" Text="Annuleren" Style="max-width: 30%; background-color:indianred; margin-right: auto; margin-top:10%; display: inline" class="btn btn-primary btn-lg btn-block" OnClick="btnAnnuleren_Click"></asp:button>
                             
                         </div>

                         <div class="modal-footer">

                             

                         </div>

                     </div>

                 </div>

             </div>
    
    </asp:Content>
