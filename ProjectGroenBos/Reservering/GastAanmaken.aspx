<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="GastAanmaken.aspx.cs" Inherits="ProjectGroenBos.Reservering.GastAanmaken" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1>Gast aanmaken</h1>

    <h2>Persoonsgegevens:</h2>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Voornaam*:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbVoornaam" runat="server" CssClass="textboxchaos"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txbVoornaam" ErrorMessage="Dit veld is verplicht." CssClass="validators"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txbVoornaam" ErrorMessage="In een voornaam staan geen getallen." ValidationExpression="^[a-zA-Z -]*$" ForeColor="Red"></asp:RegularExpressionValidator>

    <br />
    <asp:Label ID="Label4" runat="server" Text="Tussenvoegsel:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbTussenvoegsel" runat="server" CssClass="textboxchaos"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txbTussenvoegsel" ErrorMessage="In een tussenvoegsel kunnen geen cijfers zitten." ValidationExpression="^[a-zA-Z -]*$" ForeColor="Red"></asp:RegularExpressionValidator>

    <br />
    <asp:Label ID="Label5" runat="server" Text="Achternaam*:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbAchternaam" runat="server" CssClass="textboxchaos"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txbAchternaam" ErrorMessage="Dit veld is verplicht." CssClass="validators"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txbAchternaam" ErrorMessage="In een achternaam staan geen getallen." ValidationExpression="^[a-zA-Z -]*$" ForeColor="Red"></asp:RegularExpressionValidator>

    <br />
    <asp:Label ID="Label12" runat="server" Text="Telefoonnummer*:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbTelefoonnummer" runat="server" CssClass="textboxchaos"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txbTelefoonnummer" ErrorMessage="Dit veld is verplicht." CssClass="validators"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txbTelefoonnummer" ErrorMessage="Telefoonnummer bestaat uit 9 getallen. De eerste 0 kan worden weggelaten." ValidationExpression="^[0-9]{9}$" ForeColor="Red"></asp:RegularExpressionValidator>

    <br />
    <asp:Label ID="Label6" runat="server" Text="E-mail*:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbEmail" runat="server" CssClass="textboxchaos"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txbEmail" ErrorMessage="Dit veld is verplicht." CssClass="validators"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txbEmail" ErrorMessage="Email is niet geldig" ValidationExpression="[a-z0-9!#$%&'+/=?^_`{|}~-]+(?:.[a-z0-9!#$%&'+/=?^_`{|}~-]+)@(?:[a-z0-9](?:[a-z0-9-][a-z0-9])?.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" ForeColor="Red"></asp:RegularExpressionValidator>

    <br />
    <asp:Label ID="Label7" runat="server" Text="Geboortedatum*:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbGeboortedatum" runat="server" TextMode="Date" CssClass="textboxchaos"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbGeboortedatum" ErrorMessage="Dit veld is verplicht." CssClass="validators"></asp:RequiredFieldValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txbGeboortedatum" ErrorMessage="U bent geen 18 jaar oud." ForeColor="Red"></asp:CustomValidator>




    <h2>Adresgegevens:</h2>
    <br />
    <asp:Label ID="Label8" runat="server" Text="Land" CssClass="labelsnieuw"></asp:Label>

    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="textboxchaos">
        <asp:ListItem>Nederland(+31)</asp:ListItem>
        <asp:ListItem>Duitsland(+49)</asp:ListItem>
        <asp:ListItem>Frankrijk(+33)</asp:ListItem>
        <asp:ListItem>België(+32)</asp:ListItem>
    </asp:DropDownList>
    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Er moet een land geselecteerd zijn." ValidateEmptyText="True" CssClass="validators"></asp:CustomValidator>
    
    <br />
    <asp:Label ID="Label13" runat="server" Text="Woonplaats*:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbWoonplaats" runat="server" CssClass="textboxchaos"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txbWoonplaats" ErrorMessage="Dit veld is verplicht." CssClass="validators"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txbWoonplaats" ErrorMessage="In een woonplaats staan geen getallen." ValidationExpression="^[a-zA-Z -]*$" ForeColor="Red"></asp:RegularExpressionValidator>


    <br />
    <asp:Label ID="Label9" runat="server" Text="Straat*:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbStraatnaam" runat="server" CssClass="textboxchaos"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txbStraatnaam" ErrorMessage="Dit veld is verplicht." CssClass="validators"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txbStraatnaam" ErrorMessage="In een straatnaam staan geen getallen." ValidationExpression="^[a-zA-Z -]*$" ForeColor="Red"></asp:RegularExpressionValidator>

    <br />
    <asp:Label ID="Label10" runat="server" Text="Huisnummer + toevoeging*:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbHuisnummer" runat="server" CssClass="textboxchaos"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txbHuisnummer" ErrorMessage="Dit veld is verplicht." CssClass="validators"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txbHuisnummer" ErrorMessage="In een huisnummer staan alleen getallen met eventuele toevoeging." ValidationExpression="^[A-Za-z0-9 ]+$" ForeColor="Red"></asp:RegularExpressionValidator>

    <br />
    <asp:Label ID="Label11" runat="server" Text="Postcode*:" CssClass="labelsnieuw"></asp:Label>
    <asp:TextBox ID="txbPostcode" runat="server" CssClass="textboxchaos"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txbPostcode" ErrorMessage="Dit veld is verplicht." CssClass="validators"></asp:RequiredFieldValidator>
    
    <br />
    <asp:Button ID="btnAanmaken" runat="server" Text="Aanmaken" CssClass="btnUitloggen" OnClick="btnAanmaken_Click" Style="background-color: #009879; color: #fff" class="btn" />




</asp:Content>
