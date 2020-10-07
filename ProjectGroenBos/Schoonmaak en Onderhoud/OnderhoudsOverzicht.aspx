<%@ Page Title="Overzicht Onderhoud" Language="C#" AutoEventWireup="true"  MasterPageFile="Schoonmaak.Master" CodeBehind="OnderhoudsOverzicht.aspx.cs" Inherits="ProjectGroenBos.Schoonmaak_en_Onderhoud.OnderhoudsOverzicht" %>
<asp:Content ID="OnderhoudsOverzicht" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <br />
    <br />
    <br />
    <br />
    <br />
        <br />

<div class="form-row" style="text-align:center;">
    <h1 class="text-primary"> Overzicht Onderhoud</h1>
    <p class="text-primary"></p>
    <br />
    <div class="row col-sm-12">
       <div class="col-sm-12" style="text-align:center;">
          <asp:Button ID="Button2" runat="server" Text="Onderhoud Toevoegen" BackColor="#0E6251" OnClick="Button2_Click" Width="218px" BorderColor="#0E6251" ForeColor="White"/>
           <br />
           <br />
           <hr />
          </div>

 <div class="col-xs-3">
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
        <br />

<div id="divZoek" runat="server" class="col-xs-6">
        <asp:Label ID="lblNM" runat="server" Text="Naam Medewerker:"></asp:Label>
&nbsp;<asp:TextBox ID="naamTxtbox" runat="server" Width="174px"></asp:TextBox>
    &nbsp;<br />
        <br />
        <asp:Button ID="btnAndersZoeken" runat="server" BackColor="#0E6251" BorderColor="#0E6251" Height="26px" OnClick="btnAndersZoeken_Click1" Text="Anders Zoeken" Width="160px" ForeColor="White" />
&nbsp;
     <asp:Button ID="btnZoek" runat="server" BackColor="#0E6251" BorderColor="#0E6251" Height="26px" OnClick="btnZoek_Click" Text="Zoek" Width="68px" ForeColor="White" />
        <br />
        <br />
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Visible="False">
        <asp:ListItem>Startdatum</asp:ListItem>
        <asp:ListItem>Bungalownummer</asp:ListItem>
    </asp:DropDownList>
     &nbsp;<asp:TextBox ID="searchBox" runat="server" CssClass="form-control" TextMode="SingleLine" CausesValidation="True" Width="185px" Visible="False"></asp:TextBox>
     &nbsp;&nbsp;
</div>
<div class="col-xs-3" style="margin-left:auto; margin-right:auto;">
   <label for="ex3" style="color:rgba(0, 0, 0, 0)"></label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="select Onderhoudsopdracht.Nummer, Medewerker.Naam, Startdatum, VerwachteEinddatum, Kosten, BungalowNummer, OnderhoudsstatusID, Onderhoudtype, DatumvanConstatering  from Onderhoudsopdracht left join Medewerker on Medewerker.Nummer = Onderhoudsopdracht.MedewerkerNummer" DeleteCommand="delete from Onderhoudsopdracht where nummer = @nummer"></asp:SqlDataSource>
    <center>
    <asp:GridView ID="OverzichtGrid" runat="server" AutoGenerateColumns="False" BackColor="White" Width="80%" BorderColor="#0E6251" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" DataKeyNames="Nummer" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" >
        <AlternatingRowStyle BackColor="#f0f0f0" />
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="Startdatum" HeaderText="Startdatum" SortExpression="Startdatum"/>
            <asp:BoundField DataField="VerwachteEinddatum" HeaderText="Verwachte Einddatum" SortExpression="VerwachteEinddatum" />
            <asp:BoundField DataField="Kosten" HeaderText="Kosten" SortExpression="Kosten"  />
            <asp:BoundField DataField="BungalowNummer" HeaderText="Bungalow" SortExpression="BungalowNummer" />
            <asp:BoundField DataField="OnderhoudsstatusID" HeaderText="Status" SortExpression="OnderhoudsstatusID" />
            <asp:BoundField DataField="Onderhoudtype" HeaderText="Onderhoudtype" SortExpression="Onderhoudtype" />
            <asp:BoundField DataField="DatumvanConstatering" HeaderText="Datum Constatering" SortExpression="DatumvanConstatering" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/deleteRow.png" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="#0E6251" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="Black" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
        </center>
    <center>
    <asp:GridView ID="datumGrid" runat="server" AutoGenerateColumns="False" BackColor="White" Width="80%" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" DataKeyNames="Nummer" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#f0f0f0" />
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="Startdatum" HeaderText="Startdatum" SortExpression="Startdatum" />
            <asp:BoundField DataField="VerwachteEinddatum" HeaderText="Verwachte Einddatum" SortExpression="VerwachteEinddatum" />
            <asp:BoundField DataField="Kosten" HeaderText="Kosten" SortExpression="Kosten" />
            <asp:BoundField DataField="BungalowNummer" HeaderText="Bungalow" SortExpression="BungalowNummer" />
            <asp:BoundField DataField="OnderhoudsstatusID" HeaderText="Status" SortExpression="OnderhoudsstatusID" />
            <asp:BoundField DataField="Onderhoudtype" HeaderText="Onderhoudtype" SortExpression="Onderhoudtype" />
            <asp:BoundField DataField="DatumvanConstatering" HeaderText="Datum Constatering" SortExpression="DatumvanConstatering" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/deleteRow.png" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="#0E6251" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="Black" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
        </center>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="select Onderhoudsopdracht.Nummer, Medewerker.Naam, Startdatum, VerwachteEinddatum, Kosten, BungalowNummer, OnderhoudsstatusID, Onderhoudtype, DatumvanConstatering  from Onderhoudsopdracht left join Medewerker on Medewerker.Nummer = Onderhoudsopdracht.MedewerkerNummer WHERE ([Startdatum] = @searchBox)"  DeleteCommand="delete from Onderhoudsopdracht where nummer = @nummer">
        <SelectParameters>
            <asp:ControlParameter ControlID="searchBox" Name="searchBox" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <center>
    <asp:GridView ID="bungalowGrid" runat="server" AutoGenerateColumns="False" BackColor="White" Width="80%" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" DataKeyNames="Nummer" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#f0f0f0" />
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="Startdatum" HeaderText="Startdatum" SortExpression="Startdatum" />
            <asp:BoundField DataField="VerwachteEinddatum" HeaderText="Verwachte Einddatum" SortExpression="VerwachteEinddatum" />
            <asp:BoundField DataField="Kosten" HeaderText="Kosten" SortExpression="Kosten" />
            <asp:BoundField DataField="BungalowNummer" HeaderText="Bungalow" SortExpression="BungalowNummer" />
            <asp:BoundField DataField="OnderhoudsstatusID" HeaderText="Status" SortExpression="OnderhoudsstatusID" />
            <asp:BoundField DataField="Onderhoudtype" HeaderText="Onderhoudtype" SortExpression="Onderhoudtype" />
            <asp:BoundField DataField="DatumvanConstatering" HeaderText="Datum Constatering" SortExpression="DatumvanConstatering" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/deleteRow.png" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="#0E6251" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="Black" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
        </center>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="select Onderhoudsopdracht.Nummer, Medewerker.Naam, Startdatum, VerwachteEinddatum, Kosten, BungalowNummer, OnderhoudsstatusID, Onderhoudtype, DatumvanConstatering  from Onderhoudsopdracht left join Medewerker on Medewerker.Nummer = Onderhoudsopdracht.MedewerkerNummer WHERE ([BungalowNummer] = @searchBox)"  DeleteCommand="delete from Onderhoudsopdracht where nummer = @nummer">
        <SelectParameters>
            <asp:ControlParameter ControlID="searchBox" Name="searchBox" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <center>
    <asp:GridView ID="naamGrid" runat="server" AutoGenerateColumns="False" BackColor="White" Width="80%" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" DataKeyNames="Nummer" DataSourceID="SqlDataSource4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#f0f0f0" />
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="Startdatum" HeaderText="Startdatum" SortExpression="Startdatum" />
            <asp:BoundField DataField="VerwachteEinddatum" HeaderText="Verwachte Einddatum" SortExpression="VerwachteEinddatum" />
            <asp:BoundField DataField="Kosten" HeaderText="Kosten" SortExpression="Kosten" />
            <asp:BoundField DataField="BungalowNummer" HeaderText="Bungalow" SortExpression="BungalowNummer" />
            <asp:BoundField DataField="OnderhoudsstatusID" HeaderText="Status" SortExpression="OnderhoudsstatusID" />
            <asp:BoundField DataField="Onderhoudtype" HeaderText="Onderhoudtype" SortExpression="Onderhoudtype" />
            <asp:BoundField DataField="DatumvanConstatering" HeaderText="Datum Constatering" SortExpression="DatumvanConstatering" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/deleteRow.png" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
       <HeaderStyle BackColor="#0E6251" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="Black" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    </center>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="select Onderhoudsopdracht.Nummer, Medewerker.Naam, Startdatum, VerwachteEinddatum, Kosten, BungalowNummer, OnderhoudsstatusID, Onderhoudtype, DatumvanConstatering  from Onderhoudsopdracht left join Medewerker on Medewerker.Nummer = Onderhoudsopdracht.MedewerkerNummer WHERE ([Naam] = @searchBox)"  DeleteCommand="delete from Onderhoudsopdracht where nummer = @nummer">
        <SelectParameters>
            <asp:ControlParameter ControlID="searchBox" Name="searchBox" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" Width="80%" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" DataKeyNames="Nummer" DataSourceID="SqlDataSource5" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#f0f0f0" />
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="Startdatum" HeaderText="Startdatum" SortExpression="Startdatum" />
            <asp:BoundField DataField="VerwachteEinddatum" HeaderText="Verwachte Einddatum" SortExpression="VerwachteEinddatum" />
            <asp:BoundField DataField="Kosten" HeaderText="Kosten" SortExpression="Kosten" />
            <asp:BoundField DataField="BungalowNummer" HeaderText="Bungalow" SortExpression="BungalowNummer" />
            <asp:BoundField DataField="OnderhoudsstatusID" HeaderText="Status" SortExpression="OnderhoudsstatusID" />
            <asp:BoundField DataField="Onderhoudtype" HeaderText="Onderhoudtype" SortExpression="Onderhoudtype" />
            <asp:BoundField DataField="DatumvanConstatering" HeaderText="Datum Constatering" SortExpression="DatumvanConstatering" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/deleteRow.png" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="#0E6251" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="Black" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    </center>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="select Onderhoudsopdracht.Nummer, Medewerker.Naam, Startdatum, VerwachteEinddatum, Kosten, BungalowNummer, OnderhoudsstatusID, Onderhoudtype, DatumvanConstatering  from Onderhoudsopdracht left join Medewerker on Medewerker.Nummer = Onderhoudsopdracht.MedewerkerNummer WHERE ([Naam] = @naamTxtbox)"  DeleteCommand="delete from Onderhoudsopdracht where nummer = @nummer">
        <SelectParameters>
            <asp:ControlParameter ControlID="naamTxtbox" Name="naamTxtbox" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    
</div>

    </div>
    </div>

<%--<div class="col-xs-3">
  <label for="ex1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Zoek op:</label>                          
</div>

 

<div id="divZoek" runat="server" class="col-xs-6">
     <label ID="txtZoek" runat="server" for="ex3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Voer het onderhoudsnummer in:</label>

 

     <asp:Label ID="lblErrror" runat="server" ForeColor="Red"></asp:Label>
     <asp:TextBox ID="searchBox" runat="server" CssClass="form-control" TextMode="SingleLine" CausesValidation="True" OnTextChanged="searchBox_TextChanged" Width="149px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Zoek" OnClick="Button1_Click" BackColor="#7FB241" BorderColor="#7FB241" />
     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="searchBox" ErrorMessage="Voer een getal in." ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
&nbsp;&nbsp;&nbsp;&nbsp;
     <br />
     <hr />
</div>
<div class="col-xs-3">
   <label for="ex3" style="color:rgba(0, 0, 0, 0)"></label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [Onderhoudsopdracht]"></asp:SqlDataSource>
    <br />
    <div style="text-align:center;">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"> </asp:PlaceHolder>
    </div>--%>

    <br />

</asp:Content>

