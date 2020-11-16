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
    <asp:TextBox ID="txtBungalowID" runat="server" OnTextChanged="txtBungalowID_TextChanged" Width="125px" ></asp:TextBox>

                     </td>
                     <td class="auto-style3">

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtBungalowID" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>

                         &nbsp;&nbsp;&nbsp;

                         </td>

                     <td class="auto-style2">

                         <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtBungalowID" ErrorMessage="Nummer ongeldig" ForeColor="Red" MaximumValue="20" MinimumValue="2" Type="Integer"></asp:RangeValidator>

                         </td>
                </tr>
                 <tr>
                    <td class="auto-style16">
           <asp:Label ID="lblDatum" runat="server" Text="Schouwingsdatum" ></asp:Label>
                     </td>
                    <td class="auto-style17">
           <asp:TextBox ID="txtdatum" runat="server" Width="125px" ></asp:TextBox>

                     </td>
                      <td class="auto-style1">


                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDatum" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>


                          &nbsp;&nbsp;&nbsp;


                          </td>
                     <td class="auto-style22">

                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtDatum" ErrorMessage="Invoer ongeldig " ForeColor="Red" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$" Enabled="False"></asp:RegularExpressionValidator>

                     </td>
                </tr>
                 <tr>
                    <td class="auto-style16">
           <asp:Label ID="lblOmschrijving" runat="server" Text="Omschrijving"></asp:Label>
                     </td>
                    <td class="auto-style17">
           <asp:TextBox ID="txtOmschrijving" runat="server" Height="25px" Width="125px" TextMode="MultiLine" ></asp:TextBox>
                     </td>
                     
                </tr>

                         

                <tr>
                    <td class="auto-style16">

                    </td>
                    <td class="auto-style17">

                        &nbsp;</td>
                    <td class="auto-style1">

                        &nbsp;</td>
                    <td class="auto-style22">

                        &nbsp;</td>
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
            width: 64px;
        }
        .auto-style2 {
            height: 52px;
        }
        .auto-style3 {
            width: 64px;
            height: 52px;
        }
    </style>
</asp:Content>
