<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="ActiviteitVerwijderen.aspx.cs" Inherits="recreatie.paginas.ActiviteitVerwijderen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Activiteit Inactief Maken</div>

    <asp:GridView ID="gvActiviteitVerwijderen" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="content-table" DataKeyNames="Nummer" ForeColor="#333333" GridLines="None" ShowFooter="True" ShowHeaderWhenEmpty="True" Width="80%" AllowPaging="True" OnSelectedIndexChanged="gvActiviteitVerwijderen_SelectedIndexChanged1" DataSourceID="SqlDataSource1" >
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Activiteitnaam" HeaderText="Activiteitnaam" SortExpression="Activiteitnaam" />
            <asp:BoundField DataField="Locatie" HeaderText="Locatie" SortExpression="Locatie" />
            <asp:BoundField DataField="Inschrijfkosten" HeaderText="Inschrijfkosten" SortExpression="Inschrijfkosten" />
            <asp:BoundField DataField="Maximaal aantal" HeaderText="Maximaal aantal" SortExpression="Maximaal aantal" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
            <asp:BoundField DataField="Datum" HeaderText="Datum" ReadOnly="True" SortExpression="Datum" />
            <asp:BoundField DataField="Begintijd" HeaderText="Begintijd" ReadOnly="True" SortExpression="Begintijd" />
            <asp:BoundField DataField="Eindtijd" HeaderText="Eindtijd" ReadOnly="True" SortExpression="Eindtijd" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="MedewerkerID" HeaderText="MedewerkerID" SortExpression="MedewerkerID" />
            <asp:BoundField DataField="FaciliteitID" HeaderText="FaciliteitID" SortExpression="FaciliteitID" Visible="False" />
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM [vActiviteit]"></asp:SqlDataSource>

    <div id="Popup" class="modal fade" role="dialog">
                 <div class="modal-dialog">
                     <!-- Modal content-->
                     <div class="modal-content">
                         <div class="modal-header">
                             <h4 class="modal-title">Activiteit Verwijderen</h4>
                         </div>
                         <div class="modal-body">
                             <asp:GridView ID="gvVerwijderen" runat="server" AutoGenerateColumns="False" ShowFooter="true" DataKeyNames="Nummer" ShowHeaderWhenEmpty="true"
                              CellPadding="4" ForeColor="#333333" GridLines="none" Width="80%" CssClass="content-table">
 
          
                              <Columns>
                <asp:TemplateField HeaderText="Nummer" SortExpression="Nummer" Visible ="True" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label  ID="Label1" Text='<%# Eval("Nummer") %>' runat="server"/>
                    </ItemTemplate>                     
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Activiteit Naam" SortExpression="Activiteitnaam" HeaderStyle-ForeColor="White">  
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Naam") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Locatie" SortExpression="Locatie" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Locatie") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Inschrijfkosten" SortExpression="Inschrijfkosten" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Inschrijfkosten") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Maximaal Aantal" SortExpression="MaximaalAantal" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Maximaal Aantal") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Omschrijving" SortExpression="Omschrijving" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Omschrijving") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Datum" SortExpression="Datum" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Datum") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="BeginTijd" SortExpression="BeginTijd" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("BeginTijd") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="EindTijd" SortExpression="EindTijd" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("EindTijd") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            
        </Columns>          
                             </asp:GridView>

                                                        </div>
                         <div class="modal-footer">
                             <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>
                         </div>
                     </div>
                 </div>
             </div>

</asp:Content>