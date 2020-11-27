<%@ Page Title="Toevoegen Project" Language="C#" AutoEventWireup="true" MasterPageFile="Schoonmaak.Master" CodeBehind="ProjectToevoegen.aspx.cs" Inherits="ProjectGroenBos.Schoonmaak_en_Onderhoud.ProjectToevoegen" %>
<asp:Content ID="ProjectToevoegen" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <br />
    <br />
        <br />

<div class="form-row" style="text-align:center;">
    <h1 class="text-primary">Project Toevoegen</h1>
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

        <asp:Label ID="Label3" runat="server" Text="Bevinding(en)"></asp:Label>
                   
                    </td>
                    <td class="auto-style3">

        <asp:TextBox ID="TxtOmschrijving" runat="server" Height="99px" TextMode="MultiLine" Width="228px"></asp:TextBox>
                        </td>
                    <td class="auto-style4">

                        <br />

                    </td>
                    <td class="auto-style5">

                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">
                   
                        <asp:Label ID="Label5" runat="server" Text="Projectcategorie"></asp:Label>
                   
                    </td>
                    <td class="auto-style3">

                        <asp:DropDownList ID="DropDownList3" runat="server" Width="231px">
                <asp:ListItem Value="0">-- Selecteer --</asp:ListItem>
                <asp:ListItem>Raamwerk</asp:ListItem>
                <asp:ListItem>Vloerwerk</asp:ListItem>
                <asp:ListItem>Dakwerk</asp:ListItem>
                <asp:ListItem>Interieurwerk</asp:ListItem>
                <asp:ListItem>Stucken</asp:ListItem>
                <asp:ListItem>Schilderen</asp:ListItem>
                        </asp:DropDownList>
                        <td class="auto-style4">

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList3" ErrorMessage="Selecteer Iets" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                    </td>                    
                </tr>
                <tr>
                    <td class="auto-style6">

                        <asp:Label ID="Label4" runat="server" Text="Offertestatus"></asp:Label>

                    </td>
                    <td>

                        <asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem Value="0">-- Selecteer --</asp:ListItem>
                            <asp:ListItem>Financien</asp:ListItem>
                            <asp:ListItem>Ontvangen</asp:ListItem>
                            <asp:ListItem>Ontbreekt</asp:ListItem>
                        </asp:DropDownList>

                    </td>
                    <td>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Selecteer Iets" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                    </td>
                </tr>  
                <tr>
                    <td class="auto-style7">

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
        width: 223px;
        height: 40px;
    }
    .auto-style7 {
            width: 223px;
        }
    </style>
</asp:Content>