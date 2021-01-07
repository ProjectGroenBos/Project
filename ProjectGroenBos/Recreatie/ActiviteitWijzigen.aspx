<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="ActiviteitWijzigen.aspx.cs" Inherits="recreatie.paginas.ActiviteitWijzigen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Activiteit Wijzigen</div>
        <asp:GridView ID="GridView1"  CssClass="content-table4" runat="server" AutoGenerateColumns="False" DataKeyNames="Nummer"  DataSourceID="SqlDataSource5" AllowPaging="True" GridLines="None">
            <Columns>
                <asp:BoundField DataField="Nummer" HeaderText="Nummer" ReadOnly="True" SortExpression="Nummer" />
                <asp:TemplateField HeaderText="Activiteitnaam" SortExpression="Activiteitnaam">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Activiteitnaam") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="TextBox1" CssClass="ReqActiviteitValidator"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Voer een geldige Activiteit in" ControlToValidate="TextBox1" ValidateRequestMode="Enabled" Display="Dynamic" ValidationExpression="^[a-zA-Z]+$" CssClass="RegularActiviteitValidator"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Activiteitnaam") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Locatie" SortExpression="Locatie">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Locatie") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox2" Display="Dynamic" ValidateRequestMode="Enabled" CssClass="ReqLocatieVaidator"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Locatie") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Inschrijfkosten" SortExpression="Inschrijfkosten">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Inschrijfkosten") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="TextBox3" ValidateRequestMode="Enabled" CssClass="ReqInschrijfkostenValidator"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Voer een bedrag in" Display="Dynamic" ControlToValidate="TextBox3" CssClass="RegularInschrijfkostenValidator" ValidationExpression="^\d*\,?\d*$"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Inschrijfkosten") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Maximaal aantal" SortExpression="MaximaalAantal">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbMaxAantal" runat="server" Text='<%# Bind("MaximaalAantal") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="TbMaxAantal" Display="Dynamic" CssClass="ReqTbMaxAantal"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Voer een aantal in" Display="Dynamic" ControlToValidate="TbMaxAantal" ValidationExpression='^\d+$' CssClass="RegularTbMaxAantal"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("MaximaalAantal") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Omschrijving" SortExpression="Omschrijving">
                    <EditItemTemplate>
                       
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Omschrijving" DataValueField="ID" SelectedValue='<%# Bind("FaciliteitID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [ID], [Omschrijving] FROM [Faciliteit]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Omschrijving") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Datum" SortExpression="Datum">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbDatum" runat="server" Text='<%# Bind("Datum", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="TbDatum" CssClass="ReqTbDatum"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Voer een geldige datum in" Display="Dynamic" ControlToValidate="TbDatum" Type="Date" Operator="DataTypeCheck" CssClass="RegularActiviteitValidator"></asp:CompareValidator>
                        </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Datum", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Begintijd" SortExpression="Begintijd">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbBegintijd" runat="server" Text='<%# Bind("Begintijd") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="TbBegintijd" CssClass="ReqTbBegintijd"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Voer een geldige begintijd in" Display="Dynamic" ControlToValidate="TbBegintijd" CssClass="RegularActiviteitValidator" ValidationExpression="(?:[01]?\d|2[0-3])(?::[0-5]\d){1,2}$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>

                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Begintijd") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Eindtijd" SortExpression="Eindtijd">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbEindtijd" runat="server" Text='<%# Bind("Eindtijd") %>'></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="TbEindtijd" Display="Dynamic" CssClass="ReqTbEindtijd"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Vul een geldige tijd in" ControlToValidate="TbEindtijd" ControlToCompare="TbBegintijd" Type="String" Operator="GreaterThan" CssClass="RegularActiviteitValidator"></asp:CompareValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEindtijd" runat="server" ErrorMessage="Voer een geldige Eindtijd in" Display="Dynamic" CssClass="RegularActiviteitValidator" ValidationExpression="(?:[01]?\d|2[0-3])(?::[0-5]\d){1,2}$" ControlToValidate="TbEindtijd"></asp:RegularExpressionValidator>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Eindtijd") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Naam" SortExpression="Naam">
             
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Naam" DataValueField="Nummer" SelectedValue='<%# Bind("MedewerkerID") %>' AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Nummer], [Naam] FROM [Medewerker]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Label ID="Label1" runat="server" Text='<%# Bind("Naam") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="FaciliteitID" HeaderText="FaciliteitID" Visible="False" />
            </Columns>
        </asp:GridView>

    <asp:HiddenField ID="MedewerkerID" runat="server"
                                    Value='' />
     <asp:HiddenField ID="FaciliteitID" runat="server"
                                    Value='' />
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="select Nummer, Activiteitnaam, Locatie, Inschrijfkosten, [Maximaal aantal] as 'MaximaalAantal', Omschrijving, Datum, Begintijd, Eindtijd, Naam, MedewerkerID, FaciliteitID from vactiviteit" UpdateCommand="update [dbo].[Activiteit] set [Naam] = @ActiviteitNaam , [Locatie]= @Locatie, [Inschrijfkosten] = @Inschrijfkosten, [FaciliteitID] = @FaciliteitID, [Begintijd] = @Begintijd, [Maximaal aantal] = @MaximaalAantal, [Datum] = @Datum, [Eindtijd] = @Eindtijd, [MedewerkerID] = @MedewerkerID Where Nummer = @Nummer">
            <UpdateParameters>
                <asp:Parameter Name="ActiviteitNaam"  />
                <asp:Parameter Name="Locatie" />
                <asp:Parameter Name="Inschrijfkosten" />
                <asp:Parameter Name="Begintijd" />
                <asp:Parameter Name="MaximaalAantal" />  
                <asp:Parameter Name="Datum" DbType="Date" />
                <asp:Parameter Name="Eindtijd" />
                <asp:ControlParameter
                    Name="MedewerkerID"
                    ControlID="MedewerkerID"
                    PropertyName="Value" />
                <asp:Parameter Name="Nummer" />
                 <asp:ControlParameter
                    Name="FaciliteitID"
                    ControlID="FaciliteitID"
                    PropertyName="Value" />
                <asp:Parameter Name="Nummer" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>