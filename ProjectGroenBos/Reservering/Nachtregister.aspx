﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="Nachtregister.aspx.cs" Inherits="ProjectGroenBos.Reservering.Nachtregister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div class="container">
        <h2>Nachtregister</h2>
        <br />
        Mochten wij in geval van nood het park moeten evacueren, waar wij en u niet op hopen, hebben we
        
        de gegevens van uw medevakantiegangers nodig. Dit alles om te weten of iedereen het park uit is.
   <br />
        <br />
        <table class ="tabelReserveringen" >
            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label2" runat="server" Text="Naam:" CssClass="labelsnieuw"></asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox ID="TxBNaam" runat="server" CssClass="textboxchaos"></asp:TextBox></td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxBNaam" ErrorMessage="Dit veld is verplicht." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="In een naam kunnen geen getallen of leestekens zitten." ControlToValidate="TxBNaam" ValidationExpression="^[a-zA-Z -]*$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>

            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Tussenvoegsel:" CssClass="labelsnieuw"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TxBtussenvoegsel" runat="server" CssClass="textboxchaos"></asp:TextBox></td>
                <td style="width: 40%">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="In een tussenvoegsel kunnen alleen letters komen te staan." ControlToValidate="TxBtussenvoegsel" ValidationExpression="^[a-zA-Z -]*$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator></td>

            </tr>
            <tr>

                <td style="width: 15%">
                    <asp:Label ID="Label5" runat="server" Text="Achternaam:" CssClass="labelsnieuw"></asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox ID="TxBAchternaam" runat="server" CssClass="textboxchaos"></asp:TextBox></td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxBAchternaam" ErrorMessage="Dit veld is verplicht." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="In een achternaam kunnen geen getallen zitten." ControlToValidate="TxBAchternaam" ValidationExpression="^[a-zA-Z -]*$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>

                <td style="width: 15%">
                    <asp:Label ID="label4" runat="server" Text="Geboortedatum:" CssClass="labelsnieuw"></asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox ID="TxBGeboortedatum" runat="server" CssClass="textboxchaos" TextMode="Date"></asp:TextBox></td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxBGeboortedatum" ErrorMessage="Dit veld is verplicht." ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Datum moet ingevult zijn als  jjjj-mm-dd." ControlToValidate="TxBGeboortedatum" ValidationExpression="^(19|20)?\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>







        <br />
        <asp:Label ID="lblOutput" runat="server" CssClass="labelsnieuw"></asp:Label>

        <br />
        <asp:Button ID="btnBevestigen" runat="server" Click="btnBevestigen_Click1" Text="Bevestigen" OnClick="btnBevestigen_Click" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" />

        <asp:Button ID="btnToevoegen" runat="server" OnClick="btnToevoegen_Click1" Text="Toevoegen" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" />

    </div>

</asp:Content>
