<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="Uitchecken.aspx.cs" Inherits="ProjectGroenBos.Reservering.Uitchecken" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <h2>Uitchecken</h2>
        <br />
        <p>Gasten die vertrekken kunnen worden uitgecheckt, <br />mochten ze nog niet alle rekeningen betaald hebben, kan dat ook nog.</p>
        <br />
        <table style="text-align: left; margin-left: 5%">
            <tr>
                <td style="width: 15%">
                    <asp:Label runat="server" Text="Voornaam:" ID="label1"></asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox runat="server" ID="txbVoornaam"></asp:TextBox></td>
                <td style="width:40%"></td>
                </tr>
                <tr>
                <td style="width: 15%">
                    <asp:Label runat="server" Text="Geboortedatum:" ID="label2"></asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox runat="server" ID="txbGeboortedatum"></asp:TextBox></td>
                <td style="width:40%"></td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowCustomPaging="True" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="content-table" DataKeyNames="Nummer" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
                <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" />
                <asp:BoundField DataField="Geboortedatum" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Geboortedatum" SortExpression="Geboortedatum" />
                <asp:BoundField DataField="Aankomstdatum" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Aankomstdatum" SortExpression="Aankomstdatum" />
                <asp:BoundField DataField="Vertrekdatum" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Vertrekdatum" SortExpression="Vertrekdatum" />
            </Columns>
            <HeaderStyle ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT Reservering.Nummer as Reservering nummer, Gast.Achternaam, Gast.Geboortedatum, Reservering.Aankomstdatum, Reservering.Vertrekdatum
FROM     Reservering INNER JOIN
                  Gast ON Reservering.GastNummer = Gast.Nummer
				  where Vertrekdatum = getdate() and Achternaam like '%' + @achternaam + '%' and Geboortedatum like '%' + @geboortedatum + '%'">
            <SelectParameters>
                <asp:ControlParameter ControlID="txbVoornaam" DefaultValue="%" Name="achternaam" PropertyName="Text" />
                <asp:ControlParameter ControlID="txbGeboortedatum" Name="geboortedatum" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
