<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="ActiviteitWijzigen.aspx.cs" Inherits="recreatie.paginas.ActiviteitWijzigen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <asp:GridView ID="GridView1"  CssClass="content-table tweedetable" runat="server" AutoGenerateColumns="False" DataKeyNames="Nummer" style="max-width:10%" DataSourceID="SqlDataSource5" AllowPaging="True" GridLines="None">
            <Columns>
                <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="True" SortExpression="Nummer" />
                <asp:BoundField DataField="Activiteitnaam" HeaderText="Activiteitnaam" SortExpression="Activiteitnaam" />
                <asp:BoundField DataField="Locatie" HeaderText="Locatie" SortExpression="Locatie" />
                <asp:BoundField DataField="Inschrijfkosten" HeaderText="Inschrijfkosten" SortExpression="Inschrijfkosten" />
                <asp:BoundField DataField="MaximaalAantal" HeaderText="Maximaal aantal" SortExpression="MaximaalAantal" />
                <asp:TemplateField HeaderText="Omschrijving" SortExpression="Omschrijving">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Omschrijving" DataValueField="ID" SelectedValue='<%# Bind("FaciliteitID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [ID], [Omschrijving] FROM [Faciliteit]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Omschrijving") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Datum" HeaderText="Datum" ApplyFormatInEditMode="true" DataFormatString="{0:dd/MM/yyyy}" SortExpression="Datum" />
                <asp:BoundField DataField="Begintijd" HeaderText="Begintijd" SortExpression="Begintijd" />
                <asp:BoundField DataField="Eindtijd" HeaderText="Eindtijd" SortExpression="Eindtijd" />
                <asp:TemplateField HeaderText="Naam" SortExpression="Naam">
             
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Naam" DataValueField="Nummer" SelectedValue='<%# Bind("MedewerkerID") %>' AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Nummer], [Naam] FROM [Medewerker]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Label ID="Label1" runat="server" Text='<%# Bind("Naam") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="FaciliteitID" HeaderText="FaciliteitID" Visible="False" />
            </Columns>
        </asp:GridView>

    <asp:HiddenField ID="MedewerkerID" runat="server"
                                    Value='' />
     <asp:HiddenField ID="FaciliteitID" runat="server"
                                    Value='' />
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select Nummer, Activiteitnaam, Locatie, Inschrijfkosten, [Maximaal aantal] as 'MaximaalAantal', Omschrijving, Datum, Begintijd, Eindtijd, Naam, MedewerkerID, FaciliteitID from vactiviteit" UpdateCommand="update [dbo].[Activiteit] set [Naam] = @ActiviteitNaam , [Locatie]= @Locatie, [Inschrijfkosten] = @Inschrijfkosten, [FaciliteitID] = @FaciliteitID, [Begintijd] = @Begintijd, [Maximaal aantal] = @MaximaalAantal, [Datum] = @Datum, [Eindtijd] = @Eindtijd, [MedewerkerID] = @MedewerkerID Where Nummer = @Nummer">
            <UpdateParameters>
                <asp:Parameter Name="ActiviteitNaam" />
                <asp:Parameter Name="Locatie" />
                <asp:Parameter Name="Inschrijfkosten" />
                <asp:Parameter Name="Begintijd" />
                <asp:Parameter Name="MaximaalAantal" />  
                <asp:Parameter Name="Datum" DbType="Date" />
                <asp:Parameter Name="Eindtijd" />
                <asp:ControlParameter
                    Name="MedewerkerID"
                    ControlID="MedewerkerID"
                    PropertyName="Value" />
                <asp:Parameter Name="Nummer" />
                 <asp:ControlParameter
                    Name="FaciliteitID"
                    ControlID="FaciliteitID"
                    PropertyName="Value" />
                <asp:Parameter Name="Nummer" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>