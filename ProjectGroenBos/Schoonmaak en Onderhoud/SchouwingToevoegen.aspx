<%@ Page Title="Toevoegen Schouwingen" Language="C#" AutoEventWireup="true" MasterPageFile="Schoonmaak.Master" CodeBehind="SchouwingToevoegen.aspx.cs" Inherits="ProjectGroenBos.Schoonmaak_en_Onderhoud.SchouwingToevoegen" %>
<asp:Content ID="SchouwingToevoegen" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <br />
    <br />
        <br />

<div class="form-row" style="text-align:center;">
    <h1 class="text-primary">Schouwing Toevoegen</h1>
    <br />
    <div class="row col-sm-12">
       <div class="col-sm-12" style="text-align:center;">
           <br />

           <hr />
          </div>
        <br />
         <div style="text-align:center;">
  <div style="margin: 0 auto; text-align:left;" class="auto-style1">
            <table>
                <tr>
                    <td class="auto-style7">

<asp:Label ID="Label1" runat="server" Text="Bungalownummer"></asp:Label>

                    </td>
                    <td class="auto-style3">

                        <asp:DropDownList ID="DropDownList1" runat="server">
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

                    &nbsp;</td>
                    <td>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Selecteer Iets" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">

        <asp:Label ID="Label2" runat="server" Text="Schouwingsdatum"></asp:Label>

                    </td>
                    <td class="auto-style3">

        <asp:TextBox ID="TxtSchouwingsDatum" runat="server" Width="125px"></asp:TextBox>
                        </td>
                    <td class="auto-style4">

                    <asp:RequiredFieldValidator ID="RFVSchouwingsdatum" runat="server" ControlToValidate="TxtSchouwingsDatum" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>

                        <br />

                    </td>
                    <td class="auto-style5">

                        <asp:RegularExpressionValidator ID="REVSchouwingsdatum" runat="server" ControlToValidate="TxtSchouwingsDatum" ErrorMessage="Onjuiste Datum " ValidationExpression="&quot;(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$&quot;" ForeColor="Red"></asp:RegularExpressionValidator>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                   
        <asp:Label ID="Label3" runat="server" Text="Omschrijving"></asp:Label>
                   
                    </td>
                    <td class="auto-style3">

        <asp:TextBox ID="TxtOmschrijving" runat="server" Height="79px" TextMode="MultiLine" Width="178px"></asp:TextBox>
                        <td class="auto-style4">
                            &nbsp;</td>                    
                </tr>
                <tr>
                    <td class="auto-style6">

                        <asp:Label ID="Label4" runat="server" Text="Status"></asp:Label>

                    </td>
                    <td>

                        <asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem Value="0">-- Selecteer --</asp:ListItem>
                            <asp:ListItem>Gepland</asp:ListItem>
                            <asp:ListItem>Bezig</asp:ListItem>
                            <asp:ListItem>Klaar</asp:ListItem>
                        </asp:DropDownList>

                    </td>
                    <td>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Selecteer Iets" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                    </td>
                </tr>  
                <tr>
                    <td>

                    </td>
                </tr>

                <tr>
                    <td class="auto-style7">

                    </td>
                    <td class="auto-style3">

        <asp:Button ID="BtnTerugNaarOverzicht" runat="server" OnClick="BtnTerugNaarOverzicht_Click" Text="Terug Naar overzicht" BackColor="#0E6251" BorderColor="#0E6251" CssClass="buttonstyle" ForeColor="White" />

                    </td>
                    <td class="auto-style4">

        <asp:Button ID="BtnToevoegen" runat="server" OnClick="BtnToevoegen_Click" Text="Toevoegen" BackColor="#0E6251" BorderColor="#0E6251" CssClass="buttonstyle" ForeColor="White" />

                    </td>
                </tr>
            </table>
        </div>
        </div>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;<br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;<br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />

        <br />
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 35%;
        }
        .auto-style3 {
            width: 244px;
        }
        .auto-style4 {
            width: 181px;
        }
        .auto-style5 {
            width: 204px;
        }
    .auto-style6 {
        width: 215px;
        height: 40px;
    }
    .auto-style7 {
        width: 215px;
    }
    </style>
</asp:Content>
