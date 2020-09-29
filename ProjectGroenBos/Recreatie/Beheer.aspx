<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="Beheer.aspx.cs" Inherits="recreatie.paginas.Beheer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label3" runat="server" Text="Zoeken:"></asp:Label>
    <asp:TextBox ID="txtZoekbalk" runat="server" Width="300px" placeholder="Zoek op Artikelnaam of Omschrijving..." OnTextChanged="txtZoeken_TextChanged"  AutoPostBack="True"></asp:TextBox>
    <asp:GridView ID="gvVoorraad" runat="server" AutoGenerateColumns="False" ShowFooter="true" DataKeyNames="ID" ShowHeaderWhenEmpty="true"
            OnRowCommand="gvVoorraad_RowCommand" OnRowEditing="gvVoorraad_RowEditing" OnRowCancelingEdit="gvVoorraad_RowCancelingEdit" OnRowUpdating="gvVoorraad_RowUpdating" OnRowDeleting="gvVoorraad_RowDeleting"
            CellPadding="4" ForeColor="#333333" GridLines="none" Width="80%" AllowSorting ="true" OnSelectedIndexChanged="gvVoorraad_SelectedIndexChanged">

           <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
           <EditRowStyle BackColor="#999999" />
           <FooterStyle BackColor="#7fb241" Font-Bold="True" ForeColor="White" />
           <HeaderStyle BackColor="#7fb241" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
           <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
           <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
           <SortedAscendingCellStyle BackColor="#E9E7E2" />
           <SortedAscendingHeaderStyle BackColor="#506C8C" />
           <SortedDescendingCellStyle BackColor="#FFFDF8" />
           <SortedDescendingHeaderStyle BackColor="#6F8DAE" /> 

            <Columns>
                <asp:TemplateField HeaderText="Artikelnummer">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("ID") %>' runat="server" />
                    </ItemTemplate>
                    <%--  %><EditItemTemplate>
                        <asp:TextBox ID="txtNaamRestaurant" Text='<%# Eval("NaamRestaurant") %>' runat="server" />
                    </EditItemTemplate> --%>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Naam " >  
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Artikelnaam") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Aantal">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Aantal") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="In gebruik">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Beschikbaar") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Beschikbaar">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Ingebruik") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Minimale voorraad">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("[Minimum voorraad]") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Actie">
                    <ItemTemplate>
                        <asp:ImageButton ImageUrl="~/img/Winkelwagenicoon.png" runat="server" CommandName="Edit" ToolTip="Bewerken" Width="20px" Height="20px" />
                    </ItemTemplate> 
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
</asp:Content>
