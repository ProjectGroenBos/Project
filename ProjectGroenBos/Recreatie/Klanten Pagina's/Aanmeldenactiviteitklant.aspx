<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/Klanten.Master" AutoEventWireup="true" CodeBehind="Aanmeldenactiviteitklant.aspx.cs" Inherits="ProjectGroenBos.Recreatie.Reserverenfaciliteit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script>function openModal(modalnaam) {
             $(modalnaam).modal('show');
         }</script>
    <div class="header">Aanmelden Activiteit</div>
     <br />
     <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" BackColor="#CCCCCC" BorderColor="#009879" BorderWidth="2px" Font-Names="Verdana" Font-Size="9pt" ForeColor="black" Height="390px" NextPrevFormat="FullMonth" Width="85%" BorderStyle="Solid" style="margin-left:5%">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" />
                    <DayStyle BackColor="White" BorderColor="Black" BorderStyle="Dotted" BorderWidth="2px" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Underline="False" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="#009879" BorderColor="#009879" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="White" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>
     <br />
    <asp:Button ID="Button1" runat="server" Text="Aanmelden" OnClick="Button1_Click" />

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
