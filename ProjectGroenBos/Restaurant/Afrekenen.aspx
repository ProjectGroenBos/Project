<%@ Page Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="Afrekenen.aspx.cs" Inherits="ProjectGroenBos.Restaurant.Afrekenen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/Afrekenen.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="werkgebied">
        <asp:Label ID="lblBetalen" class="paginatitel" runat="server" Text="Afrekenen"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lbltafel" CssClass="lblTafel" runat="server" Text="Tafel"></asp:Label>
            <div class="Factuurregelbak">
            <asp:GridView class="GvdOrder" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="Aantal" HeaderText="Aantal" SortExpression="Aantal" >
                       <ItemStyle HorizontalAlign="Center" />
                     </asp:BoundField>
                    <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" >
                        <ItemStyle HorizontalAlign="Center" />
                     </asp:BoundField>
                    <asp:BoundField DataField="RegelTotaal" HeaderText="RegelTotaal" SortExpression="RegelTotaal" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                     </asp:BoundField>

                </Columns>             
                <HeaderStyle CssClass="GdvHeader"/>
                <RowStyle CssClass="GdvRow"/>
                
            </asp:GridView>
        </div>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT [Naam], [Aantal], [RegelTotaal] FROM [RestaurantAfrekenOvericht]"></asp:SqlDataSource>

        <asp:Label ID="lblTotaal" CssClass="lblTotaal" runat="server" Text="Totaal"></asp:Label>
            <asp:GridView class="Gdvtotaal" ID="GridViewTotaal" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceTotaal" AllowSorting="True" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="Totaalbedrag" HeaderText="Totaalbedrag" ReadOnly="True" SortExpression="Totaalbedrag" />
                </Columns>
            </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceTotaal" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT cast(SUM(RegelTotaal) AS DECIMAL(18,2)) AS Totaalbedrag FROM RestaurantAfrekenOvericht"></asp:SqlDataSource>

        <div class="btnbak">
            <asp:Button ID="btnRekening" CssClass="buttongreen" runat="server" Text="Op rekening" OnClick="btnRekening_Click" />
            <asp:Button ID="btnBetalen" CssClass="buttongreen" runat="server" Text="Pin" OnClick="btnBetalen_Click" />
            <asp:Button ID="BtnContant" CssClass="buttongreen" runat="server" Text="Contant" OnClick="btnContant_Click" />
        </div>
    </div>
</asp:Content>
