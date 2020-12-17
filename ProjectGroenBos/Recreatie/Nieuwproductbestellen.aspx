<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/Site1.Master" AutoEventWireup="true" CodeBehind="Nieuwproductbestellen.aspx.cs" Inherits="ProjectGroenBos.Recreatie.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script>function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:GridView ID="gvNieuwenProductenaanvragen" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="content-table7" DataKeyNames="Nummer"  ForeColor="#333333" GridLines="None" ShowFooter="True" OnSelectedIndexChanged="gvNieuwenProductenaanvragen_SelectedIndexChanged1" ShowHeaderWhenEmpty="True" Width="80%" AllowPaging="True" >
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" HeaderStyle-ForeColor="White"  ReadOnly="True" SortExpression="Nummer" Visible ="False"  />
            <asp:BoundField DataField="Productnaam" HeaderText="Productnaam" HeaderStyle-ForeColor="White"  ReadOnly="True" SortExpression="Productnaam"  />
            <asp:BoundField DataField="Hoeveelheid" HeaderText="Hoeveelheid" HeaderStyle-ForeColor="White"  ReadOnly="True" SortExpression="Hoeveelheid"  />
            <asp:BoundField DataField="Opmerking" HeaderText="Hoeveelheid" HeaderStyle-ForeColor="White"  ReadOnly="True" SortExpression="Hoeveelheid"  />
            <asp:CommandField ShowSelectButton="True" ItemStyle-ForeColor="White">
            <ItemStyle ForeColor="White"></ItemStyle>
            </asp:CommandField>
         </Columns>
        </asp:GridView>
   
    <asp:Label ID="Label2" runat="server" Text="Productnaam" CssClass="lblproductnaam"></asp:Label>
    <asp:TextBox ID="txtActiviteitNaam" runat="server" CssClass="txbproductnaam"></asp:TextBox>
   
    <asp:Label ID="Label1" runat="server" Text="Hoeveelheid" CssClass="lblproducthoeveelheid"></asp:Label>
    <asp:TextBox ID="txtHoeveelheid" runat="server" CssClass="txbproducthoeveelheid"></asp:TextBox>
   
    <asp:Label ID="Label3" runat="server" Text="Opmerking" CssClass="lblprductopmerking"></asp:Label>
    <asp:TextBox ID="txtOpmerking" runat="server" CssClass="txbproductopmerking"></asp:TextBox>
   
     <asp:Button ID="btnToevoegen" runat="server" Text="Item Toevoegen" ForeColor="White" OnClick="btnToevoegen_Click" CssClass="btntoevoegenproductbestellen"/>
     <asp:Button ID="btnAanvragen" runat="server" Text="Aanvraag Aanmaken" ForeColor="White" OnClick="btnAanvragen_Click" CssClass="btnAanvragenproductbestellen"/>

        <div id="Popup" class="modal fade" role="dialog">
                 <div class="modal-dialog">

                     <!-- Modal content-->

                     <div class="modal-content">

                         <div class="modal-header">

                             <h4 class="modal-title">Nieuwe producten aanvragen</h4>

                         </div>

                         <div class="modal-body">

                             <asp:Label ID="Label4" runat="server" Text="Label">De producten zijn aangevraagd</asp:Label>
                             <asp:Button ID="btnDoorgaan" OnClick="btnDoorgaan_Click" runat="server" Text="OK" Style="max-width: 30%; margin-right: 37%; margin-top: 10%; display: inline" class="btn btn-primary btn-lg btn-block" />
                             
                             
                         </div>

                         <div class="modal-footer">
</asp:Content>
