﻿<%@  Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="Gerechten overzicht.aspx.cs" Inherits="ProjectGroenBos.Gerechten_overzicht" %>

<!DOCTYPE html>

<html>
<head runat ="server ">
    <title>Groenbos</title>
    <link rel="stylesheet" href="css/style.css">
    <asp:ContentPlaceHolder ID="head" runat="server">
    </asp:ContentPlaceHolder>
</head>
<body>
    <form id="form1" runat="server">

        <div class="wrapper">
            <div class="sidebar">
                <h2>
                    <img src="img/Logo4.png" alt="Logo" height="150"></h2>
                <h3>RESTAURANT</h3>
                <ul>
                    <li><a href="home.aspx"><i class="fas fa-home"></i>Home</a></li>
                    <li><a href="#"><i class="fas fa-user"></i>Bestellingen</a>
                        <ul class="submenu">
                            <li><a href="opnemenbestelling.aspx">Bestelling opnemen</a></li>
                            <li><a href="#">Bestellingen overzicht</a>
                                <ul class="submenu">
                                    <li><a href="#">Dranken overzicht</a></li>
                                    <li><a href="#">Gerechten overzicht</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li><a href="#"><i class="fas fa-user"></i>Keuken</a>
                        <ul class="submenu">
                            <li><a href="#">Keukenscherm</a></li>
                        </ul>
                    </li>
                </ul>
                <div class="terug">
                    <a href="#">&#8249; Terug naar home</a>
                </div>
            </div>
            <div class="main_content">
                <div class="navigator">
                    <nav>
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li class="selected"><a href="#">Restraurant</a></li>
                            <li><a href="#">Reserveringen</a></li>
                            <li><a href="#">Recreatie</a></li>
                            <li><a href="#">Schoonmaak</a></li>
                            <li><a href="#">Financiën</a></li>
                            <asp:Button ID="btnUitloggen" runat="server" CssClass="btnUitloggen" Text="Uitloggen" />
                        </ul>
                    </nav>
                </div>
                <asp:ContentPlaceHolder ID="ContentPlaceHolder1" runat="server">
                </asp:ContentPlaceHolder>
            </div>
        </div>
    </form>
</body>

</html>
