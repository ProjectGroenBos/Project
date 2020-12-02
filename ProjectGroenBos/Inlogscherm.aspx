<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inlogscherm.aspx.cs" Inherits="ProjectGroenBos.Financien.Inlogscherm" %>

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
            <img src="Financien/img/Logo.png" alt="Logo" height="150" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [Personeelsnummer], [Wachtwoord], [Voornaam], [Functie] FROM [Personeel]">
            </asp:SqlDataSource>
        </div>
        <div class="container">
            <div style="text-align: center;">
                <asp:Label ID="Label1" runat="server" Text="PERSONEELS ID" Width="393px" Font-Bold="True" ></asp:Label>
            </div>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" Height="36px" Width="391px" BorderColor="Blue"></asp:TextBox>
            <br />
             <div style="text-align: center;">
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="WACHTWOORD" Font-Bold="True"></asp:Label>
            </div>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged" Height="36px" Width="391px" BorderColor="#0033CC" TextMode="Password"></asp:TextBox>
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

