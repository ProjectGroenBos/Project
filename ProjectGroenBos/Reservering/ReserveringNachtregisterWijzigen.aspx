<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="ReserveringNachtregisterWijzigen.aspx.cs" Inherits="ProjectGroenBos.Reservering.ReserveringNachtregisterWijzigen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <h2>Nachtregister wijzigen</h2>
        <br />
        <p>Voeg de ontbrekende gastern toe, verwijder de gasten die teveel zijn, of doe niks en ga verder of er niks aan de hand is.</p>
        
        <br />
        <asp:Button ID="btnToevoegen" runat="server" Text="Toevoegen" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" OnClick="btnToevoegen_Click"/>
        <asp:Label ID="lblOutput" runat="server" CssClass="labelsnieuw"></asp:Label>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="content-table" DataKeyNames="volgnummer,ReserveringNummer2" DataSourceID="SqlDataSource1" AutoGenerateEditButton="True">
            <Columns>
                <asp:BoundField DataField="volgnummer" HeaderText="Volgnummer" InsertVisible="False" ReadOnly="True" SortExpression="volgnummer" />
                <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
                <asp:BoundField DataField="Tussenvoegsel" HeaderText="Tussenvoegsel" SortExpression="Tussenvoegsel" />
                <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" />
                <asp:BoundField DataField="Geboortedatum" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Geboortedatum" SortExpression="Geboortedatum" />
                <asp:BoundField DataField="ReserveringNummer2" HeaderText="Reservering nummer" ReadOnly="True" SortExpression="ReserveringNummer2" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT * FROM [Nachtregister] WHERE ([ReserveringNummer2] = @ReserveringNummer2)" DeleteCommand="DELETE FROM [Nachtregister] WHERE [volgnummer] = @volgnummer AND [ReserveringNummer2] = @ReserveringNummer2" InsertCommand="INSERT INTO [Nachtregister] ([Voornaam], [Tussenvoegsel], [Achternaam], [Geboortedatum], [ReserveringNummer2]) VALUES (@Voornaam, @Tussenvoegsel, @Achternaam, @Geboortedatum, @ReserveringNummer2)" UpdateCommand="UPDATE [Nachtregister] SET [Voornaam] = @Voornaam, [Tussenvoegsel] = @Tussenvoegsel, [Achternaam] = @Achternaam, [Geboortedatum] = @Geboortedatum WHERE [volgnummer] = @volgnummer AND [ReserveringNummer2] = @ReserveringNummer2">
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
                <asp:ControlParameter ControlID="lblReserveringnummer" Name="ReserveringNummer2" PropertyName="Text" Type="Int32" />
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
