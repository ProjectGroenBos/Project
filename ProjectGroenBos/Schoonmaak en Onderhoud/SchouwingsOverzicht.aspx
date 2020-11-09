<%@ Page Title="Overzicht Schouwingen" Language="C#" AutoEventWireup="true" MasterPageFile="Schoonmaak.Master" CodeBehind="SchouwingsOverzicht.aspx.cs" Inherits="ProjectGroenBos.Schoonmaak_en_Onderhoud.SchouwingsOverzicht" %>
<asp:Content ID="SchouwingsOverzicht" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <br />
    <br />
        <br />

<div class="form-row" style="text-align:center;">
    <h1 class="text-primary">Overzicht Schouwingen</h1>
    <br />
    <div class="row col-sm-12">
       <div class="col-sm-12" style="text-align:center;">
          <asp:Button ID="btnToevoegen" runat="server" Text="Schouwing Toevoegen" BackColor="#0E6251" OnClick="Button2_Click" BorderColor="#0E6251" ForeColor="White" EnableTheming="True" CssClass="buttonstyle"/>
           &nbsp;
           <asp:Button ID="btnWijzigen" runat="server" BackColor="#0E6251" BorderColor="#0E6251" CssClass="buttonstyle" ForeColor="White" OnClick="btnWijzigscherm_Click" Text="Onderhoud Wijzigen" />
           <br />
           <br />
           <hr />
          </div>
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>

        <br />
        </div>
    </div>

</asp:Content>