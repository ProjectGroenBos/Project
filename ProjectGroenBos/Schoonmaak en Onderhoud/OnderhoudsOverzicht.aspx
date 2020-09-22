<%@ Page Title="Overzicht Onderhoud" Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="OnderhoudsOverzicht.aspx.cs" Inherits="ProjectGroenBos.Schoonmaak_en_Onderhoud.OnderhoudsOverzicht" %>
<asp:Content ID="OnderhoudsOverzicht" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 

 

<div class="form-row">
  <h1 class="text-primary">Overzicht Onderhoud</h1>
    <div class="row col-sm-12">
       <div class="col-sm-12">
          <a style="width:100%; margin-top:1em; margin-bottom:1em" class="btn-primary btn" href="OnderhoudToevoegen.aspx">Klik hier om een nieuwe onderhoud aan te maken</a>
              <hr />
          </div>

 

<div class="col-xs-3">
  <label for="ex1">Zoek op:</label>                          
</div>

 

<div id="divZoek" runat="server" class="col-xs-6">
     <label ID="txtZoek" runat="server" for="ex3">Voer het onderhoudsnummer in:</label>

 

     <asp:Label ID="lblErrror" runat="server" ForeColor="Red"></asp:Label>
     <asp:TextBox ID="searchBox" runat="server" CssClass="form-control" TextMode="SingleLine" CausesValidation="True" OnTextChanged="searchBox_TextChanged" Width="149px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Zoek" OnClick="Button1_Click" />
     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="searchBox" ErrorMessage="Voer een getal in." ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
</div>
<div class="col-xs-3">
   <label for="ex3" style="color:rgba(0, 0, 0, 0)"></label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [Onderhoudsopdracht]"></asp:SqlDataSource>
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    <br />
</div>

 

    </div>
    </div>

 

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .form-control {}
    </style>
</asp:Content>