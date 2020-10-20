<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="Factuurinvoerscherm.aspx.cs" Inherits="ProjectGroenBos.Financien.Factuurinvoerscherm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
        function factuursuccess() {
            Swal.fire({
                icon: 'success',
                title: 'De factuur is aangemaakt.',
                showConfirmButton: false,
                timer: 4000
            })
        }
        function retoursuccess() {
            Swal.fire({
                icon: 'success',
                title: 'De factuur is naar retour verzonden.',
                showConfirmButton: false,
                timer: 4000
            })
        }
        </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!DOCTYPE html>

    <div class="container">

<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#ToevoegenModal1">Factuur toevoegen</button>
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#ToevoegenModal2">Factuur Retourzenden</button>



              <div id="ToevoegenModal1" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Factuur toevoegen</h4>
                </div>
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select Inkooporderregel.ID as Nummer, Inkooporderregel.prijs as Kosten, Voorraad.Naam as omschrijving
from Inkooporderregel cross join Voorraad
where Inkooporderregel.VoorraadID = Voorraad.ID
union
select  op.Prijs as Kosten, op.OnderhoudsopdrachtNummer as nummer, ond.Onderhoudtype as omschrijving
from offerte op cross join Onderhoudsopdracht ond
where op.OnderhoudsopdrachtNummer = ond.Nummer"></asp:SqlDataSource>
                 <asp:GridView ID="GridView2" CssClass="content-table" GridLines="None" AutoGenerateColumns="False" Style="text-align: center; margin-left: auto; margin-right: auto; width:auto; height:100px; overflow:scroll"  runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" DataSourceID="SqlDataSource8">
                                    <Columns>
                                        <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="True" SortExpression="Nummer" />
                                        <asp:BoundField DataField="Kosten" HeaderText="Kosten" ReadOnly="True" SortExpression="Kosten" />
                                        <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" ReadOnly="True" SortExpression="Omschrijving" />
                                    </Columns>
                                    <EditRowStyle BackColor="#009879" ForeColor="White" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#009879" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                <div class="modal-body">
                    <p>Leverancier of aannemer</p>
                    <asp:DropDownList ID="leverancieraanemer" runat="server">  
        </asp:DropDownList>
                    <p>Totaalbedrag</p>
                    <asp:TextBox ID="txbTotaalbedrag" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <p>Uiterste betaaldatum</p>
                    <asp:TextBox ID="txbTermijn" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <p>Factuurtype</p>
                    <asp:DropDownList ID="dlFactuurtype" Style="text-align: center; margin-top: 10px;" Height="50px" Width="100%" runat="server">
                        <asp:ListItem>Inkooporder</asp:ListItem>
                        <asp:ListItem>Offerte</asp:ListItem>
                        <asp:ListItem>Anders</asp:ListItem>
                    </asp:DropDownList>
                    
                    <p>IBAN</p>
                    <asp:TextBox ID="txbIBAN" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <p>OrderID/OnderhoudsID</p>
                    <asp:TextBox ID="txbORDERID" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <p>OfferteID</p>
                    <asp:TextBox ID="txtbOfferte" placeholder="hoeft alleen bij offerte" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <asp:Button ID="btnToevoegen" CssClass="btnToevoegen" runat="server" Text="goedkeuren" OnClick="btnToevoegen_Click" />
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>
                </div>
            </div>

        </div>
        </div>
        </div>

    <div id="ToevoegenModal2" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Factuur toevoegen</h4>
                </div>
                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select ink.InkooporderID as Inkoopnummer, ink.prijs as Kosten, Voorraad.Naam as omschrijving, ink.Hoeveelheid
from Inkooporderregel ink cross join Voorraad
where ink.VoorraadID = Voorraad.ID"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" CssClass="content-table" GridLines="None" AutoGenerateColumns="False" Style="text-align: center; margin-left: auto; margin-right: auto; width:auto; height:100px; overflow:scroll" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataSourceID="SqlDataSource9">
                                    <Columns>
                                        <asp:BoundField DataField="Inkoopnummer" HeaderText="Inkoopnummer" ReadOnly="True" SortExpression="Inkoopnummer" />
                                        <asp:BoundField DataField="Kosten" HeaderText="Kosten" ReadOnly="True" SortExpression="Kosten" />
                                        <asp:BoundField DataField="Hoeveelheid" HeaderText="Hoeveelheid" ReadOnly="True" SortExpression="Hoeveelheid" />
                                        <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" ReadOnly="True" SortExpression="Omschrijving" />
                                    </Columns>
                                    <EditRowStyle BackColor="#009879" ForeColor="White" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#009879" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                <div class="modal-body">
                    <p>Hoeveelheid</p>
                    <asp:TextBox ID="txtbHoeveelheid" runat="server" Style="text-align: center" Height="50px" Width="100%"></asp:TextBox>
                    <p>Totaalbedrag</p>
                    <asp:TextBox ID="txt" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <p>InkoopOrderID</p>
                    <asp:TextBox ID="txtbInkoopID" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <p>Leverancier</p>
                   <asp:DropDownList ID="leverancier" runat="server">  
        </asp:DropDownList> 
                    <asp:Button ID="BtnRetour" CssClass="btnToevoegen" runat="server" Text="Retour" OnClick="BtnRetour_Click" />
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>
                </div>
            </div>

        </div>
        </div>

</asp:Content>
