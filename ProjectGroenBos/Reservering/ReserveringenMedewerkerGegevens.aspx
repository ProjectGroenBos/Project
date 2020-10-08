<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="ReserveringenMedewerkerGegevens.aspx.cs" Inherits="ProjectGroenBos.Reservering.ReserveringenMedewerkerGegevens" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div class="werkgebied">
        <br />
        &nbsp;&nbsp;

                    Vul hier de klantgegevens in<br />
        <br />


        <p>
            <asp:Label ID="lblNaam" runat="server" Text="Naam" CssClass="labelhuisjemedewerker"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="txbNaam" runat="server" CssClass="textboxchaos"></asp:TextBox>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="In een naam kunnen geen getallen of leestekens zitten" ControlToValidate="txbNaam" ValidationExpression="^[a-zA-Z -]*$"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbNaam" ErrorMessage="Dit veld is verplicht."></asp:RequiredFieldValidator>
        </p>
        <br />
        <p>
            <asp:Label ID="lblTussenvoegsel" runat="server" Text="Tussenvoegsel" CssClass="labelhuisjemedewerker"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="txbTussenvoegsel" runat="server" CssClass="textboxchaos"></asp:TextBox>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="In een tussenvoegsel kunnen alleen letters komen te staan." ControlToValidate="txbTussenvoegsel" ValidationExpression="^[a-zA-Z -]*$"></asp:RegularExpressionValidator>
        </p>
            <br />
        <p>
            <asp:Label ID="lblAchternaam" runat="server" Text="Achternaam" CssClass="labelhuisjemedewerker"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="txbAchternaam" runat="server" CssClass="textboxchaos"></asp:TextBox>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="In een achternaam kunnen geen getallen zitten." ControlToValidate="txbAchternaam" ValidationExpression="^[a-zA-Z -]*$"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txbAchternaam" ErrorMessage="Dit veld is verplicht."></asp:RequiredFieldValidator>
        </p>
        <br />
        <p>
            <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="labelhuisjemedewerker"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="txbEmail" runat="server"></asp:TextBox>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Email is niet geldig." ControlToValidate="txbEmail" ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txbEmail" ErrorMessage="Dit veld is verplicht."></asp:RequiredFieldValidator>
        </p>
        <br />
        <p>
            <asp:Label ID="lblLand" runat="server" Text="Land" CssClass="labelhuisjemedewerker"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem>Nederland</asp:ListItem>
                <asp:ListItem>Duitsland</asp:ListItem>
                <asp:ListItem>Frankrijk</asp:ListItem>
                <asp:ListItem>Belgi&#235;</asp:ListItem>
            </asp:DropDownList>
        </p>
        <br />
        <p>
            <asp:Label ID="lblStraat" runat="server" Text="Straat" CssClass="labelhuisjemedewerker"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="txbStraat" runat="server"></asp:TextBox>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Straatnaam is niet geldig." ControlToValidate="txbStraat" ValidationExpression="^[a-zA-Z -]*$"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txbStraat" ErrorMessage="Dit veld is verplicht."></asp:RequiredFieldValidator>
        </p>
        <br />
        <p>
            <asp:Label ID="lblHuisnummer" runat="server" Text="Huisnummer + toevoeging" CssClass="labelhuisjemedewerker"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="txbHuisnummer" runat="server"></asp:TextBox>

            &nbsp;&nbsp;&nbsp;

            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="In een huisnummer en toevoeging horen alleen letters en cijfers." ControlToValidate="txbHuisnummer" ValidationExpression="(^[A-Za-z0-9 ]+$)"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txbHuisnummer" ErrorMessage="Dit veld is verplicht."></asp:RequiredFieldValidator>
        </p>
        <br />
        <p>
            <asp:Label ID="lblPostcode" runat="server" Text="Postcode" CssClass="labelhuisjemedewerker"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="txbPostcode" runat="server"></asp:TextBox>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ErrorMessage="Een postcode bestaat uit letters en cijfers." ControlToValidate="txbPostcode" Enabled="False"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txbPostcode" ErrorMessage="Dit veld is verplicht."></asp:RequiredFieldValidator>
        </p>
        <br />
        <p>
            <asp:Label ID="lblTelefoonnummer" runat="server" Text="Telefoonnummer" CssClass="labelhuisjemedewerker"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="txbTelefoonnummer" runat="server"></asp:TextBox>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Telefoonnummer is niet geldig." ControlToValidate="txbTelefoonnummer" ValidationExpression="^[0-9]{9}$"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txbTelefoonnummer" ErrorMessage="Dit veld is verplicht."></asp:RequiredFieldValidator>
        </p>
        <br />
        <p>
            <asp:Label ID="lblOpmerkingen" runat="server" Text="Opmerkingen" CssClass="labelhuisjemedewerker"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:TextBox ID="txbOpmerkingen" runat="server"></asp:TextBox>
        </p>

        <br />



        <p>
            <asp:Button ID="btnBevestigen" runat="server" OnClick="btnBevestigen_Click" Text="Bevestigen" CssClass="labelhuisjemedewerker" />

            <asp:Label ID="Label1" runat="server"></asp:Label>

        </p>

            <script src="js/app.js"></script>
            <p>
                &nbsp;
       
            </p>
        <p>
            &nbsp;
       
        </p>
    </div>
</asp:Content>
