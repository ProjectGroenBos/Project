<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ProjectGroenBos.Reservering.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <h2>Nachtregister overzicht</h2>
        <br />
        <p>Als mensen bellen dat ze gegevens van een iemand willen veranderen, kunnnen die<br />
            op deze pagina aan de hand van het reserveringsnummer de gegevens wijzigen.</p>
        <table>
            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label1" runat="server" Text="Label">Reserveringsnummer</asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbReserveringsnummer" runat="server"></asp:TextBox></td>
                <td style="width: 40%"></td>
            </tr>
        </table>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="content-table" DataKeyNames="volgnummer,ReserveringNummer2" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="volgnummer" HeaderText="volgnummer" InsertVisible="False" ReadOnly="True" SortExpression="volgnummer" />
                <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
                <asp:BoundField DataField="Tussenvoegsel" HeaderText="Tussenvoegsel" SortExpression="Tussenvoegsel" />
                <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" />
                <asp:BoundField DataField="Geboortedatum" HeaderText="Geboortedatum" SortExpression="Geboortedatum" DataFormatString="{0:dd/MM/yyyy}" ApplyFormatInEditMode="true"/>
                <asp:BoundField DataField="ReserveringNummer2" HeaderText="ReserveringNummer2" ReadOnly="True" SortExpression="ReserveringNummer2" />   
            </Columns>
            <HeaderStyle ForeColor="White" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT * FROM [Nachtregister] WHERE ([ReserveringNummer2] = @ReserveringNummer2)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txbReserveringsnummer" Name="ReserveringNummer2" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
