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
                                        <input type="hidden" id="elhidden" name="custId" value='<%# Eval("Winst") %>'>
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
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">€<%# Eval("Bedrag") %></div>
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
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">€<%# Eval("Uitgaven") %></div>
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
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">€<%# Eval("WinstJaar") %></div>
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

                            $({ percentage: 0 }).stop(true).animate({ percentage: value }, {
                                duration: 2000,
                                easing: "easeOutExpo",
                                step: function () {
                                    // percentage with 1 decimal;
                                    var percentageVal = Math.round(this.percentage * 10) / 10;
                                    $el.text('€' + percentageVal);


                                }
                            }).promise().done(function () {
                                // hard set the value after animation is done to be
                                // sure the value is correct
                                $el.text("€" + value);
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
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <!-- Content Row -->

            <div class="row">
                <!-- Pie Chart -->
                <div class="col-xl-6 col-lg-2">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div
                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
                            <div class="dropdown no-arrow">
                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                    aria-labelledby="dropdownMenuLink">
                                    <div class="dropdown-header">Dropdown Header:</div>
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-pie pt-4 pb-2">
                                <canvas id="myPieChart"></canvas>
                            </div>
                            <div class="mt-4 text-center small">
                                <span class="mr-2">
                                    <i class="fas fa-circle text-primary"></i>Direct
                                </span>
                                <span class="mr-2">
                                    <i class="fas fa-circle text-success"></i>Social
                                </span>
                                <span class="mr-2">
                                    <i class="fas fa-circle text-info"></i>Referral
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Pie Chart -->
                <div class="col-xl-6 col-lg-2">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div
                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
                            <div class="dropdown no-arrow">
                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                    aria-labelledby="dropdownMenuLink">
                                    <div class="dropdown-header">Dropdown Header:</div>
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-pie pt-4 pb-2">
                                <canvas id="myPieChart"></canvas>
                            </div>
                            <div class="mt-4 text-center small">
                                <span class="mr-2">
                                    <i class="fas fa-circle text-primary"></i>Direct
                                </span>
                                <span class="mr-2">
                                    <i class="fas fa-circle text-success"></i>Social
                                </span>
                                <span class="mr-2">
                                    <i class="fas fa-circle text-info"></i>Referral
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Area Chart -->
                <div class="col-xl-12 col-lg-7">
                    <div class="card shadow mb-5">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Projects</h6>
                        </div>
                        <div class="card-body">
                            <h4 class="small font-weight-bold">Server Migration <span
                                class="float-right">20%</span></h4>
                            <div class="progress mb-4">
                                <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
                                    aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                </div>
                            </div>
                            <h4 class="small font-weight-bold">Sales Tracking <span
                                class="float-right">40%</span></h4>
                            <div class="progress mb-4">
                                <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
                                    aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                                </div>
                            </div>
                            <h4 class="small font-weight-bold">Customer Database <span
                                class="float-right">60%</span></h4>
                            <div class="progress mb-4">
                                <div class="progress-bar" role="progressbar" style="width: 60%"
                                    aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                                </div>
                            </div>
                            <h4 class="small font-weight-bold">Payout Details <span
                                class="float-right">80%</span></h4>
                            <div class="progress mb-4">
                                <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
                                    aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">
                                </div>
                            </div>
                            <h4 class="small font-weight-bold">Account Setup <span
                                class="float-right">Complete!</span></h4>
                            <div class="progress">
                                <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
                                    aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>
</asp:Content>
