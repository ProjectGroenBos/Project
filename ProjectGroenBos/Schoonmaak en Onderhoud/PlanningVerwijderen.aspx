<%@ Page Title="Planning Verwijderen" Language="C#" MasterPageFile="Schoonmaak.Master" AutoEventWireup="true" CodeBehind="PlanningVerwijderen.aspx.cs" Inherits="ProjectGroenBos.Schoonmaak_en_Onderhoud.PlanningVerwijderen" %>
<asp:Content ID="PlanningVerwijderen" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
        <br />
    <br />
        <br />
<div class="form-row">
    <div style="text-align:center;">
    <h1 class="text-primary">Planning Verwijderen</h1>
        </div>
    <div class="row col-sm-12">
       <div class="col-sm-12" style="text-align: center">
           <br />

           <hr />
           <br />
          </div>
        </div>
    </div>
    <div>
        <center>
            <asp:GridView ID="GridView1" Width="75%" runat="server" AutoGenerateColumns="False" DataKeyNames="Nummer" DataSourceID="SqlDataSource1" AllowPaging="True">
                <Columns>
                <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
                <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
                <asp:BoundField DataField="BungalowNummer" HeaderText="Bungalownummer" SortExpression="BungalowNummer" />
                <asp:BoundField DataField="Naam" HeaderText="Medewerker" SortExpression="MedewerkerNaam" />
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/deleteRow.png" ShowDeleteButton="True" />
                </Columns>
                 <AlternatingRowStyle BackColor="#f0f0f0" />
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="#0E6251" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#0E6251" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#0E6251" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="btnTerug" runat="server" BackColor="#0E6251" BorderColor="#0E6251" CssClass="buttonstyle" ForeColor="White" OnClick="btnTerug_Click" Text="Terug naar Overzicht" />
            <br />
        </center>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT Medewerker.Naam, Schoonmaakopdracht.Nummer, Datum, Omschrijving, BungalowNummer, MedewerkerNummer  FROM [Schoonmaakopdracht] left join Medewerker on Medewerker.Nummer = Schoonmaakopdracht.MedewerkerNummer" DeleteCommand="delete from Schoonmaakopdracht where nummer = @nummer">
            <DeleteParameters>
                <asp:Parameter Name="nummer" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>