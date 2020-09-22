<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="Personeeloverzicht.aspx.cs" Inherits="ProjectGroenBos.Financien.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Main grid --%>
    <div class="header">Personeellijst</div>
    <div class="container">
        <h2>Personeelscherm 2020</h2>
        <p>Dit is de indeling van alle werknemers bij recreatiepark Groenbos periode 2020/2021.</p>

        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#ToevoegenModal">Personeel toevoegen</button>

        <asp:GridView ID="gvPersoneelsOverzicht" DataKeyNames="Nummer" CssClass="content-table tweedetable" GridLines="None" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:BoundField DataField="Nummer" HeaderText="" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
                <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
                <asp:BoundField DataField="Geboortedatum" ApplyFormatInEditMode="true" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Geboortedatum" SortExpression="Geboortedatum" />
                <asp:BoundField DataField="In_dienst_sinds" ReadOnly="true" ApplyFormatInEditMode="true" DataFormatString="{0:dd/MM/yyyy}" HeaderText="In dienst sinds" SortExpression="In_dienst_sinds" />
                <asp:BoundField DataField="Salaris_per_maand" HeaderText="Salaris" SortExpression="Salaris" />
                <asp:BoundField DataField="Functie" ReadOnly="true" HeaderText="Functie" SortExpression="Functie" />
                <asp:BoundField DataField="Afdeling" ReadOnly="true" HeaderText="Afdeling" SortExpression="Afdeling" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT Med.Nummer, Med.Naam, Med.Geboortedatum, Med.[In dienst sinds] AS In_dienst_sinds, Med.[Salaris per maand] AS Salaris_per_maand, Fun.naam as Functie, Afd.Naam as Afdeling FROM (( dbo.Medewerker Med  inner join dbo.Functie Fun on Med.FunctieID = Fun.ID) inner join dbo.Afdeling Afd on Med.AfdelingID= Afd.ID) where Med.FunctieID= Fun.ID and Med.AfdelingID= Afd.ID" UpdateCommand="
Update dbo.Medewerker
Set [Salaris per maand] = @Salaris_per_maand, [Naam] = @Naam, [Geboortedatum] = convert(datetime,@Geboortedatum,104) Where [Nummer] = @Nummer">

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
                    <p>Naam</p>
                    <asp:TextBox ID="txbNaam" runat="server" Style="text-align: center" Height="50px" Width="100%"></asp:TextBox>
                    <p>Geboortedatum</p>
                    <asp:TextBox ID="txbGeboortedatum" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <p>Adres</p>
                    <asp:TextBox ID="txbAdres" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <p>Postcode</p>
                    <asp:TextBox ID="txbPostcode" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <asp:DropDownList ID="dlFunctie" Style="text-align: center; margin-top: 10px;" Height="50px" Width="100%" runat="server"></asp:DropDownList>
                    <asp:DropDownList ID="dlAfdeling" Style="text-align: center; margin-top: 10px;" Height="50px" Width="100%" runat="server"></asp:DropDownList>
                    <p>Contracturen per week</p>
                    <asp:TextBox ID="txbContracturen" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <p>In dienst sinds</p>
                    <asp:TextBox ID="txbInDienst" Style="text-align: center" Height="50px" Width="100%" runat="server"></asp:TextBox>
                    <asp:Button ID="btnToevoegen" CssClass="button" runat="server" Text="Toevoegen" OnClick="btnToevoegen_Click" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
