<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="BestellenNonFood.aspx.cs" Inherits="ProjectGroenBos.Restaurant.BestellenNonFood" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/BestellenVoorraad.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
        <h1>Bestellen Non-Food artikelen</h1> 

           <div>
               <br />
               <br />
               
            <div class="Gridview">
            <asp:GridView ID="gvInkoopOrderregel" runat="server" AutoGenerateColumns="False" ShowFooter ="true" DataKeyNames="PK_Product" ShowHeaderWhenEmpty="true"

                OnRowCommand="gvInkoopOrderregel_RowCommand" OnRowEditing ="gvInkoopOrderregel_RowEditing" OnRowCancelingEdit="gvInkoopOrderregel_RowCancelingEdit" OnRowUpdating ="gvInkoopOrderregel_RowUpdating" OnRowDeleting ="gvInkoopOrderregel_RowDeleting"
            
            CellPadding="4" ForeColor="#333333" GridLines="None" Width="421px">

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
    <%--Hier beginnen de kolommen van de grid view--%>

                    <asp:TemplateField HeaderText="Product" runat="server">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Product") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtProduct" Text='<%# Eval("Product") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Hoeveelheid" runat="server">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Hoeveelheid") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtHoeveelheid" Text='<%# Eval("Hoeveelheid") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField runat="server">
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Restaurant/img/delete.png" runat="server" CommandName="Delete" ToolTip="Verwijderen" Width="20px" Height="20px" />
                        </ItemTemplate>

                    </asp:TemplateField>
              </Columns>
        </asp:GridView>
                </div>
               <br />
               <%--Hier beginnen de labels, textboxen en buttons--%>
                        <asp:Label ID="lblLeverancier" runat="server" Text="Kies leverancier"></asp:Label>
        <asp:DropDownList ID="ddlLeverancier" runat="server" DataSourceID="SqlDataSource2" DataTextField="Naam" DataValueField="ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [ID], [Naam] FROM [Leverancier] WHERE Naam='Ikea'"></asp:SqlDataSource>
            <asp:ScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ScriptManager>

               <br />
               <br />
               <asp:Label ID="lblProduct" runat="server" Text="Kies product"></asp:Label>
               <asp:DropDownList ID="ddlProduct" runat="server" DataSourceID="SqlDataSource1" DataTextField="Naam" DataValueField="ID">
               </asp:DropDownList>
               
               
        <br />
        <br />
               <asp:Label ID="lblHoeveelheid" runat="server" Text="Hoeveelheid"></asp:Label>
               <asp:TextBox ID="txtQty" runat="server" CssClass="auto-style1"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQty" ErrorMessage="Voer hoeveelheid in" Font-Bold="True" ForeColor="#CC3300" ValidationGroup="Validation"></asp:RequiredFieldValidator>
               <br />
         <br />
               <asp:Button ID="btnMaakOrderRegel" runat="server" Text="Voeg product toe aan order" OnClick="btnBevestiging_Click" ValidationGroup="Validation" Height="25px" Width="262px" />

               <ajaxtoolkit:modalpopupextender ID="popupBevestiging" TargetControlID="btnMaakOrderRegel" popupControlID="modelpanBevestiging" CancelcontrolID="btnclose2" runat="server">

        </ajaxtoolkit:modalpopupextender>
               <asp:Panel ID="modelpanBevestiging" Class="popup" runat="server">
         
                <div ID="header2" class=header>
                    <asp:Label ID="lbltafel2popup" class="Tafelpopup" runat="server" Text="Weet u het zeker?"/>
                
                </div>

            <div class="center">
            <asp:button  runat="server" class="popupbutton" text="Ja" OnClick="btnMaakOrderRegel_Click" ValidationGroup="Validation" />
                &nbsp;
            <asp:button ID="btnclose2" Class="close" runat="server" text="Nee"/>
            
            </div>
        </asp:Panel>
               <br /><br />

               <asp:Button ID="btnPlaatsOrder" runat="server" Text="Order plaatsen" OnClick="btnPlaatsOrder_Click" Height="25px" Width="262px" />

               <br />

        </div>


    </div>
        <asp:Label ID ="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
        <asp:Label ID ="lblErrorMessage" Text="" runat="server" ForeColor="Red" />

               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM Voorraad WHERE Omschrijving = 'Inventaris'"></asp:SqlDataSource>
</asp:Content>
