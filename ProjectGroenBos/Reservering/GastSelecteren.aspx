<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="GastSelecteren.aspx.cs" Inherits="ProjectGroenBos.KlantSelecteren" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <h1>Selecteer de gast voor de reservering</h1>
    <br />
    <p>Selecteer de gast door middel van achternaam en woonplaats. Als je de gast niet kan vinden,<br />  moet er een nieuw gastnummer worden aangemaakt inclusief gastgegevens.</p>
    
    <br />
    <asp:Label ID="Label1" runat="server" Text="Achternaam" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbAchternaam" runat="server" CssClass="textboxchaos"></asp:TextBox>
    
    <br />
    <asp:Label ID="Label2" runat="server" Text="Email" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbEmail" runat="server" CssClass="textboxchaos"></asp:TextBox>
    
    <br />
    <asp:Label ID="Label3" runat="server" Text="Telefoonnummer" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbTelefoonnummer" runat="server" CssClass="textboxchaos"></asp:TextBox>
    
    <br />
    <asp:Button ID="btnZoek" runat="server" Text="Zoek gast" CssClass="btnUitloggen" OnClick="btnZoek_Click" style="background-color: #009879; color: #fff" class="btn"/>
    <asp:Button ID="btnGastAanmaken" runat="server" Text="Gast aanmaken" CssClass="btnUitloggen" OnClick="btnGastAanmaken_Click" style="background-color: #009879; color: #fff" class="btn"/>
    
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" CssClass="content-table" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Gastnummer" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
        <Columns>
            <asp:ButtonField HeaderText="Selecteer gast" Text="Selecteer" />
            <asp:BoundField DataField="Gastnummer" HeaderText="Gastnummer" SortExpression="Gastnummer" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
            <asp:BoundField DataField="Tussenvoegsel" HeaderText="Tussenvoegsel" SortExpression="Tussenvoegsel" />
            <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" />
            <asp:BoundField DataField="Telefoonnummer" HeaderText="Telefoonnummer" SortExpression="Telefoonnummer" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="select top(10) Nummer as [Gastnummer], Voornaam, Tussenvoegsel, Achternaam, Telefoonnummer, Email 
from Gast 
where Achternaam like '%'+@achternaam+'%' and Telefoonnummer like '%'+@telefoonnummer+'%' and Email like '%'+@email+'%'
order by Nummer desc">
        <SelectParameters>
            <asp:ControlParameter ControlID="txbAchternaam" DefaultValue="%" Name="achternaam" PropertyName="Text" />
            <asp:ControlParameter ControlID="txbTelefoonnummer" DefaultValue="%" Name="telefoonnummer" PropertyName="Text" />
            <asp:ControlParameter ControlID="txbEmail" DefaultValue="%" Name="email" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
