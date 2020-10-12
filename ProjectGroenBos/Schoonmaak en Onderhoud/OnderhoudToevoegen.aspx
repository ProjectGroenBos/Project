<%@ Page Title="Overzicht Onderhoud" Language="C#" AutoEventWireup="true"  MasterPageFile="Schoonmaak.Master" CodeBehind="OnderhoudToevoegen.aspx.cs" Inherits="ProjectGroenBos.Schoonmaak_en_Onderhoud.OnderhoudToevoegen" 
    %><asp:Content ID="OnderhoudsToevoegent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <br />
    <br />
        <br />
<div class="form-row">
    <div style="text-align:center;">
    <h1 class="text-primary">Onderhoud Toevoegen</h1>
        </div>
    <div class="row col-sm-12">
       <div class="col-sm-12" style="text-align: center">
           <br />

           <hr />
           <br />
          </div>
        </div>
    </div>
        <div style="text-align:center;">
  <div style="width:65%; margin: 0 auto; text-align:left;">
            <table style="width:100%;">
                 <tr>
                    <td class="auto-style16">Startdatum </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtStart" runat="server" CausesValidation="True" Width="125px"></asp:TextBox>
                    </td>
                     <td class="auto-style18">

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStart" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>

                         &nbsp;&nbsp;&nbsp;

                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtStart" ErrorMessage="Invoer ongeldig " ForeColor="Red" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>

                     </td>
                </tr>
                 <tr>
                    <td class="auto-style16">Verwachte einddatum</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtEind" runat="server" CausesValidation="True" Width="125px"></asp:TextBox>
                    </td>
                     <td class="auto-style18">

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEind" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>

                         &nbsp;&nbsp;&nbsp;

                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEind" ErrorMessage="Invoer ongeldig" ForeColor="Red" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
                         </td>

                     <td class="auto-style1">

                         <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtStart" ControlToValidate="txtEind" ErrorMessage="Einddatum moet later" ForeColor="Red" Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>

                     </td>
                </tr>
                 <tr>
                    <td class="auto-style17">Kosten</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtKosten" runat="server" CausesValidation="True" Width="125px"></asp:TextBox>
                    </td>
                      <td class="auto-style2">

                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtKosten" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>


                          &nbsp;&nbsp;&nbsp;


                          <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtKosten" ErrorMessage="Alleen Getallen" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>

                     </td>
                </tr>
                 <tr>
                    <td class="auto-style16">Bungalownummer</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtBungalownummer" runat="server" CausesValidation="True" Width="125px"></asp:TextBox>
                    </td>
                     <td class="auto-style18">

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtBungalownummer" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>

                         &nbsp;&nbsp;&nbsp;
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtBungalownummer" ErrorMessage="Alleen getallen" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
&nbsp;</td>
                     <td class="auto-style1">
                         <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtBungalownummer" ErrorMessage="Nummer ongeldig" ForeColor="Red" MaximumValue="20" MinimumValue="2" Type="Integer"></asp:RangeValidator>

                     </td>
                </tr>
                 <tr>
                    <td class="auto-style6">Onderhoudsstatus</td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="DropDownList2" runat="server" Width="125px">
                            <asp:ListItem>--Selecteer--</asp:ListItem>
                            <asp:ListItem>Ingepland</asp:ListItem>
                            <asp:ListItem>Bezig</asp:ListItem>
                            <asp:ListItem>Klaar</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                      <td class="auto-style8">

                          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Selecteer een optie" ForeColor="Red" InitialValue="--Selecteer--"></asp:RequiredFieldValidator>

                     &nbsp;&nbsp;&nbsp;
                          
                     </td>
                </tr>
                 <tr>
                    <td class="auto-style9">Onderhoudstype</td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="DropDownList3" runat="server" Width="125px">
                            <asp:ListItem>--Selecteer--</asp:ListItem>
                            <asp:ListItem>Dakwerk</asp:ListItem>
                            <asp:ListItem>Raamwerk</asp:ListItem>
                            <asp:ListItem>Schoonmaak</asp:ListItem>
                            <asp:ListItem>Schouwing</asp:ListItem>
                            <asp:ListItem>Schilderwerk</asp:ListItem>
                            <asp:ListItem>Stuckwerk</asp:ListItem>
                            <asp:ListItem>Vloerleggen</asp:ListItem>
                            <asp:ListItem>Interieurwerk</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                     <td class="auto-style11">

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="DropDownList3" ErrorMessage="Selecteer een optie" ForeColor="Red" InitialValue="--Selecteer--"></asp:RequiredFieldValidator>
                         
                     </td>
                </tr>
                 <tr>
                    <td class="auto-style12">Datum van constatering</td>
                    <td class="auto-style13">
                        <asp:TextBox ID="txtConstatering" runat="server" CausesValidation="True" Width="125px"></asp:TextBox>
                    </td>
                     <td class="auto-style14">

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtConstatering" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtEind" ErrorMessage="Invoer ongeldig" ForeColor="Red" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>

                     </td>
                </tr>
                                 
                <tr>
                     <td style="margin-left: 40px" class="auto-style16">  
                         <br />
                     </td>
                    <td class="auto-style3">

                    </td>

                   <td class="auto-style18" >
                 
                     </td>
                    <td  style="margin-left: 40px; " class="auto-style1">
                         <asp:Button ID="btnToevoegen" runat="server" Text="Toevoegen" OnClick="btnToevoegen_Click1" BackColor="#0E6251" BorderColor="#0E6251" ForeColor="White" CssClass="buttonstyle" />
                    </td>

                </tr>
            </table>
        </div>
            </div>

 

        <p>
            &nbsp;</p>

 

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 270px;
        }
        .auto-style2 {
            height: 27px;
            width: 241px;
        }
        .auto-style3 {
            width: 101px;
        }
        .auto-style4 {
            height: 27px;
            width: 101px;
        }
        .auto-style6 {
            height: 34px;
            width: 200px;
        }
        .auto-style7 {
            height: 34px;
            width: 101px;
        }
        .auto-style8 {
            height: 34px;
            width: 241px;
        }
        .auto-style9 {
            height: 30px;
            width: 200px;
        }
        .auto-style10 {
            height: 30px;
            width: 101px;
        }
        .auto-style11 {
            height: 30px;
            width: 241px;
        }
        .auto-style12 {
            height: 52px;
            width: 200px;
        }
        .auto-style13 {
            width: 101px;
            height: 52px;
        }
        .auto-style14 {
            width: 241px;
            height: 52px;
        }
        .auto-style16 {
            width: 200px;
        }
        .auto-style17 {
            height: 27px;
            width: 200px;
        }
        .auto-style18 {
            width: 241px;
        }
    </style>
</asp:Content>
