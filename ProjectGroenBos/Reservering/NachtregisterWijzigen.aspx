<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="NachtregisterWijzigen.aspx.cs" Inherits="ProjectGroenBos.Reservering.NachtregisterWijzigen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">

        <h2>Nachtregister wijzigen</h2>
        <br />
        <p>Verander de gegevens van de aangeklikte persoon die naar het park toekomt bij een bepaalde reservering.</p>
        <br />
        <asp:GridView ID="GridView1" runat="server" CssClass="content-table" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="volgnummer,ReserveringNummer2">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="volgnummer" HeaderText="volgnummer" InsertVisible="False" ReadOnly="True" SortExpression="volgnummer" />
                <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
                <asp:BoundField DataField="Tussenvoegsel" HeaderText="Tussenvoegsel" SortExpression="Tussenvoegsel" />
                <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" />
                <asp:BoundField DataField="Geboortedatum" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Geboortedatum" SortExpression="Geboortedatum" />
                <asp:BoundField DataField="ReserveringNummer2" HeaderText="Reserveringsnummer" ReadOnly="True" SortExpression="ReserveringNummer2" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnTerug" runat="server" CssClass="btnUitloggen" Text="Terug" Style="background-color: #009879; color: #fff" class="btn" OnClick="btnTerug_Click"  />
        <br />
        <asp:Label ID="lblUitkomst" runat="server"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" DeleteCommand="DELETE FROM [Nachtregister] WHERE [volgnummer] = @volgnummer AND [ReserveringNummer2] = @ReserveringNummer2" InsertCommand="INSERT INTO [Nachtregister] ([Voornaam], [Tussenvoegsel], [Achternaam], [Geboortedatum], [ReserveringNummer2]) VALUES (@Voornaam, @Tussenvoegsel, @Achternaam, @Geboortedatum, @ReserveringNummer2)" SelectCommand="SELECT * FROM [Nachtregister] WHERE ([volgnummer] = @volgnummer)" UpdateCommand="UPDATE [Nachtregister] SET [Voornaam] = @Voornaam, [Tussenvoegsel] = @Tussenvoegsel, [Achternaam] = @Achternaam, [Geboortedatum] = @Geboortedatum WHERE [volgnummer] = @volgnummer AND [ReserveringNummer2] = @ReserveringNummer2">
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
                <asp:ControlParameter ControlID="lblUitkomst" Name="volgnummer" PropertyName="Text" Type="Int32" />
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
