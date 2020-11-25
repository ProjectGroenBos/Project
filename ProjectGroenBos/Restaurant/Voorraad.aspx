<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="Voorraad.aspx.cs" Inherits="ProjectGroenBos.Restaurant.Voorraad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 100%;
            width: 90%;
            margin-bottom: 1;
        }
        .auto-style2 {
            margin-left: 80px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Voorraad overzicht</h1>
    <div>
            <p class="auto-style2">
            Zoeken:&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txbZoeken" runat="server" OnTextChanged="txbZoeken_TextChanged" Width="293px" AutoPostBack="True" Height="18px"></asp:TextBox>
            </p>
            <p class="auto-style2">
                &nbsp;</p>
            <asp:GridView ID="gvBekijkenVoorraad" runat="server" AutoGenerateColumns="False" ShowFooter ="true" DataKeyNames="ID" ShowHeaderWhenEmpty="true"

              onrowcommand="gvBekijkenVoorraad_rowcommand" onrowediting ="gvBekijkenVoorraad_rowediting" onrowcancelingedit="gvBekijkenVoorraad_rowcancelingedit" onrowupdating ="gvBekijkenVoorraad_rowupdating" onrowdeleting ="gvBekijkenVoorraad_rowdeleting"
            
            cellpadding="4" forecolor="#333333" gridlines="none" width="90%" Align="center" onselectedindexchanged="gvBekijkenVoorraad_selectedindexchanged" CssClass="auto-style1">
            
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#10715e" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#10715e" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#7fb241" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <sortedascendingcellstyle backcolor="#e9e7e2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />


<Columns>

<%--                        <asp:TemplateField HeaderText="ProductID">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ID") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>--%>

                    <asp:TemplateField HeaderText="Producten op Voorraad">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Aantal") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAantalVoorraad" Text='<%# Eval("Aantal") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAantalVoorraadFooter" runat="server" />
                            <asp:RequiredFieldValidator ID="AantalVoorraadFooter" runat="server" ErrorMessage="Dit veld mag niet leeg blijven" ControlToValidate="txtAantalVoorraadFooter" ForeColor="red" ValidationGroup="FooterValidation" Display="Dynamic"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="AantalVoorraadFooter1" runat="server" ErrorMessage="Dit veld mag alleen cijfers bevatten" ControlToValidate="txtAantalVoorraadFooter" ForeColor="Red" ValidationExpression="\d+" ValidationGroup="FooterValidation" Display="Dynamic"></asp:RegularExpressionValidator>
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
                            <asp:RequiredFieldValidator ID="ProductnaamFooter" runat="server" ErrorMessage="Dit veld mag niet leeg blijven" ControlToValidate="txtProductnaamFooter" ForeColor="red" ValidationGroup="FooterValidation" Display="Dynamic"></asp:RequiredFieldValidator>
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
                            <asp:RequiredFieldValidator ID="PrijsFooter" runat="server" ErrorMessage="Dit veld mag niet leeg blijven" ControlToValidate="txtPrijsFooter" ForeColor="red" ValidationGroup="FooterValidation" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="PrijsFooter1" runat="server" ErrorMessage="Dit veld mag alleen cijfers bevatten" ControlToValidate="txtPrijsFooter" ForeColor="Red" ValidationExpression="^\d{0,3}(\,\d{1,2})?$" ValidationGroup="FooterValidation" Display="Dynamic"></asp:RegularExpressionValidator>
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
                            <asp:RequiredFieldValidator ID="MinimumVoorraadFooter" runat="server" ErrorMessage="Dit veld mag niet leeg blijven" ControlToValidate="txtMinimumVoorraadFooter" ForeColor="red" ValidationGroup="FooterValidation" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="MinimumVoorraadFooter1" runat="server" ErrorMessage="Er mag alleen een cijfer tussen 10 én 999 ingevoerd worden" ControlToValidate="txtMinimumVoorraadFooter" ForeColor="Red" ValidationExpression="^[10-999]{2,3}$" ValidationGroup="FooterValidation" Display="Dynamic"></asp:RegularExpressionValidator>
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
                            <asp:RequiredFieldValidator ID="BTWTariefFooter" runat="server" ErrorMessage="Dit veld mag niet leeg blijven" ControlToValidate="txtBTWTariefFooter" ForeColor="red" ValidationGroup="FooterValidation" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="BTWTariefFooter1" runat="server" ErrorMessage="Er mag hier alleen een 1 of een 2 ingevoerd worden" ControlToValidate="txtBTWTariefFooter" ForeColor="Red" ValidationGroup="FooterValidation" Display="Dynamic" ValidationExpression="^[1-2]{0,1}$"></asp:RegularExpressionValidator>
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

       
            <asp:Label ID="Label1" runat="server" Text="Het BTW tarief is onderverdeeld onder 2 catogorieën 1 is het hoge tarief en 2 is het lage tarief"></asp:Label>

       
        <br />
        <asp:Label ID ="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
         <br />

        </div>
        <asp:Label ID ="lblErrorMessage" Text="" runat="server" ForeColor="Red" />
</asp:Content>
