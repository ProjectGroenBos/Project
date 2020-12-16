<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="reserveren.aspx.cs" Inherits="ProjectGroenBos.Restaurant.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/reserveren.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="werkgebied">
        <h1 class="paginatitel">Reserveren</h1>

        <div class="contentbak">
            <div class="contentvak">

                <h1 class="informatietitel">Persoonlijke gegevens</h1>

                <div class="contentrij">
                    <div class="tekstlabel">
                        <label>Bungalow</label>
                    </div>

                    <asp:Button ID="btnJa" runat="server" OnClick="btnJa_Click" Text="Ja" />
                    <asp:Button ID="btnNee" runat="server" Text="Nee" OnClick="btnNee_Click" />

                </div>

                <div class="contentrij">
                    <div class="tekstlabel">
                        <label>nummer</label>
                    </div>
                    <asp:TextBox class="tekstbox" ID="txtBungalownummer"
                        runat="server" placeholder="" OnTextChanged="txtBungalownummer_TextChanged"></asp:TextBox>
                </div>

                <div class="contentrij">
                    <div class="tekstlabel">
                        <label>Voornaam</label>
                    </div>
                    <asp:TextBox class="tekstbox" ID="txtVoornaam"
                        runat="server" placeholder=""></asp:TextBox>
                </div>

                <div class="contentrij">
                    <div class="tekstlabel">
                        <label>Achternaam</label>
                    </div>
                    <asp:TextBox class="tekstbox" ID="txtAchternaam"
                        runat="server" placeholder=""></asp:TextBox>
                </div>

                <div class="contentrij">
                    <div class="tekstlabel">
                        <label>Tussenvoegsel</label>
                    </div>
                    <asp:TextBox class="tekstbox" ID="txtTussenvoegsel"
                        runat="server" placeholder=""></asp:TextBox>
                </div>


                <div class="contentrij">
                    <div class="tekstlabel">
                        <label>Telefoonnummer</label>
                    </div>
                    <asp:TextBox class="tekstbox" ID="txtTelefoon"
                        runat="server" placeholder=""></asp:TextBox>
                </div>

                <div class="contentrij">
                    <div class="tekstlabel">
                        <label>E-mail</label>
                    </div>
                    <asp:TextBox class="tekstbox" ID="txtEmail"
                        runat="server" placeholder=""></asp:TextBox>
                </div>
            </div>


            <div class="contentvak2">
                <h1 class="informatietitel">Tafel gegevens</h1>

                <div class="contentrij">
                    <div class="tekstlabel">
                        <label>Tafelnummer</label>
                    </div>
                    <asp:Label ID="lblTafelnummer" runat="server"></asp:Label>
                </div>



                <div class="contentrij">
                    <div class="tekstlabel">
                        <label>Datum</label>
                    </div>
                    <asp:TextBox class="tekstbox" ID="txtDatum"
                        runat="server" placeholder=""></asp:TextBox>
                    <asp:Label CssClass="form-control" ID="lblOutput"
                        runat="server" placeholder=""></asp:Label>
                </div>

                <div class="contentrij">
                    <div class="tekstlabel">
                        <label>Tijd</label>
                    </div>
                    <asp:TextBox class="tekstbox" ID="txtTijd"
                        runat="server" placeholder=""></asp:TextBox>
                </div>


                <div class="contentrij">
                    <div class="tekstlabel">
                        <label>Aantal personen</label>
                    </div>
                    <asp:TextBox class="tekstbox" ID="TxtAantalP"
                        runat="server" placeholder=""></asp:TextBox>
                    <asp:Label CssClass="form-control" ID="lblAantalP"
                        runat="server" placeholder=""></asp:Label>
                </div>
                <div class="contentrij">
                    <div class="tekstlabel">
                        <label>Opmerkingen</label>
                    </div>
                    <asp:TextBox class="tekstbox" ID="TxtOpmerkingen"
                        runat="server" placeholder="" TextMode="MultiLine"></asp:TextBox>
                    <asp:Label CssClass="form-control" ID="LblOpmerkingen"
                        runat="server" placeholder=""></asp:Label>
                </div>



            </div>

        <asp:Button class="reserveerknop" ID="btnReserveer" runat="server" placeholder="" Text="Reserveer" OnClick="btnReserveer_Click"></asp:Button>

    </div>
        <asp:Label CssClass="form-control" ID="lblGelukt"
                        runat="server" placeholder=""></asp:Label>
</asp:Content>
