<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="ReserveringMedewerkerNachtregister.aspx.cs" Inherits="ProjectGroenBos.Reservering.ReserveringMedewerkerNachtregister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <body>
        <form>
    <p>
        Mochten wij in geval van nood het park moeten evacueren, waar wij en u niet op hopen, hebben we 
                    de gegevens van uw medevakantiegangers nodig. Dit alles om te weten of iedereen het park uit is.
    </p>

    <br />


    <p>
        <asp:Label ID="Label2" runat="server" Text="Naam:"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TxBNaam" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="In een naam kunnen geen getallen of leestekens zitten." ControlToValidate="TxBNaam" ValidationExpression="^[a-zA-Z -]*$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxBNaam" ErrorMessage="Dit veld is verplicht."></asp:RequiredFieldValidator>
    </p>



    <p>
        <asp:Label ID="Label1" runat="server" Text="Tussenvoegsel:"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TxBtussenvoegsel" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="In een tussenvoegsel kunnen alleen letters komen te staan." ControlToValidate="TxBtussenvoegsel" ValidationExpression="^[a-zA-Z -]*$"></asp:RegularExpressionValidator>
    </p>



    <p>
        <asp:Label ID="Label3" runat="server" Text="Achternaam:"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TxBAchternaam" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="In een achternaam kunnen geen getallen zitten." ControlToValidate="TxBAchternaam" ValidationExpression="^[a-zA-Z -]*$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxBAchternaam" ErrorMessage="Dit veld is verplicht."></asp:RequiredFieldValidator>
    </p>

    <p>
        <asp:Label ID="label4" runat="server" Text="Geboortedatum:"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TxBGeboortedatum" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Datum moet ingevult zijn als  jjjj-mm-dd." ControlToValidate="TxBGeboortedatum" ValidationExpression="^(19|20)?\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxBGeboortedatum" ErrorMessage="Dit veld is verplicht."></asp:RequiredFieldValidator>
    </p>

    
    <p>
    </p>
    <p>

        <asp:Label ID="lblOutput" runat="server"></asp:Label>

    </p>
    <p>
        &nbsp;
    </p>
    <p>
        <asp:Button ID="btnBevestigen" runat="server" Click="btnBevestigen_Click1" Text="Bevestigen" OnClick="btnBevestigen_Click" />
        <asp:Button ID="btnToevoegen" runat="server" OnClick="btnToevoegen_Click1" Text="Toevoegen" />
    </p>
    </form>
    </body>
</asp:Content>
