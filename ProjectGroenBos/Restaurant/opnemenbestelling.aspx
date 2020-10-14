<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="opnemenbestelling.aspx.cs" Inherits="ProjectGroenBos.Restaurant.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="css/opnemenbestelling.css">
    <div class="werkgebied">

        <!-- Winkelmandje -->
        <div class="winkelmandje" id="winkelmand">


            <div class="titel">
<<<<<<< HEAD
                <asp:Label ID="lbltafel" runat="server" Text=""></asp:Label>
            </div>

            <!-- Producten -->
            <div class="cart-items">
            </div>
            <div class="cart-total">
                <strong class="cart-total-title">Totaal</strong>
                <span class="cart-total-price">€0</span>
=======
                Besteld:
            </div>

            <!-- Producten -->
            <div class="cart">
>>>>>>> RestaurantTeam/Jibbe
            </div>
            <div class="betalen">

                <asp:Button ID="btnBetalen" runat="server" Text="BETALEN!!" />

            </div>
        </div>

        <!--Items-->
        <div class="doorklik-content">
            <button class="doorklik-button"><a href="#Dranken">Dranken</a></button>
            <button class="doorklik-button"><a href="#Voorgerecht">Voorgerecht</a></button>
            <button class="doorklik-button"><a href="#Hoofdgerecht">Hoofdgerecht</a></button>
            <button class="doorklik-button"><a href="#Nagerecht">Nagerecht</a></button>
            <br />
        </div>



        <div class="Productenbak">

            <!--Dranken-->
            <div class="productgroep">
                <h1 class="productgroepnaam" id="Dranken">Dranken</h1>
            </div>

            <div class="productrow">
                <img class="productimg" src="img/productimg/Fanta.png" alt="Fanta Orange" />
                <h1 class="productnaam">Fanta Orange</h1>
                <asp:Button class="toevoegen" runat="server" Text="Toevoegen" />
            </div>
            <div class="productrow">
                <img class="productimg" src="img/productimg/Cola.png" alt="Fanta Orange" />
                <h1 class="productnaam">Coca Cola</h1>
                <asp:Button class="toevoegen" runat="server" Text="Toevoegen" />
            </div>
            <div class="productrow">
                <img class="productimg" src="img/productimg/Sprite.png" alt="Fanta Orange" />
                <h1 class="productnaam">Sprite</h1>
                <asp:Button class="toevoegen" runat="server" Text="Toevoegen" />
            </div>


            <!--Voorgerecht-->
            <div class="productgroep">
                <h1 class="productgroepnaam" id="Voorgerecht">Voorgerecht</h1>
            </div>

            <div class="productrow">
                <img class="productimg" src="img/productimg/champignonsoep.png" alt="Fanta Orange" />
                <h1 class="productnaam">Champignonsoep</h1>
                <asp:Button class="toevoegen" runat="server" Text="Toevoegen" />
            </div>
            <div class="productrow">
                <img class="productimg" src="img/productimg/tomatensoep.png" alt="Fanta Orange" />
                <h1 class="productnaam">Tomatensoep</h1>
                <asp:Button class="toevoegen" runat="server" Text="Toevoegen" />
            </div>
            <div class="productrow">
                <img class="productimg" src="img/productimg/carpaccio.png" alt="Fanta Orange" />
                <h1 class="productnaam">Carpaccio</h1>
                <asp:Button class="toevoegen" runat="server" Text="Toevoegen" />
            </div>
            <div class="productrow">
                <img class="productimg" src="img/productimg/broodplankje.png" alt="Fanta Orange" />
                <h1 class="productnaam">Broodplankje</h1>
                <asp:Button class="toevoegen" runat="server" Text="Toevoegen" />
            </div>


            <!--Hoofdgerecht-->
            <div class="productgroep">
                <h1 class="productgroepnaam" id="Hoofdgerecht">Hoofdgerecht</h1>
            </div>

            <div class="productrow">
                <img class="productimg" src="img/productimg/patat.png" alt="Fanta Orange" />
                <h1 class="productnaam">Patat</h1>
                <asp:Button class="toevoegen" runat="server" Text="Toevoegen" />
            </div>
            <div class="productrow">
                <img class="productimg" src="img/productimg/sate.png" alt="Fanta Orange" />
                <h1 class="productnaam">Saté</h1>
                <asp:Button class="toevoegen" runat="server" Text="Toevoegen" />
            </div>
            <div class="productrow">
                <img class="productimg" src="img/productimg/schnitzel.png" alt="Fanta Orange" />
                <h1 class="productnaam">Schnitzel</h1>
                <asp:Button class="toevoegen" runat="server" Text="Toevoegen" />
            </div>
            <div class="productrow">
                <img class="productimg" src="img/productimg/spareribs.png" alt="Fanta Orange" />
                <h1 class="productnaam">Spareribs</h1>
                <asp:Button class="toevoegen" runat="server" Text="Toevoegen" />
            </div>
            <div class="productrow">
                <img class="productimg" src="img/productimg/varkenshaas.png" alt="Fanta Orange" />
                <h1 class="productnaam">Varkenshaassaté</h1>
                <asp:Button class="toevoegen" runat="server" Text="Toevoegen" />
            </div>


            <!--Nagerecht-->
            <div class="productgroep">
                <h1 class="productgroepnaam" id="Nagerecht">Nagerecht</h1>
            </div>

            <div class="productrow">
                <img class="productimg" src="img/productimg/cremebrulee.png" alt="Fanta Orange" />
                <h1 class="productnaam">Crème brûlée</h1>
                <asp:Button class="toevoegen" runat="server" Text="Toevoegen" />
            </div>
            <div class="productrow">
                <img class="productimg" src="img/productimg/chocoladetaart.png" alt="Fanta Orange" />
                <h1 class="productnaam">Chocoladetaart</h1>
                <asp:Button class="toevoegen" runat="server" Text="Toevoegen" />
            </div>


        </div>
    </div>
</asp:Content>
