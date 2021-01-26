<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="OrderPagina.aspx.cs" Inherits="ProjectGroenBos.Restaurant.OrderPagina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @media print {
            @page {
            }

            body {
                margin-left: auto;
                margin-right: auto;
                height: auto;
                overflow: hidden;
                position: absolute;
            }

            .inline-flex {
                justify-content: space-between;
            }

            .logofactuur {
                display: inline-flex;
            }

            .content-table {
                width: 100%;
                font-size: 20px;
            }

            .footerfactuur {
                display: flex;
                flex-direction: row;
                justify-content: space-between;
                bottom: 0;
                width: 100%;
                background: #fff;
                margin: 0 auto 0 auto;
            }
        }
@import url('https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    list-style: none;
    text-decoration: none;
    font-family: "Century Gothic";
}

body {
    background-color: #fff;
}

.wrapper {
    display: flex;
    position: relative;
}

    .wrapper .sidebar {
        width: 300px;
        height: 100%;
        background: linear-gradient(180deg, rgba(14,98,81,1) 0%, rgba(20,143,119,1) 100%);
        padding: 30px 0px;
        position: fixed;
    }

        .wrapper .sidebar h2 {
            color: #fff;
            text-transform: uppercase;
            text-align: center;
        }

        .wrapper .sidebar h3 {
            margin-top: -20px;
            color: #fff;
            text-transform: uppercase;
            text-align: center;
            margin-bottom: 30px;
        }

        .wrapper .sidebar ul li {
            padding: 15px;
            border-bottom: 1px solid #bdb8d7;
            border-bottom: 1px solid rgba(0,0,0,0.05);
            border-top: 1px solid rgba(255,255,255,0.05);
        }

            .wrapper .sidebar ul li a {
                color: #fff;
                display: block;
            }

                .wrapper .sidebar ul li a .fas {
                    width: 25px;
                }

            .wrapper .sidebar ul li:hover {
                background-color: #594f8d;
            }

                .wrapper .sidebar ul li:hover a {
                    color: #fff;
                }

                .wrapper .sidebar ul li:hover .submenu {
                    display: block;
                    max-height: 500px;
                }

.submenu {
    overflow: hidden;
    max-height: 0;
    -webkit-transition: all 1s ease-out;
}

.wrapper .sidebar .terug {
    color: #fff;
    position: absolute;
    width: 100%;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
}

    .wrapper .sidebar .terug a {
        font-weight: bold;
        display: block;
        width: 100%;
        background: #fff;
        height: 40px;
        line-height: 45px;
        text-align: center;
        margin: 0 5px;
        color: rgba(14,98,81,1);
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }

.wrapper .main_content {
    width: 100%;
    margin-left: 300px;
}

    .wrapper .main_content .header {
        text-align: center;
        font-size: 20px;
        padding: 20px;
        background: #fff;
        color: rgba(14,98,81,1);
        border-bottom: 1px solid rgba(14,98,81,1);
    }

    .wrapper .main_content .info {
        margin: 20px;
        color: #717171;
        line-height: 25px;
    }

        .wrapper .main_content .info div {
            margin-bottom: 20px;
        }

.container {
    background-color: #f3f5f9;
    width: 90%;
    height: auto;
    border: 1px solid rgba(14,98,81,1);
    border-radius: 15px;
    text-align: center;
    margin-left: 5%;
    margin-top: 20px;
    min-height: 100px;
}

    .container h2 {
        margin-top: 5px;
        color: rgba(14,98,81,1);
        margin-bottom: 5px;
    }

.center {
    text-align: center;
}

/* table */
.content-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    min-width: 400px;
    border-radius: 5px 5px 0 0;
    overflow: hidden;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);

    margin-left: auto;
    margin-right: auto;
}

    .content-table tbody tr th {
        background-color: #009879;
        color: #ffffff;
        text-align: center;
        font-weight: bold;
    }

    .content-table th,
    .content-table td {
        padding: 12px 15px;
    }

    .content-table tbody tr {
        border-bottom: 1px solid #dddddd;
    }

        .content-table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }


        .content-table tbody tr:last-of-type {
            border-bottom: 2px solid #009879;
        }

        .content-table tbody tr:hover {
            font-weight: bold;
            color: #009879;
        }

        .content-table tbody tr td a {
            background-color: rgba(20,143,119,1);
            border-radius: 5px;
            color: #ffffff;
            padding: .5em;
            text-decoration: none;
        }

            .content-table tbody tr td a:nth-child(2) {
                background-color: #C0392B;
                border-radius: 5px;
                color: #ffffff;
                padding: .5em;
                text-decoration: none;
            }

                .content-table tbody tr td a:nth-child(2):hover {
                    background-color: #CD6155;
                    color: #ffffff;
                }

            .content-table tbody tr td a:hover {
                background-color: #009879;
                color: #ffffff;
            }

.eerstetable {
    width: 60%;
    margin-left: auto;
    margin-right: auto;
}

.tweedetable {
    width: 80%;
    margin-left: auto;
    margin-right: auto;
}

    .tweedetable tr:nth-child(2) input {
        width: 80px;        
    }

.mainpanel {
    width: 70%;
    height: auto;
    min-height: 100px;

    margin-left: 5%;
    margin-top: 5%;

    display: inline-block;
    vertical-align: top;
}

.sidepanel {
    width: 20%; 
    
    height: auto;
    min-height: 100px;
    
    display: inline-block;
    vertical-align: top;

    margin-top: 5%;
}

/* BUTTONS */
.btnToevoegen {
    width: 100%;
    height: 50px;
    margin-top: 10px;
    background-color: rgba(20,143,119,1);
    border-radius: 5px;
    color: #ffffff;
    padding: .5em;
}

.buttongreen {
    background-color: rgba(20,143,119,1);
}

.buttonred {
    background-color: orangered;
}

    .button:active {
        background-color: ghostwhite;
        box-shadow: 0 5px #666;
        transform: translateY(4px);
    }

/*Navigator*/
.navigator {
    height: 120px;
    background: linear-gradient(160deg, rgba(14,98,81,1) 0%, rgba(20,143,119,1) 100%);
    font-weight: bold;
}

.logo {
    margin-left: 40px;
    width: 240px;
    float: left;
}

.selected {
    border: 2px solid #fff;
    color: #fff;
    border-radius: 25px;
}

nav {
    margin-right: 35px;
    padding-top: 45px;
    background: transparent;
    text-align: center;
    float: right;
    position: sticky;
}

    nav li {
        float: left;
        background-color: transparent;
        padding-left: 20px;
        padding-right: 20px;
        padding-top: 15px;
        padding-bottom: 15px;
        margin-left: 10px;
        margin-right: 10px;
        border-color: #7fb241;
    }

        nav li:hover {
            float: left;
            background: transparent;
            padding-left: 20px;
            padding-right: 20px;
            padding-top: 15px;
            padding-bottom: 15px;
            margin-left: 10px;
            margin-right: 10px;
            border-bottom: 2px solid;
            border-color: #fff;
            border-radius: 25px;
        }

    nav a {
        color: #fff;
        text-decoration: none;
    }

        nav a:hover {
            color: #fff;
            text-decoration: none;
        }

        .uitloggen{
            color: rgba(14,98,81,1);
            background-color: #fff;
            border-radius: 25px;
        }

    nav ul {
        list-style-type: none;
        overflow: hidden;
    }


.btnUitloggen {
    font-weight: bold;
    margin-left: 10px;
    padding-left: 20px;
    padding-right: 20px;
    padding-top: 15px;
    padding-bottom: 15px;
    color: rgba(14,98,81,1);
    background-color: #fff;
    border-radius: 25px;
    border: 2px solid #fff;
    border-color: #fff;
}

.btnUitloggen:hover {
    background-color: transparent;
    color: #fff;
}

.inline-flex {
    display: flex;
    justify-content: center;
}

.inline-flex > div {
    text-align: center;
}

.logofactuur {
    display: none;
}

.footerfactuur {
    display: none;
}

.modal-body {
    display: flex;
    flex-direction: column;
}

.inline-flex {
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
}

.Raar {
    text-align: left;
    float: left;
    margin-left: 10%;
margin-bottom: 25%;
margin-top: 10%
}
    </style>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
        function emailsuccess() {
            Swal.fire({
                icon: 'success',
                title: 'De email is verstuurd naar de klant.',
                showConfirmButton: false,
                timer: 4000
            })
        }


        function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;
        }

        function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Goedkeuring Food orders</div>
    <div class="container" runat="server" id="pdfbody">

        <asp:GridView ID="gvOrderBekijken" DataKeyNames="Nummer" CssClass="content-table tweedetable" GridLines="None" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource6">
            <Columns>
                <asp:BoundField DataField="Bestelnummer" HeaderText="Bestelnummer" InsertVisible="False" SortExpression="Bestelnummer" ReadOnly="True" />
                <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" ReadOnly="True" />
                <asp:BoundField DataField="Naam" HeaderText="Leverancier" SortExpression="Naam" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <button type="button" style="background-color: #009879; color: #fff" class="btn" data-toggle="modal" data-target="#modal<%# Eval("Nummer") %>">Druk voor meer info</button>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select * from VoedselRestaurantInkoopOrder inner join Leverancier on Leverancier.ID = VoedselRestaurantInkoopOrder.LeverancierID WHERE Aanvraagstatus = 4"></asp:SqlDataSource>
        <br />
    </div>

    <asp:Repeater ID="rpReservering" runat="server">
        <ItemTemplate>
            <!-- Modal -->
            <div id="modal<%# Eval("Nummer") %>" class="modal fade" role="dialog">
                <div class="modal-dialog modal-lg">
                    <!-- Modal content-->
                    <div class="modal-content">

                        <div class="modal-header">
                            <h4 class="modal-title"><%# Eval("Nummer") %> | <%# Eval("Naam") %></h4>
                            <asp:Button runat="server" CssClass="btn btn-primary" Text="Sluiten"></asp:Button>
                        </div>

                        

                        <div class="modal-body">
                            <div class="factuur" id="printModal<%# Eval("Nummer") %>">
                                <div class="inline-flex">
                                    <div>
                                        <h4>Leveranciergegevens</h4>
                                        <p>
                                            <%# Eval("Nummer") %><br />
                                            <%# Eval("Naam") %><br />
                                            <%# Eval("Adres") %><br />
                                            <%# Eval("Telefoonnummer") %><br />
                                            <%# Eval("Plaats") %>
                                        </p>
                                    </div>
                                    <div class="logofactuur">
                                        <img src="img/logo3.png" style="width: 150px; height: 200px;" alt="Logo">
                                    </div>
                                </div>
                                <hr />
                                <br />
                                <asp:HiddenField ID="Nummer" runat="server"
                                    Value='<%# Eval("Nummer") %>' />
                                <asp:GridView ID="gvFactuurreservering" CssClass="content-table" GridLines="None" AutoGenerateColumns="False" Style="text-align: center; margin-left: auto; margin-right: auto;" runat="server" DataSourceID="SqlDataSource7">
                                    <Columns>
                                        <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="True" SortExpression="Nummer" />
                                        <asp:BoundField DataField="Naam" HeaderText="Naam" ReadOnly="True" SortExpression="Naam" />
                                        <asp:BoundField DataField="Prijs" HeaderText="Prijs per stuk" ReadOnly="True" SortExpression="Prijs" DataFormatString="{0:C}" />
                                        <asp:BoundField DataField="Aantal" HeaderText="Aantal" ReadOnly="True" SortExpression="Aantal" />
                                        <asp:BoundField DataField="Bestelnummer" HeaderText="Bestelnummer" ReadOnly="True" SortExpression="Bestelnummer" />
                                        <asp:BoundField DataField="Omschrijving" HeaderText="Status" ReadOnly="True" SortExpression="Omschrijving" />
                                    </Columns>
                                    <EditRowStyle BackColor="#009879" ForeColor="White" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#009879" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>

                                <%--<table class="content-table" style="min-width: 656px; margin-top: -25px">
                                    <tbody>
                                        <tr>
                                            <td>Totaalbedrag:</td>
                                            <td></td>
                                            <td></td>
                                            <td style="width: 100px">€ <%# Eval("Totaalbedrag") %></td>
                                        </tr>

                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td style="text-align: right">Al betaald:</td>
                                            <td style="width: 100px">€ <%# Eval("Totaal") %></td>
                                        </tr>

                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td style="text-align: right">Nog te betalen:</td>
                                            <td style="width: 100px">€ <%# Eval("Nogtebetalen") %></td>
                                        </tr>
                                    </tbody>
                                </table>--%>

                                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT *
FROM     VoedselRestaurantAanvraagRegels INNER JOIN
                  VoedselRestaurantInkoopOrder ON VoedselRestaurantAanvraagRegels.VoedselOrderAanvraag = VoedselRestaurantInkoopOrder.Nummer INNER JOIN
                  InkoopOrderAanvraagStatus ON VoedselRestaurantInkoopOrder.Aanvraagstatus = InkoopOrderAanvraagStatus.ID INNER JOIN
                  Voorraad ON VoedselRestaurantAanvraagRegels.VoorraadID = Voorraad.ID where nummer = @nummer">
                                    <SelectParameters>
                                        <asp:ControlParameter
                                            Name="Nummer"
                                            ControlID="Nummer"
                                            PropertyName="Value" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <div class="fixed-bottom">
                                    <div class="footerfactuur">
                                        <div>
                                            <br />
                                            <br />
                                            <p>
                                                Groenbos recreatie b.v.
                                                <br />
                                                Noorderpark 12, 6755 VB  Aalterveld
                                            </p>
                                        </div>
                                        <div>
                                            <p>
                                                <br />
                                                <br />
                                                tel. 0625 - 918200
                                                <br />
                                                fax. 0625 - 918201
                                                <br />
                                                bank: NL32 RABO 0220.96.13.200, Rabobank Aalten

                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>

<%--                            <asp:Button ID="btnTransactiehistory" Style="max-width: 80%; margin-left: auto; margin-right: auto;" class="btn btn-primary btn-lg btn-block" CommandArgument='<%# Eval("fnummer")%>' CommandName="<%# Container.ItemIndex %>" runat="server" Text="Zie transactie historie" OnClick="btnTransactiehistory_OnClick" />

                                <input type="button" style="max-width: 80%; margin-left: auto; margin-right: auto;" class="btn btn-primary btn-lg btn-block" onclick="printDiv('printModal<%# Eval("Nummer") %>')" value="Print Factuur" />

                            <asp:Button ID="btnExport" Style="max-width: 80%; margin-left: auto; margin-right: auto;" class="btn btn-primary btn-lg btn-block" CommandName="<%# Container.ItemIndex %>" runat="server" Text="Email naar klant" OnClick="btnExport_Click" />--%>
                        </div>

                        <div class="modal-footer">
                            <asp:Button ID="BtnGoedkeuren" class="btn btn-default" runat="server" Text="Goedkeuren" CommandName="<%# Container.ItemIndex %>" onclick="btnGoedkeuren_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <%--<asp:Repeater ID="rpTransactiemodals" runat="server">
        <ItemTemplate>
            <!-- Modal -->
            <div id="modal2<%# Eval("fnummer") %>" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Transactiehistory Debiteurenfactuur nummer <%# Eval("fnummer") %></h4>
                            <asp:Button runat="server" CssClass="btn btn-primary" Text="Sluiten"></asp:Button>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lblNoRecords" Visible="false" runat="server" Text="Er zijn nog geen transacties bij dit factuur gevonden."></asp:Label>
                            <asp:Repeater ID="rpTransacties" runat="server">
                                <HeaderTemplate>
                                    <div class="timeline">
                                        <ul>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li>
                                        <div class="content">
                                            <h3><%# Eval("TransactieOmschrijving") %></h3>
                                            <p>
                                                <%# Eval("Omschrijving") %><br />
                                                &euro;<%# Eval("Bedrag") %></p>
                                        </div>
                                        <div class="point"></div>
                                        <div class="date">
                                            <h6><%# Eval("Datum", "{0: dd/MM/yyyy}") %></h6>
                                        </div>
                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </div>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>--%>
</asp:Content>