<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="Voorraad.aspx.cs" Inherits="ProjectGroenBos.Restaurant.Voorraad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Voorraad overzicht</h1>
    <div>
            Zoeken:<asp:TextBox ID="txbZoeken" runat="server" OnTextChanged="txbZoeken_TextChanged" Width="1169px" AutoPostBack="True"></asp:TextBox>
            <asp:GridView ID="gvBekijkenVoorraad" runat="server" AutoGenerateColumns="False" ShowFooter ="true" DataKeyNames="ID" ShowHeaderWhenEmpty="true"

              onrowcommand="gvBekijkenVoorraad_rowcommand" onrowediting ="gvBekijkenVoorraad_rowediting" onrowcancelingedit="gvBekijkenVoorraad_rowcancelingedit" onrowupdating ="gvBekijkenVoorraad_rowupdating" onrowdeleting ="gvBekijkenVoorraad_rowdeleting"
            
            cellpadding="4" forecolor="#333333" gridlines="none" width="190px" onselectedindexchanged="gvBekijkenVoorraad_selectedindexchanged" style="height: 100%; width: 90%">
            
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />


<Columns>

                        <asp:TemplateField HeaderText="ProductID">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ID") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtProductID" Text='<%# Eval("ID") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Producten op Voorraad">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Aantal") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAantalVoorraad" Text='<%# Eval("Aantal") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAantalVoorraadFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Productnaam">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Naam") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtProductNaam" Text='<%# Eval("Naam") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtProductnaamFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Inkoopprijs">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Prijs") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPrijs" Text='<%# Eval("Prijs") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPrijsFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Minimum Voorraad">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Minimum voorraad") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMinimumVoorraad" Text='<%# Eval("Minimum voorraad") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtMinimumVoorraadFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                        <asp:TemplateField HeaderText="BTW Tarief">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("BTW tariefID") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtBTWTarief" Text='<%# Eval("BTW tariefID") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtBTWTariefFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Restaurant/img/edit.png" runat="server" CommandName="Edit" ToolTip="Bewerken" Width="20px" Height="20px" />
                            <asp:ImageButton ImageUrl="~/Restaurant/img/delete.png" runat="server" CommandName="Delete" ToolTip="Verwijderen" Width="20px" Height="20px" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/Restaurant/img/save.png" runat="server" CommandName="Update" ToolTip="Opslaan" Width="20px" Height="20px" ValidationGroup="Validation" />
                            <asp:ImageButton ImageUrl="~/Restaurant/img/cancel.png" runat="server" CommandName="Cancel" ToolTip="Annuleren" Width="20px" Height="20px" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ImageUrl="~/Restaurant/img/addnew.png" runat="server" CommandName="AddNew" ToolTip="Toevoegen" Width="20px" Height="20px" ValidationGroup="FooterValidation" />
                        </FooterTemplate>
                    </asp:TemplateField>
              </Columns>
        </asp:GridView>

       
        <br />
        <asp:Label ID ="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
         <br />

        </div>
        <asp:Label ID ="lblErrorMessage" Text="" runat="server" ForeColor="Red" />
</asp:Content>
