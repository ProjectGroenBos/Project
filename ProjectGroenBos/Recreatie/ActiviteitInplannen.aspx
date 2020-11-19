<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="ActiviteitInplannen.aspx.cs" Inherits="recreatie.paginas.ActiviteitInplannen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Names="Century Gothic" Font-Overline="False" Font-Size="X-Large" Text="Planning" CssClass="labelplanning"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="Activiteit:" CssClass="labelactiviteit"></asp:Label>


    <asp:TextBox ID="TxbActiviteit" runat="server" CssClass="textboxplanningactiviteit"></asp:TextBox>
    <asp:RequiredFieldValidator ID="Activiteitvalidator" runat="server" ControlToValidate="TxbActiviteit" ErrorMessage="Vul een activiteit in" ForeColor="Red" CssClass="validatortxbactiviteit">Vul een activiteit in</asp:RequiredFieldValidator>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM [Activiteit]"></asp:SqlDataSource>

    <asp:Label ID="Label4" runat="server" Text="Locatie:" CssClass="labellocatie"></asp:Label>

    <asp:TextBox ID="txbLocatie" runat="server" CssClass="textboxlocatie"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocatie" runat="server" ControlToValidate="txbLocatie" ErrorMessage="Je moet een locatie invullen" ForeColor="Red" CssClass="validatorlocatie">Vul een locatie in</asp:RequiredFieldValidator>



    <asp:Label ID="Label5" runat="server" Text="Aantal:" CssClass="labelaantal"></asp:Label>

    <asp:TextBox ID="TxbAantal" runat="server" CssClass="textboxaantal"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBegeleider" runat="server" ControlToValidate="TxbAantal" ErrorMessage="RequiredFieldValidator" ForeColor="Red" CssClass="validatoraantal">Vul een aantal in</asp:RequiredFieldValidator>


    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="gridviewbegeleider" EmptyDataText="No data yet" OnRowDeleting="GridView2_RowDeleting">
        <Columns>
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>

    <asp:Label ID="Label6" runat="server" Text="Begeleider:" CssClass="labelbegeleider"></asp:Label>

    <asp:DropDownList ID="TxbMedewerker" runat="server" OnRowCommand="gvMedewerker_RowCommand" AutoPostBack="True" CssClass="textboxbegeleider" DataSourceID="SqlDataSource3" DataTextField="Naam" DataValueField="Nummer" OnSelectedIndexChanged="TxbMedewerker_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorBegeleider" runat="server" ControlToValidate="TxbMedewerker" ErrorMessage="RegularExpressionValidator" ValidationExpression="\d+" ForeColor="Red" CssClass="validatormedewerker">Vul een medewerker in</asp:RegularExpressionValidator>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Nummer], [Naam] FROM [Medewerker]"></asp:SqlDataSource>




    <asp:Label ID="Label9" runat="server" Text="Datum:" CssClass="labelplanningdatum"></asp:Label>

    <asp:TextBox ID="TxbDatum" runat="server" CssClass="textboxdatum" TextMode="DateTime"></asp:TextBox>
    <asp:CompareValidator ID="Datevalidator" runat="server" ControlToValidate="TxbDatum" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Date" ForeColor="Red" CssClass="validatordatumcompare">Onjuiste datum</asp:CompareValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDatum" runat="server" ControlToValidate="TxbDatum" ErrorMessage="RequiredFieldValidator" ForeColor="Red" CssClass="validatordatum">Vul een datum in</asp:RequiredFieldValidator>


    <asp:Label ID="Label7" runat="server" Text="Begintijd:" CssClass="labelbegintijd"></asp:Label>

    <asp:TextBox ID="TxbBegintijd" runat="server" CssClass="textboxbegintijd" TextMode="Time"></asp:TextBox>
    <!--
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxbBegintijd" ErrorMessage="Je moet een geldige tijd invullen" ValidationExpression="^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$" ForeColor="Red" CssClass="validatorgeldigetijd">Vul een geldige tijd in</asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBegintijd" runat="server" ControlToValidate="TxbBegintijd" ErrorMessage="RequiredFieldValidator" ForeColor="Red" CssClass="validatorbegintijd">Vul een begintijd in</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorBegintijd" runat="server" ControlToValidate="TxbBegintijd" ErrorMessage="Je moet een geldige tijd invullen" ValidationExpression="^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$" ForeColor="Red" CssClass="validatorgeldigetijd">Vul een geldige tijd in</asp:RegularExpressionValidator>
    !-->



    <asp:Label ID="Label8" runat="server" Text="Eindtijd:" CssClass="labeleindtijd"></asp:Label>

    <asp:TextBox ID="TxbEindtijd" runat="server" CssClass="textboxeindtijd" TextMode="Time"></asp:TextBox>
    <!--
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEindtijd" runat="server" ControlToValidate="TxbEindtijd" ErrorMessage="RequiredFieldValidator" ForeColor="Red" CssClass="validatoreindtijd">Vul een eindtijd in</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEindtijd" runat="server" ControlToValidate="TxbEindtijd" ErrorMessage="Het moet een geldige tijd zijn" ValidationExpression="^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$" ForeColor="Red" CssClass="validatorgeldigeeindtijd">Vul een geldige tijd in</asp:RegularExpressionValidator>
        !-->
    <asp:Label ID="Label10" runat="server" CssClass="labelinschrijfkosten" Text="Inschrijfkosten:"></asp:Label>

    <asp:TextBox ID="txbInschrijfkosten" runat="server" CssClass="textboxinschrijfkosten"></asp:TextBox>
    <asp:RangeValidator ID="RangeValidatorInschrijfkosten" runat="server" ControlToValidate="txbInschrijfkosten" ErrorMessage="RangeValidator" MaximumValue="25" MinimumValue="0" Type="Double" ForeColor="Red" CssClass="validatornulvijfentwintiginschrijfkosten">Vul een getal tussen 0 en 25 in</asp:RangeValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorInschrijfkosten" runat="server" ControlToValidate="txbInschrijfkosten" ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d{1,3}(\.\d{3})*(,\d{2})?$" ForeColor="Red" CssClass="validatorbedraginschrijfkosten">Vul een bedrag in</asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorInschrijfkosten" runat="server" ControlToValidate="txbInschrijfkosten" ErrorMessage="RequiredFieldValidator" ForeColor="Red" CssClass="validatorinschrijfkosten">Vul een getal in</asp:RequiredFieldValidator>



    <asp:Label ID="Label11" runat="server" CssClass="labelfaciliteit" Text="Faciliteit"></asp:Label>

    <asp:DropDownList ID="ddlFaciliteit" runat="server" DataSourceID="SqlDataSource4" DataTextField="Omschrijving" CssClass="textboxfaciliteit" DataValueField="ID"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [ID], [Omschrijving] FROM [Faciliteit]"></asp:SqlDataSource>




    <asp:Button ID="btnActiviteitInplannen" runat="server" BackColor="#117B66" CssClass="buttonactiviteiteninplannen" ForeColor="#FEFEFE" Text="Activiteiten Inplannen" OnClick="btnActiviteitInplannen_Click" />
    <asp:Label ID="LblBevestiging" runat="server" CssClass="labelbevestigingplanning"></asp:Label>


     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Nummer" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" CssClass="gridviewplanning" Width="50px" Height="100px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Activiteitnaam" HeaderText="Activiteitnaam" SortExpression="Activiteitnaam" />
            <asp:BoundField DataField="Locatie" HeaderText="Locatie" SortExpression="Locatie" />
            <asp:BoundField DataField="Inschrijfkosten" HeaderText="Inschrijfkosten" SortExpression="Inschrijfkosten" />
            <asp:BoundField DataField="Maximaal aantal" HeaderText="Maximaal aantal" SortExpression="Maximaal aantal" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
            <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" ReadOnly="True" />
            <asp:BoundField DataField="Begintijd" HeaderText="Begintijd" SortExpression="Begintijd" ReadOnly="True" />
            <asp:BoundField DataField="Eindtijd" HeaderText="Eindtijd" SortExpression="Eindtijd" ReadOnly="True" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="MedewerkerID" HeaderText="MedewerkerID" SortExpression="MedewerkerID" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM [vActiviteit]"></asp:SqlDataSource>
</asp:Content>