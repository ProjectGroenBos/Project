<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ProjectGroenBos.Reservering.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <h2>Nachtregister overzicht</h2>
        <br />
        <p>
            Als mensen bellen dat ze gegevens van een iemand willen veranderen, kunnnen die<br />
            op deze pagina aan de hand van het reserveringsnummer de gegevens wijzigen.
        </p>
        <table style="text-align: left; margin-left: 5%">
            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label1" runat="server" Text="Label">Reserveringsnummer</asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbReserveringsnummer" runat="server"></asp:TextBox></td>
                <td style="width: 40%"></td>
            </tr>
            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label2" runat="server" Text="Label">Achternaam</asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbAchternaam" runat="server"></asp:TextBox></td>
                <td style="width: 40%"></td>
            </tr>
        </table>
        <br />
        <asp:Label ID="lblUitkomst" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnZoeken" runat="server" Text="Zoeken" Style="background-color: #009879; color: #fff" class="btn" OnClick="BtnZoeken_Click" CssClass="btnUitloggen"/>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="content-table" DataKeyNames="volgnummer,ReserveringNummer2" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="volgnummer" HeaderText="Volgnummer" InsertVisible="False" ReadOnly="True" SortExpression="volgnummer" />
                <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
                <asp:BoundField DataField="Tussenvoegsel" HeaderText="Tussenvoegsel" SortExpression="Tussenvoegsel" />
                <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" />
                <asp:BoundField DataField="Geboortedatum" HeaderText="Geboortedatum" SortExpression="Geboortedatum" DataFormatString="{0:dd-MM-yyyy}" />
                <asp:BoundField DataField="ReserveringNummer2" HeaderText="Reserveringsnummer" ReadOnly="True" SortExpression="ReserveringNummer2" />
            </Columns>
            <HeaderStyle ForeColor="White" />
        </asp:GridView>
        <br />
        <br />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT * FROM [Nachtregister] WHERE (([ReserveringNummer2] = @ReserveringNummer2) AND ([Achternaam] LIKE '%' + @Achternaam + '%'))" DeleteCommand="DELETE FROM [Nachtregister] WHERE [volgnummer] = @volgnummer AND [ReserveringNummer2] = @ReserveringNummer2" InsertCommand="INSERT INTO [Nachtregister] ([Voornaam], [Tussenvoegsel], [Achternaam], [Geboortedatum], [ReserveringNummer2]) VALUES (@Voornaam, @Tussenvoegsel, @Achternaam, @Geboortedatum, @ReserveringNummer2)" UpdateCommand="UPDATE [Nachtregister] SET [Voornaam] = @Voornaam, [Tussenvoegsel] = @Tussenvoegsel, [Achternaam] = @Achternaam, [Geboortedatum] = @Geboortedatum WHERE [volgnummer] = @volgnummer AND [ReserveringNummer2] = @ReserveringNummer2">
            <DeleteParameters>
                <asp:Parameter Name="volgnummer" Type="Int32" />
                <asp:Parameter Name="ReserveringNummer2" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Voornaam" Type="String" />
                <asp:Parameter Name="Tussenvoegsel" Type="String" />
                <asp:Parameter Name="Achternaam" Type="String" />
                <asp:Parameter DbType="Date" Name="Geboortedatum" />
                <asp:Parameter Name="ReserveringNummer2" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txbReserveringsnummer" Name="ReserveringNummer2" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="txbAchternaam" Name="Achternaam" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Voornaam" Type="String" />
                <asp:Parameter Name="Tussenvoegsel" Type="String" />
                <asp:Parameter Name="Achternaam" Type="String" />
                <asp:Parameter DbType="Date" Name="Geboortedatum" />
                <asp:Parameter Name="volgnummer" Type="Int32" />
                <asp:Parameter Name="ReserveringNummer2" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
