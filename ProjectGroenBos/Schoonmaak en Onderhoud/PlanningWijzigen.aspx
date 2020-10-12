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
                <asp:CommandField  ButtonType="Image" SelectImageUrl="~/Images/SelectIcon.png" ShowSelectButton="True"  />
                <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
                <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
                <asp:BoundField DataField="BungalowNummer" HeaderText="Bungalownummer" SortExpression="BungalowNummer" />
                <asp:BoundField DataField="Naam" HeaderText="Medewerker" SortExpression="MedewerkerNaam" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT Medewerker.Naam, Schoonmaakopdracht.Nummer, Datum, Omschrijving, BungalowNummer, MedewerkerNummer  FROM [Schoonmaakopdracht] left join Medewerker on Medewerker.Nummer = Schoonmaakopdracht.MedewerkerNummer"></asp:SqlDataSource>
        <div style="text-align:center;">
  <div style="width:65%; margin: 0 auto; text-align:left;">
            <table style="width:100%;">
                 <tr>
                    <td class="auto-style16">Nummer</td>
                    <td class="auto-style3">
                        <asp:Label ID="lblNummerS" runat="server"></asp:Label>
                    </td>
                     <td class="auto-style18">

                         &nbsp;&nbsp;&nbsp;

                         </td>
                </tr>
                 <tr>
                    <td class="auto-style15">Schoonmaakdatum</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtDatum" runat="server" Width="125px"></asp:TextBox>
                     </td>
                     <td class="auto-style8">

                         &nbsp;&nbsp;&nbsp;

                         </td>

                     <td class="auto-style9">

                         </td>
                </tr>
                 <tr>
                    <td class="auto-style16">Omschrijving</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtOmschrijving" runat="server" TextMode="MultiLine" Width="125px"></asp:TextBox>
                     </td>
                      <td class="auto-style2">


                          &nbsp;&nbsp;&nbsp;


                          </td>
                </tr>
                 <tr>
                    <td class="auto-style16">Bungalownummer</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtBNummer" runat="server" Width="125px"></asp:TextBox>
                     </td>
                     <td class="auto-style18">

                         &nbsp;&nbsp;&nbsp;
                         &nbsp;</td>
                     <td class="auto-style1">
                         &nbsp;</td>
                </tr>
                 <tr>
                    <td class="auto-style16">Medewerker</td>
                    <td class="auto-style7">
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Naam" DataValueField="Nummer" AppendDataBoundItems="True">
            <asp:ListItem Text="--Selecteer--" Value="0" />
        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [Nummer], [Naam] FROM [Medewerker]"></asp:SqlDataSource>
                     </td>
                      <td class="auto-style8">

                     &nbsp;&nbsp;&nbsp;
                          
                     </td>
                     
                </tr>
                <tr>
                    <td>

                    </td>
                    <td>

                    </td>
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