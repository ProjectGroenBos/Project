<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NietGebruiken.aspx.cs" Inherits="ProjectGroenBos.ReserveringWijzigen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        Zoek op de achternaam en kijk of diegene een reservering heeft staan om de reservering te wijzigen als ze bellen of aal de balie staan.<br />
        <br />
        <asp:RadioButton ID="rdbVoornaam" runat="server" GroupName="Sort" Text="gesorteerd op voornaam" />
        <br />
        <asp:RadioButton ID="rdbAchternaam" runat="server" GroupName="Sort" Text="gesorteerd op achternaam" />
        <br />
        <asp:RadioButton ID="rdbReserveringsNummer" runat="server" Checked="True" GroupName="Sort" Text="gesorteerd op reserveringsnummer" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Zoek op: "></asp:Label>
        <asp:TextBox ID="txbAchternaam" runat="server" AutoPostBack="True" OnTextChanged="txbAchternaam_TextChanged"></asp:TextBox>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" >
            <Columns>
                <asp:ButtonField Text="Selecteren" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="lblUitkomst" runat="server"></asp:Label>
    </form>
</body>
</html>
