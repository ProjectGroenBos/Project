<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="ActiviteitInplannen.aspx.cs" Inherits="recreatie.paginas.ActiviteitInplannen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>function openModal(modalnaam) {
             $(modalnaam).modal('show');
         }</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="header">Activiteit Inplannen</div>

    
    <asp:HiddenField ID="FaciliteitID" runat="server"
                                    Value='' />
    <asp:HiddenField ID="MedewerkerID" runat="server"
                                    Value='' />

    <asp:GridView ID="GvActiviteitInplannen" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="content-table2" DataKeyNames="Nummer" ForeColor="#333333" GridLines="None" ShowFooter="True" ShowHeaderWhenEmpty="True" Width="80%" OnRowCancelingEdit="GvActiviteitInplannen_RowCancelingEdit" OnRowCommand="GvActiviteitInplannen_RowCommand" OnRowDeleting="GvActiviteitInplannen_RowDeleting" OnRowEditing="GvActiviteitInplannen_RowEditing" OnRowUpdating="GvActiviteitInplannen_RowUpdating" OnSelectedIndexChanged="GvActiviteitInplannen_SelectedIndexChanged" OnSorting="OnSorting" AllowPaging="True" OnPageIndexChanged="GvActiviteitInplannen_PageIndexChanged" OnPageIndexChanging="GvActiviteitInplannen_PageIndexChanging" >
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" HeaderStyle-ForeColor="White"  ReadOnly="True" SortExpression="Nummer"  />
            <asp:BoundField DataField="Activiteitnaam" HeaderText="Activiteitnaam" HeaderStyle-ForeColor="White"  SortExpression="Activiteitnaam" />
            <asp:BoundField DataField="Locatie" HeaderText="Locatie" HeaderStyle-ForeColor="White"  SortExpression="Locatie" />
            <asp:BoundField DataField="Inschrijfkosten" HeaderText="Inschrijfkosten" HeaderStyle-ForeColor="White"  SortExpression="Inschrijfkosten" />
            <asp:BoundField DataField="Maximaal aantal" HeaderText="Maximaal Aantal" HeaderStyle-ForeColor="White" SortExpression="Maximaalaantal" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" HeaderStyle-ForeColor="White"  SortExpression="Omschrijving" />
            <asp:BoundField DataField="Datum" HeaderText="Datum" HeaderStyle-ForeColor="White"  ReadOnly="True" SortExpression="Datum" />
            <asp:BoundField DataField="Begintijd" HeaderText="Begintijd" HeaderStyle-ForeColor="White"  ReadOnly="True" SortExpression="Begintijd" />
            <asp:BoundField DataField="Eindtijd" HeaderText="Eindtijd" HeaderStyle-ForeColor="White"  ReadOnly="True" SortExpression="Eindtijd" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" HeaderStyle-ForeColor="White"  SortExpression="Naam" />
            <asp:BoundField DataField="MedewerkerID" HeaderText="MedewerkerID" HeaderStyle-ForeColor="White"  SortExpression="MedewerkerID" />
        </Columns>

     </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Nummer], [Activiteitnaam], [Locatie], [Inschrijfkosten], [Maximaal aantal] AS Maximaal_aantal, [Omschrijving], [Datum], [Begintijd], [Eindtijd], [Naam], [MedewerkerID] FROM [vActiviteit]"></asp:SqlDataSource>

    <asp:Button ID="btnNieuwActiviteit" runat="server" CssClass="btnnieuweactiviteitinplannen" Text="Activiteit Toevoegen" OnClick="btnNieuwActiviteit_Click" ForeColor="White"/>


    <div id="Popup" class="modal fade" role="dialog">

                 <div class="modal-dialog">

                     <!-- Modal content-->

                     <div class="modal-content">

                         <div class="modal-header">

                             <h4 class="modal-title">Activiteit Inplannen</h4>

                         </div>

                         <div class="modal-body">

                             <asp:Label ID="Label2" runat="server" Text="ActiviteitNaam"></asp:Label>
                             <asp:TextBox ID="txtActiviteitNaam" runat="server" CssClass="txbActiviteitnaam"></asp:TextBox>
                             <br />
                             <br />
                             <asp:Label ID="Label3" runat="server" Text="Locatie"></asp:Label>
                             <asp:TextBox ID="txtLocatie" runat="server" CssClass="txblocatieactivitieit"></asp:TextBox>
                             <br />
                             <br />
                             <asp:Label ID="Label4" runat="server" Text="Inschrijfkosten"></asp:Label>
                             <asp:TextBox ID="txtInschrijfkosten" runat="server" CssClass="txbInschrijfkostenactivitieit"></asp:TextBox>
                             <br />
                             <br />
                             <asp:Label ID="Label5" runat="server" Text="Maximaal Aantal"></asp:Label>
                             <asp:TextBox ID="txtMaximaalAantal" runat="server" CssClass="txbMaximaalaantalactivitieit"></asp:TextBox>
                             <br />
                             <br />
                             <asp:Label ID="Label6" runat="server" Text='Omschrijving'></asp:Label>
                             <asp:DropDownList ID="ddlOmschrijving" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Omschrijving" DataValueField="ID" OnSelectedIndexChanged="ddlOmschrijving_SelectedIndexChanged" CssClass="txbOmschrijvingactivitieit"></asp:DropDownList>
                             <br />
                             <br />

                             <asp:Label ID="Label7" runat="server" Text="Datum"></asp:Label>
                             <asp:TextBox ID="txtDatum" runat="server" CssClass="txbDatumactivitieit"></asp:TextBox>
                             <br />
                             <br />
                             <asp:Label ID="Label8" runat="server" Text="Begintijd"></asp:Label>
                             <asp:TextBox ID="txtBegintijd" runat="server" TextMode="Time" CssClass="txbBegintijdactivitieit"></asp:TextBox>
                             <br />
                             <br />
                             <asp:Label ID="Label9" runat="server" Text="Eindtijd"></asp:Label>
                             <asp:TextBox ID="txtEindtijd" runat="server" TextMode="Time" CssClass="txbEindtijdactivitieit"></asp:TextBox>
                             <br />
                             <br />
                             <asp:Label ID="Label10" runat="server" Text="Medewerker"></asp:Label>
                            <asp:DropDownList ID="ddlMedewerker" runat="server" DataSourceID="SqlDataSource1" DataTextField="Naam" DataValueField="Nummer" AutoPostBack="True" OnSelectedIndexChanged="ddlMedewerker_SelectedIndexChanged" CssClass="txbMedewerkeractivitieit">

                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Nummer], [Naam] FROM [Medewerker]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [ID], [Omschrijving] FROM [Faciliteit]"></asp:SqlDataSource>

                               
                         </div>

                         <div class="modal-footer">

                             <asp:Button ID="btnInplannen" runat="server" Style="max-width: 80%; margin-left: auto; margin-right: auto;" class="btn btn-primary btn-lg btn-block" Text="Inplannen" OnClick="btnInplannen_Click"/>
                             <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>



                         </div>


                     </div>

                 </div>

             </div>

</asp:Content>