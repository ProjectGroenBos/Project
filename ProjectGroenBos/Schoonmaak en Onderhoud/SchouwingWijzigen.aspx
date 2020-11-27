<%@ Page Title="Wijzigen Schouwingen" Language="C#" AutoEventWireup="true" MasterPageFile="Schoonmaak.Master" CodeBehind="SchouwingWijzigen.aspx.cs" Inherits="ProjectGroenBos.Schoonmaak_en_Onderhoud.SchouwingWijzigen" %>
<asp:Content ID="SchouwingWijzigen" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <br />
    <br />
        <br />
    <div class="form-row" style="text-align:center;">
    <h1 class="text-primary">Schouwing Wijzigen</h1>
    <br />
    <br />
    <br />
    </div>
    <div class="row col-sm-12"></div>
       <div class="col-sm-12" style="text-align:center;">
           <hr />
          </div>
    <br />
    <div style="text-align:center;">
  <div style="width:65%; margin: 0 auto; text-align:left;">
            <table class="auto-style23">
                 <tr>
                    <td class="auto-style16">
    <asp:Label ID="LblNummer" runat="server" Text="Nummer"></asp:Label>
                     </td>
                    <td class="auto-style17">
    <asp:Label ID="lblID" runat="server"></asp:Label>
                    </td>
                     <td class="auto-style1">

                         &nbsp;&nbsp;&nbsp;

                         </td>
                </tr>
                 <tr>
                    <td class="auto-style2">
    <asp:Label ID="lblBungalownummer" runat="server" Text="Bungalownummer"></asp:Label>
                     </td>
                    <td class="auto-style2">

                        <asp:DropDownList ID="DropDownList1" runat="server" Width="125px">
                            <asp:ListItem Value="0">-- Selecteer --</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                        </asp:DropDownList>

                     </td>
                     <td class="auto-style3">

                         &nbsp;&nbsp;&nbsp;

                         </td>

                     <td class="auto-style2">

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Selecteer Iets" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                         </td>
                </tr>
                 <tr>
                    <td class="auto-style16">
           <asp:Label ID="lblDatum" runat="server" Text="Schouwingsdatum" ></asp:Label>
                     </td>
                    <td class="auto-style17">
           &nbsp;
                        <asp:Label ID="lblDatumW" runat="server"></asp:Label>

                     </td>
                      <td class="auto-style1">


                          &nbsp;&nbsp;&nbsp;


                          </td>
                     <td class="auto-style22">

                         &nbsp;</td>
                </tr>
                 <tr>
                    <td class="auto-style16">
           <asp:Label ID="lblOmschrijving" runat="server" Text="Omschrijving"></asp:Label>
                     </td>
                    <td class="auto-style17">
           <asp:TextBox ID="txtOmschrijving" runat="server" Height="66px" Width="172px" TextMode="MultiLine" ></asp:TextBox>
                     </td>
                     
                </tr>

                         

                <tr>
                    <td class="auto-style16">

                        <asp:Label ID="Label4" runat="server" Text="Status"></asp:Label>

                    </td>
                    <td class="auto-style17">

                        <asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem Value="0">-- Selecteer --</asp:ListItem>
                            <asp:ListItem>Gepland</asp:ListItem>
                            <asp:ListItem>Bezig</asp:ListItem>
                            <asp:ListItem>Klaar</asp:ListItem>
                        </asp:DropDownList>

                    </td>
                    <td class="auto-style1">

                        &nbsp;</td>
                    <td class="auto-style22">

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Selecteer Iets" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                         </td>
                </tr>
                <tr>
                    <td>

                    </td>
                    <td>

                    </td>
                    <td class="auto-style1">

                    </td>
                </tr>
                <tr>
                    <td>

                    </td>
                    <td>

                    </td>
                    <td class="auto-style1">

                        &nbsp;</td>
                    <td class="auto-style22">

                        <asp:Button ID="btnTerug" runat="server" BackColor="#0E6251" BorderColor="#0E6251" CssClass="buttonstyle" ForeColor="White" OnClick="btnTerugNO_Click" Text="Terug naar overzicht" />

                        <td class="auto-style24">

                        <asp:Button ID="btnWijzigS" runat="server" BackColor="#0E6251" BorderColor="#0E6251" BorderStyle="Solid" CssClass="buttonstyle" ForeColor="White" OnClick="btnWijzigS_Click1" Text="Wijzig" />

                    </td>
                </tr>
            </table>
      </div>
    
    <br />
    <br />
    <br />
                         &nbsp;&nbsp;

                         <br />
    <div class="row col-sm-12">
       <div class="col-sm-12" style="text-align:center;">

                         &nbsp;&nbsp;

                         <br />
           <br />
           <br />

           <hr />
          </div>

        <br />
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
        .auto-style2 {
            height: 52px;
        }
        .auto-style3 {
            width: 100px;
            height: 52px;
        }
    </style>
</asp:Content>
