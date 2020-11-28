<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="bestellingopnemen.aspx.cs" Inherits="ProjectGroenBos.Restaurant.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/opnemenbestelling.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="werkgebied">
        <h1 class="paginatitel">Bestelling opnemen</h1>

        <!-- Winkelmandje -->
        <div class="winkelmandje" id="winkelmand">

            <div class="titel">
                Besteld:
                <br />
                <asp:Label ID="lblSelectedProducts" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="White"></asp:Label>
            </div>

            <!-- Producten -->
            <div class="cart">
                <asp:GridView class="gdvCart" ID="GridView2" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView2_RowDeleting" ShowFooter="True" ShowHeader="False" Font-Bold="True" Font-Size="Large" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="sno" />
                        <asp:ImageField DataImageUrlField="Afbeelding">
                            <ControlStyle Height="30px" Width="30px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:ImageField>
                        <asp:BoundField DataField="Naam" HeaderText="Naam">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Prijs" HeaderText="Prijs">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Hoeveelheid" HeaderText="Hoeveelheid">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TotalePrijs" HeaderText="Totale Prijs">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:CommandField DeleteText="X" ShowDeleteButton="True">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Columns>
                    <RowStyle CssClass="rijstyle" />
                </asp:GridView>              
                    <asp:Button ID="btnBestellen" class="bestelknop" runat="server" Text="Bestellen" OnClick="btnBestellen_Click" />
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

            <div class="productgroep">
                <h1 class="productgroepnaam" id="Dranken">Dranken</h1>
            </div>
            <asp:DataList ID="dtlDranken" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand" Width="100%">
                <ItemTemplate>
                    <div class="productrow">
                        <asp:Image class="productimg" ID="imgProdimg" runat="server" ImageUrl='<%# Eval("Afbeelding") %>' />
                        <asp:Label class="productnaam" ID="lblProdnaam" runat="server" Text='<%# Eval("Naam") %>' Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                        <asp:Label ID="Euro" runat="server" Text='€' Font-Size="XX-Large"></asp:Label>
                        <asp:Label ID="lblProdprijs" runat="server" Font-Size="XX-Large" Text='<%# Eval("Prijs") %>'></asp:Label>
                        <asp:DropDownList ID="ddlHoeveel" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button class="toevoegen" ID="btnProdtoevoegen" runat="server" Text="Toevoegen" CommandArgument='<%# Eval("ID")%>' CommandName="toevoegen" />
                    </div>
                </ItemTemplate>
            </asp:DataList>


            <div class="productgroep">
                <h1 class="productgroepnaam" id="Voorgerecht">Voorgerecht</h1>
            </div>
            <asp:DataList ID="dtlVoorgerecht" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource2" OnItemCommand="DataList1_ItemCommand" Width="100%">
                <ItemTemplate>
                    <div class="productrow">
                        <asp:Image class="productimg" ID="imgProdimg" runat="server" ImageUrl='<%# Eval("Afbeelding") %>' />
                        <asp:Label class="productnaam" ID="lblProdnaam" runat="server" Text='<%# Eval("Naam") %>' Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                        <asp:Label ID="Euro" runat="server" Text='€' Font-Size="XX-Large"></asp:Label>
                        <asp:Label ID="lblProdprijs" runat="server" Font-Size="XX-Large" Text='<%# Eval("Prijs") %>'></asp:Label>
                        <asp:DropDownList ID="ddlHoeveel" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button class="toevoegen" ID="btnProdtoevoegen" runat="server" Text="Toevoegen" CommandArgument='<%# Eval("ID")%>' CommandName="toevoegen" />
                    </div>
                </ItemTemplate>
            </asp:DataList>


            <div class="productgroep">
                <h1 class="productgroepnaam" id="Hoofdgerecht">Hoofdgerecht</h1>
            </div>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource3" OnItemCommand="DataList1_ItemCommand" Width="100%">
                <ItemTemplate>
                    <div class="productrow">
                        <asp:Image class="productimg" ID="imgProdimg" runat="server" ImageUrl='<%# Eval("Afbeelding") %>' />
                        <asp:Label class="productnaam" ID="lblProdnaam" runat="server" Text='<%# Eval("Naam") %>' Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                        <asp:Label ID="Euro" runat="server" Text='€' Font-Size="XX-Large"></asp:Label>
                        <asp:Label ID="lblProdprijs" runat="server" Font-Size="XX-Large" Text='<%# Eval("Prijs") %>'></asp:Label>
                        <asp:DropDownList ID="ddlHoeveel" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button class="toevoegen" ID="btnProdtoevoegen" runat="server" Text="Toevoegen" CommandArgument='<%# Eval("ID")%>' CommandName="toevoegen" />
                    </div>
                </ItemTemplate>
            </asp:DataList>


            <div class="productgroep">
                <h1 class="productgroepnaam" id="Nagerecht">Nagerecht</h1>
            </div>
            <asp:DataList ID="DataList2" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource4" OnItemCommand="DataList1_ItemCommand" Width="100%">
                <ItemTemplate>
                    <div class="productrow">
                        <asp:Image class="productimg" ID="imgProdimg" runat="server" ImageUrl='<%# Eval("Afbeelding") %>' />
                        <asp:Label class="productnaam" ID="lblProdnaam" runat="server" Text='<%# Eval("Naam") %>' Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                        <asp:Label ID="Euro" runat="server" Text='€' Font-Size="XX-Large"></asp:Label>
                        <asp:Label ID="lblProdprijs" runat="server" Font-Size="XX-Large" Text='<%# Eval("Prijs") %>'></asp:Label>
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

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT * FROM [Item] WHERE Type = 'Drank'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT * FROM [Item] WHERE Type = 'Voorgerecht'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT * FROM [Item] WHERE Type = 'Hoofdgerecht'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT * FROM [Item] WHERE Type = 'Nagerecht'"></asp:SqlDataSource>
    </div>

</asp:Content>
