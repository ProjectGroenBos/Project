<%@ Page Title="Overzicht Onderhoud" Language="C#" AutoEventWireup="true"  MasterPageFile="Schoonmaak.Master" CodeBehind="OnderhoudsOverzicht.aspx.cs" Inherits="ProjectGroenBos.Schoonmaak_en_Onderhoud.OnderhoudsOverzicht" %>
<asp:Content ID="OnderhoudsOverzicht" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 

 
    <br />
    <br />
    <br />
    <br />
    <br />
        <br />

<div class="form-row" style="text-align:center;">
    <h1 class="text-primary"> Overzicht Onderhoud</h1>
    <p class="text-primary"></p>
    <br />
    <div class="row col-sm-12">
       <div class="col-sm-12" style="text-align:center;">
          <asp:Button ID="Button2" runat="server" Text="Onderhoud Toevoegen" BackColor="#7FB241" OnClick="Button2_Click" Width="218px" BorderColor="#7FB241"/>
           <br />
           <br />
           <hr />
          </div>

 

<div class="col-xs-3">
  <label for="ex1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Zoek op:</label>                          
</div>

 

<div id="divZoek" runat="server" class="col-xs-6">
     <label ID="txtZoek" runat="server" for="ex3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Voer het onderhoudsnummer in:</label>

 

     <asp:Label ID="lblErrror" runat="server" ForeColor="Red"></asp:Label>
     <asp:TextBox ID="searchBox" runat="server" CssClass="form-control" TextMode="SingleLine" CausesValidation="True" OnTextChanged="searchBox_TextChanged" Width="149px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Zoek" OnClick="Button1_Click" BackColor="#7FB241" BorderColor="#7FB241" />
     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="searchBox" ErrorMessage="Voer een getal in." ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
&nbsp;&nbsp;&nbsp;&nbsp;
     <br />
     <hr />
</div>
<div class="col-xs-3">
   <label for="ex3" style="color:rgba(0, 0, 0, 0)"></label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [Onderhoudsopdracht]"></asp:SqlDataSource>
    <br />
    <div style="text-align:center;">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"> </asp:PlaceHolder>
    </div>

    <br />
</div>

 

    </div>
    </div>

 

</asp:Content>

