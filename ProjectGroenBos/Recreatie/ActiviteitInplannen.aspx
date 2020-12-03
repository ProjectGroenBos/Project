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

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Nummer], [Activiteitnaam], [Locatie], [Inschrijfkosten], [Maximaal aantal] AS Maximaal_aantal, [Omschrijving], [Datum], [Begintijd], [Eindtijd], [Naam], [MedewerkerID] FROM [vActiviteit]"></asp:SqlDataSource>

    <asp:Button ID="btnNieuwActiviteit" runat="server" CssClass="btnnieuweactiviteitinplannen" Text="Activiteit Toevoegen" OnClick="btnNieuwActiviteit_Click" ForeColor="White" CausesValidation="False"/>


    <div id="Popup" class="modal fade" role="dialog">

                 <div class="modal-dialog">

                     <!-- Modal content-->

                     <div class="modal-content">

                         <div class="modal-header">

                             <h4 class="modal-title">Activiteit Inplannen</h4>

                         </div>

                         <div class="modal-body">

                             <asp:Label ID="Label2" runat="server" Text="ActiviteitNaam"></asp:Label>
                             <asp:TextBox ID="txtActiviteitNaam" runat="server" CssClass="txbActiviteitnaam" ></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtActiviteitNaam" CssClass="ReqActiviteitValidatorInplannen" ></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Voer een activiteit in" ControlToValidate="txtActiviteitNaam" ValidationExpression="^[a-zA-Z]+$" CssClass="RegularActiviteitvalidatorInplannen"></asp:RegularExpressionValidator>
                             <br />
                             <br />
                             <asp:Label ID="Label3" runat="server" Text="Locatie"></asp:Label>
                             <asp:TextBox ID="txtLocatie" runat="server" CssClass="txblocatieactivitieit"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtLocatie" CssClass="ReqLocatieValidatorInplannen"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Voer een locatie in" ValidationExpression="^[a-zA-Z]+$" CssClass="RegularLocatieValidatorInplannen" ControlToValidate="txtLocatie"></asp:RegularExpressionValidator>
                             <br />
                             <br />
                             <asp:Label ID="Label4" runat="server" Text="Inschrijfkosten"></asp:Label>
                             <asp:TextBox ID="txtInschrijfkosten" runat="server" CssClass="txbInschrijfkostenactivitieit"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtInschrijfkosten" CssClass="ReqInschrijfkostenValidatorInplannen"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Voer een bedrag in" ControlToValidate="txtInschrijfkosten" Display="Static" ValidationExpression="^\d*\,?\d*$" CssClass="RegularInschrijfkostenValidatorInplannen"></asp:RegularExpressionValidator>
                             <br />
                             <br />
                             <asp:Label ID="Label5" runat="server" Text="Maximaal Aantal"></asp:Label>
                             <asp:TextBox ID="txtMaximaalAantal" runat="server" CssClass="txbMaximaalaantalactivitieit"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtMaximaalAantal" CssClass="ReqMaximaalAantal"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Voer een getal in" Display="Dynamic" ControlToValidate="txtMaximaalAantal" ValidationExpression="^\d+$" CssClass="RegularMaximaalAantalInplannen"></asp:RegularExpressionValidator>
                             <br />
                             <br />
                             <asp:Label ID="Label6" runat="server" Text='Omschrijving'></asp:Label>
                             <asp:DropDownList ID="ddlOmschrijving" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Omschrijving" DataValueField="ID" OnSelectedIndexChanged="ddlOmschrijving_SelectedIndexChanged" CssClass="txbOmschrijvingactivitieit"></asp:DropDownList>
                             <br />
                             <br />

                             <asp:Label ID="Label7" runat="server" Text="Datum"></asp:Label>
                             <asp:TextBox ID="txtDatum" runat="server" CssClass="txbDatumactivitieit"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtDatum" Display="Dynamic" CssClass="ReqDatumValidatorInplannen"></asp:RequiredFieldValidator>
                             <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Vul een datum in" Display="Dynamic" ControlToValidate="txtDatum" Operator="DataTypeCheck" Type="Date" CssClass="RegularDatumInplannen"></asp:CompareValidator>
                             <br />
                             <br />
                             <asp:Label ID="Label8" runat="server" Text="Begintijd"></asp:Label>
                             <asp:TextBox ID="txtBegintijd" runat="server" TextMode="Time" CssClass="txbBegintijdactivitieit"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtBegintijd" CssClass="ReqBegintijdInplannen"></asp:RequiredFieldValidator>
                             <br />
                             <br />
                             <asp:Label ID="Label9" runat="server" Text="Eindtijd"></asp:Label>
                             <asp:TextBox ID="txtEindtijd" runat="server" TextMode="Time" CssClass="txbEindtijdactivitieit"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" Display="Dynamic" CssClass="ReqBegintijdInplannen" ControlToValidate="txtEindtijd"></asp:RequiredFieldValidator>
                             <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Vul een geldige datum in" Operator="GreaterThan" Display="Dynamic" ControlToCompare="txtBegintijd" ControlToValidate="txtEindtijd" CssClass="RegularLocatieValidatorInplannen"></asp:CompareValidator>
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