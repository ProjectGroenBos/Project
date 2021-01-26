<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="VoorraadZien.aspx.cs" Inherits="ProjectGroenBos.Restaurant.VoorraadZien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Voorraad.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="werkgebied">
        <h1>Voorraad overzicht</h1>
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
                CellPadding="4" ForeColor="#333333" GridLines="none" Width="90%" Align="center" OnSelectedIndexChanged="gvBekijkenVoorraad_selectedindexchanged" CssClass="auto-style1">

                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#10715e" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#10715e" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#7fb241" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#e9e7e2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />


                <Columns>
                    <%--Kolom Producten op voorraad met textbox en footertextbox--%>
                    <asp:TemplateField HeaderText="Producten op Voorraad">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Aantal") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--Kolom Productnaam met textbox en footertextbox--%>
                    <asp:TemplateField HeaderText="Productnaam">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Naam") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--Kolom Inkoopprijs met textbox en footertextbox--%>
                    <asp:TemplateField HeaderText="Inkoopprijs">
                        <ItemTemplate>
                            <asp:Label Text='<%# string.Format("{0:C}", Eval("Prijs"))%>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--Kolom Minimum voorraad met textbox en footertextbox--%>
                    <asp:TemplateField HeaderText="Minimum Voorraad">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Minimum voorraad") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--Kolom BTW Tarief met textbox en footertextbox--%>
                    <asp:TemplateField HeaderText="BTW Tarief">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("BTW tariefID") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
