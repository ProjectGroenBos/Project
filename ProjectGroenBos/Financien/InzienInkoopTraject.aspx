<%@ Page Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="True" CodeBehind="InzienInkoopTraject.aspx.cs" Inherits="ProjectGroenBos.Financien.InzienInkoopTraject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Alle inkoopaanvragen en bestellingen</div>
    <div class="container">

        <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" BorderStyle="Solid" Height="23px" OnTextChanged="TextBox1_TextChanged" Width="215px"></asp:TextBox>
        <asp:DropDownList ID="DropDownList1" AutoPostBack="True" runat="server" DataSourceID="SqlDataSource2" DataTextField="Naam" DataValueField="Naam" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="DropDownAfdeling"></asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Naam] FROM [Afdeling] union
SELECT 'Alle Afdelingen' AS [Naam]"></asp:SqlDataSource>

        <asp:GridView ID="gvInkooporderaanvragerMain" CssClass="content-table tweedetable" GridLines="None" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Nummer" AllowSorting="True">
            <Columns>

                <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="True" SortExpression="Nummer" />
                <asp:BoundField DataField="Naam" HeaderText="Afdeling" SortExpression="Naam" />
                <asp:BoundField DataField="Datum" DataFormatString="{0:d}" HeaderText="Datum" SortExpression="Datum" />
                <asp:BoundField DataField="Leverancier" HeaderText="Leverancier" SortExpression="Leverancier" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="LaatsteUpdate" DataFormatString="" HeaderText="Laatste Update" SortExpression="LaatsteUpdate" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <button type="button" style="background-color: #009879; color: #fff" class="btn" data-toggle="modal" data-target="#modal<%# Eval("Nummer") %>">Meer...</button>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Bestelnummer" HeaderText="Bestelnummer" ReadOnly="True" SortExpression="Bestelnummer" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select * from inkooporderaanvraagmainLev order by datum DESC, opmerking DESC"></asp:SqlDataSource>
    </div>

        <asp:Repeater ID="rpInzienInkoopTraject" runat="server">
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
                            <div class="inline-flex">
                                <div>
                                    <h4>Opmerking</h4>
                                    <p>
                                        <%# Eval("Opmerking") %><br />
                                    </p>
                                </div>

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
                            <asp:GridView ID="gvFactuurreservering" ShowHeaderWhenEmpty="True" EmptyDataText="Er zijn geen producten gevonden bij deze inkooporderaanvraag." CssClass="content-table" GridLines="None" AutoGenerateColumns="False" Style="text-align: center; margin-left: auto; margin-right: auto" runat="server" DataSourceID="SqlDataSource7">
                                <Columns>
                                    <asp:BoundField DataField="Naam" HeaderText="Item" ReadOnly="True" SortExpression="Naam" />
                                    <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" ReadOnly="True" SortExpression="Omschrijving" />
                                    <asp:BoundField DataField="Minimum_Voorraad" HeaderText="Minimum Voorraad" ReadOnly="True" SortExpression="Minimum_Voorraad" ItemStyle-Width="50px" />
                                    <asp:BoundField DataField="Huidige_voorraad" HeaderText="Huidige voorraad" HtmlEncode="False" ReadOnly="True" SortExpression="Huidige_voorraad" ItemStyle-Width="50px" />
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
                            <table class="content-table" style="min-width: 656px; margin-top: -25px">
                                <tbody>
                                    <tr>
                                        <td>Totaalbedrag:</td>
                                        <td></td>
                                        <td></td>
                                        <td style="width: 100px">€ <%# Eval("TotaalPrijs") %></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>
                        </div>
                    </div>
                </div>
            </div>

        </ItemTemplate>
    </asp:Repeater>

    <script>
        // Get the container element
        var btnContainer = document.getElementById("setting-drop");

        // Get all buttons with class="btn" inside the container
        var btns = document.getElementsByClassName("afdelingbtn");

        // Loop through the buttons and add the active class to the current/clicked button
        for (var i = 0; i < btns.length; i++) {
            btns[i].addEventListener("click", function () {
                var current = document.getElementsByClassName("active");

                // If there's no active class
                if (current.length > 0) {
                    current[0].className = current[0].className.replace(" active", "");
                }

                // Add the active class to the current/clicked button
                this.className += " active";
            });
        }
    </script>


    <script>
        const drop_btn = document.querySelector(".drop-btn");
        const tooltip = document.querySelector(".tooltip");
        const menu_wrapper = document.querySelector(".dropdownFilterWrapper");
        const menu_bar = document.querySelector(".menu-bar");
        const setting_drop = document.querySelector(".setting-drop");
        const help_drop = document.querySelector(".help-drop");
        const setting_item = document.querySelector(".setting-item");
        const help_item = document.querySelector(".help-item");
        const setting_btn = document.querySelector(".back-setting-btn");
        const help_btn = document.querySelector(".back-help-btn");

        drop_btn.onclick = (() => {
            menu_wrapper.classList.toggle("show");
            tooltip.classList.toggle("show");
        });

        setting_item.onclick = (() => {
            menu_bar.style.marginLeft = "-400px";
            setTimeout(() => {
                setting_drop.style.display = "block";
            }, 100);
        });
        help_item.onclick = (() => {
            menu_bar.style.marginLeft = "-400px";
            setTimeout(() => {
                help_drop.style.display = "block";
            }, 100);
        });
        setting_btn.onclick = (() => {
            menu_bar.style.marginLeft = "0px";
            setting_drop.style.display = "none";
        });
        help_btn.onclick = (() => {
            help_drop.style.display = "none";
            menu_bar.style.marginLeft = "0px";
        });
    </script>
</asp:Content>

