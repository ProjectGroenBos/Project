<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ProjectGroenBos.Financien.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Homepagina</div>
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Content Row -->
        <div class="row">
            <asp:Repeater ID="rpTopInfo" runat="server">
                <ItemTemplate>
                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            Winst (Maand)
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="el">€</div>
                                        <input type="hidden" id="elhidden" name="elhidden" value='<%# string.Format("{0:C}", Eval("Winst")) %>'>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-euro-sign fa-2x text-green-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Inkomsten (Maand)
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="el1"></div>
                                        <input type="hidden" id="elhidden1" name="elhidden1" value='<%# string.Format("{0:C}", Eval("Bedrag")) %>'>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-euro-sign fa-2x text-blue-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-danger shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                                            Uitgaven (Maand)
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="el2"></div>
                                        <input type="hidden" id="elhidden2" name="elhidden2" value='<%# string.Format("{0:C}", Eval("Uitgaven")) %>'>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-euro-sign fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            Winst (Jaar)
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="el3"></div>
                                        <input type="hidden" id="elhidden3" name="elhidden3" value='<%# string.Format("{0:C}", Eval("WinstJaar")) %>'>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-euro-sign fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script>
                        $(document).ready(function () {

                            var $el = $("#el"),
                                value = $("#elhidden").val();

                            var $el1 = $("#el1"),
                                value1 = $("#elhidden1").val();

                            var $el2 = $("#el2"),
                                value2 = $("#elhidden2").val();

                            var $el3 = $("#el3"),
                                value3 = $("#elhidden3").val();

                            $({ percentage: 0 }).stop(true).animate({ percentage: value }, {
                                duration: 2000,
                                easing: "easeOutExpo",
                                step: function () {
                                    // percentage with 1 decimal;
                                    var percentageVal = Math.round(this.percentage * 10) / 10;
                                    $el.text(percentageVal);


                                }
                            }).promise().done(function () {
                                // hard set the value after animation is done to be
                                // sure the value is correct
                                $el.text(value);
                            });

                            $({ percentage: 0 }).stop(true).animate({ percentage: value1 }, {
                                duration: 2000,
                                easing: "easeOutExpo",
                                step: function () {
                                    // percentage with 1 decimal;
                                    var percentageVal = Math.round(this.percentage * 10) / 10;
                                    $el1.text(percentageVal);


                                }
                            }).promise().done(function () {
                                // hard set the value after animation is done to be
                                // sure the value is correct
                                $el1.text(value1);
                            });

                            $({ percentage: 0 }).stop(true).animate({ percentage: value2 }, {
                                duration: 2000,
                                easing: "easeOutExpo",
                                step: function () {
                                    // percentage with 1 decimal;
                                    var percentageVal = Math.round(this.percentage * 10) / 10;
                                    $el2.text(percentageVal);


                                }
                            }).promise().done(function () {
                                // hard set the value after animation is done to be
                                // sure the value is correct
                                $el2.text(value2);
                            });

                            $({ percentage: 0 }).stop(true).animate({ percentage: value3 }, {
                                duration: 2000,
                                easing: "easeOutExpo",
                                step: function () {
                                    // percentage with 1 decimal;
                                    var percentageVal = Math.round(this.percentage * 10) / 10;
                                    $el3.text(percentageVal);


                                }
                            }).promise().done(function () {
                                // hard set the value after animation is done to be
                                // sure the value is correct
                                $el3.text(value3);
                            });
                        });

                    </script>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- Content Row -->

        <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Maandelijkse absolute winst overzicht</h6>
                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <div class="chart-area">
                            <canvas id="myAreaChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>

                    <input type="hidden" id="Datumhidden" name="Datumhidden" value='<%# Eval("Maanden") %>'>
                    <input type="hidden" id="Bedraghidden" name="Bedraghidden" value='<%# Eval("Bedrag") %>'>
                    <script>
                        // Set new default font family and font color to mimic Bootstrap's default styling
                        Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                        Chart.defaults.global.defaultFontColor = '#858796';

                        var Datumhidden = $("#Datumhidden").val();
                        var Bedraghidden = $("#Bedraghidden").val();

                        var DatumArray = Datumhidden.split(',');
                        var BedragArray = Bedraghidden.split(',');

                        console.log(Bedraghidden);

                        function number_format(number, decimals, dec_point, thousands_sep) {
                            // *     example: number_format(1234.56, 2, ',', ' ');
                            // *     return: '1 234,56'
                            number = (number + '').replace(',', '').replace(' ', '');
                            var n = !isFinite(+number) ? 0 : +number,
                                prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
                                sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
                                dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
                                s = '',
                                toFixedFix = function (n, prec) {
                                    var k = Math.pow(10, prec);
                                    return '' + Math.round(n * k) / k;
                                };
                            // Fix for IE parseFloat(0.55).toFixed(0) = 0;
                            s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
                            if (s[0].length > 3) {
                                s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
                            }
                            if ((s[1] || '').length < prec) {
                                s[1] = s[1] || '';
                                s[1] += new Array(prec - s[1].length + 1).join('0');
                            }
                            return s.join(dec);
                        }

                        // Area Chart Example
                        var ctx = document.getElementById("myAreaChart");
                        var myLineChart = new Chart(ctx, {
                            type: 'line',
                            data: {
                                labels: DatumArray,
                                datasets: [{
                                    label: "Winst",
                                    lineTension: 0.3,
                                    backgroundColor: "rgba(78, 115, 223, 0.05)",
                                    borderColor: "rgba(78, 115, 223, 1)",
                                    pointRadius: 3,
                                    pointBackgroundColor: "rgba(78, 115, 223, 1)",
                                    pointBorderColor: "rgba(78, 115, 223, 1)",
                                    pointHoverRadius: 3,
                                    pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
                                    pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                                    pointHitRadius: 10,
                                    pointBorderWidth: 2,
                                    data: BedragArray,
                                }],
                            },
                            options: {
                                maintainAspectRatio: false,
                                layout: {
                                    padding: {
                                        left: 10,
                                        right: 25,
                                        top: 25,
                                        bottom: 0
                                    }
                                },
                                scales: {
                                    xAxes: [{
                                        time: {
                                            unit: 'date'
                                        },
                                        gridLines: {
                                            display: false,
                                            drawBorder: false
                                        },
                                        ticks: {
                                            maxTicksLimit: 7
                                        }
                                    }],
                                    yAxes: [{
                                        ticks: {
                                            maxTicksLimit: 5,
                                            padding: 10,
                                            // Include a dollar sign in the ticks
                                            callback: function (value, index, values) {
                                                return '€' + number_format(value);
                                            }
                                        },
                                        gridLines: {
                                            color: "rgb(234, 236, 244)",
                                            zeroLineColor: "rgb(234, 236, 244)",
                                            drawBorder: false,
                                            borderDash: [2],
                                            zeroLineBorderDash: [2]
                                        }
                                    }],
                                },
                                legend: {
                                    display: false
                                },
                                tooltips: {
                                    backgroundColor: "rgb(255,255,255)",
                                    bodyFontColor: "#858796",
                                    titleMarginBottom: 10,
                                    titleFontColor: '#6e707e',
                                    titleFontSize: 14,
                                    borderColor: '#dddfeb',
                                    borderWidth: 1,
                                    xPadding: 15,
                                    yPadding: 15,
                                    displayColors: false,
                                    intersect: false,
                                    mode: 'index',
                                    caretPadding: 10,
                                    callbacks: {
                                        label: function (tooltipItem, chart) {
                                            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                                            return datasetLabel + ': €' + number_format(tooltipItem.yLabel);
                                        }
                                    }
                                }
                            }
                        });
                    </script>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Repeater ID="rpCirkel" runat="server">
                <ItemTemplate>

                    <!-- Pie Chart -->
                    <div class="col-xl-4 col-lg-5">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div
                                class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Inkomsten bronnen</h6>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-pie pt-4 pb-2">
                                    <canvas id="myPieChart"></canvas>
                                </div>
                                <div class="mt-4 text-center small">
                                    <span class="mr-2">
                                        <i class="fas fa-circle text-primary"></i>Huuritemopbrengst
                                    </span>
                                    <span class="mr-2">
                                        <i class="fas fa-circle text-success"></i>Activiteit
                                    </span>
                                    <span class="mr-2">
                                        <i class="fas fa-circle text-info"></i>Reserveringen
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" id="HuuritemopbrengstHidden" name="custId" value='<%# Eval("huuritemopbrengst") %>'>
                    <input type="hidden" id="ActiviteitHidden" name="ActiviteitHidden" value='<%# Eval("activiteit") %>'>
                    <input type="hidden" id="ReserveringenHidden" name="ReserveringenHidden" value='<%# Eval("reservering") %>'>
                    <script>
                        // Set new default font family and font color to mimic Bootstrap's default styling
                        Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                        Chart.defaults.global.defaultFontColor = '#858796';

                        var HuuritemopbrengstHidden = $("#HuuritemopbrengstHidden").val();
                        var ActiviteitHidden = $("#ActiviteitHidden").val();
                        var ReserveringenHidden = $("#ReserveringenHidden").val();
                        console.log(ReserveringenHidden);

                        // Pie Chart Example
                        var ctx = document.getElementById("myPieChart");
                        var myPieChart = new Chart(ctx, {
                            type: 'doughnut',
                            data: {
                                labels: ["Huuritemopbrengst", "Activiteit", "Reserveringen"],
                                datasets: [{
                                    data: [HuuritemopbrengstHidden, ActiviteitHidden, ReserveringenHidden],
                                    backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
                                    hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
                                    hoverBorderColor: "rgba(234, 236, 244, 1)",
                                }],
                            },
                            options: {
                                maintainAspectRatio: false,
                                tooltips: {
                                    backgroundColor: "rgb(255,255,255)",
                                    bodyFontColor: "#858796",
                                    borderColor: '#dddfeb',
                                    borderWidth: 1,
                                    xPadding: 15,
                                    yPadding: 15,
                                    displayColors: false,
                                    caretPadding: 10,
                                },
                                legend: {
                                    display: false
                                },
                                cutoutPercentage: 80,
                            },
                        });
                    </script>
                </ItemTemplate>
            </asp:Repeater>

            <!-- Content Row -->



            <!-- Illustrations -->
            <div class="col-xl-8 col-lg-11">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Transacties van vandaag</h6>
                    </div>
                    <div class="card-body">
                        <div class="text-center">
                            <asp:GridView ID="GridView1" CssClass="content-table2" GridLines="None" runat="server" AutoGenerateColumns="False" DataKeyNames="Kenmerk" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="Kenmerk" HeaderText="Kenmerk" InsertVisible="False" ReadOnly="True" SortExpression="Kenmerk" />
                                    <asp:BoundField DataField="Aan" HeaderText="Aan" SortExpression="Aan" />
                                    <asp:BoundField DataField="Bedrag" HeaderText="Bedrag" SortExpression="Bedrag" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT top(10) [Kenmerk], [Aan], [Bedrag] FROM [recentetransacties]"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
