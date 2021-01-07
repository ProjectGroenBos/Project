<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="ReserveringWijzigen.aspx.cs" Inherits="ProjectGroenBos.Reservering.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            display: inline-block;
            width: 145px;
            left: 0px;
            top: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <script type="text/javascript">
            $(function () {
                var date = new Date();
                var currentMonth = date.getMonth(); // huidige maand
                var currentDate = date.getDate(); // huidige datum
                var currentYear = date.getFullYear(); // dit jaar
                $("#<%= txbAankomstdatum.ClientID %>").datepicker({
                    changeMonth: true, // Hierdoor kan de gebruiker de maand veranderen
                    changeYear: true, // Hierdoor kan de gebruiker het jaar veranderen
                    minDate: new Date(currentYear, currentMonth, currentDate),
                    dateFormat: 'dd/mm/yy',
                    beforeShowDay: function (date) {
                        if (date.getDay() == 0 || date.getDay() == 2 || date.getDay() == 3 || date.getDay() == 4 || date.getDay() == 6) {
                            return [false, ''];
                        } else {
                            return [true, ''];
                        }
                    }
                });
            });

            $(function () {
                var date = new Date();
                var currentMonth = date.getMonth(); // huidige maand
                var currentDate = date.getDate(); // huidige datum
                var currentYear = date.getFullYear(); // dit jaar
                $("#<%= txbVertrekdatum.ClientID %>").datepicker({
                    changeMonth: true, // Hierdoor kan de gebruiker de maand veranderen
                    changeYear: true, // Hierdoor kan de gebruiker het jaar veranderen
                    minDate: new Date(currentYear, currentMonth, currentDate),
                    dateFormat: 'dd/mm/yy',
                    beforeShowDay: function (date) {
                        if (date.getDay() == 0 || date.getDay() == 2 || date.getDay() == 3 || date.getDay() == 4 || date.getDay() == 6) {
                            return [false, ''];
                        } else {
                            return [true, ''];
                        }
                    }
                });
            });




        </script>
        <h1>Reservering wijzigen</h1>
        &nbsp;
    
     <table style="text-align: left; margin-left: 5%">
         <tr>
             <td style="width: 15%">
                 <asp:Label ID="Label2" runat="server" Text="Huisje behouden:" CssClass="labelsnieuw"></asp:Label>
             </td>
             <td style="width: 15%">
                 <asp:CheckBox ID="chbHuisje" runat="server" OnCheckedChanged="chbHuisje_CheckedChanged" Text="Aangevinkt betekent ja" AutoPostBack="True" />
             </td>
             <td style="width: 40%"></td>
         </tr>
         <tr>
             <td style="width: 15%">
                 <asp:Label ID="Label6" runat="server" Text="Reseveringsnummer:" CssClass="labelsnieuw"></asp:Label>
             </td>
             <td style="width: 15%">
                 <asp:Label ID="lblReserveringsnummer" runat="server" CssClass="labelsnieuw"></asp:Label>
             </td>
             <td style="width: 40%"></td>
         </tr>
         <tr>
             <td style="width: 15%">
                 <asp:Label ID="Label7" runat="server" Text="Aantal Personen:" CssClass="labelsnieuw"></asp:Label>
             </td>
             <td style="width: 15%">
                 <asp:TextBox ID="txbAantalPersonen" runat="server" CssClass="textboxchaos" EnableViewState="False"></asp:TextBox>
             </td>
             <td style="width: 40%">
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Aantal personen is een even getal." ControlToValidate="txbAantalPersonen" ValidationExpression="^([246])$" ForeColor="Red"></asp:RegularExpressionValidator>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Dit veld is verplicht." ControlToValidate="txbAantalPersonen" ForeColor="Red"></asp:RequiredFieldValidator>
             </td>
         </tr>
         <tr>
             <td style="width: 15%">
                 <asp:Label ID="Label8" runat="server" Text="Opmerkingen" CssClass="labelsnieuw"></asp:Label>
             </td>
             <td style="width: 15%">
                 <asp:TextBox ID="txbOpmerkingen" runat="server" CssClass="auto-style1" EnableViewState="False"></asp:TextBox>
             </td>
             <td style="width: 40%"></td>
         </tr>
         <tr>
             <td style="width: 15%">
                 <asp:Label ID="Label9" runat="server" Text="Aankomstdatum:" CssClass="labelsnieuw"></asp:Label>
             </td>
             <td style="width: 15%">
                 <asp:TextBox ID="txbAankomstdatum" runat="server" CssClass="textboxchaos" EnableViewState="False"></asp:TextBox>
             </td>
             <td style="width: 40%"></td>
         </tr>
         <tr>
             <td style="width: 15%">
                 <asp:Label ID="Label10" runat="server" Text="Vertrekdatum:" CssClass="labelsnieuw"></asp:Label>
             </td>
             <td style="width: 15%">
                 <asp:TextBox ID="txbVertrekdatum" runat="server" CssClass="textboxchaos"></asp:TextBox>
             </td>
             <td style="width: 40%"></td>
         </tr>
         <tr>
             <td style="width: 15%">
                 <asp:Label ID="Label1" runat="server" Text="Bungalownummer:" CssClass="labelsnieuw"></asp:Label>
             </td>
             <td style="width: 15%">
                 <asp:Label ID="lblHuisjenummer" runat="server" Text=""></asp:Label>
             </td>
             <td style="width: 40%"></td>
         </tr>
         

     </table>






        <br />
        <asp:Label ID="lblUitkomst" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnZoeken" runat="server" Text="Zoek nieuwe bungalow" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" OnClick="btnZoeken_Click"/>
        <asp:Button ID="btnWijzigen" runat="server" Text="Wijzigen" CssClass="btnUitloggen" Style="background-color: #009879; color: #fff" class="btn" OnClick="btnWijzigen_Click"  />
        <asp:Button ID="btnTerug" runat="server" Style="background-color: #009879; color: #fff" class="btn" CssClass="btnUitloggen" Text="Terug" OnClick="btnTerug_Click" ValidateRequestMode="Disabled" />
        <br />
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="Nummer,Aankomstdatum,Vertrekdatum,Aantal_personen,Opmerking,Achternaam,Email" EnableViewState="False" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
                <asp:BoundField DataField="Aankomstdatum" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Aankomstdatum" SortExpression="Aankomstdatum" />
                <asp:BoundField DataField="Vertrekdatum" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Vertrekdatum" SortExpression="Vertrekdatum" />
                <asp:BoundField DataField="Aantal_personen" HeaderText="Aantal personen" SortExpression="Aantal_personen" />
                <asp:BoundField DataField="Opmerking" HeaderText="Opmerking" SortExpression="Opmerking" />
                <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateSelectButton="True" CssClass="content-table" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand=" select res.Nummer, res.Aankomstdatum, res.Vertrekdatum, res.Aantal_personen, res.Opmerking, gst.Achternaam, gst.Email from Gast as gst inner join Reservering as res on gst.Nummer = res.GastNummer  where res.Nummer = @nummer">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblReserveringsnummer" Name="nummer" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />

    </div>

</asp:Content>
