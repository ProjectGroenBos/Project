<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Financien/Financien.Master" CodeBehind="CrediteurenFactuurBetaal.aspx.cs" Inherits="ProjectGroenBos.Financien.Openstaandecreditnota" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @media print {
            @page {
                size: auto; /* auto is the initial value */
                /* this affects the margin in the printer settings */
                margin: 25mm 25mm 25mm 25mm;
            }

            body {
                /* this affects the margin on the content before sending to printer */
                margin: 0px;
            }

            .factuur_text {
                width: 90%;
                margin-top: 10px;
                display: block;
            }

            .gegevens_factuur {
                margin-left: 0;
                width: 30%;
            }

            .inline-flex {
                justify-content: space-between;
            }

            .logofactuur {
                display: inline-flex;
            }

            .content-table {
                width: 80%;
                font-size: 20px;
            }

            .footerfactuur {
                display: flex;
                flex-direction: row;
                justify-content: space-between;
                bottom: 0;
                width: 100%;
                background: #fff;
                margin: 0 auto 0 auto;
            }
        }

        .blauw {
            color: blue;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
        function betalingsuccess() {
            Swal.fire({
                icon: 'success',
                title: 'Factuur is betaald!',
                showConfirmButton: false,
                timer: 4000
            })
        }


        function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;
        }

        function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Inkoopfacturen</div>
    <div class="container" runat="server" id="pdfbody">
        <h2>Crediteuren Factuur Betaalscherm</h2>
        <p>Overzicht van alle crediteurfacturen die nog betaald moeten worden.</p>

        <asp:GridView ID="gvRekeningen" runat="server" CssClass="content-table tweedetable" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" DataKeyNames="Nummer">
            <Columns>
                <asp:BoundField DataField="Nummer" HeaderText="Factuurnummer" SortExpression="Nummer" ReadOnly="True" />
                <asp:BoundField DataField="Betalen aan" HeaderText="Betalen aan" SortExpression="Betalen aan" ReadOnly="True" />
                <asp:BoundField DataField="Totaal bedrag" HeaderText="Totaal Bedrag" SortExpression="Totaal bedrag" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Termijn" DataFormatString="{0:d}" HeaderText="Termijn" SortExpression="Termijn" />
                <asp:BoundField DataField="Omschrijving betaalcondities" HeaderText="Omschrijving betaalcondities" SortExpression="Omschrijving betaalcondities" />
                <asp:BoundField DataField="Omschrijving" HeaderText="Status" SortExpression="Omschrijving" />
                <asp:TemplateField>
                    <ItemTemplate>
                         <asp:Button ID="btnRekeningen" runat="server" OnClick="btnRekeningen_Click" style="background-color: #009879; color: #fff" class="btn"  CommandArgument='<%# Eval("Nummer")%>' Text="Zie Factuur" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select Nummer, [Betalen aan], [Totaal bedrag], Termijn, [Omschrijving betaalcondities], Omschrijving from Crediteurenfactuur inner join Factuurstatus on Factuurstatus.ID = Crediteurenfactuur.FactuurstatusID Where Omschrijving != 'Factuur Betaald'"></asp:SqlDataSource>
    </div>
    <asp:Panel ID="Panel1" runat="server">
        <asp:Repeater ID="rpModals" runat="server">
            <ItemTemplate>
                <!-- Modal -->
                <div id="modal<%# Eval("Nummer") %>" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Inkoopfactuur <%# Eval("Betalen aan") %></h4>
                                <asp:Button runat="server" CssClass="btn btn-primary" Text="Sluiten"></asp:Button>
                            </div>
                            <div class="modal-body">
                                <div class="factuur" id="printModal<%# Eval("Nummer") %>">
                                    <div>
                                        <div class="gegevens_factuur">
                                            <p><b>Leverancier:</b></p>
                                            <p><%# Eval("Betalen aan") %></p>
                                        </div>
                                        <div class="gegevens_factuur">
                                            <p><b>Adres:</b></p>
                                            <p><%# Eval("Adres") %></p>
                                        </div>
                                        <div class="gegevens_factuur">
                                            <p><b>Postcode:</b></p>
                                            <p><%# Eval("Postcode") %></p>
                                        </div>
                                        <div class="gegevens_factuur">
                                            <p><b>Plaats:</b></p>
                                            <p><%# Eval("Plaats") %></p>
                                        </div>
                                        <div class="gegevens_factuur">
                                            <p><b>Email:</b></p>
                                            <p><%# Eval("Email") %></p>
                                        </div>
                                        <div class="gegevens_factuur">
                                            <p><b>Telefoon:</b></p>
                                            <p><%# Eval("Telefoonnummer") %></p>
                                        </div>
                                        <div class="gegevens_factuur">
                                            <p><b>Telefoon:</b></p>
                                            <p><%# Eval("Telefoonnummer") %></p>
                                        </div>
                                        <div class="gegevens_factuur">
                                            <p><b>IBAN:</b></p>
                                            <p><%# Eval("IBAN") %></p>
                                        </div>
                                        <div class="gegevens_factuur">
                                            <p><b>Betalen voor:</b></p>
                                            <p><%# Eval("Termijn", "{0: dd/MM/yyyy}") %></p>
                                        </div>

                                        <div class="factuur_text blauw">
                                            <p>Factuur/Invoice</p>
                                        </div>

                                        <div class="gegevens_factuur">
                                            <p><b>Aan:</b></p>
                                            <p>Groenbos Recreatie b.v. Noorderpark 12 6755 VB Aalterveld</p>
                                        </div>
                                        <div class="gegevens_factuur">
                                            <p><b>Datum:</b></p>
                                            <p><%# Eval("Datum", "{0: dd/MM/yyyy}") %></p>
                                        </div>
                                        <div class="gegevens_factuur">
                                            <p><b>Ordernummer:</b></p>
                                            <p><%# Eval("InkooporderID") %></p>
                                        </div>

                                        <hr />

                                        <div class="factuur_text">
                                            <p>
                                                Hierbij debiteren wij u wegens geleverde artikelen volgens onderstaand overzicht. 
                                                Wij verzoeken u het totaalbedrag ons binnen veertien dagen na dagtekening te doen toekomen via onze bankrelatie. 
                                                Na verstrijken van de vervaldatum zien wij ons genoodzaakt u administratiekosten in rekening te brengen.
                                            </p>
                                        </div>
                                    </div>



                                    <br />
                                    <asp:GridView ID="gvFactuurrekening" runat="server" CssClass="content-table" GridLines="None" AutoGenerateColumns="False" Style="text-align: center; margin-left: auto; margin-right: auto;" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="Naam" HeaderText="Omschrijving" ReadOnly="True" SortExpression="Naam" />
                                            <asp:BoundField DataField="Prijs" HeaderText="Prijs" ReadOnly="True" SortExpression="Prijs" DataFormatString="{0:C}" />
                                            <asp:BoundField DataField="Hoeveelheid" HeaderText="Hoeveelheid" ReadOnly="True" SortExpression="Hoeveelheid" />
                                            <asp:BoundField DataField="Totaal" HeaderText="Totaal" ReadOnly="True" SortExpression="Totaal" DataFormatString="{0:C}" HeaderStyle-Width="100px" />
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

                                    <table class="content-table" style="margin-top: -25px">
                                        <tbody>
                                            <tr>
                                                <td>Totaalbedrag:</td>
                                                <td></td>
                                                <td></td>
                                                <td style="width: 100px"> <%# Eval("Totaal bedrag", "{0:C}") %></td>
                                            </tr>
                                        </tbody>
                                    </table>

                                    <asp:HiddenField ID="Nummer" runat="server"
                                        Value='<%# Eval("Nummer") %>' />

                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select onderhoudtype as Naam, 1 as Hoeveelheid, Prijs, (Prijs * 1) AS 'Totaal' from CreditOnderhoud where Nummer = @Nummer
								union
								select Naam, Hoeveelheid, Prijs, (Prijs * hoeveelheid) AS 'Totaal' from creditinkoop where Nummer = @Nummer">
                                        <SelectParameters>
                                            <asp:ControlParameter
                                                Name="Nummer"
                                                ControlID="Nummer"
                                                PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <h4 style="text-align: center">Te betalen voor: <%# Eval("Termijn", "{0: dd/MM/yyyy}") %></h4>


                                </div>

                                <input type="button" class="btn btn-primary btn-lg btn-block" onclick="printDiv('printModal<%# Eval("Nummer") %>')" value="Print Factuur" />

                                <br />
                              
                                <asp:Button ID="btnBetalen" runat="server" OnClick="btnBetalen_OnClick" CssClass="btn btn-primary btn-lg btn-block" CommandArgument='<%# Eval("Nummer")%>' Text="Betaal factuur" />

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <!-- Modal -->
                <div id="modal2<%# Eval("Nummer") %>" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Inkoopfactuur <%# Eval("Betalen aan") %></h4>
                                <asp:Button runat="server" CssClass="btn btn-primary" Text="Sluiten"></asp:Button>
                            </div>
                            <div class="modal-body">
                                <table class="content-table" style="margin-top: +25px">
                                    <tbody>
                                        <tr>
                                            <td>Te betalen bedrag</td>
                                            <td> <%# Eval("Totaal bedrag", "{0:C}") %></td>
                                        </tr>
                                        <tr>
                                            <td>Geld overmaken naar</td>
                                            <td><%# Eval("Betalen aan") %> <%# Eval("IBAN") %></td>
                                        </tr>
                                        <tr>
                                          
                                        </tr>
                                    </tbody>
                                </table>
                               


                                <asp:HiddenField ID="Winkel" runat="server"
                                    Value='<%# Eval("Betalen aan") %>' />
                                <asp:HiddenField ID="Nummer" runat="server"
                                    Value='<%# Eval("Nummer") %>' />
                                <asp:HiddenField ID="Totaalbedrag" runat="server"
                                    Value='<%# Eval("Totaal bedrag") %>' />
                                <asp:HiddenField ID="Bedrag" runat="server"
                                    Value='<%# Eval("Totaal bedrag") %>' />



                                <asp:Button ID="btnBetaal" class="btn btn-primary btn-lg btn-block" OnClick="btnToevoegen2_Click" CommandName="<%# Container.ItemIndex %>"  runat="server" Text="Betaal factuur" />

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </asp:Panel>
</asp:Content>
