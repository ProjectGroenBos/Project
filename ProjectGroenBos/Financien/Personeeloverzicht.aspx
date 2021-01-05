<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="Personeeloverzicht.aspx.cs" Inherits="ProjectGroenBos.Financien.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Main grid --%>
    <div class="header">Personeel-overzicht</div>
    <div class="container">
        <h2>Personeelscherm</h2>
        <p>Dit is de indeling van alle werknemers bij recreatiepark Groenbos.</p>

        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#ToevoegenModal">Personeel toevoegen</button>

        <asp:GridView ID="gvPersoneelsOverzicht" DataKeyNames="Nummer" CssClass="content-table tweedetable" GridLines="None" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:BoundField DataField="Nummer" HeaderText="" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
               
                <asp:TemplateField HeaderText="Naam" SortExpression="Naam">
                    <EditItemTemplate>
                        <asp:TextBox ID="TBnaam" runat="server" Text='<%# Bind("Naam") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="Naam" runat="server" ErrorMessage="*" ControlToValidate="TBnaam" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="Naam1" runat="server" ErrorMessage="Bijv. Cor Netto" ControlToValidate="TBnaam" ForeColor="Red" ValidationExpression="[a-zA-Z\.\'\-_\s]+[ëäÄÉéöÖüÜß\w-]{1,40}" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>                    
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Naam") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="Geboortedatum" SortExpression="Geboortedatum">
                    <EditItemTemplate>
                        <asp:TextBox ID="TBGB" runat="server" Text='<%# Bind("Geboortedatum", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="Geboortedatum" runat="server" ErrorMessage="*" ControlToValidate="TBGB" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="Geboortedatum1" runat="server" ErrorMessage="dd/MM/yyyy" ControlToValidate="TBGB" ForeColor="Red" ValidationExpression="(^((((0[1-9])|([1-2][0-9])|(3[0-1]))|([1-9]))-(((0[1-9])|(1[0-2]))|([1-9]))-(([0-9]{2})|(((19)|([2]([0]{1})))([0-9]{2}))))$)" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Geboortedatum", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="In_dienst_sinds" HeaderText="In dienst sinds" SortExpression="In_dienst_sinds" ApplyFormatInEditMode="True" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="True" />
              
                <asp:TemplateField HeaderText="Salaris" SortExpression="Salaris">
                    <EditItemTemplate>
                        <asp:TextBox ID="TBspm" runat="server" Text='<%# Bind("Salaris_per_maand") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="Salaris" runat="server" ErrorMessage="*" ControlToValidate="TBspm" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="Salaris1" runat="server" ErrorMessage="bijv. 5000" ControlToValidate="TBspm" ForeColor="Red" ValidationExpression="^\d{0,8}(\,\d{1,4})?$" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>                    
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Salaris_per_maand") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="Functie" HeaderText="Functie" SortExpression="Functie" ReadOnly="True" />
                <asp:BoundField DataField="Afdeling" HeaderText="Afdeling" SortExpression="Afdeling" ReadOnly="True" />

                <asp:CommandField ShowEditButton="True"/>
                <asp:TemplateField></asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT Med.Nummer, Med.Naam, Med.Geboortedatum, Med.[In dienst sinds] AS In_dienst_sinds, Med.[Salaris per maand] AS Salaris_per_maand, Fun.naam as Functie, Afd.Naam as Afdeling FROM (( dbo.Medewerker Med  inner join dbo.Functie Fun on Med.FunctieID = Fun.ID) inner join dbo.Afdeling Afd on Med.AfdelingID= Afd.ID) where Med.FunctieID= Fun.ID and Med.AfdelingID= Afd.ID" UpdateCommand="
Update dbo.Medewerker 
Set [Salaris per maand] = @Salaris_per_maand, [Naam] = @Naam, [Geboortedatum] = convert(datetime,@Geboortedatum,104)">
            <UpdateParameters>
                <asp:Parameter Name="Naam" />
                <asp:Parameter Name="Geboortedatum" />
                <asp:Parameter Name="Salaris_per_maand" />
                <asp:Parameter Name="Nummer" />
            </UpdateParameters>

        </asp:SqlDataSource>
    </div>

    <!-- Modal -->
    <div id="ToevoegenModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Personeel toevoegen</h4>
                </div>
                <div class="modal-body">
                    <p style="margin-top: 1rem; margin-bottom: 0;" >Naam</p>
                    <asp:TextBox ID="txbNaam" placeholder="Cor Netto" runat="server" Style="text-align: center" Height="50px" Width="100%"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="Naam" runat="server" ErrorMessage="*" ControlToValidate="txbNaam" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Naam1" runat="server" ErrorMessage="Bijv. Cor Netto" ControlToValidate="txbNaam" ForeColor="Red" ValidationExpression="[a-zA-Z\.\'\-_\s]{1,40}" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>                    

                    <p style="margin-top: 1rem; margin-bottom: 0;" >Geboortedatum</p>
                    <asp:TextBox ID="txbGeboortedatum" placeholder="DD-MM-YYYY" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="Geboortedatum" runat="server" ErrorMessage="*" ControlToValidate="txbGeboortedatum" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="Geboortedatum1" runat="server" ErrorMessage="dd/MM/yyyy" ControlToValidate="txbGeboortedatum" ForeColor="Red" ValidationExpression="(^((((0[1-9])|([1-2][0-9])|(3[0-1]))|([1-9]))-(((0[1-9])|(1[0-2]))|([1-9]))-(([0-9]{2})|(((19)|([2]([0]{1})))([0-9]{2}))))$)" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>

                    <p style="margin-top: 1rem; margin-bottom: 0;" >Adres</p>
                    <asp:TextBox ID="txbAdres" placeholder="Straatnaam 123" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Adres" runat="server" ErrorMessage="*" ControlToValidate="txbAdres" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Adres1" runat="server" ErrorMessage="Bijv. Straatnaam 123" ControlToValidate="txbAdres" ForeColor="Red" ValidationExpression="^[a-zA-Z]+\s[0-9]+$" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>                    

                    <p style="margin-top: 1rem; margin-bottom: 0;" >Postcode</p>
                    <asp:TextBox ID="txbPostcode" placeholder="ABCD12" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Postcode" runat="server" ErrorMessage="*" ControlToValidate="txbPostcode" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Postcode1" runat="server" ErrorMessage="Bijv. 2020AB" ControlToValidate="txbPostcode" ForeColor="Red" ValidationExpression="^[1-9][0-9]{3}\s?[a-zA-Z]{2}$" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>                    

                    <p style="margin-top: 1rem; margin-bottom: 0;" >Functie</p>
                    <asp:DropDownList ID="dlFunctie" Style="text-align: center;" Height="50px" Width="100%" runat="server"></asp:DropDownList>
                    
                    <p style="margin-top: 1rem; margin-bottom: 0;" >Afdeling</p>
                    <asp:DropDownList ID="dlAfdeling" Style="text-align: center;" Height="50px" Width="100%" runat="server"></asp:DropDownList>
                   
                    <p style="margin-top: 1rem; margin-bottom: 0;" >Salaris</p>
                    <asp:TextBox ID="txbSalaris" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Salaris" runat="server" ErrorMessage="*" ControlToValidate="txbSalaris" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Salaris1" runat="server" ErrorMessage="bijv. 5000" ControlToValidate="txbSalaris" ForeColor="Red" ValidationExpression="^\d{0,8}(\,\d{1,4})?$" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>                    

                    <p style="margin-top: 1rem; margin-bottom: 0;" >Contracturen per week</p>
                    <asp:TextBox ID="txbContracturen" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Contracturen_per_week" runat="server" ErrorMessage="*" ControlToValidate="txbContracturen" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Contracturen_per_week1" runat="server" ErrorMessage="bijv. 40" ControlToValidate="txbContracturen" ForeColor="Red" ValidationExpression="^\d{0,8}(\,\d{1,4})?$" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>                    
                    
                    <p style="margin-top: 1rem; margin-bottom: 0;" >In dienst sinds</p>
                   <asp:RequiredFieldValidator ID="In_dienst_sinds" runat="server" ErrorMessage="*" ControlToValidate="txbInDienst" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="In_dienst_sinds1" runat="server" ErrorMessage="dd/MM/yyyy" ControlToValidate="txbInDienst" ForeColor="Red" ValidationExpression="(^((((0[1-9])|([1-2][0-9])|(3[0-1]))|([1-9]))-(((0[1-9])|(1[0-2]))|([1-9]))-(([0-9]{2})|(((19)|([2]([0]{1})))([0-9]{2}))))$)" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txbInDienst" placeholder="DD-MM-YYYY" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <asp:Button ID="btnToevoegen" ValidationGroup="Validation" CssClass="btnToevoegen" runat="server" Text="Toevoegen" OnClick="btnToevoegen_Click" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
