<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="Rekeningen.aspx.cs" Inherits="ProjectGroenBos.Financien.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

    <asp:Repeater ID="rpModals" runat="server">
        <ItemTemplate>
            <!-- Modal -->
            <div id="modal<%# Eval("Nummer") %>" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Rekeningen <%# Eval("Naam") %></h4>
                        </div>
                        <div class="modal-body">
                            <h4>Reserverings gegevens</h4>
                            <p>
                                <%# Eval("Naam") %><br />
                                <%# Eval("Aantal_personen") %> personen
                                <br />
                                Van <%# Eval("Aankomstdatum", "{0: dd/MM/yyyy}") %>
                                <br />
                                Tot <%# Eval("Vertrekdatum", "{0: dd/MM/yyyy}") %>
                            </p>
                            <br />
                            <h4>Persoonlijke gegevens</h4>
                            <p>
                                <%# Eval("Adres") %>
                                <br />
                                <%# Eval("Postcode") %><br />
                                <%# Eval("Land") %><br />
                                <%# Eval("Telefoonnummer") %><br />
                                <%# Eval("Email") %>
                            </p>

                            <hr />

                            <asp:GridView ID="gvFactuurrekening" CssClass="content-table" GridLines="None" AutoGenerateColumns="False" style="text-align: center;" runat="server" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="Naam" HeaderText="Omschrijving" ReadOnly="True" SortExpression="Naam" />
                                    <asp:BoundField DataField="Prijs" HeaderText="Prijs" ReadOnly="True" SortExpression="Prijs" />
                                    <asp:BoundField DataField="Aantal" HeaderText="Aantal" ReadOnly="True" SortExpression="Aantal" />
                                    <asp:BoundField DataField="Totaal" HeaderText="Totaal" ReadOnly="True" SortExpression="Totaal" />
                                </Columns>
                            </asp:GridView>
                            <table class="content-table" style="margin-top: -30px">
                                <tbody>
                                    <tr>
                                        <td></td>
                                        <td>Totaalbedrag:</td>
                                        <td><%# Eval("Nummer") %></td>
                                        <td></td>
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

                            <asp:Button ID="btnExport" class="btn btn-primary btn-lg btn-block" runat="server" Text="Export naar PDF" OnClick="btnExport_Click" />

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
