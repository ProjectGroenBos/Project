<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="NachtregisterInvullen.aspx.cs" Inherits="ProjectGroenBos.Reservering.Nachtregister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div class="container">
        <h2>Nachtregister invullen</h2>
        <br />
        Mochten wij in geval van nood het park moeten evacueren, waar wij en u niet op hopen, hebben we
        
        de gegevens van uw medevakantiegangers nodig. Dit alles om te weten of iedereen het park uit is.
   <br />
        <br />
        <table style="text-align: left; margin-left: 5%">
            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label2" runat="server" Text="Naam:" CssClass="labelsnieuw"></asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox ID="TxBNaam" runat="server" CssClass="textboxchaos"></asp:TextBox></td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxBNaam" ErrorMessage="Dit veld is verplicht." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Gebruik alleen letters." ControlToValidate="TxBNaam" ValidationExpression="^[a-zA-Z -]*$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>

            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Tussenvoegsel:" CssClass="labelsnieuw"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TxBtussenvoegsel" runat="server" CssClass="textboxchaos"></asp:TextBox></td>
                <td style="width: 40%">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Gebruik alleen letters." ControlToValidate="TxBtussenvoegsel" ValidationExpression="^[a-zA-Z -]*$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator></td>

            </tr>
            <tr>

                <td style="width: 15%">
                    <asp:Label ID="Label5" runat="server" Text="Achternaam:" CssClass="labelsnieuw"></asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox ID="TxBAchternaam" runat="server" CssClass="textboxchaos"></asp:TextBox></td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxBAchternaam" ErrorMessage="Dit veld is verplicht." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Gebruik alleen letters." ControlToValidate="TxBAchternaam" ValidationExpression="^[a-zA-Z -]*$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>

                <td style="width: 15%">
                    <asp:Label ID="label4" runat="server" Text="Geboortedatum:" CssClass="labelsnieuw"></asp:Label></td>
                <td style="width: 15%">
                    <asp:TextBox ID="TxBGeboortedatum" runat="server" CssClass="textboxchaos" TextMode="Date"></asp:TextBox></td>
                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxBGeboortedatum" ErrorMessage="Dit veld is verplicht." ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Datum moet ingevult zijn als  jjjj-mm-dd." ControlToValidate="TxBGeboortedatum" ValidationExpression="^(19|20)?\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TxBGeboortedatum" ErrorMessage="Geboortedatum kan niet in de toekomst zijn." ForeColor="Red"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Reserveringnummer:"></asp:Label></td>
                <td>
                    <asp:Label ID="lblReserveringnummer" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
        <br />
        <asp:Label ID="lblOutput" runat="server" CssClass="labelsnieuw"></asp:Label>
        <br />




        
        

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="content-table" DataKeyNames="volgnummer,ReserveringNummer2" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="volgnummer" HeaderText="volgnummer" InsertVisible="False" ReadOnly="True" SortExpression="volgnummer" />
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




        
        

        <asp:Label ID="lblControle" runat="server" Visible="False"></asp:Label>




        
        

        <br />
        <asp:Button ID="btnBevestigen" runat="server" Click="btnBevestigen_Click1" Text="Bevestigen" OnClick="btnBevestigen_Click" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" />

        <asp:Button ID="btnToevoegen" runat="server" OnClick="btnToevoegen_Click1" Text="Toevoegen" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" />
        <br />
        <br />
        

        

    </div>

</asp:Content>
