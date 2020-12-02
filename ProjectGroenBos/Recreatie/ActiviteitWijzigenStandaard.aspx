<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="ActiviteitWijzigenStandaard.aspx.cs" Inherits="recreatie.paginas.ActiviteitWijzigenStandaard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Activiteit Wijzigen</div>
         <asp:GridView ID="GridView1"  CssClass="content-table2" runat="server" AutoGenerateColumns="False" style="max-width:10%" AllowPaging="True" GridLines="None" AutoGenerateEditButton="True">
        </asp:GridView>
    <asp:HiddenField ID="MedewerkerID" runat="server"
                                    Value='' />
     <asp:HiddenField ID="FaciliteitID" runat="server"
                                    Value='' />
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select Nummer, Activiteitnaam, Locatie, Inschrijfkosten, [Maximaal aantal] as 'MaximaalAantal', Omschrijving, Datum, Begintijd, Eindtijd, Naam, MedewerkerID, FaciliteitID from vactiviteit where Nummer = @nummer" UpdateCommand="update [dbo].[Activiteit] set [Naam] = @ActiviteitNaam , [Locatie]= @Locatie, [Inschrijfkosten] = @Inschrijfkosten, [FaciliteitID] = @FaciliteitID, [Begintijd] = @Begintijd, [Maximaal aantal] = @MaximaalAantal, [Datum] = @Datum, [Eindtijd] = @Eindtijd, [MedewerkerID] = @MedewerkerID Where Nummer = @Nummer">
            <UpdateParameters>
                <asp:Parameter Name="ActiviteitNaam" />
                <asp:Parameter Name="Locatie" />
                <asp:Parameter Name="Inschrijfkosten" />
                 <asp:ControlParameter
                    Name="FaciliteitID"
                    ControlID="FaciliteitID"
                    PropertyName="Value" />
                <asp:Parameter Name="Begintijd" />
                <asp:Parameter Name="MaximaalAantal" />  
                <asp:Parameter Name="Datum" DbType="Date" />
                <asp:Parameter Name="Eindtijd" />
                <asp:ControlParameter
                    Name="MedewerkerID"
                    ControlID="MedewerkerID"
                    PropertyName="Value" />
                <asp:Parameter Name="Nummer" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>