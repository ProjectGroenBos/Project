<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="bestellingopnemen.aspx.cs" Inherits="ProjectGroenBos.Restaurant.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/opnemenbestelling.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="werkgebied">
            <!-- Winkelmandje -->
        <div class="winkelmandje" id="winkelmand">

            <div class="titel">
<<<<<<< HEAD
                
                <br />
                <asp:Label ID="lblTafel" runat="server"></asp:Label>
=======
                Besteld:
                <br />
>>>>>>> origin/RestaurantTeam/Kevin
            <asp:Label ID="lblSelectedProducts" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="White"></asp:Label>
            </div>

            <!-- Producten -->
            <div class="cart">
                <asp:GridView class="gdvCart" ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="auto-style1" Height="611px" OnRowDeleting="GridView2_RowDeleting" ShowFooter="True" ShowHeader="False" BackColor="White" BorderColor="#336666" BorderStyle="None" BorderWidth="3px" CellPadding="4" Font-Bold="True" Font-Size="Large" GridLines="Horizontal" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="sno" HeaderText="S. No" />
                        <asp:ImageField DataImageUrlField="Afbeelding">
                            <ControlStyle Height="30px" Width="30px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:ImageField>
                        <asp:BoundField DataField="Naam" HeaderText="Naam" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Prijs" HeaderText="Prijs" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Hoeveelheid" HeaderText="Hoeveelheid" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TotalePrijs" HeaderText="Totale Prijs" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:CommandField DeleteText="X" ShowDeleteButton="True" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
            </div>
            <div class="betalen">

<<<<<<< HEAD

                <asp:Button ID="btnBetalen" runat="server" Text="Bestellen" />

                <asp:Button ID="btnBestellen" runat="server" Text="Bestellen" OnClick="btnBestellen_Click" />


=======
                <asp:Button ID="btnBestellen" runat="server" Text="Bestellen" OnClick="btnBestellen_Click" />

>>>>>>> origin/RestaurantTeam/Kevin
            </div>
        </div>

        <!--Items-->
        <div class="doorklik-content">
            <button class="doorklik-button"><a href="#Dranken">Dranken</a></button>
            <button class="doorklik-button"><a href="#Voorgerecht">Voorgerecht</a></button>
            <button class="doorklik-button"><a href="#Hoofdgerecht">Hoofdgerecht</a></button>
            <button class="doorklik-button"><a href="#Nagerecht">Nagerecht</a></button>
            <br />
        </div>

        <div class="Productenbak">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand" Width="100%">
                <ItemTemplate>
                    <div class="productrow">
                        <asp:Image class="productimg" ID="imgProdimg" runat="server" ImageUrl='<%# Eval("Afbeelding") %>' />
                        <asp:Label class="productnaam" ID="lblProdnaam" runat="server" Text='<%# Eval("Naam") %>' Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                        <asp:Label ID="lblProdprijs" runat="server" Text='<%# Eval("Prijs") %>'></asp:Label>
                        <asp:DropDownList ID="ddlHoeveel" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button class="toevoegen" ID="btnProdtoevoegen" runat="server" Text="Toevoegen" CommandArgument='<%# Eval("ID")%>' CommandName="toevoegen" />
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT * FROM [Item]"></asp:SqlDataSource>
    </div>

</asp:Content>
