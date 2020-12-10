<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="GastSelecteren.aspx.cs" Inherits="ProjectGroenBos.KlantSelecteren" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <h1>Selecteer de gast voor de reservering</h1>
        <br />
        <p>
            Selecteer de gast door middel van achternaam en woonplaats. Als je de gast niet kan vinden,<br />
            moet er een nieuw gastnummer worden aangemaakt inclusief gastgegevens.
        </p>

        <br />

        <table style="text-align: left; margin-left: 5%">
            <tr>
                <td style="width: 15%">
                    <asp:Label ID="Label1" runat="server" Text="Achternaam" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:TextBox ID="txbAchternaam" runat="server" CssClass="textboxchaos"></asp:TextBox>
                </td>


                <td style="width: 40%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbAchternaam" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txbAchternaam" ErrorMessage="In een achternaam staan geen getallen." ValidationExpression="^[a-zA-Z -]*$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>

            


        </table>

        <br />
        <asp:Button ID="btnZoek" runat="server" Text="Zoek gast" CssClass="btnUitloggen" OnClick="btnZoek_Click" Style="background-color: #009879; color: #fff" class="btn" />

        <asp:Button ID="btnGastAanmaken" runat="server" Text="Gast aanmaken" CssClass="btnUitloggen" OnClick="btnGastAanmaken_Click" Style="background-color: #009879; color: #fff" class="btn" />

        <br />
        <br />
        <asp:Label ID="lblUitkomst" runat="server" Text=""></asp:Label>
        <br />
       

        <asp:GridView ID="GridView1" runat="server" CssClass="content-table" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Gastnummer" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True" AutoGenerateSelectButton="True">
            <Columns>
                <asp:BoundField DataField="Gastnummer" HeaderText="Gastnummer" SortExpression="Gastnummer" InsertVisible="False" ReadOnly="True">
                </asp:BoundField>
                <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam">
                </asp:BoundField>
                <asp:BoundField DataField="Tussenvoegsel" HeaderText="Tussenvoegsel" SortExpression="Tussenvoegsel">
                </asp:BoundField>
                <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam">
                </asp:BoundField>
                <asp:BoundField DataField="Telefoonnummer" HeaderText="Telefoonnummer" SortExpression="Telefoonnummer">
                </asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email">

                </asp:BoundField>

            </Columns>
            <HeaderStyle ForeColor="White" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="select top(10) Nummer as [Gastnummer], Voornaam, Tussenvoegsel, Achternaam, Telefoonnummer, Email 
from Gast 
where Achternaam like '%'+@achternaam+'%' 
order by Nummer desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="txbAchternaam" DefaultValue="%" Name="achternaam" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>


</asp:Content>
