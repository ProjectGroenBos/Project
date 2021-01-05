<%@ Page Language="C#"   MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="NieuwproductAanvragen.aspx.cs" Inherits="ProjectGroenBos.Financien.NieuwproductAanvragen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Main grid --%>
    <div class="header">Leveranciersoverzicht</div>
    <div class="container">
        <h2>leveranciers</h2>
        <p>Dit zijn de leveranciers van recreatiepark Groenbos.</p>

        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#ToevoegenModal">Leverancier toevoegen</button>

        <asp:GridView ID="gvLeveranciersOverzicht" DataKeyNames="ID" CssClass="content-table tweedetable" GridLines="None" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />

                <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />

                <asp:BoundField DataField="Opmerking" HeaderText="Opmerking" SortExpression="Opmerking" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <button type="button" style="background-color: #009879; color: #fff" class="btn" data-toggle="modal" data-target="#ToevoegenModal">Meer...</button>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="select ID, Naam, Opmerking from InkoopAanvraagRegelNieuwProduct"></asp:SqlDataSource>
    </div>

    <!-- Toevoegen Modal -->
    <div id="ToevoegenModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">leverancier toevoegen</h4>
                </div>

                    <p style="margin-top: 1rem; margin-bottom: 0;">Naam</p>
                    <asp:TextBox ID="txbNaam" placeholder="Cornetto" runat="server" Style="text-align: center" Height="50px" Width="100%" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Naam" runat="server" ErrorMessage="*" ControlToValidate="txbNaam" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Naam1" runat="server" ErrorMessage="Bijv. Cornetto" ControlToValidate="txbNaam" ForeColor="Red" ValidationExpression="[a-zA-Z\.\'\-_\s]{1,40}" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>

                    <p style="margin-top: 1rem; margin-bottom: 0;">Prijs</p>
                    <asp:TextBox ID="txbPrijs" placeholder="32,95" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    

                    <p style="margin-top: 1rem; margin-bottom: 0;">Minimum voorraad</p>
                    <asp:TextBox ID="txbMinimumVoorraad" placeholder="100" runat="server" Style="text-align: center" Height="50px" Width="100%"></asp:TextBox>

                    <p style="margin-top: 1rem; margin-bottom: 0;">Omschrijving</p>
                    <asp:TextBox ID="txbOmschrijving" placeholder="Haarlem" runat="server" Style="text-align: center" Height="50px" Width="100%"></asp:TextBox>
                   

                    <asp:Button ID="btnToevoegen" ValidationGroup="Validation" CssClass="btnToevoegen" runat="server" Text="Toevoegen" OnClick="btnToevoegen_Click" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>
                </div>
            </div>

        </div>
    </div>

    <asp:Repeater ID="rpInzienLeverancier" runat="server">
        <ItemTemplate>
            <!-- Modal -->
            <div id="modal<%# Eval("ID") %>" class="modal fade" role="dialog">
                <div class="modal-dialog modal-lg">
                    <!-- Modal content-->
                    <div class="modal-content">

                        <div class="modal-header">
                            <h4 class="modal-title">Leverancierdetails <%# Eval("ID") %> </h4>
                        </div>

                        <div class="modal-body">
                            <div class="inline-flex">
                                <div>
                                    <h4>Leverancier gegevens</h4>
                                    <p>
                                        <%# Eval("Naam") %><br />
                                        <%# Eval("Plaats") %><br />
                                        <%# Eval("Adres") %><br />
                                        <%# Eval("Postcode") %><br />
                                        <%# Eval("Telefoonnummer") %><br />
                                        <%# Eval("Email") %>
                                    </p>
                                </div>
                            </div>

                            <hr />
                            <br />
                            <asp:GridView ID="gvLeverancierdetails" ShowHeaderWhenEmpty="True" EmptyDataText="Er zijn geen producten gevonden bij deze Leverancier." CssClass="content-table" GridLines="None" AutoGenerateColumns="False" Style="text-align: center; margin-left: auto; margin-right: auto" runat="server" DataSourceID="SqlDataSource2">
                                <Columns>
                                    <asp:BoundField DataField="Voorraad_Naam" HeaderText="Item" ReadOnly="True" SortExpression="Voorraad_Naam" />
                                    <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" ReadOnly="True" SortExpression="Omschrijving" />
                                    <asp:BoundField DataField="Minimum_voorraad" HeaderText="Minimum Voorraad" ReadOnly="True" SortExpression="Minimum_voorraad" ItemStyle-Width="50px" />
                                    <asp:BoundField DataField="Aantal" HeaderText="Huidige voorraad" HtmlEncode="False" ReadOnly="True" SortExpression="Aantal" ItemStyle-Width="50px" />
                                    <asp:BoundField DataFormatString="{0:C}" DataField="Prijs" HeaderText="Prijs" ReadOnly="True" SortExpression="Prijs" />
                                </Columns>
                            </asp:GridView>


                            <asp:HiddenField ID="ID" runat="server"
                                Value='<%# Eval("ID") %>' />

                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT Voorraad_Naam, Omschrijving, Minimum_voorraad, Aantal, Prijs from LeverancierDetails where ID = @ID">
                                <SelectParameters>
                                    <asp:ControlParameter
                                        Name="ID"
                                        ControlID="ID"
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
