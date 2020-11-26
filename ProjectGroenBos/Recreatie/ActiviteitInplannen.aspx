<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="ActiviteitInplannen.aspx.cs" Inherits="recreatie.paginas.ActiviteitInplannen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>function openModal(modalnaam) {
             $(modalnaam).modal('show');
         }</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="header">Activiteit Inplannen</div>

    <asp:GridView ID="GvActiviteitInplannen" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="content-table2" DataKeyNames="Nummer" ForeColor="#333333" GridLines="None" ShowFooter="True" ShowHeaderWhenEmpty="True" Width="80%" OnRowCancelingEdit="GvActiviteitInplannen_RowCancelingEdit" OnRowCommand="GvActiviteitInplannen_RowCommand" OnRowDeleting="GvActiviteitInplannen_RowDeleting" OnRowEditing="GvActiviteitInplannen_RowEditing" OnRowUpdating="GvActiviteitInplannen_RowUpdating" OnSelectedIndexChanged="GvActiviteitInplannen_SelectedIndexChanged" OnSorting="OnSorting" AllowPaging="true" >

         <Columns>

             <asp:TemplateField HeaderText="Artikelnummer" SortExpression="Nummer" Visible="true" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label ID ="Label1" Text='<%# Eval("Nummer") %>'  runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Activiteitnaam" SortExpression="Activiteitnaam" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Activiteitnaam") %>' runat="server" />

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Locatie" SortExpression="Locatie" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Locatie") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Inschrijfkosten" SortExpression="Inschrijfkosten" HeaderStyle-ForeColor="White" >

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Inschrijfkosten") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Maximaal aantal" SortExpression="[Maximaal aantal]" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("[Maximaal aantal]") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Omschrijving" SortExpression="Omschrijving" HeaderStyle-ForeColor="White" >

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Omschrijving") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>

             <asp:TemplateField HeaderText="Datum" SortExpression="Datum" HeaderStyle-ForeColor="White" >

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Datum") %>' runat="server"/>

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

              <asp:TemplateField HeaderText="Naam" SortExpression="Naam" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("Naam") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>

              <asp:TemplateField HeaderText="MedewerkerID" SortExpression="MedewerkerID" HeaderStyle-ForeColor="White">

                 <ItemTemplate>

                     <asp:Label Text='<%# Eval("MedewerkerID") %>' runat="server"/>

                 </ItemTemplate>

             </asp:TemplateField>

         </Columns>

     </asp:GridView>

    <asp:Button ID="btnNieuwActiviteit" runat="server" Style="max-width: 80%; margin-left: auto; margin-right: auto;" class="btn" CssClass="buttonAfboekenVoorraadmuteren" Text="Activiteit Toevoegen" OnClick="btnNieuwActiviteit_Click"/>


    <div id="Popup" class="modal fade" role="dialog">

                 <div class="modal-dialog">

                     <!-- Modal content-->

                     <div class="modal-content">

                         <div class="modal-header">

                             <h4 class="modal-title">Activiteit Inplannen</h4>

                         </div>

                         <div class="modal-body">



                               <asp:Button ID="btnActiviteitInplannen" runat="server" Style="max-width: 80%; margin-left: auto; margin-right: auto;" class="btn btn-primary btn-lg btn-block" Text="Inplannen"/>

                         </div>

                         <div class="modal-footer">

                             <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>

                         </div>

                     </div>

                 </div>

             </div>

</asp:Content>