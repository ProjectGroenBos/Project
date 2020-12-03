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
    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="validators" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbAchternaam"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txbAchternaam" ErrorMessage="In een achternaam staan geen getallen." ValidationExpression="^[a-zA-Z -]*$" ForeColor="Red" CssClass="validators" Display="Dynamic"></asp:RegularExpressionValidator>

    <br />
    <asp:Label ID="Label2" runat="server" Text="Email" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbEmail" runat="server" CssClass="textboxchaos"></asp:TextBox>
    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="validators" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbEmail"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txbEmail" ErrorMessage="Email is niet geldig" ValidationExpression="[a-z0-9!#$%&'+/=?^_`{|}~-]+(?:.[a-z0-9!#$%&'+/=?^_`{|}~-]+)@(?:[a-z0-9](?:[a-z0-9-][a-z0-9])?.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" ForeColor="Red" CssClass="validators" Display="Dynamic"></asp:RegularExpressionValidator>

    <br />
    <asp:Label ID="Label3" runat="server" Text="Telefoonnummer" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbTelefoonnummer" runat="server" CssClass="textboxchaos"></asp:TextBox>
    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="validators" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbTelefoonnummer"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txbTelefoonnummer" ErrorMessage="Eerste 0 weglaten en 9 cijfers gebruiken." ValidationExpression="^[0-9]{9}$" ForeColor="Red" CssClass="validators" Display="Dynamic"></asp:RegularExpressionValidator>

    <br />
    <asp:Button ID="btnZoek" runat="server" Text="Zoek gast" CssClass="btnUitloggen" OnClick="btnZoek_Click" style="background-color: #009879; color: #fff" class="btn"/>
    <asp:Button ID="btnGastAanmaken" runat="server" Text="Gast aanmaken" CssClass="btnUitloggen" OnClick="btnGastAanmaken_Click" style="background-color: #009879; color: #fff" class="btn"/>
    
    <br />
    <asp:Label ID="lblUitkomst" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" CssClass="content-table" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Gastnummer" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True" AutoGenerateSelectButton="True">
        <Columns>  
            <asp:BoundField DataField="Gastnummer" HeaderText="Gastnummer" SortExpression="Gastnummer" InsertVisible="False" ReadOnly="True" >
            <HeaderStyle ForeColor="White" />
            </asp:BoundField>
            <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" >
            <HeaderStyle ForeColor="White" />
            </asp:BoundField>
            <asp:BoundField DataField="Tussenvoegsel" HeaderText="Tussenvoegsel" SortExpression="Tussenvoegsel" >
            <HeaderStyle ForeColor="White" />
            </asp:BoundField>
            <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" >
            <HeaderStyle ForeColor="White" />
            </asp:BoundField>
            <asp:BoundField DataField="Telefoonnummer" HeaderText="Telefoonnummer" SortExpression="Telefoonnummer" >
            <HeaderStyle ForeColor="White" />
            </asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" >
            
            <HeaderStyle ForeColor="White" />
            </asp:BoundField>
            
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
