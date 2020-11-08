<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="InkoopAanvraagScherm.aspx.cs" Inherits="ProjectGroenBos.Financien.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Inkoop Aanvragen Overzicht</div>
    <div class="container">
        <div class="controls">
            <i id="filter" class="material-icons">filter_alt</i>
        </div>

        <asp:GridView ID="gvInkooporderaanvragerMain" CssClass="content-table tweedetable" GridLines="None" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Nummer" AllowSorting="True">
            <Columns>

                <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="True" SortExpression="Nummer" />
                <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
                <asp:BoundField DataField="Datum" DataFormatString="{0:d}" HeaderText="Datum" SortExpression="Datum" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <button type="button" style="background-color: #009879; color: #fff" class="btn" data-toggle="modal" data-target="#modal<%# Eval("Nummer") %>">Inzien Inkoop aanvraag</button>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Opmerking" HeaderText="Opmerking" ReadOnly="True" SortExpression="Opmerking" HtmlEncode="False" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select * from inkooporderaanvraagmain order by datum DESC, opmerking DESC"></asp:SqlDataSource>
    </div>

    <asp:Repeater ID="rpInkoopOrderAanvragen" runat="server">
        <ItemTemplate>
            <!-- Modal -->
            <div id="modal<%# Eval("Nummer") %>" class="modal fade" role="dialog">
                <div class="modal-dialog modal-lg">
                    <!-- Modal content-->
                    <div class="modal-content">

                        <div class="modal-header">
                            <h4 class="modal-title">Inkooporderaanvraag <%# Eval("Nummer") %> </h4>
                            <asp:Button runat="server" CssClass="btn btn-primary" Text="Sluiten"></asp:Button>
                        </div>

                        <div class="modal-body">
                            <h2>Opmerking</h2>
                            <p><%# Eval("Opmerking") %></p>
                            <hr />
                            <br />
                            <asp:GridView ID="gvFactuurreservering" CssClass="content-table" GridLines="None" AutoGenerateColumns="False" Style="text-align: center; margin-left: auto; margin-right: auto;" runat="server" DataSourceID="SqlDataSource7">
                                <Columns>
                                    <asp:BoundField DataField="Naam" HeaderText="Item" ReadOnly="True" SortExpression="Naam" />
                                    <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" ReadOnly="True" SortExpression="Omschrijving" />
                                    <asp:BoundField DataField="Minimum_Voorraad" HeaderText="Minimum Voorraad" ReadOnly="True" SortExpression="Minimum_Voorraad" />
                                    <asp:BoundField DataField="Huidige_voorraad" HeaderText="Huidige voorraad" HtmlEncode="False" ReadOnly="True" SortExpression="Huidige_voorraad" />
                                    <asp:BoundField DataFormatString="{0:C}" DataField="Prijs" HeaderText="Prijs" ReadOnly="True" SortExpression="Prijs" />
                                    <asp:BoundField DataField="Inkoopaantal" HeaderText="Inkoop Aantal" ReadOnly="True" SortExpression="Inkoopaantal" HeaderStyle-Width="100px" />
                                </Columns>
                            </asp:GridView>

                            
                            <asp:HiddenField ID="Nummer" runat="server"
                                             Value='<%# Eval("Nummer") %>' />

                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT Naam, Omschrijving, [Minimum Voorraad] AS Minimum_Voorraad, [Huidige voorraad] AS Huidige_voorraad, Prijs, Inkoopaantal from inkooporderaanvraagitems where InkoopOrderAanvraagNummer = @Nummer">
                                <SelectParameters>
                                    <asp:ControlParameter
                                        Name="Nummer"
                                        ControlID="Nummer"
                                        PropertyName="Value" />
                                </SelectParameters>
                            </asp:SqlDataSource>

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
