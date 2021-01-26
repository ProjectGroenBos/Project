<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InlogschermKlanten.aspx.cs" Inherits="ProjectGroenBos.Recreatie.InlogschermKlanten" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style>
          body {
            background-color:#009879;
        }

        #form1 {
            background-color: rgba(183, 189, 181,0.75);
            width: 500px;
            height: 460px;
            margin-top:80px;
            margin-left: auto;
            margin-right: auto;
           border-radius: 25px;
           padding-top: 20px;
          
        }

        .container {
            margin-left: 50px;
            width: 402px;
            color :white;
            border-radius:5px;
        }

        .logo {
            margin-left: 40%;
           
        }

    </style>
</head>
<body style="height: 448px">
    <form id="form1" runat="server">
        <div class="logo">
            <img src="../img/logo.png" alt="Logo" height="150" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT Gast.Nummer, Gast.Voornaam, Gast.Tussenvoegsel, Gast.Achternaam, Gast.Email, GastAccount.Wachtwoord
FROM   Gast INNER JOIN
             GastAccount
             ON GastAccount.GastNummer = Gast.Nummer Where [GastAccount.Wachtwoord] = @Wachtwoord AND [Gast.Email] = @Email">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="Wachtwoord" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox1" Name="Email" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="container">
            <div style="text-align: center;">
                <asp:Label ID="Label1" runat="server" Text="E-MAIL" Width="393px" Font-Bold="True" ></asp:Label>
            </div>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Vul hier uw E-mail in" OnTextChanged="TextBox1_TextChanged" Height="36px" Width="391px" BorderColor="Blue"></asp:TextBox>
            <br />
             <div style="text-align: center;">
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="WACHTWOORD" Font-Bold="True"></asp:Label>
            </div>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Vul hier uw Wachtwoord in" OnTextChanged="TextBox2_TextChanged" Height="36px" Width="391px" BorderColor="#0033CC" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <br />

             <asp:Button ID="Button1" runat="server" Text="INLOGGEN" Width="397px" BackColor="#148f77" BorderColor="#003366" ForeColor="White" BorderStyle="Outset"  Font-Bold="True" Font-Size="Larger" Height="35px" OnClick="Button1_Click" />
                
            <br />
            <asp:Label ID="Label3" runat="server" Text=" "></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>

