<%@ Page Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="Reserveringen.aspx.cs" Inherits="ProjectGroenBos.Financien.Reserveringen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="header">Reserveringen</div>
    <div class="container">
        <h2>Reserveringen-overzicht</h2>
        <p>Dit is een overzicht van alle reserveringen bij recreatiepark Groenbos.</p>
    
    
         <asp:GridView ID="gvReserveringen" DataKeyNames="Nummer" CssClass="content-table tweedetable" GridLines="None" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource6">
            <Columns>
                <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" SortExpression="Nummer" ReadOnly="True" />
                <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" ReadOnly="True" />
                <asp:BoundField DataField="Totaalprijs" HeaderText="Totaalprijs" SortExpression="Totaalprijs" DataFormatString="€ {0:n} " />
                <asp:BoundField DataField="Aankomstdatum" HeaderText="Aankomstdatum" SortExpression="Aankomstdatum" DataFormatString="{0:d}" />
                <asp:TemplateField>
                    <ItemTemplate>
                         <button type="button" style="background-color:#009879; color: #fff" class="btn" data-toggle="modal" data-target="#modal<%# Eval("Nummer") %>"">Inzien reservering</button>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT Reservering.Nummer, Reservering.Totaal_prijs AS Totaalprijs, Isnull(Gast.Voornaam,' ') +' '+ Isnull(Gast.Tussenvoegsel,' ')+' '+ Isnull(Gast.Achternaam,' ') AS Naam, Reservering.Aankomstdatum FROM Reservering INNER JOIN Gast ON Reservering.GastNummer = Gast.Nummer"></asp:SqlDataSource>
        <br />

        <asp:Repeater ID="rpReservering" runat="server">
            <ItemTemplate>
                <!-- Modal -->
                <div id="modal<%# Eval("Nummer") %>"" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">

                            <div class="modal-header">
                                <h4 class="modal-title"><%# Eval("Nummer") %> | <%# Eval("Voornaam") %> <%# Eval("Tussenvoegsel") %> <%# Eval("Achternaam") %></h4>
                                 <asp:Button runat="server" CssClass="btn btn-primary" Text="Sluiten"></asp:Button>
                            </div>
                        
                            <div class="modal-body">
                                <div class="inline-flex">
                                    <div>
                                        <h4>Reserverings gegevens</h4
                                        <p> <%# Eval("Voornaam") %> <%# Eval("Tussenvoegsel") %> <%# Eval("Achternaam") %><br />
                                            <%# Eval("Aantal_personen") %> personen <br />
                                            Aankomstdatum: <%# Eval("Aankomstdatum", "{0: dd/MM/yyyy}") %><br />
                                            Vertrekdatum: <%# Eval("Vertrekdatum", "{0: dd/MM/yyyy}") %><br />
                                        </p>
                                    </div>
 
                                    <div class="logofactuur">
                                        <img src="img/logo3.png" style="width: 150px; height: 200px;" alt="Logo">
                                    </div>

                                    <div>
                                        <h4>Persoonlijke gegevens</h4>
                                        <p><%# Eval("Straatnaam") %> <%# Eval("Huisnummer") %><br />
                                            <%# Eval("Postcode") %><br />
                                            <%# Eval("Land") %><br />
                                            <%# Eval("Telefoonnummer") %><br />
                                            <%# Eval("Email") %>
                                        </p>
                                    </div>
                                </div>
                                <hr />
                                <br />
                                <asp:GridView ID="gvFactuurreservering" CssClass="content-table" GridLines="None" AutoGenerateColumns="False" Style="text-align: center;" runat="server" DataSourceID="SqlDataSource6">
                                    <Columns>
                                        <asp:BoundField DataField="BungalowtypCode" HeaderText="Omschrijving" ReadOnly="True" SortExpression="Naam" />
                                        <asp:BoundField DataField="Prijs" HeaderText="Prijs" ReadOnly="True" SortExpression="Prijs" />
                                        <asp:BoundField DataField="Aantal" HeaderText="Aantal" ReadOnly="True" SortExpression="Aantal" />
                                        <asp:BoundField DataField="Totaal" HeaderText="Totaal" ReadOnly="True" SortExpression="Totaal" />
                                    </Columns>
                                </asp:GridView>

                                <table class="content-table" style="margin-top: -25px">
                                    <tbody>
                                        <tr>
                                            <td></td>
                                            <td>Totaalbedrag:</td>
                                            <td><%# Eval("Totaalbedrag") %></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>

                            <input type="button" class="btn btn-primary btn-lg btn-block" onclick="printDiv('printModal<%# Eval("Nummer") %>')" value="Print Factuur" />

                            <asp:Button ID="btnExport" class="btn btn-primary btn-lg btn-block" runat="server" Text="Email naar klant" OnClick="btnExport_Click" />

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>
                            </div>

                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>
</asp:Content>