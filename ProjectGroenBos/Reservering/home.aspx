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
                <td>
                    <h3>Binnenkomende gasten:</h3>
                </td>
                <td>
                    <h3>Vertrekkende gasten:</h3>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblAankomend" runat="server" Text=""></asp:Label>
                    <asp:GridView ID="GridView3" runat="server" AllowSorting="True" CssClass="content-table" AutoGenerateColumns="False" DataKeyNames="Reservering nummer" DataSourceID="SqlDataSource3">
                        <Columns>
                            <asp:BoundField DataField="Reservering nummer" HeaderText="Reservering nummer" InsertVisible="False" ReadOnly="True" SortExpression="Reservering nummer" />
                            <asp:BoundField DataField="Aantal personen" HeaderText="Aantal personen" SortExpression="Aantal personen" />
                            <asp:BoundField DataField="Aankomstdatum" DataFormatString="{0:d}" HeaderText="Aankomstdatum" SortExpression="Aankomstdatum" />
                            <asp:BoundField DataField="Vertrekdatum" DataFormatString="{0:d}" HeaderText="Vertrekdatum" SortExpression="Vertrekdatum" />
                        </Columns>
                        <HeaderStyle ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="select Nummer as [Reservering nummer], Aantal_personen as[Aantal personen], Aankomstdatum, Vertrekdatum
from Reservering
where Aankomstdatum = Getdate()
order by Nummer desc"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:Label ID="lblVertrekkend" runat="server" Text=""></asp:Label>
                    <asp:GridView ID="GridView4" runat="server" AllowSorting="True" CssClass="content-table" AutoGenerateColumns="False" DataKeyNames="Reservering nummer" DataSourceID="SqlDataSource4">
                        <Columns>
                            <asp:BoundField DataField="Reservering nummer" HeaderText="Reservering nummer" InsertVisible="False" ReadOnly="True" SortExpression="Reservering nummer" />
                            <asp:BoundField DataField="Aantal personen" HeaderText="Aantal personen" SortExpression="Aantal personen" />
                            <asp:BoundField DataField="Aankomstdatum" DataFormatString="{0:d}" HeaderText="Aankomstdatum" SortExpression="Aankomstdatum" />
                            <asp:BoundField DataField="Vertrekdatum" DataFormatString="{0:d}" HeaderText="Vertrekdatum" SortExpression="Vertrekdatum" />
                        </Columns>
                        <HeaderStyle ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="select Nummer as [Reservering nummer], Aantal_personen as[Aantal personen], Aankomstdatum, Vertrekdatum
from Reservering
where Vertrekdatum = Getdate()
order by Nummer desc"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <h3>5 nieuwste reserveringen:</h3>
                </td>
                <td>
                    <h3>5 nieuwste gasten:</h3>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblReserveringen" runat="server" Text=""></asp:Label>
                    <asp:GridView ID="GridView1" CssClass="content-table" runat="server" AutoGenerateColumns="False" DataKeyNames="Reservering Nummer" DataSourceID="SqlDataSource1" AllowSorting="True">
                        <Columns>
                            <asp:BoundField DataField="Reservering Nummer" HeaderText="Reservering Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Reservering Nummer" />
                            <asp:BoundField DataField="Aantal personen" HeaderText="Aantal personen" SortExpression="Aantal personen" />
                            <asp:BoundField DataField="Aankomstdatum" HeaderText="Aankomstdatum" SortExpression="Aankomstdatum" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="Vertrekdatum" HeaderText="Vertrekdatum" SortExpression="Vertrekdatum" DataFormatString="{0:d}" />
                        </Columns>
                        <HeaderStyle ForeColor="White" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="select top(5) Nummer as [Reservering Nummer], Aantal_personen as [Aantal personen], Aankomstdatum, Vertrekdatum
from Reservering
order by Nummer desc"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:Label ID="lblGasten" runat="server" Text=""></asp:Label>
                    <asp:GridView ID="GridView2" CssClass="content-table" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Gast nummer" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:BoundField DataField="Gast nummer" HeaderText="Gast nummer" InsertVisible="False" ReadOnly="True" SortExpression="Gast nummer" />
                            <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" />
                            <asp:BoundField DataField="Telefoonnummer" HeaderText="Telefoonnummer" SortExpression="Telefoonnummer" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        </Columns>
                        <HeaderStyle ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="select top(5)Nummer as [Gast nummer], Achternaam, Telefoonnummer, Email
from Gast
order by Nummer desc"></asp:SqlDataSource>
                </td>
            </tr>


        </table>







    </div>
</asp:Content>
