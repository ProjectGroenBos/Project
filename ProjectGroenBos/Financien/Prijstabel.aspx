<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="Prijstabel.aspx.cs" Inherits="ProjectGroenBos.Financien.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Prijsmanagement</div>
    <div class="container">
        <h2>Seizoensindeling 2020-2021</h2>
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
        <h2>Feestdagen 2020-2021</h2>
        <asp:GridView ID="gvFeesdagen" CssClass="content-table eerstetable" GridLines="None" DataKeyNames="ID" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam"  ReadOnly="True" />
                <asp:BoundField DataField="Opslagfactor" HeaderText="Opslagfactor" SortExpression="Opslagfactor" />
                <asp:BoundField DataField="Begindatum" HeaderText="Begindatum" SortExpression="Begindatum" DataFormatString="{0:dd/MM/yyyy}" ApplyFormatInEditMode="true"/>
                <asp:BoundField DataField="Einddatum" HeaderText="Einddatum" SortExpression="Einddatum" DataFormatString="{0:dd/MM/yyyy}" ApplyFormatInEditMode="true"/>
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT ID, naam, Opslagfactor, Begindatum, einddatum FROM [Feestdag] ORDER BY [Begindatum], [Einddatum]" InsertCommand="INSERT INTO [Feestdag] ([Naam], [Opslagfactor], [Begindatum], [Einddatum]) VALUES (@Naam, @Opslagfactor, @Begindatum, @Einddatum)" UpdateCommand="Update Feestdag SET [Begindatum] = Convert(datetime, @Begindatum,104), [Einddatum] = Convert(datetime,@Einddatum,104), Opslagfactor = @Opslagfactor Where [ID] = @ID">

            <UpdateParameters>
                <asp:Parameter Name="ID" />
                <asp:Parameter Name="Opslagfactor" />
                <asp:Parameter Name="Begindatum" />
                <asp:Parameter Name="Einddatum" />
            </UpdateParameters>         
            <InsertParameters>
                <asp:Parameter Name="Naam" Type="String" />
                <asp:Parameter Name="Opslagfactor" Type="Single" />
                <asp:Parameter DbType="Date" Name="Begindatum" />
                <asp:Parameter DbType="Date" Name="Einddatum" />
            </InsertParameters>
        </asp:SqlDataSource>

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
                <asp:BoundField DataField="Prijs_per_Week" HeaderText="Prijs per Week" SortExpression="Prijs_per_Week" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Prijs_per_Midweek" HeaderText="Prijs per Midweek" SortExpression="Prijs_per_Midweek" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Prijs_per_weekend" HeaderText="Prijs per weekend" SortExpression="Prijs_per_weekend" DataFormatString="{0:C}" />
                <asp:CommandField ShowEditButton="True"  />
            </Columns>
        </asp:GridView>

        <h2>Seizoentoeslag<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Code], CAST([Prijs per Week] as DECIMAL(9,2)) AS Prijs_per_Week, CAST([Prijs per Midweek] as DECIMAL(9,2)) AS Prijs_per_Midweek, CAST([Prijs per weekend] as DECIMAL(9,2)) AS Prijs_per_weekend FROM [Bungalowtype]" UpdateCommand="UPDATE [Bungalowtype] SET [Prijs per Week] = @Prijs_per_Week, [Prijs per Midweek] = @Prijs_per_Midweek, [Prijs per weekend] = @Prijs_per_weekend WHERE [Code] = @Code" DeleteCommand="DELETE FROM [Bungalowtype] WHERE [Code] = @Code" InsertCommand="INSERT INTO [Bungalowtype] ([Code], [Prijs per Week], [Prijs per Midweek], [Prijs per weekend]) VALUES (@Code, @Prijs_per_Week, @Prijs_per_Midweek, @Prijs_per_weekend)">

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
                
                
   
                
                
                <asp:BoundField DataField="BungalowtypeCode" HeaderText="Bungalowtype" SortExpression="BungalowtypeCode" ReadOnly="True"/>
                <asp:BoundField DataField="SeizoenID" HeaderText="SeizoenID" SortExpression="SeizoenID" ReadOnly="True" ItemStyle-CssClass="hideGridColumn" HeaderStyle-CssClass="hideGridColumn"/>
                <asp:BoundField DataField="Seizoen" HeaderText="Seizoen" SortExpression="Seizoen" ReadOnly="True"/>
                <asp:BoundField DataField="Toeslag_week" HeaderText="Toeslag week" SortExpression="Toeslag_week" DataFormatString="{0:C}" />
                
                <asp:BoundField DataField="Toeslag_midweek" HeaderText="Toeslag midweek" SortExpression="Toeslag_midweek" DataFormatString="{0:C}"  />
                <asp:BoundField DataField="Toeslag_weekend" HeaderText="Toeslag weekend" SortExpression="Toeslag_weekend" DataFormatString="{0:C}"  />
                
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [ID], [BungalowtypeCode], [SeizoenID], [Seizoen], [Toeslag week] AS Toeslag_week, [Toeslag midweek] AS Toeslag_midweek, [Toeslag weekend] AS Toeslag_weekend FROM [Seizoensopslag]" DeleteCommand="DELETE FROM [Seizoensopslag] WHERE [ID] = @original_ID AND [BungalowtypeCode] = @original_BungalowtypeCode AND [SeizoenID] = @original_SeizoenID AND [Seizoen] = @original_Seizoen AND [Toeslag week] = @original_Toeslag_week AND (([Toeslag midweek] = @original_Toeslag_midweek) OR ([Toeslag midweek] IS NULL AND @original_Toeslag_midweek IS NULL)) AND (([Toeslag weekend] = @original_Toeslag_weekend) OR ([Toeslag weekend] IS NULL AND @original_Toeslag_weekend IS NULL))" InsertCommand="INSERT INTO [Seizoensopslag] ([BungalowtypeCode], [SeizoenID], [Seizoen], [Toeslag week], [Toeslag midweek], [Toeslag weekend]) VALUES (@BungalowtypeCode, @SeizoenID, @Seizoen, @Toeslag_week, @Toeslag_midweek, @Toeslag_weekend)" UpdateCommand="UPDATE [Seizoensopslag] SET [Toeslag week] = @Toeslag_week, [Toeslag midweek] = @Toeslag_midweek, [Toeslag weekend] = @Toeslag_weekend WHERE [ID] = @original_ID AND [BungalowtypeCode] = @original_BungalowtypeCode AND [SeizoenID] = @original_SeizoenID AND [Seizoen] = @original_Seizoen AND [Toeslag week] = @original_Toeslag_week AND (([Toeslag midweek] = @original_Toeslag_midweek) OR ([Toeslag midweek] IS NULL AND @original_Toeslag_midweek IS NULL)) AND (([Toeslag weekend] = @original_Toeslag_weekend) OR ([Toeslag weekend] IS NULL AND @original_Toeslag_weekend IS NULL))" OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_BungalowtypeCode" Type="String" />
                <asp:Parameter Name="original_SeizoenID" Type="Int32" />
                <asp:Parameter Name="original_Seizoen" Type="String" />
                <asp:Parameter Name="original_Toeslag_week" Type="Single" />
                <asp:Parameter Name="original_Toeslag_midweek" Type="Single" />
                <asp:Parameter Name="original_Toeslag_weekend" Type="Single" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="BungalowtypeCode" Type="String" />
                <asp:Parameter Name="SeizoenID" Type="Int32" />
                <asp:Parameter Name="Seizoen" Type="String" />
                <asp:Parameter Name="Toeslag_week" Type="Single" />
                <asp:Parameter Name="Toeslag_midweek" Type="Single" />
                <asp:Parameter Name="Toeslag_weekend" Type="Single" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="BungalowtypeCode" Type="String" />
                <asp:Parameter Name="SeizoenID" Type="Int32" />
                <asp:Parameter Name="Seizoen" Type="String" />
                <asp:Parameter Name="Toeslag_week" Type="Single" />
                <asp:Parameter Name="Toeslag_midweek" Type="Single" />
                <asp:Parameter Name="Toeslag_weekend" Type="Single" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_BungalowtypeCode" Type="String" />
                <asp:Parameter Name="original_SeizoenID" Type="Int32" />
                <asp:Parameter Name="original_Seizoen" Type="String" />
                <asp:Parameter Name="original_Toeslag_week" Type="Single" />
                <asp:Parameter Name="original_Toeslag_midweek" Type="Single" />
                <asp:Parameter Name="original_Toeslag_weekend" Type="Single" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
