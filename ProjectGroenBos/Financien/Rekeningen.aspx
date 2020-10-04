<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="Rekeningen.aspx.cs" Inherits="ProjectGroenBos.Financien.WebForm4" EnableEventValidation="false" %>

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
    <script>
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

        <asp:GridView ID="gvRekeningen" CssClass="content-table tweedetable" GridLines="None" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" DataKeyNames="Gastnummer">
            <Columns>
                <asp:BoundField DataField="Nummer" HeaderText="Reserveringsnummer" SortExpression="Nummer" ReadOnly="True" />
                <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" ReadOnly="True" />
                <asp:BoundField DataField="Aantal_personen" HeaderText="Aantal Personen" SortExpression="Aantal_personen" />
                <asp:BoundField DataField="Aankomstdatum" DataFormatString="{0:d}" HeaderText="Aankomstdatum" SortExpression="Aankomstdatum" />
                <asp:BoundField DataField="Vertrekdatum" DataFormatString="{0:d}" HeaderText="Vertrekdatum" SortExpression="Vertrekdatum" />
                <asp:BoundField DataField="Gastnummer" HeaderText="Gastnummer" SortExpression="Gastnummer" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <button type="button" style="background-color: #009879; color: #fff" class="btn" data-toggle="modal" data-target="#modal<%# Eval("Nummer") %>">Zie rekeningen</button>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Nummer], [Naam], [Aantal_personen], [Aankomstdatum], [Vertrekdatum], [Gastnummer]  FROM [rekeningen]"></asp:SqlDataSource>
    </div>
    <asp:Panel ID= "Panel1"  runat = "server">
    <asp:Repeater ID="rpModals" runat="server">
        <ItemTemplate>
            <!-- Modal -->
            <div id="modal<%# Eval("Nummer") %>" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Rekeningen <%# Eval("Naam") %></h4>
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
                                            <%# Eval("Naam") %><br />
                                            <%# Eval("Aantal_personen") %> personen
                                <br />
                                            Van <%# Eval("Aankomstdatum", "{0: dd/MM/yyyy}") %>
                                            <br />
                                            Tot <%# Eval("Vertrekdatum", "{0: dd/MM/yyyy}") %>
                                        </p>
                                    </div>
                                    <div class="logofactuur">
                                        <img src="img/logo3.png" style="width: 150px; height: 200px;" alt="Logo">
                                    </div>
                                    <div>
                                        <h4>Persoonlijke gegevens</h4>
                                        <p>
                                            <%# Eval("Adres") %>
                                            <br />
                                            <%# Eval("Postcode") %><br />
                                            <%# Eval("Land") %><br />
                                            <%# Eval("Telefoonnummer") %><br />
                                            <%# Eval("Email") %>
                                        </p>
                                    </div>
                                </div>
                                <hr />
                                <br />
                                <asp:GridView ID="gvFactuurrekening" CssClass="content-table" GridLines="None" AutoGenerateColumns="False" Style="text-align: center;" runat="server" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="Naam" HeaderText="Omschrijving" ReadOnly="True" SortExpression="Naam" />
                                        <asp:BoundField DataField="Prijs" HeaderText="Prijs" ReadOnly="True" SortExpression="Prijs" DataFormatString="{0:C}" />
                                        <asp:BoundField DataField="Aantal" HeaderText="Aantal" ReadOnly="True" SortExpression="Aantal" />
                                        <asp:BoundField DataField="Totaal" HeaderText="Totaal" ReadOnly="True" SortExpression="Totaal" DataFormatString="{0:C}" HeaderStyle-Width="100px"/>
                                    </Columns>
                                </asp:GridView>

                                <table class="content-table" style="margin-top: -25px">
                                    <tbody>
                                        <tr>
                                            <td>Totaalbedrag:</td>
                                            <td></td>
                                            <td></td>
                                            <td style="width: 100px">€ <%# Eval("Totaalbedrag") %></td>
                                        </tr>
                                    </tbody>
                                </table>

                                <asp:HiddenField ID="Nummer" runat="server"
                                    Value='<%# Eval("Nummer") %>' />

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select Naam, Prijs, Aantal, (Prijs * Aantal) AS 'Totaal' from RekeningAct where ReserveringNummer = @Nummer
                                    union
                                select Naam, Prijs, Aantal, (Prijs * Aantal) AS 'Totaal' from RekeningHuur where Reserveringnummer = @Nummer">
                                    <SelectParameters>
                                        <asp:ControlParameter
                                            Name="Nummer"
                                            ControlID="Nummer"
                                            PropertyName="Value" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:Label ID="Nummertje" runat="server" Text='<%#Eval("Nummer") %>'></asp:Label>
                                <h4 style="text-align: center">Te betalen voor: <%# Eval("Vertrekdatum", "{0: dd/MM/yyyy}") %></h4>

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

                            <asp:Button ID="btnExport" class="btn btn-primary btn-lg btn-block" runat="server" Text="Email naar klant" OnClick="btnExport_Click" />

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
