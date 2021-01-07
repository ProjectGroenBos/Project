<%@ Page Language="C#"   MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="NieuwproductAanvragen.aspx.cs" Inherits="ProjectGroenBos.Financien.NieuwproductAanvragen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Main grid --%>
    <div class="header">Aanvragen nieuwe producten</div>
    <div class="container">
        <h2>Nieuwe producten-overzicht</h2>
        <p>Dit zijn de aanvragen voor nieuwe producten.</p>


        <asp:GridView ID="gvLeveranciersOverzicht" DataKeyNames="ID" CssClass="content-table tweedetable" GridLines="None" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="Aanvraagnummer" InsertVisible="False" ReadOnly="True" SortExpression="ID" />

                <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />

                <asp:BoundField DataField="Opmerking" HeaderText="Opmerking" SortExpression="Opmerking" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <button type="button" style="background-color: #009879; color: #fff" class="btn" data-toggle="modal" data-target="#ToevoegenModal<%# Eval("ID") %>" OnClick="btnToevoegen2_Click">Meer...</button>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="select ID, Naam, Opmerking from InkoopAanvraagRegelNieuwProduct where Referentie IS NULL"></asp:SqlDataSource>
    </div>
    <asp:Repeater ID="Rptoevoegen" runat="server">

       <ItemTemplate>
    <div id="ToevoegenModal<%# Eval("ID") %>" class="modal fade" role="dialog">
        <div class="modal-dialog">
             
            <asp:HiddenField ID="Aantal" runat="server"
                                    Value='<%# Eval("Aantal") %>' />
            <asp:HiddenField ID="ID" runat="server"
                                    Value='<%# Eval("ID") %>' />
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Aanvragen voor nieuwe producten</h4>
                </div>
                <div class ="modal-body">
                    <p style="margin-top: 1rem; margin-bottom: 0;">Naam</p>
                    <asp:TextBox ID="txbNaam" Text='<%# Eval("Naam") %>' placeholder="Cornetto" runat="server" Style="text-align: center" Height="50px" Width="100%" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Naam" runat="server" ErrorMessage="*" ControlToValidate="txbNaam" ForeColor="red" ValidationGroup="Validation" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Naam1" runat="server" ErrorMessage="Bijv. Cornetto" ControlToValidate="txbNaam" ForeColor="Red" ValidationExpression="[a-zA-Z\.\'\-_\s]{1,40}" ValidationGroup="Validation" Display="Dynamic"></asp:RegularExpressionValidator>

                    <p style="margin-top: 1rem; margin-bottom: 0;">Prijs</p>
                    <asp:TextBox ID="txbPrijs" placeholder="32,95" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    

                    <p style="margin-top: 1rem; margin-bottom: 0;">Minimum voorraad</p>
                    <asp:TextBox ID="txbMinimumVoorraad" placeholder="100" runat="server" Style="text-align: center" Height="50px" Width="100%"></asp:TextBox>

                    <p style="margin-top: 1rem; margin-bottom: 0;">Omschrijving</p>
                    <asp:TextBox ID="txbOmschrijving" placeholder="Haarlem" runat="server" Style="text-align: center" Height="50px" Width="100%"></asp:TextBox>
                   
                 <p style="margin-top: 1rem; margin-bottom: 0;">Leverancier</p>
                <asp:DropDownList ID="DropDownList1" runat="server" Style="text-align: center" Height="50px" Width="100%" DataSourceID="SqlDataSource2" DataValueField="ID" DataTextField="Naam"></asp:DropDownList>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="select ID, Naam from Leverancier"></asp:SqlDataSource>


                    <asp:Button ID="btnToevoegen" CssClass="btnToevoegen" runat="server" CommandName="<%# Container.ItemIndex %>" Text="Toevoegen" OnClick="btnToevoegen_Click" />
                    <asp:Button ID="Button2" CssClass="btnToevoegen" runat="server" CommandName="<%# Container.ItemIndex %>" Text="Afwijzen" OnClick="btnAfkeuren_Click" BackColor="#FF5050" />
                    <asp:Button ID="Button1" CssClass="btnToevoegen" runat="server" CommandName="<%# Container.ItemIndex %>" Text="Leverancier Toevoegen" OnClick="btnToevoegen2_Click" />
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>
                </div>
            </div>
        </div>
        </div>
            </ItemTemplate>
    </asp:Repeater>

</asp:Content>
