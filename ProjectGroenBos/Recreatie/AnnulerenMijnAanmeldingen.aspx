<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/klant2.Master" AutoEventWireup="true" CodeBehind="AnnulerenMijnAanmeldingen.aspx.cs" Inherits="ProjectGroenBos.Recreatie.AnnulerenMijnAanmeldingen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Aanmelding Annuleren</div>

   <asp:GridView ID="gvAanmeldingAnnuleren" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="content-table2" DataKeyNames="Naam" ForeColor="#333333" GridLines="None" ShowFooter="True" >
         <Columns>

             <asp:TemplateField HeaderText="Naam" SortExpression="Naam" Visible="true" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label ID ="Label1" Text='<%# Eval("Naam") %>'  runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Datum" SortExpression="Datum" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Datum") %>' runat="server" />

                 </ItemTemplate>

             </asp:TemplateField>

             <asp:TemplateField HeaderText="Begintijd" SortExpression="Begintijd" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Begintijd") %>' runat="server"/>

                 </ItemTemplate>
                 </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Eindtijd" SortExpression="Eindtijd" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Eindtijd") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Begeleider" SortExpression="Begeleider" HeaderStyle-ForeColor="White" >

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Begeleider") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Inschrijfkosten" SortExpression="Inschrijfkosten" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Inschrijfkosten") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>

             <asp:CommandField ShowSelectButton="True" ItemStyle-ForeColor="White" HeaderText="Inactief maken">
<ItemStyle ForeColor="Black"></ItemStyle>
            </asp:CommandField>
              </Columns>
    </asp:GridView>

    <div id="Popup" class="modal fade" role="dialog">
                 <div class="modal-dialog">

                     <!-- Modal content-->

                     <div class="modal-content">

                         <div class="modal-header">

                             <h4 class="modal-title">Product Verwijderen</h4>

                         </div>

                         <div class="modal-body">

                             <asp:Label ID="Label1" runat="server" Text="Label">Weet u zeker dat u deze aanmelding wilt opzeggen?</asp:Label>
                             <asp:Button ID="btnDoorgaan" runat="server" Text="Doorgaan"  Style="max-width: 30%; margin-right: 37%; margin-top: 10%; display: inline" class="btn btn-primary btn-lg btn-block" OnClick="BtnDoorgaanproduct_Click1"  />
                             <asp:Button ID="btnAnnuleren" runat="server" Text="Annuleren" Style="max-width: 30%; background-color:indianred; margin-right: auto; margin-top:10%; display: inline" class="btn btn-primary btn-lg btn-block" OnClick="btnAnnuleren_Click"></asp:button>
                             
                         </div>

                         <div class="modal-footer">

                             

                         </div>

                     </div>

                 </div>

             </div>
    
    </asp:Content>
