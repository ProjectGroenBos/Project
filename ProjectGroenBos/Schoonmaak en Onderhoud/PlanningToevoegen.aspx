<%@ Page Title="Planning Toevoegen" Language="C#" AutoEventWireup="true" MasterPageFile="Schoonmaak.Master" CodeBehind="PlanningToevoegen.aspx.cs" Inherits="ProjectGroenBos.Schoonmaak_en_Onderhoud.PlanningToevoegen" %>
<asp:Content ID="PlanningsToevoegen" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <br />
    <br />
        <br />

<div class="form-row" style="text-align:center;">
    <h1 class="text-primary">Planning Toevoegen</h1>
    <br />
    <div class="row col-sm-12">
       <div class="col-sm-12" style="text-align:center;">
           <br />

           <hr />
          </div>
        <br />
        <div>
             </div>
        <div style="text-align:center;">
  <div style="width:65%; margin: 0 auto; text-align:left;">
            <table style="width:100%;">
                 <tr>
                    <td class="auto-style5">Schoonmaakdatum</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtSDatum" runat="server" CausesValidation="True" Width="125px"></asp:TextBox>
                    &nbsp;

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSDatum" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>

                         </td>
                     <td class="auto-style7">

                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtSDatum" ErrorMessage="Invoer ongeldig " ForeColor="Red" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>

                         </td>
                </tr>               
                 <tr>
                    <td class="auto-style3">Bungalownummer</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtBungalownummer" runat="server" CausesValidation="True" Width="125px"></asp:TextBox>
                    &nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBungalownummer" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>

                    </td>
                     <td class="auto-style2">

                         <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtBungalownummer" ErrorMessage="Nummer ongeldig" ForeColor="Red" MaximumValue="20" MinimumValue="2" Type="Integer"></asp:RangeValidator>

                         &nbsp;&nbsp;&nbsp;
                         &nbsp;</td>
                     <td class="auto-style5">
                         &nbsp;</td>
                </tr>                          
                                 <tr>
                    <td class="auto-style3">Naam Medewerker </td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Naam" DataValueField="Nummer" AppendDataBoundItems="True">
                            <asp:ListItem Text="--Selecteer--" Value="0" />
                        </asp:DropDownList>
                        &nbsp;&nbsp;

                         </td>
                     <td class="auto-style2">

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Selecteer iets" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                                     </td>
                                     </tr>
                                                 <tr>
                    <td class="auto-style3">Omschrijving </td>
                    <td class="auto-style4">

                        <asp:TextBox ID="txtOmschr" runat="server" Height="94px" MaxLength="500" TextMode="MultiLine" Width="224px"></asp:TextBox>

                    </td>
                     <td class="auto-style2">

                         &nbsp;</td>
                                     </tr>

                 <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [Nummer], [Naam] FROM [Medewerker]"></asp:SqlDataSource>
                     </td>
                     <td class="auto-style2">

                         &nbsp;</td>
                     <td>

                         &nbsp;</td>
                </tr>
                <tr>
                     <td style="margin-left: 40px" class="auto-style3">  
                         <br />
                     </td>
                    <td class="auto-style4">

                        &nbsp;</td>

                   <td class="auto-style2" >
                 
                         <asp:Button ID="btnTerugNO" runat="server" BackColor="#0E6251" BorderColor="#0E6251" CssClass="buttonstyle" ForeColor="White" OnClick="btnTerugNO_Click" Text="Terug naar overzicht" />
                 
                     </td>
                    <td  style="margin-left: 40px; " class="auto-style1">

                         <asp:Button ID="btnToevoegen" runat="server" Text="Toevoegen" OnClick="btnToevoegen_Click1" BackColor="#0E6251" BorderColor="#0E6251" ForeColor="White" CssClass="buttonstyle" />
                 
                     </td>

                </tr>
            </table>
        </div>

        <br />
        </div>
    </div>
    </div>



</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 289px;
        }
        .auto-style2 {
            width: 254px;
        }
        .auto-style3 {
            width: 232px;
        }
        .auto-style4 {
            width: 205px;
        }
        .auto-style5 {
            width: 232px;
            height: 31px;
        }
        .auto-style6 {
            width: 205px;
            height: 31px;
        }
        .auto-style7 {
            width: 254px;
            height: 31px;
        }
    </style>
</asp:Content>

