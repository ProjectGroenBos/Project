<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="Inchecken.aspx.cs" Inherits="ProjectGroenBos.Reservering.Inchecken" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <script>
        function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }
    </script>

    <div class="container">
        <h2>Inchecken</h2>
        <br />

        <p>Gasten die aankomen bij het park moeten gecontroleerd worden
            <br />
            of het huurbedrag van het huisje volledig is betaald.</p>

        <br />
        <table style="text-align: left; margin-left: 5%">
            <tr>
                <td style="width: 15%">
                    <asp:Label runat="server" Text="Achternaam:" ID="label1"></asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox runat="server" ID="txbVoornaam"></asp:TextBox></td>
                <td style="width: 40%"></td>
            </tr>
            <tr>
                <td style="width: 15%">
                    <asp:Label runat="server" Text="Geboortedatum:" ID="label2"></asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox runat="server" ID="txbGeboortedatum" TextMode="Date" DataFormatString="{0:dd-MM-yyyy}"></asp:TextBox></td>
                <td style="width: 40%"></td>
            </tr>
        </table>

        <br />
        <asp:Button ID="btnZoek" runat="server" Text="Zoek" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" OnClick="btnZoek_Click" />
        <br />

        <asp:GridView ID="GridView1" runat="server" AllowCustomPaging="True" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="content-table" DataKeyNames="Nummer" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <button type="button" style="background-color: #009879; color: #fff" class="btnUitloggen" data-toggle="modal" data-target="#popup<%# Eval("Nummer") %>" onclick="btnSelecteer">Selecteren</button>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
                <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" />
                <asp:BoundField DataField="Geboortedatum" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Geboortedatum" SortExpression="Geboortedatum" />
                <asp:BoundField DataField="Aankomstdatum" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Aankomstdatum" SortExpression="Aankomstdatum" />
                <asp:BoundField DataField="Vertrekdatum" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Vertrekdatum" SortExpression="Vertrekdatum" />
            </Columns>
            <HeaderStyle ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT Reservering.Nummer, Gast.Achternaam, Gast.Geboortedatum, Reservering.Aankomstdatum, Reservering.Vertrekdatum
FROM     Reservering INNER JOIN
                  Gast ON Reservering.GastNummer = Gast.Nummer
				  where Aankomstdatum = CONVERT(date, getdate()) and Reservering.ReserveringsstatusID !=9 and Reservering.ReserveringsstatusID !=5"></asp:SqlDataSource>

        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="content-table" DataKeyNames="Nummer" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <button type="button" style="background-color: #009879; color: #fff" class="btnUitloggen" data-toggle="modal" data-target="#popup<%# Eval("Nummer") %>" onclick="btnSelecteer">Selecteren</button>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
                <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" />
                <asp:BoundField DataField="Geboortedatum" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Geboortedatum" SortExpression="Geboortedatum" />
                <asp:BoundField DataField="Aankomstdatum" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Aankomstdatum" SortExpression="Aankomstdatum" />
                <asp:BoundField DataField="Vertrekdatum" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Vertrekdatum" SortExpression="Vertrekdatum" />
            </Columns>
            <HeaderStyle ForeColor="White" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT Reservering.Nummer, Gast.Achternaam, Gast.Geboortedatum, Reservering.Aankomstdatum, Reservering.Vertrekdatum
FROM     Reservering INNER JOIN
                  Gast ON Reservering.GastNummer = Gast.Nummer
				  where Aankomstdatum = CONVERT(date, getdate()) and Achternaam like '%' + @achternaam + '%' and Geboortedatum like '%' + @geboortedatum + '%' and Reservering.ReserveringsstatusID !=9 and Reservering.ReserveringsstatusID !=5 ">
            <SelectParameters>
                <asp:ControlParameter ControlID="txbVoornaam" DefaultValue="%" Name="achternaam" PropertyName="Text" />
                <asp:ControlParameter ControlID="txbGeboortedatum" Name="geboortedatum" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:Repeater ID="rpReservering" runat="server">
            <ItemTemplate>
                <div id="popup<%# Eval("Nummer") %>" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">

                            <div class="modal-header">
                                <h4 class="modal-title">Inchecken van de reservering van <%#Eval("Naam") %> met reserveringsnummer <%#Eval("Nummer") %></h4>
                                <asp:Button runat="server" CssClass="btn btn-primary" Text="Sluiten"></asp:Button>
                            </div>

                            <div class="modal-body">
                                <div id="printModal<%# Eval("Nummer") %>">
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
                                            <img src="Images/logo3.png" style="width: 150px; height: 200px;" alt="Logo">
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
                                    <table style="text-align: left; margin-left: 5%">
                                        <tr>
                                            <td style="width: 15%">
                                                <asp:Label ID="Label3" runat="server" Text="Nog bij te betalen: "></asp:Label></td>
                                            <td style="width: 15%">
                                                <asp:Label ID="lblBijbetalen" runat="server" Text='<%#Eval("Nogtebetalen") %> ' Enabled="false"></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td style="width: 15%">
                                                <asp:Label ID="Label4" runat="server" Text="Straks totaal betaalde bedrag"></asp:Label></td>
                                            <td style="width: 15%">
                                                <asp:Label ID="lblTotaal" runat="server" Text= '<%#Eval("Totaalbedrag") %>' Enabled="false"></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnBetalen" runat="server" Text="Betaal restbedrag" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" OnClick="btnBetalen_Click" CommandName="<%# Container.ItemIndex %>"/></td>
                                            <td>
                                                <asp:Button ID="btnInchecken" runat="server" Text="Check Gast in" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" OnClick="btnInchecken_Click" CommandName="<%# Container.ItemIndex %>"/></td>
                                        </tr>
                                    </table>

                                    <asp:HiddenField ID="ReserveringNummer" runat="server"
                                    Value='<%# Eval("ReserveringNummer") %>' />
                                <asp:HiddenField ID="fNummer" runat="server"
                                    Value='<%# Eval("fNummer") %>' />

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>
</asp:Content>
