<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="InkoopAanvraagScherm.aspx.cs" Inherits="ProjectGroenBos.Financien.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Inkoop Aanvragen Overzicht</div>
    <div class="container">
        <div class="controls">
            <div class="dropdownFilter">
                <div class="drop-btn">
                    Filter <span class="fas fa-caret-down"></span>
                </div>
                <div class="tooltip">
                </div>
                <div class="dropdownFilterWrapper">
                    <ul class="menu-bar">
                        <li><a href="#">
                            <div class="icon">
                                <span class="fas fa-home"></span>
                            </div>
                            Home </a></li>
                        <li class="setting-item"><a href="#">
                            <div class="icon">
                                <span class="fas fa-cog"></span>
                            </div>
                            Settings & privacy <i class="fas fa-angle-right"></i>
                        </a></li>
                        <li class="help-item"><a href="#">
                            <div class="icon">
                                <span class="fas fa-question-circle"></span>
                            </div>
                            Help & support <i class="fas fa-angle-right"></i>
                        </a></li>
                        <li><a href="#">
                            <div class="icon">
                                <span class="fas fa-user"></span>
                            </div>
                            About us </a></li>
                        <li><a href="#">
                            <div class="icon">
                                <span class="fas fa-comment-alt"></span>
                            </div>
                            Feedback </a></li>
                    </ul>
                    <!-- Settings & privacy Menu-items -->
                    <ul class="setting-drop">
                        <li class="arrow back-setting-btn"><span class="fas fa-arrow-left"></span>Settings & privacy</li>
                        <li><a href="#">
                            <div class="icon">
                                <span class="fas fa-user"></span>
                            </div>
                            Personal info </a></li>
                        <li><a href="#">
                            <div class="icon">
                                <span class="fas fa-lock"></span>
                            </div>
                            Password </a></li>
                        <li><a href="#">
                            <div class="icon">
                                <span class="fas fa-address-book"></span>
                            </div>
                            Activity log </a></li>
                        <li><a href="#">
                            <div class="icon">
                                <span class="fas fa-globe-asia"></span>
                            </div>
                            Languages </a></li>
                        <li><a href="#">
                            <div class="icon">
                                <span class="fas fa-sign-out-alt"></span>
                            </div>
                            Log out </a></li>
                    </ul>
                    <!-- Help & support Menu-items -->
                    <ul class="help-drop">
                        <li class="arrow back-help-btn"><span class="fas fa-arrow-left"></span>Help & support</li>
                        <li><a href="#">
                            <div class="icon">
                                <span class="fas fa-question-circle"></span>
                            </div>
                            Help centre </a></li>
                        <li><a href="#">
                            <div class="icon">
                                <span class="fas fa-envelope"></span>
                            </div>
                            Support Inbox </a></li>
                        <li><a href="#">
                            <div class="icon">
                                <span class="fas fa-comment-alt"></span>
                            </div>
                            Send feedback </a></li>
                        <li><a href="#">
                            <div class="icon">
                                <span class="fas fa-exclamation-circle"></span>
                            </div>
                            Report problem </a></li>
                    </ul>
                </div>
            </div>

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
        </div>

        <asp:GridView ID="gvInkooporderaanvragerMain" CssClass="content-table tweedetable" GridLines="None" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Nummer" AllowSorting="True">
            <Columns>

                <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="True" SortExpression="Nummer" />
                <asp:BoundField DataField="Naam" HeaderText="Afdeling" SortExpression="Naam" />
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

                            <input type="button" style="max-width: 80%; margin-left: auto; margin-right: auto;" class="btn btn-success btn-lg btn-block" onclick="printDiv('printModal<%# Eval("Nummer") %>')" value="Goedkeuren" />
                            <input type="button" style="max-width: 80%; margin-left: auto; margin-right: auto;" class="btn btn-danger btn-lg btn-block" onclick="printDiv('printModal<%# Eval("Nummer") %>')" value="Afkeuren" />
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
