<%@ Page Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="Reserveringen.aspx.cs" Inherits="ProjectGroenBos.Financien.Reserveringen" %>

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
    <div class="header">Reserveringen</div>
    <div class="container" runat="server" id="pdfbody">
        <h2>Reserveringen-overzicht</h2>
        <p>Dit is een overzicht van alle reserveringen bij recreatiepark Groenbos.</p>


        <asp:GridView ID="gvReserveringen" DataKeyNames="Nummer" CssClass="content-table tweedetable" GridLines="None" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource6">
            <Columns>
                <asp:BoundField DataField="Nummer" HeaderText="Reserveringsnummer" InsertVisible="False" SortExpression="Nummer" ReadOnly="True" />
                <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" ReadOnly="True" />
                <asp:BoundField DataField="Aantal_personen" HeaderText="Aantal Personen" SortExpression="Aantal_personen" />
                <asp:BoundField DataField="Aankomstdatum" DataFormatString="{0:d}" HeaderText="Aankomstdatum" SortExpression="Aankomstdatum" />
                <asp:BoundField DataField="Vertrekdatum" DataFormatString="{0:d}" HeaderText="Vertrekdatum" SortExpression="Vertrekdatum" />
                <asp:BoundField DataField="Gastnummer" HeaderText="Gastnummer" SortExpression="Gastnummer" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <button type="button" style="background-color: #009879; color: #fff" class="btn" data-toggle="modal" data-target="#modal<%# Eval("Nummer") %>">Inzien reservering</button>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Nummer], [Naam], [Aantal_personen], [Aankomstdatum], [Vertrekdatum], [Gastnummer]  FROM [Reserveringen]"></asp:SqlDataSource>
        <br />
    </div>

    <asp:Repeater ID="rpReservering" runat="server">
        <ItemTemplate>
            <!-- Modal -->
            <div id="modal<%# Eval("Nummer") %>" class="modal fade" role="dialog">
                <div class="modal-dialog modal-lg">
                    <!-- Modal content-->
                    <div class="modal-content">

                        <div class="modal-header">
                            <h4 class="modal-title"><%# Eval("Nummer") %> | <%# Eval("Naam") %></h4>
                            <asp:Button runat="server" CssClass="btn btn-primary" Text="Sluiten"></asp:Button>
                        </div>

                        <div class="modal-body">
                            <div class="inline-flex">
                                <div>
                                    <h4>Reserverings gegevens</h4>
                                    <p>
                                        #<%# Eval("Nummer") %><br />
                                        <%# Eval("Naam") %><br />
                                        <%# Eval("Aantal_personen") %> personen<br />
                                        Van <%# Eval("Aankomstdatum", "{0: dd/MM/yyyy}") %><br />
                                        Tot <%# Eval("Vertrekdatum", "{0: dd/MM/yyyy}") %>
                                    </p>
                                </div>
                                <div class="logofactuur">
                                    <img src="img/logo3.png" style="width: 150px; height: 200px;" alt="Logo">
                                </div>
                                <div>
                                    <h4>Persoonlijke gegevens</h4>
                                    <p>
                                        <%# Eval("Adres") %><br />
                                        <%# Eval("Postcode") %><br />
                                        <%# Eval("Land") %><br />
                                        <%# Eval("Telefoonnummer") %><br />
                                        <%# Eval("Email") %>
                                    </p>
                                </div>
                            </div>
                            <hr />
                            <br />
                            <asp:GridView ID="gvFactuurreservering" CssClass="content-table" GridLines="None" AutoGenerateColumns="False" Style="text-align: center;" runat="server" DataSourceID="SqlDataSource7">
                                <Columns>
                                    <asp:BoundField DataField="Naam" HeaderText="Item" ReadOnly="True" SortExpression="Naam" />
                                    <asp:BoundField DataField="Periode" HeaderText="Periode" ReadOnly="True" SortExpression="Periode" />
                                    <asp:BoundField DataField="Seizoen" HeaderText="Seizoen" ReadOnly="True" SortExpression="Seizoen" />
                                    <asp:BoundField DataField="Prijs" HeaderText="Prijs per stuk" ReadOnly="True" SortExpression="Prijs" DataFormatString="{0:C}"/>
                                    <asp:BoundField DataField="Aantal" HeaderText="Aantal" ReadOnly="True" SortExpression="Aantal" />
                                    <asp:BoundField DataField="Totaal" HeaderText="Totaal" ReadOnly="True" SortExpression="Totaal" DataFormatString="{0:C}" HeaderStyle-Width="100px" />
                                </Columns>
                            </asp:GridView>

                            <table class="content-table" style="min-width: 656px; margin-top: -25px">
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

                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select ('Bungalow Type ' + Code) AS 'Naam', Prijs, Naam AS 'Periode',  Seizoen, 1 AS 'Aantal', Prijs AS 'Totaal' from ReserveringHuis where Nummer = @Nummer
                                union
                                select Naam, Prijs, Periode, Seizoen, Aantal, (Prijs * Aantal) AS 'Totaal' from ReserveringWens where Nummer = @Nummer
                                ">
                                <SelectParameters>
                                    <asp:ControlParameter
                                        Name="Nummer"
                                        ControlID="Nummer"
                                        PropertyName="Value" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                            <h4 style="text-align: center">Te betalen voor: <%# Eval("Aankomstdatum", "{0: dd/MM/yyyy}") %></h4>

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

                            <input type="button" style="max-width: 80%; margin-left: auto; margin-right: auto;" class="btn btn-primary btn-lg btn-block" onclick="printDiv('printModal<%# Eval("Nummer") %>')" value="Print Factuur" />

                            <asp:Button ID="btnExport" style="max-width: 80%; margin-left: auto; margin-right: auto;" class="btn btn-primary btn-lg btn-block" runat="server" Text="Email naar klant" OnClick="btnExport_Click" />
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
