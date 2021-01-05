<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="Leverancier.aspx.cs" Inherits="ProjectGroenBos.Financien.Leverancier" %>

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

                <asp:BoundField DataField="Adres" HeaderText="Adres" SortExpression="Adres" />
                <asp:BoundField DataField="Contactpersoon" HeaderText="Contactpersoon" SortExpression="Contactpersoon" />
                <asp:BoundField DataField="Telefoonnummer" HeaderText="Telefoonnummer" SortExpression="Telefoonnummer" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Postcode" HeaderText="Postcode" SortExpression="Postcode" />
                <asp:BoundField DataField="Plaats" HeaderText="Plaats" SortExpression="Plaats" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <button type="button" style="background-color: #009879; color: #fff" class="btn" data-toggle="modal" data-target="#modal<%# Eval("ID") %>">Meer...</button>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT * FROM [Leverancier]"></asp:SqlDataSource>
    </div>

    <!-- Toevoegen Modal -->
    <div id="ToevoegenModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">leverancier toevoegen</h4>
                </div>
                <div class="modal-body">
                    <p style="margin-top: 1rem; margin-bottom: 0;">Naam</p>
                    <asp:TextBox ID="txbNaam" placeholder="Cornetto" runat="server" Style="text-align: center" Height="50px" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Naam" runat="server" ErrorMessage="*" ControlToValidate="txbNaam" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Naam1" runat="server" ErrorMessage="Bijv. Cornetto" ControlToValidate="txbNaam" ForeColor="Red" ValidationExpression="[a-zA-Z\.\'\-_\s]{1,40}" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>

                    <p style="margin-top: 1rem; margin-bottom: 0;">Adres</p>
                    <asp:TextBox ID="txbAdres" placeholder="Straatnaam 123" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Adres" runat="server" ErrorMessage="*" ControlToValidate="txbAdres" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Adres1" runat="server" ErrorMessage="Bijv. Straatnaam 123" ControlToValidate="txbAdres" ForeColor="Red" ValidationExpression="^[a-zA-Z]+\s[0-9]+$" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>

                    <p style="margin-top: 1rem; margin-bottom: 0;">Contactpersoon</p>
                    <asp:TextBox ID="txbContactpersoon" placeholder="Julian" runat="server" Style="text-align: center" Height="50px" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Contactpersoon" runat="server" ErrorMessage="*" ControlToValidate="txbContactpersoon" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Contactpersoon1" runat="server" ErrorMessage="Bijv. Julian" ControlToValidate="txbContactpersoon" ForeColor="Red" ValidationExpression="[a-zA-Z\.\'\-_\s]{1,40}" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>

                    <p style="margin-top: 1rem; margin-bottom: 0;">Telefoonnummer</p>
                    <asp:TextBox ID="txbTelefoonnummer" placeholder="0613246879" runat="server" Style="text-align: center" Height="50px" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Telefoonnummer" runat="server" ErrorMessage="*" ControlToValidate="txbTelefoonnummer" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Telefoonnummer1" runat="server" ErrorMessage="Bijv. 0613246879" ControlToValidate="txbTelefoonnummer" ForeColor="Red" ValidationExpression="((\(\d{3,4}\)|\d{3,4}-)\d{4,9}(-\d{1,5}|\d{0}))|(\d{4,12})" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>

                    <p style="margin-top: 1rem; margin-bottom: 0;">Email</p>
                    <asp:TextBox ID="txbEmail" placeholder="Voorbeeld@hotmail.com" runat="server" Style="text-align: center" Height="50px" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Email" runat="server" ErrorMessage="*" ControlToValidate="txbEmail" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Email1" runat="server" ErrorMessage="Bijv. Voorbeeld@hotmail.com" ControlToValidate="txbEmail" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>

                    <p style="margin-top: 1rem; margin-bottom: 0;">Postcode</p>
                    <asp:TextBox ID="txbPostcode" placeholder="ABCD12" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Postcode" runat="server" ErrorMessage="*" ControlToValidate="txbPostcode" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Postcode1" runat="server" ErrorMessage="Bijv. 2020AB" ControlToValidate="txbPostcode" ForeColor="Red" ValidationExpression="^[1-9][0-9]{3}\s?[a-zA-Z]{2}$" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>

                    <p style="margin-top: 1rem; margin-bottom: 0;">Plaats</p>
                    <asp:TextBox ID="txbPlaats" placeholder="Haarlem" runat="server" Style="text-align: center" Height="50px" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Plaats" runat="server" ErrorMessage="*" ControlToValidate="txbPlaats" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Plaats1" runat="server" ErrorMessage="Bijv. Haarlem" ControlToValidate="txbPlaats" ForeColor="Red" ValidationExpression="[a-zA-Z\.\'\-_\s]{1,40}" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>

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

