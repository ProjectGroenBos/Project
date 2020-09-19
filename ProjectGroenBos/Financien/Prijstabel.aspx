<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="Prijstabel.aspx.cs" Inherits="ProjectGroenBos.Financien.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Prijsmanagement</div>
    <div class="container">
        <h2>Seizoensindeling 2020</h2>
        <p>Dit is de indeling van elk seizoen met zijn begin en einddatum van de periode 2020/2021.</p>
        <asp:GridView ID="gvSeizoenen" CssClass="content-table eerstetable" GridLines="None" DataKeyNames="id" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="seizoen" InsertVisible="False" ReadOnly="True" HeaderText="Seizoen" SortExpression="seizoen" />
                <asp:BoundField DataField="begindatum" ApplyFormatInEditMode="true" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Begindatum" SortExpression="begindatum" />
                <asp:BoundField DataField="einddatum" ApplyFormatInEditMode="true" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Einddatum" SortExpression="einddatum" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select id, seizoen, begindatum, einddatum from seizoen" UpdateCommand="Update Seizoen SET [Begindatum] = Convert(datetime, @Begindatum,104), [Einddatum] = Convert(datetime,@Einddatum,104) Where [ID] = @ID">

            <UpdateParameters>
                <asp:Parameter Name="ID" />
                <asp:Parameter Name="Begindatum" />
                <asp:Parameter Name="Einddatum" />
            </UpdateParameters>
        </asp:SqlDataSource>


    </div>

    <div class="container">
        <h2>Bungalow prijzen per type</h2>
        <asp:GridView ID="gvBungalow" CssClass="content-table tweedetable" GridLines="None" DataKeyNames="CODE" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="Code" HeaderText="Typebungalow" ReadOnly="True" SortExpression="CODE" />
                <asp:BoundField DataField="Prijs per Week" HeaderText="Prijs per Week" SortExpression="PrijsperWeek" />
                <asp:BoundField DataField="Prijs per Midweek" HeaderText="Prijs per Midweek" SortExpression="PrijsperMidweek" />
                <asp:BoundField DataField="Prijs per weekend" HeaderText="Prijs per weekend" SortExpression="PrijsperWeekend" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select * from bungalowtype" UpdateCommand="Update bungalowtype set [Prijs per Week] = @PrijsperWeek Where Code = @CODE">

            <UpdateParameters>
                <asp:Parameter Name="PrijsperWeek" />
                <asp:Parameter Name="PrijsperMidweek" />
                <asp:Parameter Name="PrijsperWeekend" />
                <asp:Parameter Name="CODE" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <h2>Seizoentoeslag</h2>
        <asp:GridView ID="gvSeizoentoeslag" CssClass="content-table tweedetable" runat="server"></asp:GridView>
    </div>
</asp:Content>
