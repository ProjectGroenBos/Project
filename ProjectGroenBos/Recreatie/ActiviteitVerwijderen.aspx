<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="ActiviteitVerwijderen.aspx.cs" Inherits="recreatie.paginas.ActiviteitVerwijderen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Activiteit Inactief Maken</div>

    <asp:GridView ID="gvActiviteitVerwijderen" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="content-table" DataKeyNames="Nummer" ForeColor="#333333" GridLines="None" ShowFooter="True" ShowHeaderWhenEmpty="True" Width="80%" OnRowCancelingEdit="gvActiviteitVerwijderen_RowCancelingEdit" AllowPaging="True" OnPageIndexChanging="gvActiviteitVerwijderen_PageIndexChanging" OnSelectedIndexChanged="gvActiviteitVerwijderen_SelectedIndexChanged1" >
        <Columns>
            <asp:TemplateField HeaderText="Nummer" SortExpression="Nummer" Visible="true" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Nummer") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Activiteitnaam" SortExpression="Activiteitnaam" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Activiteitnaam") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Locatie" SortExpression="Locatie" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Locatie") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Inschrijfkosten" SortExpression="Inschrijfkosten" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Inschrijfkosten") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Maximaal aantal" SortExpression="Maximaalaantal" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Maximaal aantal") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Omschrijving" SortExpression="Omschrijving" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Omschrijving") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Datum" SortExpression="Datum" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Datum") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Begintijd" SortExpression="Begintijd" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Begintijd") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Eindtijd" SortExpression="Eindtijd" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Eindtijd") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Naam" SortExpression="Naam" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Naam") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:CommandField SelectText="Inactief Maken" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>

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