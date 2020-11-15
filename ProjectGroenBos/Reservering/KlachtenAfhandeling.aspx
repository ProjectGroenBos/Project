<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="KlachtenAfhandeling.aspx.cs" Inherits="ProjectGroenBos.Reservering.KlachtenAfhandeling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <h1>Klachten pagina</h1>

    <br />
    <br />

    <asp:RadioButton ID="rdbBezoeker" runat="server" Text="Geen bestaande gast" groupname="rdbGastCheck" CssClass="labelsnieuw" AutoPostBack="True"></asp:RadioButton>
    <br />
    <asp:RadioButton ID="rdbGast" runat="server" Text="Bestaande gast" groupname="rdbGastCheck" CssClass="labelsnieuw" Checked="True" AutoPostBack="True"></asp:RadioButton>

    <br />
    <br />

    <asp:Label CssClass="labelsnieuw" runat="server" Text="Gastnummer"></asp:Label>

    <asp:TextBox ID="txbGastnummer"  CssClass="textboxchaos" runat="server"></asp:TextBox>

    <br />
    <br />
    
    <asp:Label CssClass="labelsnieuw" runat="server" Text="Voornaam"></asp:Label>

    <asp:TextBox ID="txbVoornaam"  CssClass="textboxchaos" runat="server"></asp:TextBox>

    <br />
    <br />

    <asp:Label CssClass="labelsnieuw" runat="server" Text="Achternaam"></asp:Label>

    <asp:TextBox ID="txbAchernaam"  CssClass="textboxchaos" runat="server"></asp:TextBox>

    <br />
    <br />

    <asp:Label CssClass="labelsnieuw" runat="server" Text="Klacht"></asp:Label>

    <asp:TextBox ID="txbKlacht" CssClass="textboxchaos" runat="server" TextMode="MultiLine" Height="200px" Width="300px"></asp:TextBox>

    <br />
    <br />

    <asp:Button ID="btnVerzenden" CssClass="textboxbtn" runat="server" Text="Verzenden" OnClick="btnVerzenden_Click" />

</asp:Content>
