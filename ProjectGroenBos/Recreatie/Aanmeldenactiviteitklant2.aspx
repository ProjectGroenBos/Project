<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/klant2.Master" AutoEventWireup="true" CodeBehind="Aanmeldenactiviteitklant2.aspx.cs" Inherits="ProjectGroenBos.Recreatie.Aanmeldenactiviteitklant2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script>function openModal(modalnaam) {
             $(modalnaam).modal('show');
         }</script>
    <div class="header">Aanmelden voor activiteit</div>
     <br />
    <asp:GridView ID="GvAanmeldenActiviteit" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="content-table" DataKeyNames="Nummer" ForeColor="#333333" GridLines="None" ShowFooter="True" ShowHeaderWhenEmpty="True" Width="80%" AllowPaging="True" OnPageIndexChanged="GvAanmeldenActiviteit_PageIndexChanged" OnPageIndexChanging="GvAanmeldenActiviteit_PageIndexChanging" OnRowCancelingEdit="GvAanmeldenActiviteit_RowCancelingEdit" OnRowCommand="GvAanmeldenActiviteit_RowCommand" OnRowDeleting="GvAanmeldenActiviteit_RowDeleting" OnRowEditing="GvAanmeldenActiviteit_RowEditing" OnSelectedIndexChanged="GvAanmeldenActiviteit_SelectedIndexChanged" OnSelectedIndexChanging="GvAanmeldenActiviteit_SelectedIndexChanging" OnSorting="GvAanmeldenActiviteit_Sorting" >
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" HeaderStyle-ForeColor="White"  ReadOnly="True" SortExpression="Nummer"  >
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="Activiteitnaam" SortExpression="Activiteitnaam">
                <EditItemTemplate>
                    <asp:TextBox ID="TbActiviteitnaam" runat="server" Text='<%# Bind("Activiteitnaam") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" Display="Dynamic" ControlToValidate="txtActiviteitNaam" ValidateRequestMode="Enabled"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Activiteitnaam") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="White" />
            </asp:TemplateField>
            <asp:BoundField DataField="Locatie" HeaderText="Locatie" HeaderStyle-ForeColor="White"  SortExpression="Locatie" >
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Inschrijfkosten" HeaderText="Inschrijfkosten" HeaderStyle-ForeColor="White"  SortExpression="Inschrijfkosten" >
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Maximaal aantal" HeaderText="Maximaal Aantal" HeaderStyle-ForeColor="White" SortExpression="Maximaalaantal" >
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" HeaderStyle-ForeColor="White"  SortExpression="Omschrijving" >
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Datum" HeaderText="Datum" HeaderStyle-ForeColor="White"  ReadOnly="True" SortExpression="Datum" >
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Begintijd" HeaderText="Begintijd" HeaderStyle-ForeColor="White"  ReadOnly="True" SortExpression="Begintijd" >
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Eindtijd" HeaderText="Eindtijd" HeaderStyle-ForeColor="White"  ReadOnly="True" SortExpression="Eindtijd" >
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Naam" HeaderText="Naam" HeaderStyle-ForeColor="White"  SortExpression="Naam" >
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="MedewerkerID" HeaderText="MedewerkerID" HeaderStyle-ForeColor="White"  SortExpression="MedewerkerID" >
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
        </Columns>

     </asp:GridView>
     <br />
    <asp:Button ID="Button1" runat="server" Text="Aanmelden" OnClick="Button1_Click"/>

    <div id="Popup" class="modal fade" role="dialog">

                 <div class="modal-dialog">

                     <!-- Modal content-->

                     <div class="modal-content">

                         <div class="modal-header">

                             <h4 class="modal-title">Aanmelden actviteit</h4>

                         </div>

                         <div class="modal-body">

                             <asp:Label ID="Label2" runat="server" Text="ActiviteitNaam"></asp:Label>
                             <asp:TextBox ID="txtActiviteitNaam" runat="server" CssClass="txbActiviteitnaam" ></asp:TextBox>
                             
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

                      
                             


                               
                         </div>

                         <div class="modal-footer">

                             <asp:Button ID="btnAanmelden" runat="server" Style="max-width: 80%; margin-left: auto; margin-right: auto;" class="btn btn-primary btn-lg btn-block" Text="Aanmelden"/>
                             <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>



                         </div>


                     </div>

                 </div>

             </div>
</asp:Content>

