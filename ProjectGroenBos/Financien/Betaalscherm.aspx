<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Financien/Financien.Master" CodeBehind="Betaalscherm.aspx.cs" Inherits="ProjectGroenBos.Financien.Betaalscherm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @media print {
            @page {
            }

            body {
                margin-left: auto;
                margin-right: auto;
                height: auto;
                overflow: hidden;
                position: absolute;
            }

            .inline-flex {
                justify-content: space-between;
            }

            .logofactuur {
                display: inline-flex;
            }

            .content-table {
                width: 100%;
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
    </style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
        function emailsuccess() {
            Swal.fire({
                icon: 'success',
                title: 'De email is verstuurd naar de klant.',
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


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Rekeningen</div>
    <div class="container" runat="server" id="pdfbody">
        <h2>Rekeningen-overzicht</h2>
        <p>Dit is een overzicht van alle opstaande rekeningen van gasten die aanwezig zijn in het park bij recreatiepark Groenbos.</p>

        <asp:GridView ID="gvRekeningen" runat="server" CssClass="content-table tweedetable" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" DataKeyNames="Nummer">
            <Columns>
                <asp:BoundField DataField="Nummer" HeaderText="Factuurnummer" SortExpression="Nummer" ReadOnly="True" />
                <asp:BoundField DataField="Betalen aan" HeaderText="Betalen aan" SortExpression="Betalen aan" ReadOnly="True" />
                <asp:BoundField DataField="Totaal bedrag" HeaderText="Totaal Bedrag" SortExpression="Totaal bedrag" />
                <asp:BoundField DataField="Reeds betaald" HeaderText="Reeds betaald" SortExpression="Reeds betaald" />
                <asp:BoundField DataField="Termijn" DataFormatString="{0:d}" HeaderText="Termijn" SortExpression="Termijn" />
                <asp:BoundField DataField="Omschrijving betaalcondities" HeaderText="Omschrijving betaalcondities" SortExpression="Omschrijving betaalcondities" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <button type="button" style="background-color: #009879; color: #fff" class="btn" data-toggle="modal" data-target="#modal<%# Eval("Nummer") %>">Zie rekeningen</button>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select Nummer, [Betalen aan], [Totaal bedrag], [Reeds betaald], Termijn, [Omschrijving betaalcondities] from Crediteurenfactuur"></asp:SqlDataSource>
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
                                <h4 class="modal-title">Factuur <%# Eval("Betalen aan") %></h4>
                                <asp:Button runat="server" CssClass="btn btn-primary" Text="Sluiten"></asp:Button>
                            </div>
                            <div class="modal-body">
                                <div class="factuur" id="printModal<%# Eval("Nummer") %>">
                                    <div class="inline-flex">
                                        <div>
                                            <h4>Reserverings gegevens</h4>
                                            <p>
                                                #<%# Eval("Nummer") %>
                                                <br />
                                                <%# Eval("Betalen aan") %><br />
                                                <%# Eval("IBAN") %> personen
                                <br />
                                                Van <%# Eval("Termijn", "{0: dd/MM/yyyy}") %>
                                                <br />
                                                Tot <%# Eval("Termijn", "{0: dd/MM/yyyy}") %>
                                            </p>
                                        </div>
                                        <div class="logofactuur">
                                            <img src="img/logo3.png" style="width: 150px; height: 200px;" alt="Logo">
                                        </div>
                                    </div>
                                    <hr />
                                    <br />
                                    <asp:GridView ID="gvFactuurrekening" runat="server" CssClass="content-table" Gridlines="None"  AutoGenerateColumns="False" Style="text-align: center; margin-left: auto; margin-right: auto;" DataSourceID="SqlDataSource1">
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
                                                <td style="width: 100px">€ <%# Eval("Totaal bedrag") %></td>
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

                                    <div class="fixed-bottom">
                                        <div class="footerfactuur">
                                            <div>
                                                <br />
                                                <br />
                                                <p>
                                                    Groenbos recreatie b.v.
                                                <br />
                                                    Noorderpark 12, 6755 VB  Aalterveld
                                                </p>
                                            </div>
                                            <div>
                                                <p>
                                                    <br />
                                                    <br />
                                                    tel. 0625 - 918200
                                                <br />
                                                    fax. 0625 - 918201
                                                <br />
                                                    bank: NL32 RABO 0220.96.13.200, Rabobank Aalten

                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <input type="button" class="btn btn-primary btn-lg btn-block" onclick="printDiv('printModal<%# Eval("Nummer") %>')" value="Print Factuur" />

                                <asp:Button ID="btnExport" class="btn btn-primary btn-lg btn-block" CommandName="<%# Container.ItemIndex %>" runat="server" Text="Betaal factuur"/>

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