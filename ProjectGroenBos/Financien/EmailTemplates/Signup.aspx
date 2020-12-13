<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="ProjectGroenBos.Financien.EmailTemplates.Signup" %>
  
<!DOCTYPE html>  
  
<html xmlns="http://www.w3.org/1999/xhtml">  
<head runat="server">  
    <title></title>  
    <style type="text/css">  
        .auto-style1 {  
            height: 30px;  
        }  
    </style>  
</head>  
<body>  
    <form id="form1" runat="server">  
        <div>  
            <h3>New User (Signup)</h3>  
            <table>  
                <tr>  
                    <td>User Name<br />  
                        (Email ID)  
                    </td>  
                    <td>  
                        <asp:TextBox ID="txtUserName" runat="server" Width="200px"></asp:TextBox>  
                    </td>  
                </tr>  
                <tr>  
                    <td>  
                        <br />  
                        Password  
                    </td>  
  
                    <td>  
                        <br />  
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="200px"> </asp:TextBox>  
                    </td>  
                </tr>  
                <tr>  
                    <td colspan="2" class="auto-style1">  
                        <asp:Button ID="btnSubmit" runat="server" Text="Register (Signup)" OnClick="btnSubmit_Click" />  
                    </td>  
                </tr>  
            </table>  
        </div>  
    </form>  
</body>  
</html> 