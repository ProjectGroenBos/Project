<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="True" CodeBehind="FactuurKoppelScherm.aspx.cs" Inherits="ProjectGroenBos.Financien.FactuurKoppelScherm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .searchbar {
            margin-bottom: auto;
            margin-top: auto;
            height: 60px;
            background-color: #009879;
            border-radius: 30px;
            padding: 10px;
        }

        .search_input {
            color: white;
            border: 0;
            outline: 0;
            background: none;
            width: 0;
            caret-color: transparent;
            line-height: 40px;
            transition: width 0.4s linear;
        }

        .searchbar:hover > .search_input {
            padding: 0 10px;
            width: 450px;
            caret-color: #009879;
            transition: width 0.4s linear;
        }

        .searchbar:hover > .search_icon {
            background: white;
            color: #009879;
        }

        .search_icon {
            height: 40px;
            width: 40px;
            float: right;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%;
            color: white;
            text-decoration: none;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
        function Bestelsuccess() {
            Swal.fire({
                icon: 'success',
                title: 'Factuur is gekoppeld.',
                showConfirmButton: false,
                timer: 4000
            })
        }

        function Bestelfout() {
            Swal.fire({
                icon: 'error',
                title: 'Er is een fout opgetreden. Alle velden moeten ingevuld worden.',
                showConfirmButton: false,
                timer: 4000
            })
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Factuur Koppelen</div>
            
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <h2>Factuur koppelen</h2>
            <p>Hier worden inkomende facturen gekoppeld met de bijbehorende bestelling.</p>
        <div class="d-flex justify-content-center h-100" style="margin-top: 20px">
            <div class="searchbar">
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Zoeken op bestelnummer..." CssClass="search_input" AutoPostBack="True" BorderStyle="Solid" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                <a href="#" class="search_icon"><i class="fas fa-search"></i></a>
            </div>
        </div>
        <asp:DropDownList ID="DropDownList1" AutoPostBack="True" runat="server" DataSourceID="SqlDataSource2" DataTextField="Naam" DataValueField="Naam" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="DropDownAfdeling"></asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Naam] FROM [Afdeling] union
SELECT 'Alle Afdelingen' AS [Naam]"></asp:SqlDataSource>

        <asp:GridView ID="gvInkooporderaanvragerMain" CssClass="content-table tweedetable" GridLines="None" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Nummer" AllowSorting="True">
            <Columns>

                <asp:BoundField DataField="Nummer" HeaderText="Factuurnummer▼" ReadOnly="True" SortExpression="Nummer" />
                <asp:BoundField DataField="Naam" HeaderText="Afdeling▼" SortExpression="Naam" />
                <asp:BoundField DataField="Datum" DataFormatString="{0:d}" HeaderText="Datum▼" SortExpression="Datum" />
                <asp:BoundField DataField="Leverancier" HeaderText="Leverancier▼" SortExpression="Leverancier" />
                <asp:BoundField DataField="Status" HeaderText="Status▼" SortExpression="Status" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <button type="button" style="background-color: #009879; color: #fff" class="btn" data-toggle="modal" data-target="#modal<%# Eval("Nummer") %>">Toevoegen Factuur</button>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Bestelnummer" HeaderText="Bestelnummer" ReadOnly="True" SortExpression="Bestelnummer" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select * from inkooporderaanvraagmainLev where [Status] = 'Pakbon goedgekeurd' order by datum DESC, opmerking DESC"></asp:SqlDataSource>
    </div>


    <asp:GridView ID="GridView1" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
        RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"
        AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="File Name" />
            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"
                        CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Repeater ID="rpFactuurToevoegen" runat="server">
        <ItemTemplate>
            <asp:UpdatePanel runat="server" ID="updatePanelTop" UpdateMode="Conditional" ChildrenAsTriggers="True">

                <ContentTemplate>
                    <!-- Modal -->
                    <div id="modal<%# Eval("Nummer") %>" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <!-- Modal content-->
                            <div class="modal-content">

                                <div class="modal-header">
                                    <h4 class="modal-title">Factuur Koppelen <%# Eval("Nummer") %> </h4>
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

                                    <div class="modal-header">
                                        <h4 class="modal-title">Factuur toevoegen</h4>
                                    </div>
                                    <div class="modal-body">

                                        <asp:UpdatePanel runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                            <ContentTemplate>

                                                <asp:GridView ID="gvFactuurreservering" DataKeyNames="ID, regelnummer" EnableCallbacks='false' ShowHeaderWhenEmpty="True" EmptyDataText="Er zijn geen producten gevonden bij deze inkooporderaanvraag." CssClass="content-table" GridLines="None" AutoGenerateColumns="False" Style="text-align: center; min-width: 656px; margin-left: auto; margin-right: auto" runat="server" DataSourceID="SqlDataSource7">
                                                    <Columns>
                                                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                                                        <asp:BoundField DataField="regelnummer" HeaderText="Regelnummer" ReadOnly="True" SortExpression="ID" />
                                                        <asp:BoundField DataField="Naam" HeaderText="Item" ReadOnly="True" SortExpression="Naam" />
                                                        <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" ReadOnly="True" SortExpression="Omschrijving" />

                                                        <asp:TemplateField HeaderText="Prijs" SortExpression="Prijs">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TxtP" runat="server" Text='<%# Bind("Prijs") %>'></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Prijs" runat="server" ErrorMessage="*" ControlToValidate="TxtP" ForeColor="Red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="Prijs1" runat="server" ErrorMessage="bijv. 345,90" ControlToValidate="TxtP" ForeColor="Red" ValidationExpression="^\d{0,8}(\,\d{1,4})?$" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Prijs", "{0:C}") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="Inkoopaantal" HeaderText="Inkoop Aantal" ReadOnly="True" SortExpression="Inkoopaantal" HeaderStyle-Width="100px" />
                                                        <asp:CommandField ShowEditButton="True" ValidationGroup="Validation" />

                                                    </Columns>
                                                </asp:GridView>
                                                <asp:HiddenField ID="Nummer" runat="server"
                                                    Value='<%# Eval("Nummer") %>' />

                                                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select * from aanpassenprijs where Nummer = @Nummer" UpdateCommand="update InkoopAanvraagRegels set [Afwijking bedrag] = @Prijs Where ID = @regelnummer">
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="Prijs" />
                                                        <asp:Parameter Name="ID" />
                                                    </UpdateParameters>

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

                                                <p style="margin-top: 1rem; margin-bottom: 0;">Uiterste betaaldatum</p>
                                                <asp:TextBox ID="txbTermijn" placeholder="DD-MM-YYYY" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Termijn" runat="server" ErrorMessage="*" ControlToValidate="txbTermijn" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="Termijn1" runat="server" ErrorMessage="dd/MM/yyyy" ControlToValidate="txbTermijn" ForeColor="Red" ValidationExpression="(^((((0[1-9])|([1-2][0-9])|(3[0-1]))|([1-9]))-(((0[1-9])|(1[0-2]))|([1-9]))-(([0-9]{2})|(((19)|([2]([0]{1})))([0-9]{2}))))$)" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>

                                                <p style="margin-top: 1rem; margin-bottom: 0;">IBAN</p>
                                                <asp:TextBox ID="txbIban" placeholder="IBAN" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                    </div>
                                    <input type="button" validationgroup="Validation" id="btnNaarPdf" data-toggle="modal" data-target="#bestelModal<%# Eval("Nummer") %>" style="max-width: 80%; margin-left: auto; margin-right: auto; margin-top: 100px" class="btn btn-success btn-lg btn-block" value="PDF Toevoegen" />
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div id="bestelModal<%# Eval("Nummer") %>" class="modal fade center" role="dialog">

                <div class="modal-dialog modal-lg">
                    <!-- Modal content-->
                    <div class="modal-content">

                        <div class="modal-header">
                            <h4 class="modal-title">PDF Uploaden <%# Eval("Nummer") %> </h4>
                            <asp:Button runat="server" CssClass="btn btn-primary" Text="Sluiten"></asp:Button>
                        </div>

                        <div class="modal-body">
                            <h3>Upload hier uw PDF</h3>
                            <div>
                                <asp:FileUpload Style="margin-left: auto; margin-right: auto" ID="FileUpload1" runat="server" accept=".pdf" />
                            </div>

                            <asp:Button ID="btnUpload" OnClick="Upload" CommandName='<%# Container.ItemIndex %>' CommandArgument='<%# Eval("Nummer") %>' Style="max-width: 80%; margin-left: auto; margin-right: auto; margin-top: 20px" CssClass="btn btn-success btn-lg btn-block" runat="server" Text="Koppelen" />

                        </div>

                        <div class="modal-footer">
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

