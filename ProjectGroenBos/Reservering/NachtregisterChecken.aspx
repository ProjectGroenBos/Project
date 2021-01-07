<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="NachtregisterChecken.aspx.cs" Inherits="ProjectGroenBos.Reservering.NachtregisterChecken" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <h2>Nachtregister controleren</h2>
        <br />
        
        <p>Controleer de ingevulde gegevens van het nachtregister, om deze eventueel te wijzigen.</p>

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="volgnummer,ReserveringNummer2" DataSourceID="SqlDataSource2" CssClass="content-table">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="volgnummer" HeaderText="volgnummer" InsertVisible="False" ReadOnly="True" SortExpression="volgnummer" />
                <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
                <asp:BoundField DataField="Tussenvoegsel" HeaderText="Tussenvoegsel" SortExpression="Tussenvoegsel" />
                <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" />
                <asp:BoundField DataField="Geboortedatum" HeaderText="Geboortedatum" SortExpression="Geboortedatum" DataFormatString="{0:dd-MM-yyyy}" />
                <asp:BoundField DataField="ReserveringNummer2" HeaderText="Reservering nummer" ReadOnly="True" SortExpression="ReserveringNummer2" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" DeleteCommand="DELETE FROM [Nachtregister] WHERE [volgnummer] = @volgnummer AND [ReserveringNummer2] = @ReserveringNummer2" InsertCommand="INSERT INTO [Nachtregister] ([Voornaam], [Tussenvoegsel], [Achternaam], [Geboortedatum], [ReserveringNummer2]) VALUES (@Voornaam, @Tussenvoegsel, @Achternaam, @Geboortedatum, @ReserveringNummer2)" SelectCommand="SELECT * FROM [Nachtregister] WHERE ([ReserveringNummer2] = @ReserveringNummer2)" UpdateCommand="UPDATE [Nachtregister] SET [Voornaam] = @Voornaam, [Tussenvoegsel] = @Tussenvoegsel, [Achternaam] = @Achternaam, [Geboortedatum] = @Geboortedatum WHERE [volgnummer] = @volgnummer AND [ReserveringNummer2] = @ReserveringNummer2">
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
                <asp:ControlParameter ControlID="lblReserveringNummer" Name="ReserveringNummer2" PropertyName="Text" Type="Int32" />
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

        <asp:Button ID="btnBevestigen" runat="server" Click="btnBevestigen_Click1" Text="Bevestigen" OnClick="btnBevestigen_Click" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" /><br />
        <asp:Label ID="lblReserveringNummer" runat="server" Visible="False"></asp:Label>
    </div>
</asp:Content>
