<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="ProjectGroenBos.Reservering.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <h2>Homepagina</h2>
        <br />
        Meldingen:
    <asp:Label ID="lbluitkomst" runat="server" Text=""></asp:Label>
        <br />
        <br />

        <table>
            <tr>
                <td style="width:40%">
                    <h3>Binnenkomende gasten:</h3>
                </td>
                <td style="width:40%">
                    <h3>Vertrekkende gasten:</h3>
                </td>
            </tr>
            <tr>
                <td style="width:40%">
                    <asp:Label ID="lblAankomend" runat="server" Text=""></asp:Label>
                    <asp:GridView ID="GridView3" runat="server" AllowSorting="True" CssClass="content-table" AutoGenerateColumns="False" DataKeyNames="Reservering nummer" DataSourceID="SqlDataSource3" AllowPaging="True">
                        <Columns>
                            <asp:BoundField DataField="Reservering nummer" HeaderText="Reservering nummer" InsertVisible="False" ReadOnly="True" SortExpression="Reservering nummer" />
                            <asp:BoundField DataField="Aantal personen" HeaderText="Aantal personen" SortExpression="Aantal personen" />
                            <asp:BoundField DataField="Aankomstdatum" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Aankomstdatum" SortExpression="Aankomstdatum" />
                            <asp:BoundField DataField="Vertrekdatum" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Vertrekdatum" SortExpression="Vertrekdatum" />
                        </Columns>
                        <HeaderStyle ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="select Nummer as [Reservering nummer], Aantal_personen as[Aantal personen], Aankomstdatum, Vertrekdatum
from Reservering
where Aankomstdatum between Getdate() and  DATEADD(day, 3, GETDATE())"></asp:SqlDataSource>
                </td>
                    
                <td style="width:40%">
                    <asp:Label ID="lblVertrekkend" runat="server" Text=""></asp:Label>
                    <asp:GridView ID="GridView4" runat="server" AllowSorting="True" CssClass="content-table" AutoGenerateColumns="False" DataKeyNames="Reservering nummer" DataSourceID="SqlDataSource4" AllowPaging="True">
                        <Columns>
                            <asp:BoundField DataField="Reservering nummer" HeaderText="Reservering nummer" InsertVisible="False" ReadOnly="True" SortExpression="Reservering nummer" />
                            <asp:BoundField DataField="Aantal personen" HeaderText="Aantal personen" SortExpression="Aantal personen" />
                            <asp:BoundField DataField="Aankomstdatum" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Aankomstdatum" SortExpression="Aankomstdatum" />
                            <asp:BoundField DataField="Vertrekdatum" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Vertrekdatum" SortExpression="Vertrekdatum" />
                        </Columns>
                        <HeaderStyle ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="select Nummer as [Reservering nummer], Aantal_personen as[Aantal personen], Aankomstdatum, Vertrekdatum
from Reservering
where Vertrekdatum between Getdate() and  DATEADD(day, 3, GETDATE())"></asp:SqlDataSource>
                </td>
            </tr>
            


        </table>







    </div>
</asp:Content>
