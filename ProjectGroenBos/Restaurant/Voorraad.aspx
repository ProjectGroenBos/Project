<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="Voorraad.aspx.cs" Inherits="ProjectGroenBos.Restaurant.Voorraad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="voorraad.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="header">
        Voorraad Muteren
    </header>

    <div class="cocacontainer">

        <div class="werkgebied">
            <div>
                <%--Hier begint de zoekbalk--%>
                <p class="auto-style2">
                    Zoeken:&nbsp;&nbsp;&nbsp;
               
                    <asp:TextBox ID="txbZoeken" runat="server" OnTextChanged="txbZoeken_TextChanged" Width="293px" AutoPostBack="True" Height="18px"></asp:TextBox>
                </p>
                <p class="auto-style2">
                    &nbsp;
           
                </p>
                <%--Hier begint de gridview--%>
                <asp:GridView ID="gvBekijkenVoorraad" runat="server" AutoGenerateColumns="False" ShowFooter="true" DataKeyNames="ID" ShowHeaderWhenEmpty="true"
                    OnRowCommand="gvBekijkenVoorraad_rowcommand" OnRowEditing="gvBekijkenVoorraad_rowediting" OnRowCancelingEdit="gvBekijkenVoorraad_rowcancelingedit" OnRowUpdating="gvBekijkenVoorraad_rowupdating" OnRowDeleting="gvBekijkenVoorraad_rowdeleting"
                    OnSelectedIndexChanged="gvBekijkenVoorraad_selectedindexchanged" class="gridviewvoorraad" CssClass="gvVoorraad" GridLines="None">




                    <Columns>
                        <%--Kolom Producten op voorraad met textbox en footertextbox--%>
                        <asp:TemplateField HeaderText="Producten op Voorraad">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Aantal") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAantalVoorraad" Text='<%# Eval("Aantal") %>' runat="server" />
                                <asp:RequiredFieldValidator ID="AantalVoorraad" runat="server" ErrorMessage="Dit veld mag niet leeg blijven" ControlToValidate="txtAantalVoorraad" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="AantalVoorraad1" runat="server" ErrorMessage="Dit veld mag alleen cijfers bevatten" ControlToValidate="txtAantalVoorraad" ForeColor="Red" ValidationExpression="\d+" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAantalVoorraadFooter" runat="server" />
                                <asp:RequiredFieldValidator ID="AantalVoorraadFooter" runat="server" ErrorMessage="Dit veld mag niet leeg blijven" ControlToValidate="txtAantalVoorraadFooter" ForeColor="red" ValidationGroup="FooterValidation" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="AantalVoorraadFooter1" runat="server" ErrorMessage="Dit veld mag alleen cijfers bevatten" ControlToValidate="txtAantalVoorraadFooter" ForeColor="Red" ValidationExpression="\d+" ValidationGroup="FooterValidation" Display="Dynamic"></asp:RegularExpressionValidator>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <%--Kolom Productnaam met textbox en footertextbox--%>
                        <asp:TemplateField HeaderText="Productnaam">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Naam") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtProductNaam" Text='<%# Eval("Naam") %>' runat="server" />
                                <asp:RequiredFieldValidator ID="Productnaam" runat="server" ErrorMessage="Dit veld mag niet leeg blijven" ControlToValidate="txtProductNaam" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtProductnaamFooter" runat="server" />
                                <asp:RequiredFieldValidator ID="ProductnaamFooter" runat="server" ErrorMessage="Dit veld mag niet leeg blijven" ControlToValidate="txtProductnaamFooter" ForeColor="red" ValidationGroup="FooterValidation" Display="Dynamic"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <%--Kolom Inkoopprijs met textbox en footertextbox--%>
                        <asp:TemplateField HeaderText="Inkoopprijs">
                            <ItemTemplate>
                                <asp:Label Text='<%# string.Format("{0:C}", Eval("Prijs"))%>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPrijs" Text='<%# Eval("Prijs") %>' runat="server" />
                                <%--<asp:RegularExpressionValidator ID="Prijs1" runat="server" ErrorMessage="Dit veld mag alleen cijfers bevatten" ControlToValidate="txtPrijs" ForeColor="Red" ValidationExpression="^\d{0,3}(\.\d{1,2})?$" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                                <asp:RequiredFieldValidator ID="Prijs" runat="server" ErrorMessage="Dit veld mag niet leeg blijven" ControlToValidate="txtPrijs" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtPrijsFooter" runat="server" />
                                <asp:RequiredFieldValidator ID="PrijsFooter" runat="server" ErrorMessage="Dit veld mag niet leeg blijven" ControlToValidate="txtPrijsFooter" ForeColor="red" ValidationGroup="FooterValidation" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="PrijsFooter1" runat="server" ErrorMessage="Dit veld mag alleen cijfers bevatten" ControlToValidate="txtPrijsFooter" ForeColor="Red" ValidationExpression="^\d{0,3}(\.\d{1,2})?$" ValidationGroup="FooterValidation" Display="Dynamic"></asp:RegularExpressionValidator>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <%--Kolom Minimum voorraad met textbox en footertextbox--%>
                        <asp:TemplateField HeaderText="Minimum Voorraad">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Minimum voorraad") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtMinimumVoorraad" Text='<%# Eval("Minimum voorraad") %>' runat="server" />
                                <asp:RequiredFieldValidator ID="MinimumVoorraad" runat="server" ErrorMessage="Dit veld mag niet leeg blijven" ControlToValidate="txtMinimumVoorraad" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="MinimumVoorraad1" runat="server" ErrorMessage="Er mag alleen een cijfer tussen 10 én 999 ingevoerd worden" ControlToValidate="txtMinimumVoorraad" ForeColor="Red" ValidationExpression="^[10-999]{2,3}$" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtMinimumVoorraadFooter" runat="server" />
                                <asp:RequiredFieldValidator ID="MinimumVoorraadFooter" runat="server" ErrorMessage="Dit veld mag niet leeg blijven" ControlToValidate="txtMinimumVoorraadFooter" ForeColor="red" ValidationGroup="FooterValidation" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="MinimumVoorraadFooter1" runat="server" ErrorMessage="Er mag alleen een cijfer tussen 10 én 999 ingevoerd worden" ControlToValidate="txtMinimumVoorraadFooter" ForeColor="Red" ValidationExpression="^[10-999]{2,3}$" ValidationGroup="FooterValidation" Display="Dynamic"></asp:RegularExpressionValidator>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <%--Kolom BTW Tarief met textbox en footertextbox--%>
                        <asp:TemplateField HeaderText="BTW Tarief">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("BTW tariefID") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtBTWTarief" Text='<%# Eval("BTW tariefID") %>' runat="server" />
                                <asp:RequiredFieldValidator ID="BTWTarief" runat="server" ErrorMessage="Dit veld mag niet leeg blijven" ControlToValidate="txtBTWTarief" ForeColor="red" ValidationGroup="alidation" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="BTWTarief1" runat="server" ErrorMessage="Er mag hier alleen een 1 of een 2 ingevoerd worden" ControlToValidate="txtBTWTarief" ForeColor="Red" ValidationGroup="Validation" Display="Dynamic" ValidationExpression="^[1-2]{0,1}$"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtBTWTariefFooter" runat="server" />
                                <asp:RequiredFieldValidator ID="BTWTariefFooter" runat="server" ErrorMessage="Dit veld mag niet leeg blijven" ControlToValidate="txtBTWTariefFooter" ForeColor="red" ValidationGroup="FooterValidation" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="BTWTariefFooter1" runat="server" ErrorMessage="Er mag hier alleen een 1 of een 2 ingevoerd worden" ControlToValidate="txtBTWTariefFooter" ForeColor="Red" ValidationGroup="FooterValidation" Display="Dynamic" ValidationExpression="^[1-2]{0,1}$"></asp:RegularExpressionValidator>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <%--Knoppen voor bewerken, deleten, opslaan, annuleren en toevoegen--%>
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
                    <HeaderStyle BackColor="#148F77" BorderStyle="None" ForeColor="White" Height="30px" />
                    <RowStyle BackColor="White" />
                </asp:GridView>

                <%--Hier beginnnen de labels die onder de gridview staan--%>
            BTW Tarief legenda:<br />
                Tarief 1 = Hoge tarief(21%)<br />
                Tarief 2 = Lage tarief(9%)<br />
                <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
                <br />

            </div>
            <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red" />
        </div>
    </div>
</asp:Content>
