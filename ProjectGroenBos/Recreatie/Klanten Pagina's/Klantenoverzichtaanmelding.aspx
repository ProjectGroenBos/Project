<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/klant2.Master" AutoEventWireup="true" CodeBehind="Klantenoverzichtaanmelding.aspx.cs" Inherits="ProjectGroenBos.Recreatie.Klantenoverzichtaanmelding" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Overzicht Mijn Aanmeldingen</div>

   <asp:GridView ID="gvAanmeldingAnnuleren" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="content-table" DataKeyNames="GastNummer,ActiviteitNummer" ForeColor="#333333" GridLines="None" ShowFooter="True" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="gvAanmeldingAnnuleren_SelectedIndexChanged" HeaderStyle-ForeColor="White" >
         <Columns>
             <asp:BoundField DataField="GastNummer" HeaderText="GastNummer" ReadOnly="True" SortExpression="GastNummer" Visible="False" />
             <asp:BoundField DataField="Nummer" HeaderText="Nummer" SortExpression="Nummer" />
             <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
             <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
             <asp:BoundField DataField="Begintijd" HeaderText="Begintijd" SortExpression="Begintijd" />
             <asp:BoundField DataField="Eindtijd" HeaderText="Eindtijd" SortExpression="Eindtijd" />
             <asp:BoundField DataField="Begeleider" HeaderText="Begeleider" SortExpression="Begeleider" />
             <asp:BoundField DataField="Inschrijfkosten" HeaderText="Inschrijfkosten" SortExpression="Inschrijfkosten" />
             <asp:BoundField DataField="ActiviteitNummer" HeaderText="ActiviteitNummer" ReadOnly="True" SortExpression="ActiviteitNummer" Visible="False" />
             <asp:CommandField ShowSelectButton="True" ItemStyle-ForeColor="White" SelectText="Annuleren" >
<ItemStyle ForeColor="White" BackColor="#CC3300"></ItemStyle>
             </asp:CommandField>
         </Columns>

<HeaderStyle ForeColor="White"></HeaderStyle>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM [vAanmeldingen] WHERE ([GastNummer] = @GastNummer) AND Status = 1" UpdateCommand="UPDATE Aanmelding SET Status = 0 WHERE (Nummer = @Nummer)">
        <SelectParameters>
            <asp:SessionParameter Name="GastNummer" SessionField="GastNummer" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nummer" />
        </UpdateParameters>
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
                             <asp:Button ID="btnDoorgaan" runat="server" Text="Doorgaan"  Style="max-width: 30%; margin-right: 37%; margin-top: 10%; display: inline" class="btn btn-primary btn-lg btn-block" OnClick="BtnDoorgaan_Click1"  />
                             <asp:Button ID="btnAnnuleren" runat="server" Text="Annuleren" Style="max-width: 30%; background-color:indianred; margin-right: auto; margin-top:10%; display: inline" class="btn btn-primary btn-lg btn-block" OnClick="btnAnnuleren_Click"></asp:button>
                             
                         </div>

                         <div class="modal-footer">

                             

                         </div>

                     </div>

                 </div>

             </div>
    
    </asp:Content>
