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
                    <td>
                        <asp:TextBox ID="txtStart" runat="server" CausesValidation="True"></asp:TextBox>
                    </td>
                     <td>

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStart" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtStart" ErrorMessage="Invoer Ongeldig " ForeColor="Red" ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$"></asp:RegularExpressionValidator>

                     </td>
                </tr>
                 <tr>
                    <td>Verwachte einddatum</td>
                    <td>
                        <asp:TextBox ID="txtEind" runat="server" CausesValidation="True"></asp:TextBox>
                    </td>
                     <td>

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEind" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEind" ErrorMessage="Invoer Ongeldig" ForeColor="Red" ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$"></asp:RegularExpressionValidator>

                     </td>
                </tr>
                 <tr>
                    <td style="height: 27px">Kosten</td>
                    <td style="height: 27px">
                        <asp:TextBox ID="txtKosten" runat="server" CausesValidation="True"></asp:TextBox>
                    </td>
                      <td style="height: 27px">

                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtKosten" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;

                     </td>
                </tr>
                 <tr>
                    <td>Bungalownummer</td>
                    <td>
                        <asp:TextBox ID="txtBungalownummer" runat="server" CausesValidation="True"></asp:TextBox>
                    </td>
                     <td>

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtBungalownummer" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>

                     </td>
                </tr>
                 <tr>
                    <td>Onderhoudsstatus</td>
                    <td>
                        <asp:TextBox ID="txtOnderhoudsstatus" runat="server" CausesValidation="True"></asp:TextBox>
                    </td>
                      <td>

                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtOnderhoudsstatus" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>

                     </td>
                </tr>
                 <tr>
                    <td>Onderhoudstype</td>
                    <td>
                        <asp:TextBox ID="txtOnderhoudstype" runat="server" CausesValidation="True"></asp:TextBox>
                    </td>
                     <td>

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtOnderhoudstype" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>

                     </td>
                </tr>
                 <tr>
                    <td>Datum van constatering</td>
                    <td>
                        <asp:TextBox ID="txtConstatering" runat="server" CausesValidation="True"></asp:TextBox>
                    </td>
                     <td>

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtConstatering" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtEind" ErrorMessage="Invoer Ongeldig" ForeColor="Red" ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$"></asp:RegularExpressionValidator>

                     </td>
                </tr>
                                 <tr>
                    <td>Naam Medewerker </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Naam" DataValueField="Nummer">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [Nummer], [Naam] FROM [Medewerker]"></asp:SqlDataSource>
                    </td>
                     <td>

                         </td>
                                     </tr>
                <tr>
                     <td style="margin-left: 40px">  
                         <br />
                         <asp:Button ID="btnToevoegen" runat="server" Text="Toevoegen" OnClick="btnToevoegen_Click1" BackColor="#7FB241" BorderColor="#7FB241" />
                     </td>
                    <td>

                    </td>

                   <td  style="margin-left: 40px">
                  <asp:Button ID="btnTerugOOverzicht" runat="server" Text="Terug naar overzicht" OnClick="btnTerugOOverzicht_Click" BackColor="#7FB241" BorderColor="#7FB241" />
                     </td>
                </tr>
            </table>
        </div>
            </div>

 

        <p>
            &nbsp;</p>

 

</asp:Content>