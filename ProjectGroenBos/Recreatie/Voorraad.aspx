<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="Voorraad.aspx.cs" Inherits="recreatie.paginas.Voorraad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        &nbsp;</p>
    <div class="voorraad">
    <p>
        
        <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Names="Century Gothic" Font-Overline="False" Font-Size="X-Large" ForeColor="#757272" Text="Voorraad" CssClass="label"></asp:Label>
        </p>
    </div>
<p>
    &nbsp;</p>
<p>
    <asp:Label ID="Label1" runat="server" Text="Artikelnaam:" CssClass="label"></asp:Label>
&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="BtnZoek" runat="server" BackColor="#7FB241" ForeColor="#FEFEFE" Text="Zoek" />
</p>
<p>
    &nbsp;</p>
<p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Artikelnaam" HeaderText="Artikelnaam" ReadOnly="True" SortExpression="Artikelnaam" />
            <asp:BoundField DataField="Aantal" HeaderText="Aantal" SortExpression="Aantal" />
            <asp:BoundField DataField="Beschikbaar" HeaderText="Beschikbaar" ReadOnly="True" SortExpression="Beschikbaar" />
            <asp:BoundField DataField="Ingebruik" HeaderText="Ingebruik" SortExpression="Ingebruik" />
            <asp:BoundField DataField="Minimum voorraad" HeaderText="Minimum voorraad" SortExpression="Minimum voorraad" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT * FROM [vVoorraadRecreatie]"></asp:SqlDataSource>
</p>
</asp:Content>
