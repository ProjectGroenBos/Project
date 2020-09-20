<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="Prijstabel.aspx.cs" Inherits="ProjectGroenBos.Financien.WebForm2" %>

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
        <asp:GridView ID="gvBungalow" CssClass="content-table tweedetable" GridLines="None" DataKeyNames="Code" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                
                <asp:BoundField DataField="Code" HeaderText="Code" ReadOnly="True" SortExpression="Code" />
                <asp:BoundField DataField="Prijs_per_Week" HeaderText="Prijs per Week" SortExpression="Prijs_per_Week" />
                <asp:BoundField DataField="Prijs_per_Midweek" HeaderText="Prijs per Midweek" SortExpression="Prijs_per_Midweek" />
                <asp:BoundField DataField="Prijs_per_weekend" HeaderText="Prijs per weekend" SortExpression="Prijs_per_weekend" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>

        <h2>Seizoentoeslag<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Code], [Prijs per Week] AS Prijs_per_Week, [Prijs per Midweek] AS Prijs_per_Midweek, [Prijs per weekend] AS Prijs_per_weekend FROM [Bungalowtype]" UpdateCommand="UPDATE [Bungalowtype] SET [Prijs per Week] = @Prijs_per_Week, [Prijs per Midweek] = @Prijs_per_Midweek, [Prijs per weekend] = @Prijs_per_weekend WHERE [Code] = @Code" DeleteCommand="DELETE FROM [Bungalowtype] WHERE [Code] = @Code" InsertCommand="INSERT INTO [Bungalowtype] ([Code], [Prijs per Week], [Prijs per Midweek], [Prijs per weekend]) VALUES (@Code, @Prijs_per_Week, @Prijs_per_Midweek, @Prijs_per_weekend)">

            <DeleteParameters>
                <asp:Parameter Name="Code" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Code" Type="String" />
                <asp:Parameter Name="Prijs_per_Week" Type="Single" />
                <asp:Parameter Name="Prijs_per_Midweek" Type="Single" />
                <asp:Parameter Name="Prijs_per_weekend" Type="Single" />
            </InsertParameters>

            <UpdateParameters>
                <asp:Parameter Name="Prijs_per_Week" Type="Single" />
                <asp:Parameter Name="Prijs_per_Midweek" Type="Single" />
                <asp:Parameter Name="Prijs_per_weekend" Type="Single" />
                <asp:Parameter Name="Code" Type="String" />
            </UpdateParameters>

        </asp:SqlDataSource>

        </h2>
        <asp:GridView ID="gvSeizoentoeslag" CssClass="content-table tweedetable" GridLines="None" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3"  DataKeyNames="ID">
            <Columns>
                <asp:BoundField DataField="BungalowtypeCode" HeaderText="Code" SortExpression="BungalowtypeCode" />
                <asp:BoundField DataField="Seizoen" HeaderText="Seizoen" SortExpression="Seizoen" />
                
                
                
                <asp:BoundField DataField="Seizoen" HeaderText="Seizoen" SortExpression="Seizoen" ReadOnly="True"/>
                <asp:BoundField DataField="BungalowtypeCode" HeaderText="BungalowtypeCode" SortExpression="BungalowtypeCode" ReadOnly="True"/>
                <asp:BoundField DataField="Bedrag" HeaderText="Bedrag" SortExpression="Bedrag" />
                <asp:CommandField ShowEditButton="True"/>
                
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Seizoen], [BungalowtypeCode], [Bedrag], [ID] FROM [Seizoensopslag]" DeleteCommand="DELETE FROM [Seizoensopslag] WHERE [ID] = @original_ID" InsertCommand="INSERT INTO [Seizoensopslag] ([Seizoen], [BungalowtypeCode], [Bedrag]) VALUES (@Seizoen, @BungalowtypeCode, @Bedrag)" UpdateCommand="UPDATE [Seizoensopslag] SET [Bedrag] = @Bedrag WHERE [ID] = @original_ID" OldValuesParameterFormatString="original_{0}">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Seizoen" Type="String" />
                <asp:Parameter Name="BungalowtypeCode" Type="String" />
                <asp:Parameter Name="Bedrag" Type="Single" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Seizoen" Type="String" />
                <asp:Parameter Name="BungalowtypeCode" Type="String" />
                <asp:Parameter Name="Bedrag" Type="Single" />
                <asp:Parameter Name="original_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
