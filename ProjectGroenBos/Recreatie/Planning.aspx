<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="Planning.aspx.cs" Inherits="recreatie.paginas.Planning" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<<<<<<< HEAD
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Names="Century Gothic" Font-Overline="False" Font-Size="X-Large" Text="Planning" CssClass="labelplanning"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="Activiteit:" CssClass="labelactiviteit"></asp:Label>


    <asp:TextBox ID="TxbActiviteit" runat="server" CssClass="textboxplanningactiviteit"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Vul een activiteit in" ControlToValidate="TxbActiviteit" CssClass="validatortxbactiviteit" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>

    <asp:RequiredFieldValidator ID="Activiteitvalidator" runat="server" ControlToValidate="TxbActiviteit" ErrorMessage="Vul een activiteit in" ForeColor="Red" CssClass="validatortxbactiviteit" Display="Dynamic">*</asp:RequiredFieldValidator>
    .<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM [Activiteit]"></asp:SqlDataSource>
=======
    <script>function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<<<<<<<< HEAD:ProjectGroenBos/Recreatie/Planning.aspx
    <link href="CSS/styleplanning.css" rel="stylesheet" />
    <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Names="Century Gothic" Font-Overline="False" Font-Size="X-Large" ForeColor="#757272" Text="Planning" CssClass="labelplanningq"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="Activiteit:" CssClass="labelplanning"></asp:Label>

    <asp:TextBox ID="TxbActiviteit" runat="server" CssClass="textboxplanningactiviteit"></asp:TextBox>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM [Activiteit]"></asp:SqlDataSource>
>>>>>>> ReserveringTeam/Noah

    <asp:Label ID="Label4" runat="server" Text="Locatie:" CssClass="labellocatie"></asp:Label>

    <asp:TextBox ID="txbLocatie" runat="server" CssClass="textboxlocatie"></asp:TextBox>
<<<<<<< HEAD
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Vul een locatie in" CssClass="validatorlocatie" ControlToValidate="txbLocatie" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocatie" runat="server" ControlToValidate="txbLocatie" ErrorMessage="Je moet een locatie invullen" ForeColor="Red" CssClass="validatorlocatie">*</asp:RequiredFieldValidator>
=======
>>>>>>> ReserveringTeam/Noah



    <asp:Label ID="Label5" runat="server" Text="Aantal:" CssClass="labelaantal"></asp:Label>

    <asp:TextBox ID="TxbAantal" runat="server" CssClass="textboxaantal"></asp:TextBox>
<<<<<<< HEAD
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Vul een getal in" ControlToValidate="TxbAantal" CssClass="validatoraantal" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBegeleider" runat="server" ControlToValidate="TxbAantal" ErrorMessage="RequiredFieldValidator" ForeColor="Red" CssClass="validatoraantal">*</asp:RequiredFieldValidator>


    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="gridviewbegeleider" EmptyDataText="No data yet" OnRowDeleting="GridView2_RowDeleting">
        <Columns>
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>

    <asp:Label ID="Label6" runat="server" Text="Begeleider:" CssClass="labelbegeleider"></asp:Label>

    <asp:DropDownList ID="TxbMedewerker" runat="server" OnRowCommand="gvMedewerker_RowCommand" AutoPostBack="True" CssClass="textboxbegeleider" DataSourceID="SqlDataSource3" DataTextField="Naam" DataValueField="Nummer" OnSelectedIndexChanged="TxbMedewerker_SelectedIndexChanged">
        <asp:ListItem>Selecteer een begeleider</asp:ListItem>
        <asp:ListItem>Matthijs</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" CssClass="validatormedewerker" ControlToValidate="TxbMedewerker" Display="Dynamic" ForeColor="Red" InitialValue="Selecteer een begeleider"></asp:RequiredFieldValidator>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Nummer], [Naam] FROM [Medewerker]"></asp:SqlDataSource>




    <asp:Label ID="Label9" runat="server" Text="Datum:" CssClass="labelplanningdatum"></asp:Label>

    <asp:TextBox ID="TxbDatum" runat="server" CssClass="textboxdatum" TextMode="DateTime"></asp:TextBox>


    <asp:CompareValidator ID="Datevalidator" runat="server" ControlToValidate="TxbDatum" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Date" ForeColor="Red" CssClass="validatordatum">Onjuiste datum</asp:CompareValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDatum" runat="server" ControlToValidate="TxbDatum" ErrorMessage="*" ForeColor="Red" CssClass="validatordatum" Display="Dynamic"></asp:RequiredFieldValidator>
    


    <asp:Label ID="Label7" runat="server" Text="Begintijd:" CssClass="labelbegintijd"></asp:Label>

    <asp:TextBox ID="TxbBegintijd" runat="server" CssClass="textboxbegintijd" TextMode="Time"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" CssClass="validatorbegintijd" ControlToValidate="TxbBegintijd" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>


 



    <asp:Label ID="Label8" runat="server" Text="Eindtijd:" CssClass="labeleindtijd"></asp:Label>

    <asp:TextBox ID="TxbEindtijd" runat="server" CssClass="textboxeindtijd" TextMode="Time"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" CssClass="validatoreindtijd" ForeColor="Red" ControlToValidate="TxbEindtijd"></asp:RequiredFieldValidator>
    <!--
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEindtijd" runat="server" ControlToValidate="TxbEindtijd" ErrorMessage="RequiredFieldValidator" ForeColor="Red" CssClass="validatoreindtijd">Vul een eindtijd in</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEindtijd" runat="server" ControlToValidate="TxbEindtijd" ErrorMessage="Het moet een geldige tijd zijn" ValidationExpression="^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$" ForeColor="Red" CssClass="validatorgeldigeeindtijd">Vul een geldige tijd in</asp:RegularExpressionValidator>
        !-->
    <asp:Label ID="Label10" runat="server" CssClass="labelinschrijfkosten" Text="Inschrijfkosten:"></asp:Label>

<%--    <asp:TextBox ID="txbInschrijfkosten" runat="server" CssClass="textboxinschrijfkosten" OnTextChanged="txbInschrijfkosten_TextChanged"></asp:TextBox>--%>
    <asp:TextBox ID="txbInschrijfkosten" runat="server"  CssClass="textboxinschrijfkosten" ></asp:TextBox>
    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Vul een bedrag in" ControlToValidate="txbInschrijfkosten" CssClass="validatorinschrijfkosten" Display="Dynamic" ForeColor="Red" MaximumValue="300" MinimumValue="0" Type="Double"></asp:RangeValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txbInschrijfkosten" CssClass="validatorinschrijfkosten" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>


     <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidatorInschrijfkosten" runat="server" ControlToValidate="txbInschrijfkosten" ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d{1,3}(\.\d{3})*(,\d{2})?$" ForeColor="Red" CssClass="validatorinschrijfkosten">Vul een bedrag in</asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorInschrijfkosten" runat="server" ControlToValidate="txbInschrijfkosten" ErrorMessage="RequiredFieldValidator" ForeColor="Red" CssClass="validatorinschrijfkosten" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator>--%>

    <%--<asp:RangeValidator ID="RangeValidatorInschrijfkosten" runat="server" ControlToValidate="txbInschrijfkosten" ErrorMessage="RangeValidator" MaximumValue="100" MinimumValue="0" Type="Double" ForeColor="Red" CssClass="validatornulvijfentwintiginschrijfkosten">Vul een getal tussen 0 en 100 in</asp:RangeValidator>--%>
  

=======

    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="gridviewbegeleider" EmptyDataText="No data yet" OnRowDeleting="GridView2_RowDeleting">
========
    <div class="header">Activiteit Inactief Maken</div>

    <asp:GridView ID="gvActiviteitVerwijderen" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="content-table2" DataKeyNames="Nummer" ForeColor="#333333" GridLines="None" ShowFooter="True" ShowHeaderWhenEmpty="True" Width="80%" AllowPaging="True" OnSelectedIndexChanged="gvActiviteitVerwijderen_SelectedIndexChanged1" DataSourceID="SqlDataSource1"  >
>>>>>>>> ReserveringTeam/Noah:ProjectGroenBos/Recreatie/ActiviteitVerwijderen.aspx
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="True" SortExpression="Nummer" HeaderStyle-ForeColor="White">
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Activiteitnaam" HeaderText="Activiteitnaam" SortExpression="Activiteitnaam" HeaderStyle-ForeColor="White">
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Locatie" HeaderText="Locatie" SortExpression="Locatie" HeaderStyle-ForeColor="White">
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Inschrijfkosten" HeaderText="Inschrijfkosten" SortExpression="Inschrijfkosten" HeaderStyle-ForeColor="White">
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Maximaal aantal" HeaderText="Maximaal aantal" SortExpression="Maximaal aantal" HeaderStyle-ForeColor="White">
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" HeaderStyle-ForeColor="White">
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Datum" HeaderText="Datum" ReadOnly="True" SortExpression="Datum" HeaderStyle-ForeColor="White">
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Begintijd" HeaderText="Begintijd" ReadOnly="True" SortExpression="Begintijd" HeaderStyle-ForeColor="White">
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Eindtijd" HeaderText="Eindtijd" ReadOnly="True" SortExpression="Eindtijd" HeaderStyle-ForeColor="White">
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" HeaderStyle-ForeColor="White">
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="MedewerkerID" HeaderText="MedewerkerID" SortExpression="MedewerkerID" HeaderStyle-ForeColor="White" Visible="False">
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="FaciliteitID" HeaderText="FaciliteitID" SortExpression="FaciliteitID" Visible="False" HeaderStyle-ForeColor="White">
<HeaderStyle ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:CommandField ShowSelectButton="True" ItemStyle-ForeColor="White">
<ItemStyle ForeColor="White"></ItemStyle>
            </asp:CommandField>
        </Columns>
    </asp:GridView>

<<<<<<<< HEAD:ProjectGroenBos/Recreatie/Planning.aspx


    
    <asp:Label ID="Label6" runat="server" Text="Begeleider:" CssClass="labelbegeleider"></asp:Label>

    <asp:DropDownList ID="TxbMedewerker" runat="server" OnRowCommand="gvMedewerker_RowCommand" AutoPostBack="True" CssClass="textboxbegeleider" DataSourceID="SqlDataSource3" DataTextField="Naam" DataValueField="Nummer" OnSelectedIndexChanged="TxbMedewerker_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Nummer], [Naam] FROM [Medewerker]"></asp:SqlDataSource>
========
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM [vActiviteit]"></asp:SqlDataSource>

    <div id="Popup" class="modal fade" role="dialog">
                 <div class="modal-dialog">
>>>>>>>> ReserveringTeam/Noah:ProjectGroenBos/Recreatie/ActiviteitVerwijderen.aspx

                     <!-- Modal content-->

                     <div class="modal-content">

<<<<<<<< HEAD:ProjectGroenBos/Recreatie/Planning.aspx
    <asp:Label ID="Label9" runat="server" Text="Datum:" CssClass="labelplanningdatum"></asp:Label>
    <asp:TextBox ID="TxbDatum" runat="server" CssClass="textboxdatum" TextMode="DateTime"></asp:TextBox>
========
                         <div class="modal-header">

                             <h4 class="modal-title">Activiteit Verwijderen</h4>

                         </div>
>>>>>>>> ReserveringTeam/Noah:ProjectGroenBos/Recreatie/ActiviteitVerwijderen.aspx

                         <div class="modal-body">

                             <asp:Label ID="Label1" runat="server" Text="Label">Weet u zeker dat u deze activiteit inactief wilt maken?</asp:Label>
                             <asp:Button ID="btnDoorgaan" OnClick="btnDoorgaan_Click" runat="server" Text="Doorgaan" Style="max-width: 30%; margin-right: 37%; margin-top: 10%; display: inline" class="btn btn-primary btn-lg btn-block" />
                             <asp:button ID="btnAnnuleren" data-dismiss="modal" runat="server" Text="Annuleren" Style="max-width: 30%; background-color:indianred; margin-right: auto; margin-top:10%; display: inline" class="btn btn-primary btn-lg btn-block"></asp:button>
                             
                         </div>

<<<<<<<< HEAD:ProjectGroenBos/Recreatie/Planning.aspx
    <asp:TextBox ID="TxbBegintijd" runat="server" CssClass="textboxbegintijd" TextMode="Time"></asp:TextBox>

========
                         <div class="modal-footer">
>>>>>>>> ReserveringTeam/Noah:ProjectGroenBos/Recreatie/ActiviteitVerwijderen.aspx

                             

                         </div>

                     </div>

<<<<<<<< HEAD:ProjectGroenBos/Recreatie/Planning.aspx
    <asp:TextBox ID="TxbEindtijd" runat="server" CssClass="textboxeindtijd" TextMode="Time"></asp:TextBox>
    <asp:Label ID="Label10" runat="server" CssClass="labelinschrijfkosten" Text="Inschrijfkosten:"></asp:Label>

    <asp:TextBox ID="txbInschrijfkosten" runat="server" CssClass="textboxinschrijfkosten"></asp:TextBox>
>>>>>>> ReserveringTeam/Noah


    <asp:Label ID="Label11" runat="server" CssClass="labelfaciliteit" Text="Faciliteit"></asp:Label>

<<<<<<< HEAD
    <asp:DropDownList ID="ddlFaciliteit" runat="server" DataSourceID="SqlDataSource4" DataTextField="Omschrijving" CssClass="textboxfaciliteit" DataValueField="ID" AppendDataBoundItems="True"> <asp:ListItem Text="Selecteer een faciliteit" Value ="-1"></asp:ListItem></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [ID], [Omschrijving] FROM [Faciliteit]"></asp:SqlDataSource>
    

    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlFaciliteit" CssClass="validatorfaciliteit" ForeColor="Red" InitialValue="Selecteer een faciliteit" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator>
=======
    <asp:DropDownList ID="ddlFaciliteit" runat="server" DataSourceID="SqlDataSource4" DataTextField="Omschrijving" CssClass="textboxfaciliteit" DataValueField="ID"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [ID], [Omschrijving] FROM [Faciliteit]"></asp:SqlDataSource>
>>>>>>> ReserveringTeam/Noah




<<<<<<< HEAD

    <asp:Button ID="btnActiviteitInplannen" runat="server" BackColor="#117B66" CssClass="buttonactiviteiteninplannen" ForeColor="#FEFEFE" Text="Activiteiten Inplannen" OnClick="btnActiviteitInplannen_Click" />
    <asp:Label ID="LblBevestiging" runat="server" CssClass="labelbevestigingplanning"></asp:Label>


=======
    <asp:Button ID="btnActiviteitInplannen" runat="server" BackColor="#7FB241" CssClass="buttonactiviteiteninplannen" ForeColor="#FEFEFE" Text="Activiteiten Inplannen" OnClick="btnActiviteitInplannen_Click" />
    <asp:Label ID="LblBevestiging" runat="server" CssClass="labelbevestiging"></asp:Label>


    <asp:Calendar ID="Calendar1" runat="server" CssClass="kalender"></asp:Calendar>
>>>>>>> ReserveringTeam/Noah
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Nummer" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" CssClass="gridviewplanning" Width="50px" Height="100px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="Locatie" HeaderText="Locatie" SortExpression="Locatie" />
            <asp:BoundField DataField="Inschrijfkosten" HeaderText="Inschrijfkosten" SortExpression="Inschrijfkosten" />
            <asp:BoundField DataField="Maximaal aantal" HeaderText="Maximaal aantal" SortExpression="Maximaal aantal" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
            <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" ReadOnly="True" />
            <asp:BoundField DataField="Begintijd" HeaderText="Begintijd" SortExpression="Begintijd" ReadOnly="True" />
            <asp:BoundField DataField="Eindtijd" HeaderText="Eindtijd" SortExpression="Eindtijd" ReadOnly="True" />
            <asp:BoundField DataField="MedewerkerID" HeaderText="MedewerkerID" SortExpression="MedewerkerID" />
        </Columns>
        <Columns>
            <asp:CommandField SelectText="Wijzigen" ShowSelectButton="True" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM [vActiviteit]"></asp:SqlDataSource>

<<<<<<< HEAD
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Clear" />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Terug naar activiteit inplannen" />

    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Verwijder" />

</asp:Content>
=======
</asp:Content>
========
                 </div>

             </div>

</asp:Content>
>>>>>>>> ReserveringTeam/Noah:ProjectGroenBos/Recreatie/ActiviteitVerwijderen.aspx
>>>>>>> ReserveringTeam/Noah
