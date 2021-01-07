<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/klant2.Master" AutoEventWireup="true" CodeBehind="MijnGereserveerdeFaciliteit.aspx.cs" Inherits="ProjectGroenBos.Recreatie.MijnGereserveerdeFaciliteit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script>function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }</script>
    
    <br />
    <asp:Label ID="Label1" runat="server" Text="" BorderStyle="Solid" style="font-size:25px; border-color:rgba(20,143,119,1); padding:5px 5px 5px 5px;"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Tijdvak: "></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="Begintijd: "></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" Text="Eindtijd: "></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label6" runat="server" Text="Huurtarief: "></asp:Label>

    <asp:Button ID="Button1" runat="server" Text="Aanmelden" OnClick="Button1_Click" />
    
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

                             <asp:Button ID="btnAanmeldenklantas" runat="server" Style="max-width: 80%; margin-left: auto; margin-right: auto;" class="btn btn-primary btn-lg btn-block" Text="Aanmelden" OnClick="btnAanmeldenklantas_Click"/>
                             <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>



                         </div>


                     </div>

                 </div>

             </div>
    
</asp:Content>
