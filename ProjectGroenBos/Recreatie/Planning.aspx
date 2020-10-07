<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="Planning.aspx.cs" Inherits="recreatie.paginas.Planning" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/styleplanning.css" rel="stylesheet" />
    <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Names="Century Gothic" Font-Overline="False" Font-Size="X-Large" ForeColor="#757272" Text="Planning" CssClass="labelplanningq"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="Activiteit:" CssClass="labelplanning"></asp:Label>

    <asp:TextBox ID="TxbActiviteit" runat="server" CssClass="textboxplanningactiviteit"></asp:TextBox>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString2 %>" SelectCommand="SELECT * FROM [Activiteit]"></asp:SqlDataSource>

    <asp:Label ID="Label4" runat="server" Text="Locatie:" CssClass="labellocatie"></asp:Label>

    <asp:TextBox ID="txbLocatie" runat="server" CssClass="textboxlocatie"></asp:TextBox>



    <asp:Label ID="Label5" runat="server" Text="Aantal:" CssClass="labelaantal"></asp:Label>

    <asp:TextBox ID="TxbAantal" runat="server" CssClass="textboxaantal"></asp:TextBox>

    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="gridviewbegeleider" EmptyDataText="No data yet" OnRowDeleting="GridView2_RowDeleting">
        <Columns>
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>



    
    <asp:Label ID="Label6" runat="server" Text="Begeleider:" CssClass="labelbegeleider"></asp:Label>

    <asp:DropDownList ID="TxbMedewerker" runat="server" OnRowCommand="gvMedewerker_RowCommand" AutoPostBack="True" CssClass="textboxbegeleider" DataSourceID="SqlDataSource3" DataTextField="Naam" DataValueField="Nummer" OnSelectedIndexChanged="TxbMedewerker_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT [Nummer], [Naam] FROM [Medewerker]"></asp:SqlDataSource>



    <asp:Label ID="Label9" runat="server" Text="Datum:" CssClass="labelplanningdatum"></asp:Label>
    <asp:TextBox ID="TxbDatum" runat="server" CssClass="textboxdatum" TextMode="DateTime"></asp:TextBox>


    <asp:Label ID="Label7" runat="server" Text="Begintijd:" CssClass="labelbegintijd"></asp:Label>

    <asp:TextBox ID="TxbBegintijd" runat="server" CssClass="textboxbegintijd" TextMode="Time"></asp:TextBox>




    <asp:Label ID="Label8" runat="server" Text="Eindtijd:" CssClass="labeleindtijd"></asp:Label>

    <asp:TextBox ID="TxbEindtijd" runat="server" CssClass="textboxeindtijd" TextMode="Time"></asp:TextBox>
    <asp:Label ID="Label10" runat="server" CssClass="labelinschrijfkosten" Text="Inschrijfkosten:"></asp:Label>

    <asp:TextBox ID="txbInschrijfkosten" runat="server" CssClass="textboxinschrijfkosten"></asp:TextBox>


    <asp:Label ID="Label11" runat="server" CssClass="labelfaciliteit" Text="Faciliteit"></asp:Label>

    <asp:DropDownList ID="ddlFaciliteit" runat="server" DataSourceID="SqlDataSource4" DataTextField="Omschrijving" CssClass="textboxfaciliteit" DataValueField="ID"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT [ID], [Omschrijving] FROM [Faciliteit]"></asp:SqlDataSource>




    <asp:Button ID="btnActiviteitInplannen" runat="server" BackColor="#7FB241" CssClass="buttonactiviteiteninplannen" ForeColor="#FEFEFE" Text="Activiteiten Inplannen" OnClick="btnActiviteitInplannen_Click" />
    <asp:Label ID="LblBevestiging" runat="server" CssClass="labelbevestiging"></asp:Label>


    <asp:Calendar ID="Calendar1" runat="server" CssClass="kalender"></asp:Calendar>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Nummer" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" CssClass="gridviewplanning" Width="50px" Height="100px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="Locatie" HeaderText="Locatie" SortExpression="Locatie" />
            <asp:BoundField DataField="Inschrijfkosten" HeaderText="Inschrijfkosten" SortExpression="Inschrijfkosten" />
            <asp:BoundField DataField="Maximaal aantal" HeaderText="Maximaal aantal" SortExpression="Maximaal aantal" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
            <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" ReadOnly="True" DataFormatString="{0:d}" />
            <asp:BoundField DataField="Begintijd" HeaderText="Begintijd" SortExpression="Begintijd" ReadOnly="True" />
            <asp:BoundField DataField="Eindtijd" HeaderText="Eindtijd" SortExpression="Eindtijd" ReadOnly="True" />
            <asp:BoundField DataField="MedewerkerID" HeaderText="MedewerkerID" SortExpression="MedewerkerID" />
        </Columns>
        <Columns>
            <asp:CommandField SelectText="Wijzigen" ShowSelectButton="True" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT * FROM [vActiviteit]"></asp:SqlDataSource>

</asp:Content>
