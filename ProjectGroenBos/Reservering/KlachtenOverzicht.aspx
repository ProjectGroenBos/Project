<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="KlachtenOverzicht.aspx.cs" Inherits="ProjectGroenBos.Reservering.KlachtenOverzicht" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <h1>Klachten overzicht</h1>

        <table style="text-align: center; margin-left: 5%">
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

        <table style="text-align: center; margin-left: 5%">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label2" runat="server" Text="Categorie" CssClass="labelsnieuw"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:DropDownList ID="DropDownCategorie" runat="server" CssClass="textboxchaos">
                        <asp:ListItem Text=""></asp:ListItem>
                        <asp:ListItem Text="Personeel" Value="Personeel"></asp:ListItem>
                        <asp:ListItem Text="Accommodatie" Value="Accomodatie"></asp:ListItem>
                        <asp:ListItem Text="Activiteiten" Value="Activiteiten"></asp:ListItem>
                        <asp:ListItem Text="Restaurant" Value="Restaurant"></asp:ListItem>
                        <asp:ListItem Text="Overig" Value="Overig"></asp:ListItem>
                    </asp:DropDownList>
                </td>


                <td class="auto-style2"></td>
            </tr>
        </table>




        <br />
        <br />
        <asp:Button ID="btnZoek" runat="server" Text="Zoek" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" />
        <br />

        <asp:GridView ID="GridView1" CssClass="content-table" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Klacht nummer" DataSourceID="SqlDataSource1" SelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="Klacht nummer" HeaderText="Klacht nummer" InsertVisible="False" ReadOnly="True" SortExpression="Klacht nummer" />
                <asp:BoundField DataField="Gastnummer" HeaderText="Gastnummer" SortExpression="Gastnummer" />
                <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
                <asp:BoundField DataField="Tussenvoegsel" HeaderText="Tussenvoegsel" SortExpression="Tussenvoegsel" />
                <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" />
                <asp:BoundField DataField="E-mail" HeaderText="E-mail" SortExpression="E-mail" />
                <asp:BoundField DataField="Categorie" HeaderText="Categorie" SortExpression="Categorie" />
                <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
            </Columns>
            <HeaderStyle ForeColor="White" />
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="SELECT Nummer AS [Klacht nummer],Gastnummer, Voornaam, Tussenvoegsel, Achternaam, Email AS [E-mail], Categorie, Omschrijving FROM Klacht where (Achternaam like '%' + @Achternaam + '%' AND Categorie LIKE '%' + @Categorie + '%') or (Achternaam like '%' + @Categorie + '%' AND Categorie LIKE '%' + @Achternaam + '%') ORDER BY [Klacht nummer] ASC">
            <SelectParameters>
                <asp:ControlParameter ControlID="txbAchternaam" DefaultValue="%" Name="achternaam" PropertyName="Text" />
                <asp:ControlParameter ControlID="DropDownCategorie" DefaultValue="%" Name="Categorie" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>