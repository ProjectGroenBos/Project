<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="BestellenFood.aspx.cs" Inherits="ProjectGroenBos.Restaurant.BestellenFood" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-bottom: 38;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
        <h1>Bestellen Food artikelen</h1> 
         <asp:Label ID="lblLeverancier" runat="server" Text="Kies leverancier"></asp:Label>
        <asp:DropDownList ID="ddlLeverancier" runat="server" DataSourceID="SqlDataSource2" DataTextField="Naam" DataValueField="ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [ID], [Naam] FROM [Leverancier]"></asp:SqlDataSource>
        

           <div>
               <br />
            <asp:GridView ID="gvInkoopOrderregel" runat="server" AutoGenerateColumns="False" ShowFooter ="true" DataKeyNames="PK_Product" ShowHeaderWhenEmpty="true"

                OnRowCommand="gvInkoopOrderregel_RowCommand" OnRowEditing ="gvInkoopOrderregel_RowEditing" OnRowCancelingEdit="gvInkoopOrderregel_RowCancelingEdit" OnRowUpdating ="gvInkoopOrderregel_RowUpdating" OnRowDeleting ="gvInkoopOrderregel_RowDeleting"
            
            CellPadding="4" ForeColor="#333333" GridLines="None" Width="40%" Align="center">
            
            <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />--%>

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
    

                    <asp:TemplateField HeaderText="Product">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Product") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtProduct" Text='<%# Eval("Product") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Hoeveelheid">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Hoeveelheid") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtHoeveelheid" Text='<%# Eval("Hoeveelheid") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Restaurant/img/delete.png" runat="server" CommandName="Delete" ToolTip="Verwijderen" Width="20px" Height="20px" />
                        </ItemTemplate>

                    </asp:TemplateField>
              </Columns>
        </asp:GridView>
               <br />
               <asp:Label ID="lblProduct" runat="server" Text="Kies product"></asp:Label>
               <asp:DropDownList ID="ddlProduct" runat="server" DataSourceID="SqlDataSource1" DataTextField="Naam" DataValueField="ID">
               </asp:DropDownList>
<%--               <asp:Button ID="btnPlaatsOrder" runat="server" Text="Order plaatsen" OnClick="btnPlaatsOrder_Click" ValidationGroup="validation" />--%>
               
               <br />
               
        <br />
               <asp:Label ID="lblHoeveelheid" runat="server" Text="Hoeveelheid"></asp:Label>
               <asp:TextBox ID="txtQty" runat="server" CssClass="auto-style1"></asp:TextBox>
               <br />
         <br />
               <asp:Button ID="btnMaakOrderRegel" runat="server" Text="Voeg product toe aan order" OnClick="btnMaakOrderRegel_Click" ValidationGroup="validation" Height="25px" Width="262px" />

               <br />

        </div>


    </div>
        <asp:Label ID ="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
        <asp:Label ID ="lblErrorMessage" Text="" runat="server" ForeColor="Red" />

               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM Voorraad WHERE Omschrijving = 'Frisdranken' OR Omschrijving = 'Voedsel'"></asp:SqlDataSource>
               </asp:Content>
