<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/klant2.Master" AutoEventWireup="true" CodeBehind="Reserverenfacilitieit.aspx.cs" Inherits="ProjectGroenBos.Recreatie.Reserverenfacilitieit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>function openModal(modalnaam) {
             $(modalnaam).modal('show');
         }</script>
    <asp:GridView ID="GridViewFaciliteit" runat="server" AutoGenerateColumns="False" CssClass="content-table" DataKeyNames="Nummer"  GridLines="None" OnSelectedIndexChanged="GridViewFaciliteit_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField HeaderText="Omschrijving" SortExpression="Omschrijving">
                <EditItemTemplate>
                    <asp:TextBox ID="TbxOmschrijvingfaciliteit" runat="server" Text='<%# Bind("Omschrijving") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Omschrijving") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="White" />
            </asp:TemplateField>
                <asp:TemplateField HeaderText="Tijdvak" SortExpression="Nummer">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Nummer") %>'></asp:TextBox>
                       
                        </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Nummer") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

              <asp:BoundField DataField="ID" HeaderText="ID" HeaderStyle-ForeColor="White"  ReadOnly="True" SortExpression="ID" Visible="False"  >
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>

               <asp:TemplateField HeaderText="Begintijd" SortExpression="Begintijd">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Begintijd") %>'></asp:TextBox>
                       
                        </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Begintijd") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

            <asp:TemplateField HeaderText="Eindtijd" SortExpression="Eindtijd">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Eindtijd") %>'></asp:TextBox>
                       
                        </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Eindtijd") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            
           <asp:TemplateField HeaderText="Huurtarief" SortExpression="Huurtarief">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Huurtarief") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Huurtarief") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            

            <asp:CommandField ShowSelectButton="True" ItemStyle-ForeColor="White">
<ItemStyle ForeColor="White"></ItemStyle>
            </asp:CommandField>
            
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM [VReserveringfaciliteit]"></asp:SqlDataSource>
    <asp:DropDownList ID="ddlFaciliteit" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Omschrijving" DataValueField="Omschrijving" OnSelectedIndexChanged="ddlFaciliteit_SelectedIndexChanged" ></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Omschrijving] FROM [Faciliteit]"></asp:SqlDataSource>
    <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" ></asp:Calendar>

     <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>

     <div id="Popup" class="modal fade" role="dialog">

                 <div class="modal-dialog">

                     <!-- Modal content-->

                     <div class="modal-content">

                         <div class="modal-header">

                             <h4 class="modal-title">Aanmelden actviteit</h4>

                         </div>

                         <div class="modal-body">

                             <asp:Label ID="Label2" runat="server" Text="Weet u zeker dat u deze faciliteit wilt selecteren?"></asp:Label>
                          
                             
                             

                      
                             


                               
                         </div>

                         <div class="modal-footer">

                             <asp:Button ID="btnAanmeldenfaciliteit" runat="server" Style="max-width: 80%; margin-left: auto; margin-right: auto;" class="btn btn-primary btn-lg btn-block" Text="Aanmelden" OnClick="btnAanmeldenfaciliteit_Click" />
                             <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>



                         </div>


                     </div>

                 </div>

             </div>

</asp:Content>
