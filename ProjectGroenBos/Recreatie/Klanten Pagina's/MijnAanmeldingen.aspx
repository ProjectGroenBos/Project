﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/Klanten Pagina's/klant2.Master" AutoEventWireup="true" CodeBehind="MijnAanmeldingen.aspx.cs" Inherits="ProjectGroenBos.Recreatie.MijnAanmeldingen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }</script>
    <div class="header">Aanmelden activiteit</div>
    <br />
    <asp:Label ID="Label1" runat="server" Text="" BorderStyle="Solid" style="font-size:25px; border-color:rgba(20,143,119,1); padding:5px 5px 5px 5px;"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Locatie: "></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Inschrijfkosten: "></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="Maximaal Aantal: "></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" Text="Omschrijving: "></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label6" runat="server" Text="Datum: "></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label7" runat="server" Text="Begintijd: "></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label8" runat="server" Text="Eindtijd: "></asp:Label>
    
    <asp:TextBox ID="Txbnamen" runat="server" OnTextChanged="Txbnamen_TextChanged" CssClass="txbnamenmijnaanmelding"></asp:TextBox>
    <asp:GridView ID="GridView1" runat="server" CssClass="content-table2"></asp:GridView>
    <asp:Button ID="BtnVoegtoe" runat="server" CssClass="btnVoegtoemijnaanmelding" Text="Voeg toe" OnClick="BtnVoegtoe_Click"/>
    <asp:Label ID="Label9" runat="server" Text="Naam" CssClass="lblnaammijnaanmelding"></asp:Label>
    <asp:Button ID="Button1" runat="server" CssClass="btnAanmeldenmijnaanmelding" Text="Aanmelden" OnClick="Button1_Click" />
    
    
    <div id="Popup" class="modal fade" role="dialog">

                 <div class="modal-dialog">

                     <!-- Modal content-->

                     <div class="modal-content">

                         <div class="modal-header">

                             <h4 class="modal-title">Aanmelden actviteit</h4>

                         </div>

                         <div class="modal-body">

                             <asp:Label ID="Label10" runat="server" Text="Weet u zeker dat u wilt aanmelden?"></asp:Label>
                          
                             
                             

                      
                             


                               
                         </div>

                         <div class="modal-footer">

                             <asp:Button ID="btnAanmeldenklant" runat="server" Style="max-width: 80%; margin-left: auto; margin-right: auto;" class="btn btn-primary btn-lg btn-block" Text="Aanmelden" OnClick="btnAanmeldenklant_Click"/>
                             <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>



                         </div>


                     </div>

                 </div>

             </div>
    

</asp:Content>
