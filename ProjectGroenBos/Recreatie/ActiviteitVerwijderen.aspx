<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="ActiviteitVerwijderen.aspx.cs" Inherits="recreatie.paginas.ActiviteitVerwijderen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Activiteit Inactief Maken</div>

    <asp:GridView ID="gvActiviteitVerwijderen" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="content-table" DataKeyNames="Nummer" ForeColor="#333333" GridLines="None" ShowFooter="True" ShowHeaderWhenEmpty="True" Width="80%" AllowPaging="True" OnSelectedIndexChanged="gvActiviteitVerwijderen_SelectedIndexChanged1" DataSourceID="SqlDataSource1" >
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="True" SortExpression="Nummer" HeaderStyle-ForeColor="White"/>
            <asp:BoundField DataField="Activiteitnaam" HeaderText="Activiteitnaam" SortExpression="Activiteitnaam" HeaderStyle-ForeColor="White"/>
            <asp:BoundField DataField="Locatie" HeaderText="Locatie" SortExpression="Locatie" HeaderStyle-ForeColor="White"/>
            <asp:BoundField DataField="Inschrijfkosten" HeaderText="Inschrijfkosten" SortExpression="Inschrijfkosten" HeaderStyle-ForeColor="White"/>
            <asp:BoundField DataField="Maximaal aantal" HeaderText="Maximaal aantal" SortExpression="Maximaal aantal" HeaderStyle-ForeColor="White"/>
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" HeaderStyle-ForeColor="White"/>
            <asp:BoundField DataField="Datum" HeaderText="Datum" ReadOnly="True" SortExpression="Datum" HeaderStyle-ForeColor="White"/>
            <asp:BoundField DataField="Begintijd" HeaderText="Begintijd" ReadOnly="True" SortExpression="Begintijd" HeaderStyle-ForeColor="White"/>
            <asp:BoundField DataField="Eindtijd" HeaderText="Eindtijd" ReadOnly="True" SortExpression="Eindtijd" HeaderStyle-ForeColor="White"/>
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" HeaderStyle-ForeColor="White"/>
            <asp:BoundField DataField="MedewerkerID" HeaderText="MedewerkerID" SortExpression="MedewerkerID" HeaderStyle-ForeColor="White"/>
            <asp:BoundField DataField="FaciliteitID" HeaderText="FaciliteitID" SortExpression="FaciliteitID" Visible="False" HeaderStyle-ForeColor="White"/>
            <asp:CommandField ShowSelectButton="True" ItemStyle-ForeColor="White"/>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM [vActiviteit]"></asp:SqlDataSource>

    <div id="Popup" class="modal fade" role="dialog">
                 <div class="modal-dialog">

                     <!-- Modal content-->

                     <div class="modal-content">

                         <div class="modal-header">

                             <h4 class="modal-title">Activiteit Verwijderen</h4>

                         </div>

                         <div class="modal-body">

                             <asp:Label ID="Label1" runat="server" Text="Label">Weet u zeker dat u deze activiteit inactief wilt maken?</asp:Label>
                             <asp:Button ID="btnDoorgaan" OnClick="btnDoorgaan_Click" runat="server" Text="Doorgaan" Style="max-width: 30%; margin-right: 37%; margin-top: 10%; display: inline" class="btn btn-primary btn-lg btn-block" />
                             <asp:button ID="btnAnnuleren" data-dismiss="modal" runat="server" Text="Annuleren" Style="max-width: 30%; background-color:indianred; margin-right: auto; margin-top:10%; display: inline" class="btn btn-primary btn-lg btn-block"></asp:button>
                             
                         </div>

                         <div class="modal-footer">

                             

                         </div>

                     </div>

                 </div>

             </div>

</asp:Content>