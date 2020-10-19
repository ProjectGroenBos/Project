<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="ReserveringenwijzigenMASTER.aspx.cs" Inherits="ProjectGroenBos.Reservering.ReserveringenwijzigenMASTER" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!DOCTYPE html>

<html>

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
        <asp:TextBox ID="txbAchternaam" runat="server" AutoPostBack="True" OnTextChanged="txbAchternaam_TextChanged" CssClass="textboxchaos"></asp:TextBox>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="radiobut">
            <Columns>
                <asp:ButtonField Text="Selecteren" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <br />
        <asp:Label ID="lblUitkomst" runat="server" CssClass="labelsnieuw"></asp:Label>
  
        <br />
        <br />
        <br />
  
</body>
</html>

</asp:Content>
