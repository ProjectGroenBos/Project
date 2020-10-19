<%@ Page Title="Planning Wijzigen" Language="C#" MasterPageFile="Schoonmaak.Master" AutoEventWireup="true" CodeBehind="PlanningWijzigen.aspx.cs" Inherits="ProjectGroenBos.Schoonmaak_en_Onderhoud.PlanningWijzigen" %>
<asp:Content ID="PlanningsWijzigen" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
        <br />
    <br />
        <br />
<div class="form-row">
    <div style="text-align:center;">
    <h1 class="text-primary">Planning Wijzigen</h1>
        </div>
    <div class="row col-sm-12">
       <div class="col-sm-12" style="text-align: center">
           <br />

           <hr />
           <br />
          </div>
        </div>
    </div>
    <div>
        <center>
        <asp:GridView ID="GridView1" Width="75%" runat="server" AutoGenerateColumns="False" DataKeyNames="Nummer" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#0E6251" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
            <Columns>
<<<<<<< HEAD
                <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
                <asp:BoundField DataField="Nummer" HeaderText="Nummer" SortExpression="Nummer" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
                <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
                <asp:BoundField DataField="BungalowNummer" HeaderText="BungalowNummer" SortExpression="BungalowNummer" />
                <asp:BoundField DataField="MedewerkerNummer" HeaderText="MedewerkerNummer" SortExpression="MedewerkerNummer" />
=======
                <asp:CommandField  ButtonType="Image" SelectImageUrl="~/Images/SelectIcon.png" ShowSelectButton="True"  />
                <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
                <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
                <asp:BoundField DataField="BungalowNummer" HeaderText="Bungalownummer" SortExpression="BungalowNummer" />
                <asp:BoundField DataField="Naam" HeaderText="Medewerker" SortExpression="MedewerkerNaam" />
>>>>>>> RecreatieTeam/DaanHeemskerk
            </Columns>
        <AlternatingRowStyle BackColor="#f0f0f0" />
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="#0E6251" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#0E6251" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        </center>
    </div>
    <br />
<<<<<<< HEAD
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT Medewerker.Naam, Schoonmaakopdracht.Nummer, Datum, Omschrijving, BungalowNummer, MedewerkerNummer  FROM [Schoonmaakopdracht] left join Medewerker on Medewerker.Nummer = Schoonmaakopdracht.MedewerkerNummer"></asp:SqlDataSource>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Nummer], [Naam] FROM [Medewerker]"></asp:SqlDataSource>
=======
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT Medewerker.Naam, Schoonmaakopdracht.Nummer, Datum, Omschrijving, BungalowNummer, MedewerkerNummer  FROM [Schoonmaakopdracht] left join Medewerker on Medewerker.Nummer = Schoonmaakopdracht.MedewerkerNummer"></asp:SqlDataSource>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [Nummer], [Naam] FROM [Medewerker]"></asp:SqlDataSource>
>>>>>>> RecreatieTeam/DaanHeemskerk

        <div style="text-align:center;">
  <div style="width:65%; margin: 0 auto; text-align:left;">
            <table style="width:100%;">
                 <tr>
                    <td class="auto-style6">Nummer</td>
                    <td class="auto-style11">
                        <asp:Label ID="lblNummerS" runat="server"></asp:Label>
                    </td>
                     <td class="auto-style12">

                         &nbsp;&nbsp;&nbsp;

                         </td>
                </tr>
                 <tr>
                    <td class="auto-style5">Schoonmaakdatum</td>
                    <td class="auto-style11">
                        <asp:TextBox ID="txtDatum" runat="server" Width="125px"></asp:TextBox>
                     </td>
                     <td class="auto-style13">

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDatum" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>

                         &nbsp;&nbsp;&nbsp;

                         </td>

                     <td class="auto-style9">

<<<<<<< HEAD
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtDatum" ErrorMessage="Invoer ongeldig " ForeColor="Red" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>

=======
>>>>>>> RecreatieTeam/DaanHeemskerk
                         </td>
                </tr>
                 <tr>
                    <td class="auto-style5">Medewerker</td>
                    <td class="auto-style11">
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Naam" DataValueField="Nummer" AppendDataBoundItems="True">
            <asp:ListItem Text="--Selecteer--" Value="0" />
        </asp:DropDownList>

                         &nbsp;

&nbsp;</td>
                      <td class="auto-style12">


                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Selecteer iets" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                          &nbsp;&nbsp;


                          </td>
                </tr>
                 <tr>
                    <td class="auto-style5">Bungalownummer</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="txtBNummer" runat="server" Width="125px"></asp:TextBox>
                     </td>
                     <td class="auto-style13">

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtBNummer" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>
                         &nbsp;&nbsp;
                         &nbsp;</td>
                     <td class="auto-style1">

                         <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtBNummer" ErrorMessage="Nummer ongeldig" ForeColor="Red" MaximumValue="20" MinimumValue="2" Type="Integer"></asp:RangeValidator>

                         </td>
                </tr>
                 <tr>
                    <td class="auto-style5">Omschrijving</td>
                    <td class="auto-style11">
                        <asp:TextBox ID="txtOmschrijving" runat="server" TextMode="MultiLine" Width="125px" Height="53px"></asp:TextBox>
                     </td>
                      <td class="auto-style13">

                     &nbsp;&nbsp;&nbsp;
                          
                     </td>
                     
                </tr>
                <tr>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">

                        &nbsp;</td>
                    <td class="auto-style10">

                        &nbsp;</td>
                    <td class="auto-style13">
                        &nbsp;</td>
                    <td>

                        <asp:Button ID="btnTerugNO" runat="server" BackColor="#0E6251" BorderColor="#0E6251" CssClass="buttonstyle" ForeColor="White" OnClick="btnTerugNO_Click" Text="Terug naar overzicht" />

                    </td>
                    <td>

                        <asp:Button ID="btnWijzigS" runat="server" BackColor="#0E6251" BorderColor="#0E6251" BorderStyle="Solid" CssClass="buttonstyle" ForeColor="White" OnClick="btnWijzigS_Click1" Text="Wijzig" />

                    </td>
                </tr>

            </table>
      </div>
        <br />
&nbsp;<br />

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }
        .auto-style5 {
            width: 270px;
        }
        .auto-style6 {
            height: 25px;
            width: 270px;
        }
        .auto-style9 {
            width: 273px;
        }
        .auto-style10 {
            width: 132px;
        }
        .auto-style11 {
            height: 25px;
            width: 132px;
        }
        .auto-style12 {
            height: 25px;
            width: 172px;
        }
        .auto-style13 {
            width: 172px;
        }
    </style>
</asp:Content>
