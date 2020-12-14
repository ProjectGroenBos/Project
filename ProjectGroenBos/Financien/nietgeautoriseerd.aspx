<%@ Page Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="nietgeautoriseerd.aspx.cs" Inherits="ProjectGroenBos.Financien.nietgeautoriseerd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
<div class="container">
        <h2>U bent niet geautoriseerd</h2>
        <p>De gegevens waar u mee ingelogd heeft, geeft geen autorisatie voor het gebruik van deze pagina.</p>
     </div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="img/oom%20dagobert.jpg" />
    <asp:Button ID="btnterug" runat="server" Text="Terug naar mijn eigen afdeling!" style=" width: 25%;
    height: 50px;
    margin-top: 10px;
    background-color: rgba(20,143,119,1);
    border-radius: 5px;
    color: #ffffff;
    padding: .5em;" />
 </asp:Content>