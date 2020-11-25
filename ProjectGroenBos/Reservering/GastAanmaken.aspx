<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="GastAanmaken.aspx.cs" Inherits="ProjectGroenBos.Reservering.GastAanmaken" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1>Gast aanmaken</h1>

    <h2>Persoonsgegevens:</h2>
    <br />

    <p>
        <asp:Label ID="Label3" runat="server" Text="Voornaam" CssClass="labelsnieuw"></asp:Label>

        <asp:TextBox ID="txbVoornaam" runat="server" CssClass="textboxchaos"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label4" runat="server" Text="Tussenvoegsel" CssClass="labelsnieuw"></asp:Label>

        <asp:TextBox ID="txbTussenvoegsel" runat="server" CssClass="textboxchaos"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label5" runat="server" Text="Achternaam" CssClass="labelsnieuw"></asp:Label>

        <asp:TextBox ID="txbAchternaam" runat="server" CssClass="textboxchaos"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label12" runat="server" Text="Telefoonnummer" CssClass="labelsnieuw"></asp:Label>

        <asp:TextBox ID="txbTelefoonnummer" runat="server" CssClass="textboxchaos"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label6" runat="server" Text="E-mail" CssClass="labelsnieuw"></asp:Label>

        <asp:TextBox ID="txbEmail" runat="server" CssClass="textboxchaos"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label7" runat="server" Text="Geboortedatum" CssClass="labelsnieuw"></asp:Label>

        <asp:TextBox ID="txbGeboortedatum" runat="server" TextMode="Date" CssClass="textboxchaos"></asp:TextBox>
        <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txbGeboortedatum" ErrorMessage="U bent geen 18 jaar oud."></asp:CustomValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbGeboortedatum" ErrorMessage="Dit veld is verplicht."></asp:RequiredFieldValidator>
    </p>


    <h2>Adresgegevens:</h2>
    <br />

    <p>
        <asp:Label ID="Label8" runat="server" Text="Land" CssClass="labelsnieuw"></asp:Label>

        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="textboxchaos">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>Nederland(+31)</asp:ListItem>
            <asp:ListItem>Duitsland(+49)</asp:ListItem>
            <asp:ListItem>Frankrijk(+33)</asp:ListItem>
            <asp:ListItem>België(+32)</asp:ListItem>
        </asp:DropDownList>
        <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Er moet een land geselecteerd zijn." ValidateEmptyText="True"></asp:CustomValidator>
    </p>
    <p>
        <asp:Label ID="Label13" runat="server" Text="Woonplaats" CssClass="labelsnieuw"></asp:Label>

        <asp:TextBox ID="txbWoonplaats" runat="server" CssClass="textboxchaos"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label9" runat="server" Text="Straat" CssClass="labelsnieuw"></asp:Label>

        <asp:TextBox ID="txbStraatnaam" runat="server" CssClass="textboxchaos"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label10" runat="server" Text="Huisnummer + toevoeging" CssClass="labelsnieuw"></asp:Label>

        <asp:TextBox ID="txbHuisnummer" runat="server" CssClass="textboxchaos"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label11" runat="server" Text="Postcode" CssClass="labelsnieuw"></asp:Label>

        <asp:TextBox ID="txbPostcode" runat="server" CssClass="textboxchaos"></asp:TextBox>
    </p>

    <p>
        <asp:Button ID="btnAanmaken" runat="server" Text="Aanmaken" CssClass="btnUitloggen" OnClick="btnAanmaken_Click" Style="background-color: #009879; color: #fff" class="btn" />
    </p>



</asp:Content>
