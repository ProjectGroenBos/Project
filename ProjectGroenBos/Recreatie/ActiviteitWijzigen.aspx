<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="ActiviteitWijzigen.aspx.cs" Inherits="recreatie.paginas.ActiviteitWijzigen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Names="Century Gothic" Font-Overline="False" Font-Size="X-Large" Text="Planning" CssClass="labelplanning"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="Activiteit:" CssClass="labelactiviteit"></asp:Label>


    <asp:TextBox ID="TxbActiviteit" runat="server" CssClass="textboxplanningactiviteit"></asp:TextBox>
    <asp:RequiredFieldValidator ID="Activiteitvalidator" runat="server" ControlToValidate="TxbActiviteit" ErrorMessage="Vul een activiteit in" ForeColor="Red" CssClass="validatortxbactiviteit">Vul een activiteit in</asp:RequiredFieldValidator>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM [Activiteit]"></asp:SqlDataSource>

    <asp:Label ID="Label4" runat="server" Text="Locatie:" CssClass="labellocatie"></asp:Label>

    <asp:TextBox ID="txbLocatie" runat="server" CssClass="textboxlocatie"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocatie" runat="server" ControlToValidate="txbLocatie" ErrorMessage="Je moet een locatie invullen" ForeColor="Red" CssClass="validatorlocatie">Vul een locatie in</asp:RequiredFieldValidator>



    <asp:Label ID="Label5" runat="server" Text="Aantal:" CssClass="labelaantal"></asp:Label>

    <asp:TextBox ID="TxbAantal" runat="server" CssClass="textboxaantal"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBegeleider" runat="server" ControlToValidate="TxbAantal" ErrorMessage="RequiredFieldValidator" ForeColor="Red" CssClass="validatoraantal">Vul een aantal in</asp:RequiredFieldValidator>


    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="gridviewbegeleider" EmptyDataText="No data yet" OnRowDeleting="GridView2_RowDeleting" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>

    <asp:Label ID="Label6" runat="server" Text="Begeleider:" CssClass="labelbegeleider"></asp:Label>

    <asp:DropDownList ID="TxbMedewerker" runat="server" OnRowCommand="gvMedewerker_RowCommand" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Naam" DataValueField="Naam" OnSelectedIndexChanged="TxbMedewerker_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorBegeleider" runat="server" ControlToValidate="TxbMedewerker" ErrorMessage="RegularExpressionValidator" ValidationExpression="\d+" ForeColor="Red" CssClass="validatormedewerker">Vul een medewerker in</asp:RegularExpressionValidator>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Naam], [Nummer] FROM [Medewerker]"></asp:SqlDataSource>




    <asp:Label ID="Label9" runat="server" Text="Datum:" CssClass="labelplanningdatum"></asp:Label>

    <asp:TextBox ID="TxbDatum" runat="server" CssClass="textboxdatum" TextMode="DateTime"></asp:TextBox>
    <asp:CompareValidator ID="Datevalidator" runat="server" ControlToValidate="TxbDatum" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Date" ForeColor="Red" CssClass="validatordatumcompare">Onjuiste datum</asp:CompareValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDatum" runat="server" ControlToValidate="TxbDatum" ErrorMessage="RequiredFieldValidator" ForeColor="Red" CssClass="validatordatum">Vul een datum in</asp:RequiredFieldValidator>


    <asp:Label ID="Label7" runat="server" Text="Begintijd:" CssClass="labelbegintijd"></asp:Label>

    <asp:TextBox ID="TxbBegintijd" runat="server" CssClass="textboxbegintijd" TextMode="Time"></asp:TextBox>
    <!--
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxbBegintijd" ErrorMessage="Je moet een geldige tijd invullen" ValidationExpression="^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$" ForeColor="Red" CssClass="validatorgeldigetijd">Vul een geldige tijd in</asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBegintijd" runat="server" ControlToValidate="TxbBegintijd" ErrorMessage="RequiredFieldValidator" ForeColor="Red" CssClass="validatorbegintijd">Vul een begintijd in</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorBegintijd" runat="server" ControlToValidate="TxbBegintijd" ErrorMessage="Je moet een geldige tijd invullen" ValidationExpression="^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$" ForeColor="Red" CssClass="validatorgeldigetijd">Vul een geldige tijd in</asp:RegularExpressionValidator>
    !-->



    <asp:Label ID="Label8" runat="server" Text="Eindtijd:" CssClass="labeleindtijd"></asp:Label>

    <asp:TextBox ID="TxbEindtijd" runat="server" CssClass="textboxeindtijd" TextMode="Time"></asp:TextBox>
    <!--
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEindtijd" runat="server" ControlToValidate="TxbEindtijd" ErrorMessage="RequiredFieldValidator" ForeColor="Red" CssClass="validatoreindtijd">Vul een eindtijd in</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEindtijd" runat="server" ControlToValidate="TxbEindtijd" ErrorMessage="Het moet een geldige tijd zijn" ValidationExpression="^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$" ForeColor="Red" CssClass="validatorgeldigeeindtijd">Vul een geldige tijd in</asp:RegularExpressionValidator>
        !-->
    <asp:Label ID="Label10" runat="server" CssClass="labelinschrijfkosten" Text="Inschrijfkosten:"></asp:Label>

    <asp:TextBox ID="txbInschrijfkosten" runat="server" CssClass="textboxinschrijfkosten"></asp:TextBox>
    <asp:RangeValidator ID="RangeValidatorInschrijfkosten" runat="server" ControlToValidate="txbInschrijfkosten" ErrorMessage="RangeValidator" MaximumValue="25" MinimumValue="0" Type="Double" ForeColor="Red" CssClass="validatornulvijfentwintiginschrijfkosten">Vul een getal tussen 0 en 25 in</asp:RangeValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorInschrijfkosten" runat="server" ControlToValidate="txbInschrijfkosten" ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d{1,3}(\.\d{3})*(,\d{2})?$" ForeColor="Red" CssClass="validatorbedraginschrijfkosten">Vul een bedrag in</asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorInschrijfkosten" runat="server" ControlToValidate="txbInschrijfkosten" ErrorMessage="RequiredFieldValidator" ForeColor="Red" CssClass="validatorinschrijfkosten">Vul een getal in</asp:RequiredFieldValidator>



    <asp:Label ID="Label11" runat="server" CssClass="labelfaciliteit" Text="Faciliteit"></asp:Label>

    <asp:DropDownList ID="ddlFaciliteit" runat="server" DataSourceID="SqlDataSource4" DataTextField="Omschrijving" CssClass="textboxfaciliteit" DataValueField="ID"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [ID], [Omschrijving] FROM [Faciliteit]"></asp:SqlDataSource>




    <asp:Button ID="Button1" runat="server" OnClick="btnActiviteitInplannen_Click" Text="Button" />




    <asp:Button ID="btnActiviteitInplannen" runat="server" BackColor="#117B66" CssClass="buttonactiviteiteninplannen" ForeColor="#FEFEFE" Text="Activiteiten Inplannen" OnClick="btnActiviteitInplannen_Click" />
    <asp:Label ID="LblBevestiging" runat="server" CssClass="labelbevestigingplanning"></asp:Label>


     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Nummer"  DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" CssClass="content-table4" Width="100px" Height="150px" AllowPaging="True" AllowCustomPaging="True" OnRowUpdating="GridView1_RowUpdating" AutoGenerateEditButton="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Activiteitnaam" HeaderText="Activiteitnaam" SortExpression="Activiteitnaam" />
            <asp:BoundField DataField="Locatie" HeaderText="Locatie" SortExpression="Locatie" />
            <asp:BoundField DataField="Inschrijfkosten" HeaderText="Inschrijfkosten" SortExpression="Inschrijfkosten" />
            <asp:BoundField DataField="Maximaal aantal" HeaderText="Maximaal aantal" SortExpression="Maximaal aantal" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
            <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" ReadOnly="True" />
            <asp:BoundField DataField="Begintijd" HeaderText="Begintijd" SortExpression="Begintijd" ReadOnly="True" />
            <asp:BoundField DataField="Eindtijd" HeaderText="Eindtijd" SortExpression="Eindtijd" ReadOnly="True" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="MedewerkerID" HeaderText="MedewerkerID" SortExpression="MedewerkerID" />
        </Columns>
        
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM [vActiviteit]"></asp:SqlDataSource>

    <div id="Popup" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Afboeken</h4>
                        </div>
                        <div class="modal-body">
                            <asp:GridView ID="GvWijzigenActiviteit" runat="server" AutoGenerateColumns="False" ShowFooter="true" DataKeyNames="ID" ShowHeaderWhenEmpty="true"
                             CellPadding="4" ForeColor="#333333" GridLines="none" Width="80%" CssClass="content-table">

          
                             <Columns>
                <asp:TemplateField HeaderText="Nummer" SortExpression="Nummer" Visible ="True" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label  ID="Label1" Text='<%# Eval("Nummer") %>' runat="server"/>
                    </ItemTemplate>                     
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Activiteit Naam" SortExpression="Activiteitnaam" HeaderStyle-ForeColor="White">  
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Naam") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Locatie" SortExpression="Locatie" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Locatie") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Inschrijfkosten" SortExpression="Inschrijfkosten" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Inschrijfkosten") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Maximaal Aantal" SortExpression="MaximaalAantal" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Maximaal Aantal") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Omschrijving" SortExpression="Omschrijving" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Omschrijving") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Datum" SortExpression="Datum" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Datum") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="BeginTijd" SortExpression="BeginTijd" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("BeginTijd") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="EindTijd" SortExpression="EindTijd" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("EindTijd") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MedewerkerID" SortExpression="MedewerkerID" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("MedewerkerID") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            
        </Columns>          
                            </asp:GridView>
                             </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>
                        </div>
                    </div>
                </div>
            </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT * FROM [vActiviteit]" UpdateCommand="update [dbo].[Activiteit]
set [Naam] = @Naam , [Locatie]= @Locatie, [Inschrijfkosten] = @Inschrijfkosten, [Begintijd] = @Begintijd,
[Maximaal aantal] = @MaximaalAantal, [FaciliteitID] = @FaciliteitID, [Datum] = @Datum, [Eindtijd] = @Eindtijd, 
[MedewerkerID] = @MedewerkerID Where [Nummer] = @Nummer">
        <UpdateParameters>
            <asp:Parameter Name="Naam" />
            <asp:Parameter Name="Locatie" />
            <asp:Parameter Name="Inschrijfkosten" />
            <asp:Parameter Name="Begintijd" />
            <asp:Parameter Name="MaximaalAantal" />
            <asp:Parameter Name="FaciliteitID" />
            <asp:Parameter Name="Datum" />
            <asp:Parameter Name="Eindtijd" />
            <asp:Parameter Name="MedewerkerID" />
            <asp:Parameter Name="Nummer" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>