<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="Gastoverzicht.aspx.cs" Inherits="ProjectGroenBos.Reservering.Klantoverzicht" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 15%;
            height: 22px;
        }
        .auto-style2 {
            width: 40%;
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
<h2>Gast Overzicht</h2>
        <br />
        <br />

        <table style="text-align: left; margin-left: 5%">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Text="Achternaam" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txbAchternaam" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>


                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbAchternaam" Display="Dynamic" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txbAchternaam" ErrorMessage="In een achternaam staan geen getallen." ValidationExpression="^[a-zA-Z -]*$" ForeColor="Red" Display="Dynamic" Enabled="False"></asp:RegularExpressionValidator>
                </td>
            </tr>

            


        </table>
        <br />
        <br />
        <asp:Button ID="btnZoek" runat="server" Text="Zoek"  CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" />
        <br />
        <asp:GridView ID="GridView1" CssClass="content-table" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Gast nummer" DataSourceID="SqlDataSource1" AutoGenerateSelectButton="True" SelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="Gast nummer" HeaderText="Gast nummer" InsertVisible="False" ReadOnly="True" SortExpression="Gast nummer" />
                <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
                <asp:BoundField DataField="Tussenvoegsel" HeaderText="Tussenvoegsel" SortExpression="Tussenvoegsel" />
                <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" />
                <asp:BoundField DataField="Telefoonnummer" HeaderText="Telefoonnummer" SortExpression="Telefoonnummer" />
                <asp:BoundField DataField="E-mail" HeaderText="E-mail" SortExpression="E-mail" />
                <asp:BoundField DataField="Geboortedatum" HeaderText="Geboortedatum" SortExpression="Geboortedatum" DataFormatString="{0:d}" />
            </Columns>
            <HeaderStyle ForeColor="White" />
    </asp:GridView>
    


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT TOP (10) Nummer AS [Gast nummer], Voornaam, Tussenvoegsel, Achternaam, Telefoonnummer, Email AS [E-mail], Geboortedatum FROM Gast inner join Adres on Gast.Nummer = Adres.GastNummer where Achternaam like '%' + @achternaam + '%' ORDER BY [Gast nummer] DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="txbAchternaam" DefaultValue="%" Name="achternaam" PropertyName="Text" />
        </SelectParameters>
        </asp:SqlDataSource>
    

    </div>
    


</asp:Content>
