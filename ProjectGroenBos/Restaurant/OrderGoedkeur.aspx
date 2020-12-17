<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="OrderGoedkeur.aspx.cs" Inherits="ProjectGroenBos.Restaurant.OrderGoedkeur" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <h1>Order overzicht</h1>
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
            <asp:GridView ID="gvOrderBekijken" runat="server" AutoGenerateColumns="False" ShowFooter="true" DataKeyNames="Nummer" ShowHeaderWhenEmpty="true"
                OnRowCommand="gvOrderBekijken_rowcommand" OnRowEditing="gvOrderBekijken_rowediting" OnRowCancelingEdit="gvOrderBekijken_rowcancelingedit" OnRowUpdating="gvOrderBekijken_rowupdating" OnRowDeleting="gvOrderBekijken_rowdeleting"
                CellPadding="4" ForeColor="#333333" GridLines="none" Width="90%" Align="center" OnSelectedIndexChanged="gvOrderBekijken_selectedindexchanged" CssClass="auto-style1">

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
                    <%--Kolom BTW Tarief met textbox en footertextbox--%>
                    <asp:TemplateField HeaderText="Bestelnummer">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Bestelnummer") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                        <asp:TemplateField HeaderText="Datum">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Datum") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Leverancier">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("LeverancierID") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnOpen" runat="server" Text="Druk voor info" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
<br />
            <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
            <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red" />
      </asp:Content>
