<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Overzicht.aspx.cs" Inherits="PersoneelsOverzicht.Overzicht" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="PersoneelsOverzicht" runat="server"  style="z-index: 1; left: 208px; top: 78px; position: absolute; height: 587px; width: 704px">
            </asp:GridView>
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" style="z-index: 1; left: 987px; top: 226px; position: absolute; height: 215px; width: 114px">
            </asp:CheckBoxList>
            <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 985px; top: 614px; position: absolute" Text="Verwijderen" />
            <asp:Button ID="Button2" runat="server" style="z-index: 1; left: 984px; top: 566px; position: absolute; width: 158px" Text="Wijzigen" />
            <asp:Button ID="Button3" runat="server" style="z-index: 1; left: 983px; top: 523px; position: absolute; width: 159px" Text="Toevoegen" />
            <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 953px; top: 132px; position: absolute"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 1002px; top: 86px; position: absolute" Text="Zoek:"></asp:Label>
        </div>
    </form>
</body>
</html>
