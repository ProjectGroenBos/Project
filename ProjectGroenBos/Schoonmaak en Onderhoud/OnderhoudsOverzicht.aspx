<%@ Page Title="Overzicht Onderhoud" Language="C#" AutoEventWireup="true"  MasterPageFile="Schoonmaak.Master" CodeBehind="OnderhoudsOverzicht.aspx.cs" Inherits="ProjectGroenBos.Schoonmaak_en_Onderhoud.OnderhoudsOverzicht" %>
<asp:Content ID="OnderhoudsOverzicht" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
        <br />

<div class="form-row" style="text-align:center;">
    <h1 class="text-primary">Overzicht Onderhoud</h1>
    <br />
    <div class="row col-sm-12">
       <div class="col-sm-12" style="text-align:center;">
          <asp:Button ID="Button2" runat="server" Text="Onderhoud Toevoegen" BackColor="#0E6251" OnClick="Button2_Click" BorderColor="#0E6251" ForeColor="White" EnableTheming="True" CssClass="buttonstyle"/>
           &nbsp;
           <asp:Button ID="btnWijzigscherm" runat="server" BackColor="#0E6251" BorderColor="#0E6251" CssClass="buttonstyle" ForeColor="White" OnClick="btnWijzigscherm_Click" Text="Onderhoud Wijzigen" />
           <br />
           <br />
           <hr />
          </div>

        <br />

<div id="divZoek" runat="server" class="col-xs-6">
<br />
    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="btnZoek_Click">
        <asp:ListItem Value="0">-- Selecteer --</asp:ListItem>
        <asp:ListItem>Startdatum</asp:ListItem>
        <asp:ListItem>Bungalownummer</asp:ListItem>
        <asp:ListItem>Status</asp:ListItem>
        <asp:ListItem>Type</asp:ListItem>
    </asp:DropDownList>
     &nbsp;<asp:TextBox ID="searchBox" runat="server" CssClass="form-control" TextMode="SingleLine" CausesValidation="True" Width="185px"></asp:TextBox>
   
&nbsp;<asp:Button ID="btnZoek" runat="server" BackColor="#0E6251" BorderColor="#0E6251" OnClick="btnZoek_Click" Text="Zoek" ForeColor="White" CssClass="buttonstyle" />
   
&nbsp;<br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="searchBox" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>
   
</div>
        <br />
<div class="col-xs-3" style="margin-left:auto; margin-right:auto;">
   <label for="ex3" style="color:rgba(0, 0, 0, 0)"></label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="select Nummer, Startdatum, VerwachteEinddatum, Kosten, BungalowNummer, OnderhoudsstatusID, Onderhoudtype, DatumvanConstatering  from Onderhoudsopdracht" DeleteCommand="delete from Onderhoudsopdracht where nummer = @nummer"></asp:SqlDataSource>
    <center>
    <asp:GridView ID="OverzichtGrid" runat="server" AutoGenerateColumns="False" BackColor="White" Width="80%" BorderColor="#0E6251" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" DataKeyNames="Nummer" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" AllowPaging="True" >
        <AlternatingRowStyle BackColor="#f0f0f0" />
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Startdatum" HeaderText="Startdatum" SortExpression="Startdatum" DataFormatString="{0:d}"/>
            <asp:BoundField DataField="VerwachteEinddatum" HeaderText="Verwachte Einddatum" SortExpression="VerwachteEinddatum" DataFormatString="{0:d}" />
            <asp:BoundField DataField="Kosten" HeaderText="Kosten" SortExpression="Kosten"  />
            <asp:BoundField DataField="BungalowNummer" HeaderText="Bungalow" SortExpression="BungalowNummer" />
            <asp:BoundField DataField="OnderhoudsstatusID" HeaderText="Status" SortExpression="OnderhoudsstatusID" />
            <asp:BoundField DataField="Onderhoudtype" HeaderText="Onderhoudtype" SortExpression="Onderhoudtype" />
            <asp:BoundField DataField="DatumvanConstatering" HeaderText="Datum Constatering" SortExpression="DatumvanConstatering" DataFormatString="{0:d}" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/deleteRow.png" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="#0E6251" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#0E6251" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="Black" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
        </center>
    <center>
    <asp:GridView ID="datumGrid" runat="server" AutoGenerateColumns="False" BackColor="White" Width="80%" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" DataKeyNames="Nummer" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical" AllowPaging="True">
        <AlternatingRowStyle BackColor="#f0f0f0" />
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Startdatum" HeaderText="Startdatum" SortExpression="Startdatum" DataFormatString="{0:d}"/>
            <asp:BoundField DataField="VerwachteEinddatum" HeaderText="Verwachte Einddatum" SortExpression="VerwachteEinddatum" DataFormatString="{0:d}" />
            <asp:BoundField DataField="Kosten" HeaderText="Kosten" SortExpression="Kosten" />
            <asp:BoundField DataField="BungalowNummer" HeaderText="Bungalow" SortExpression="BungalowNummer" />
            <asp:BoundField DataField="OnderhoudsstatusID" HeaderText="Status" SortExpression="OnderhoudsstatusID" />
            <asp:BoundField DataField="Onderhoudtype" HeaderText="Onderhoudtype" SortExpression="Onderhoudtype" />
            <asp:BoundField DataField="DatumvanConstatering" HeaderText="Datum Constatering" SortExpression="DatumvanConstatering" DataFormatString="{0:d}" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/deleteRow.png" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="#0E6251" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#0E6251" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="Black" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
        </center>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [Onderhoudsopdracht] WHERE ([Startdatum] = @Startdatum)" DeleteCommand="delete from Onderhoudsopdracht where nummer = @nummer">
        <SelectParameters>
            <asp:ControlParameter ControlID="searchBox" Name="Startdatum" PropertyName="Text" DbType="Date" />
        </SelectParameters>
    </asp:SqlDataSource>
    <center>
    <asp:GridView ID="bungalowGrid" runat="server" AutoGenerateColumns="False" BackColor="White" Width="80%" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" DataKeyNames="Nummer" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Vertical" AllowPaging="True">
        <AlternatingRowStyle BackColor="#f0f0f0" />
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Startdatum" HeaderText="Startdatum" SortExpression="Startdatum" DataFormatString="{0:d}"/>
            <asp:BoundField DataField="VerwachteEinddatum" HeaderText="Verwachte Einddatum" SortExpression="VerwachteEinddatum" DataFormatString="{0:d}"/>
            <asp:BoundField DataField="Kosten" HeaderText="Kosten" SortExpression="Kosten" />
            <asp:BoundField DataField="BungalowNummer" HeaderText="Bungalow" SortExpression="BungalowNummer" />
            <asp:BoundField DataField="OnderhoudsstatusID" HeaderText="Status" SortExpression="OnderhoudsstatusID" />
            <asp:BoundField DataField="Onderhoudtype" HeaderText="Onderhoudtype" SortExpression="Onderhoudtype" />
            <asp:BoundField DataField="DatumvanConstatering" HeaderText="Datum Constatering" SortExpression="DatumvanConstatering" DataFormatString="{0:d}" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/deleteRow.png" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="#0E6251" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#0E6251" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="Black" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
        </center>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [Onderhoudsopdracht] WHERE ([BungalowNummer] = @BungalowNummer)"  DeleteCommand="delete from Onderhoudsopdracht where nummer = @nummer">
        <SelectParameters>
            <asp:ControlParameter ControlID="searchBox" Name="BungalowNummer" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <center>
    <asp:GridView ID="statusgrid" runat="server" AutoGenerateColumns="False" BackColor="White" Width="80%" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" DataKeyNames="Nummer" DataSourceID="SqlDataSource4" ForeColor="Black" GridLines="Vertical" AllowPaging="True">
        <AlternatingRowStyle BackColor="#f0f0f0" />
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Startdatum" HeaderText="Startdatum" SortExpression="Startdatum" DataFormatString="{0:d}"/>
            <asp:BoundField DataField="VerwachteEinddatum" HeaderText="Verwachte Einddatum" SortExpression="VerwachteEinddatum" DataFormatString="{0:d}" />
            <asp:BoundField DataField="Kosten" HeaderText="Kosten" SortExpression="Kosten" />
            <asp:BoundField DataField="BungalowNummer" HeaderText="Bungalow" SortExpression="BungalowNummer" />
            <asp:BoundField DataField="OnderhoudsstatusID" HeaderText="Status" SortExpression="OnderhoudsstatusID" />
            <asp:BoundField DataField="Onderhoudtype" HeaderText="Onderhoudtype" SortExpression="Onderhoudtype" />
            <asp:BoundField DataField="DatumvanConstatering" HeaderText="Datum Constatering" SortExpression="DatumvanConstatering" DataFormatString="{0:d}" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/deleteRow.png" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
       <HeaderStyle BackColor="#0E6251" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#0E6251" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="Black" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    </center>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [Onderhoudsopdracht] WHERE ([OnderhoudsstatusID] = @OnderhoudsstatusID)"  DeleteCommand="delete from Onderhoudsopdracht where nummer = @nummer">
        <SelectParameters>
            <asp:ControlParameter ControlID="searchBox" Name="OnderhoudsstatusID" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <center>
    <asp:GridView ID="typegrid" runat="server" AutoGenerateColumns="False" BackColor="White" Width="80%" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" DataKeyNames="Nummer" DataSourceID="SqlDataSource5" ForeColor="Black" GridLines="Vertical" AllowPaging="True">
        <AlternatingRowStyle BackColor="#f0f0f0" />
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Startdatum" HeaderText="Startdatum" SortExpression="Startdatum" DataFormatString="{0:d}" />
            <asp:BoundField DataField="VerwachteEinddatum" HeaderText="Verwachte Einddatum" SortExpression="VerwachteEinddatum" DataFormatString="{0:d}"/>
            <asp:BoundField DataField="Kosten" HeaderText="Kosten" SortExpression="Kosten" />
            <asp:BoundField DataField="BungalowNummer" HeaderText="Bungalow" SortExpression="BungalowNummer" />
            <asp:BoundField DataField="OnderhoudsstatusID" HeaderText="Status" SortExpression="OnderhoudsstatusID" />
            <asp:BoundField DataField="Onderhoudtype" HeaderText="Onderhoudtype" SortExpression="Onderhoudtype" />
            <asp:BoundField DataField="DatumvanConstatering" HeaderText="Datum Constatering" SortExpression="DatumvanConstatering" DataFormatString="{0:d}"/>
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/deleteRow.png" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="#0E6251" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#0E6251" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="Black" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    </center>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [Onderhoudsopdracht] WHERE ([Onderhoudtype] = @Onderhoudtype)"  DeleteCommand="delete from Onderhoudsopdracht where nummer = @nummer">
        <SelectParameters>
            <asp:ControlParameter ControlID="searchBox" Name="Onderhoudtype" PropertyName="Text" Type="String" />
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

