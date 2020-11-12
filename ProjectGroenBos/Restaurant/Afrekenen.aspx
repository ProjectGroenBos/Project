<%@ Page Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="Afrekenen.aspx.cs" Inherits="ProjectGroenBos.Restaurant.Afrekenen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="werkgebied">
        <div class="GdvContainer">
            <asp:GridView class="Gdv1" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="ReserveringsNr" HeaderText="ReserveringsNr" InsertVisible="False" ReadOnly="True" SortExpression="ReserveringsNr" />
                    <asp:BoundField DataField="Ronde" HeaderText="Ronde" SortExpression="Ronde" />
                    <asp:BoundField DataField="Prijs" HeaderText="Prijs" SortExpression="prijs" />

                    <asp:TemplateField ShowHeader="False">

                    </asp:TemplateField>

                </Columns>             
                <HeaderStyle CssClass="GdvHeader"/>
                <RowStyle CssClass="GdvRow"/>
                
            </asp:GridView>
        </div>
    </div>
</asp:Content>
