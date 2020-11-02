<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="ReserveringenOverzicht.aspx.cs" Inherits="ProjectGroenBos.Reservering.ReserveringenwijzigenMASTER" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            left: 75px;
            top: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1>Reservering wijzigen</h1>
    <!DOCTYPE html>

    <html>
    <head>
        <title></title>
    </head>
    <body>
        
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        Zoek op de achternaam en kijk of diegene een reservering heeft staan om de<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reservering te wijzigen als ze bellen of aan de balie staan.<br />
        <br />
        <asp:RadioButton ID="rdbVoornaam" runat="server" GroupName="Sort" Text="gesorteerd op voornaam" CssClass="radiobut" />
        <br />
        <asp:RadioButton ID="rdbAchternaam" runat="server" GroupName="Sort" Text="gesorteerd op achternaam" CssClass="radiobut" />
        <br />
        <asp:RadioButton ID="rdbReserveringsNummer" runat="server" Checked="True" GroupName="Sort" Text="gesorteerd op reserveringsnummer" CssClass="radiobut" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Zoek op: " CssClass="labelsnieuw"></asp:Label>
        <asp:TextBox ID="txbAchternaam" runat="server" CssClass="auto-style1"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Datum tot en met:" CssClass="labelsnieuw"></asp:Label>
        <asp:TextBox ID="txbDatum" runat="server" CssClass="auto-style1" TextMode="Date"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnZoek" runat="server" Text="Zoek" CssClass="textboxbtn" OnClick="btnZoek_Click" />
        <br />
        <br />
         <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="gridv" AutoGenerateSelectButton="True">
        </asp:GridView>
        &nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />

        <br />
        <asp:Label ID="lblUitkomst" runat="server"></asp:Label>
        <br />
        <br />
        <br />

    </body>
    </html>

</asp:Content>
