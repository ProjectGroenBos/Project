<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="Uitchecken.aspx.cs" Inherits="ProjectGroenBos.Reservering.Uitchecken" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <h2>Uitchecken</h2>
        <br />
        <p>
            Gasten die vertrekken kunnen worden uitgecheckt,
            <br />
            mochten ze nog niet alle rekeningen betaald hebben, kan dat ook nog.
        </p>
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
        <asp:Button ID="btnZoek" runat="server" Text="Zoek" OnClick="btnZoek_Click" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowCustomPaging="True" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="content-table" DataKeyNames="Nummer" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <button type="button" style="background-color: #009879; color: #fff" class="btnUitloggen" data-toggle="modal" data-target="#popup<%# Eval("Nummer") %>">Selecteren</button>
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
				  where Vertrekdatum = CONVERT(date, getdate()) and ReserveringsstatusID = 9"></asp:SqlDataSource>

        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="content-table" DataKeyNames="Nummer" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <button type="button" style="background-color: #009879; color: #fff" class="btnUitloggen" data-toggle="modal" data-target="#popup<%# Eval("Nummer") %>">Selecteren</button>
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
				  where Vertrekdatum = CONVERT(date, getdate()) and Achternaam like '%' + @achternaam + '%' and Geboortedatum like '%' + @geboortedatum + '%' and ReserveringsstatusID = 9">
            <SelectParameters>
                <asp:ControlParameter ControlID="txbVoornaam" DefaultValue="%" Name="achternaam" PropertyName="Text" />
                <asp:ControlParameter ControlID="txbGeboortedatum" Name="geboortedatum" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT round(sum(Aantal * Prijs), 2) as [Totaal bedrag], Debiteurenfactuur.Nummer
FROM     Factuurregel INNER JOIN
                  Debiteurenfactuur ON Factuurregel.DebiteurenfactuurNummer = Debiteurenfactuur.Nummer
where Nummer = @nummer
				  group by Nummer">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblNummer" Name="nummer" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblNummer" runat="server" Text="" Visible="false"></asp:Label>


        <asp:Repeater ID="rpReservering" runat="server">
            <ItemTemplate>
                <div id="popup<%# Eval("Nummer") %>" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">

                            <div class="modal-header">
                                <h4 class="modal-title">Uitchecken van de reservering van <%#Eval("Naam") %> met reserveringsnummer <%#Eval("Nummer") %></h4>
                                <asp:Button runat="server" CssClass="btn btn-primary" Text="Sluiten"></asp:Button>
                            </div>

                            <div class="modal-body">
                                <div id="printModal<%# Eval("Nummer") %>">
                                    <div class="inline-flex">
                                        <div>
                                            <h4>Reserverings gegevens</h4>
                                            <p>
                                                #<%# Eval("Nummer") %><br /><%# Eval("Naam") %><br /><%# Eval("Aantal_personen") %>personen<br />
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
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label3" runat="server" Text="Totale gemaakte kosten: "></asp:Label></td>
                                            <td>
                                               
                                            </td>

                                        </tr>
                                    </table>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
