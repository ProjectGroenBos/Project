<%@ Page Title="Overzicht Onderhoud" Language="C#" AutoEventWireup="true"  MasterPageFile="Schoonmaak.Master" CodeBehind="OnderhoudToevoegen.aspx.cs" Inherits="ProjectGroenBos.Schoonmaak_en_Onderhoud.OnderhoudToevoegen" 
    %><asp:Content ID="OnderhoudsToevoegent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <br />
    <br />
    <br />
    <br />
    <br />
        <br />
<div class="form-row">
    <div style="text-align:center;">
    <h1 class="text-primary">Onderhoud Toevoegen</h1>
        </div>
    <p class="text-primary">&nbsp;</p>
    <div class="row col-sm-12">
       <div class="col-sm-12" style="text-align: center">
           <br />
           <br />
           <hr />
          </div>
        </div>
    </div>
        <div style="text-align:center;">
  <div style="width:50%; margin: 0 auto; text-align:left;">
            <table style="width:100%;">
                 <tr>
                    <td>Startdatum </td>
                    <td style="width: 210px">
                        <asp:TextBox ID="txtStart" runat="server" CausesValidation="True"></asp:TextBox>
                    </td>
                     <td style="width: 415px">

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStart" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>

                         &nbsp;&nbsp;&nbsp;

                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtStart" ErrorMessage="Invoer Ongeldig " ForeColor="Red" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>

                     </td>
                </tr>
                 <tr>
                    <td>Verwachte einddatum</td>
                    <td style="width: 210px">
                        <asp:TextBox ID="txtEind" runat="server" CausesValidation="True"></asp:TextBox>
                    </td>
                     <td style="width: 415px">

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEind" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>

                         &nbsp;&nbsp;&nbsp;

                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEind" ErrorMessage="Invoer Ongeldig" ForeColor="Red" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
                         </td>

                     <td>

                         <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtStart" ControlToValidate="txtEind" ErrorMessage="Einddatum moet later" ForeColor="Red" Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>

                     </td>
                </tr>
                 <tr>
                    <td style="height: 27px">Kosten</td>
                    <td style="height: 27px; width: 210px;">
                        <asp:TextBox ID="txtKosten" runat="server" CausesValidation="True"></asp:TextBox>
                    </td>
                      <td style="height: 27px; width: 415px;">

                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtKosten" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>


                          &nbsp;&nbsp;&nbsp;


                          <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtKosten" ErrorMessage="Alleen Getallen" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>

                     </td>
                </tr>
                 <tr>
                    <td>Bungalownummer</td>
                    <td style="width: 210px">
                        <asp:TextBox ID="txtBungalownummer" runat="server" CausesValidation="True"></asp:TextBox>
                    </td>
                     <td style="width: 415px">

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtBungalownummer" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>

                         &nbsp;&nbsp;&nbsp;
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtBungalownummer" ErrorMessage="Alleen Getallen" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
&nbsp;</td>
                     <td>
                         <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtBungalownummer" ErrorMessage="Nummer Ongeldig" ForeColor="Red" MaximumValue="20" MinimumValue="2" Type="Integer"></asp:RangeValidator>

                     </td>
                </tr>
                 <tr>
                    <td style="height: 27px">Onderhoudsstatus</td>
                    <td style="height: 27px; width: 210px">
                        <asp:TextBox ID="txtOnderhoudsstatus" runat="server" CausesValidation="True"></asp:TextBox>
                    </td>
                      <td style="height: 27px; width: 415px">

                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtOnderhoudsstatus" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>

                     </td>
                </tr>
                 <tr>
                    <td>Onderhoudstype</td>
                    <td style="width: 210px">
                        <asp:TextBox ID="txtOnderhoudstype" runat="server" CausesValidation="True"></asp:TextBox>
                    </td>
                     <td style="width: 415px">

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtOnderhoudstype" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>

                     </td>
                </tr>
                 <tr>
                    <td>Datum van constatering</td>
                    <td style="width: 210px">
                        <asp:TextBox ID="txtConstatering" runat="server" CausesValidation="True"></asp:TextBox>
                    </td>
                     <td style="width: 415px">

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtConstatering" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtEind" ErrorMessage="Invoer Ongeldig" ForeColor="Red" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>

                     </td>
                </tr>
                                 <tr>
                    <td>Naam Medewerker </td>
                    <td style="width: 210px">
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Naam" DataValueField="Nummer">
                            <asp:ListItem>--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [Nummer], [Naam] FROM [Medewerker]"></asp:SqlDataSource>
                    </td>
                     <td style="width: 415px">

                         </td>
                                     </tr>
                <tr>
                     <td style="margin-left: 40px">  
                         <br />
                         <asp:Button ID="btnToevoegen" runat="server" Text="Toevoegen" OnClick="btnToevoegen_Click1" BackColor="#7FB241" BorderColor="#7FB241" />
                     </td>
                    <td style="width: 210px">

                    </td>

                   <td  style="margin-left: 40px; width: 415px;">
                  <asp:Button ID="btnTerugOOverzicht" runat="server" Text="Terug naar overzicht" OnClick="btnTerugOOverzicht_Click" BackColor="#7FB241" BorderColor="#7FB241" />
                     </td>
                </tr>
            </table>
        </div>
            </div>

 

        <p>
            &nbsp;</p>

 

</asp:Content>