<%@ Page Title="Onderhoud Wijzigen" Language="C#" MasterPageFile="Schoonmaak.Master" AutoEventWireup="true" CodeBehind="OnderhoudWijzigen.aspx.cs" Inherits="ProjectGroenBos.Schoonmaak_en_Onderhoud.OnderhoudWijzigen" %>
<asp:Content ID="OnderhoudsWijzigen" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
        <br />
    <br />
        <br />
<div class="form-row">
    <div style="text-align:center;">
    <h1 class="text-primary">Onderhoud Wijzigen</h1>
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
    <asp:GridView ID="GridView1" Width="75%" runat="server" AutoGenerateColumns="False" DataKeyNames="Nummer" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#0E6251" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" ForeColor="Black" GridLines="Vertical" AllowPaging="True">
        <AlternatingRowStyle BackColor="#f0f0f0" />
        <Columns>
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Startdatum" HeaderText="Startdatum" SortExpression="Startdatum"/>
            <asp:BoundField DataField="VerwachteEinddatum" HeaderText="VerwachteEinddatum" SortExpression="VerwachteEinddatum"/>
            <asp:BoundField DataField="Kosten" HeaderText="Kosten" SortExpression="Kosten" />
            <asp:BoundField DataField="BungalowNummer" HeaderText="BungalowNummer" SortExpression="BungalowNummer" />
            <asp:BoundField DataField="OnderhoudsstatusID" HeaderText="OnderhoudsstatusID" SortExpression="OnderhoudsstatusID" />
            <asp:BoundField DataField="Onderhoudtype" HeaderText="Onderhoudtype" SortExpression="Onderhoudtype" />
            <asp:BoundField DataField="DatumvanConstatering" HeaderText="DatumvanConstatering" SortExpression="DatumvanConstatering"/>
            <asp:CommandField  ButtonType="Image" SelectImageUrl="~/Images/SelectIcon.png" ShowSelectButton="True" />
            <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" ReadOnly="True" SortExpression="Nummer" />
            <asp:BoundField DataField="Startdatum" HeaderText="Startdatum" SortExpression="Startdatum" DataFormatString="{0:d}"/>
            <asp:BoundField DataField="VerwachteEinddatum" HeaderText="Verwachte Einddatum" SortExpression="VerwachteEinddatum" DataFormatString="{0:d}"/>
            <asp:BoundField DataField="Kosten" HeaderText="Kosten" SortExpression="Kosten" />
            <asp:BoundField DataField="BungalowNummer" HeaderText="Bungalownummer" SortExpression="BungalowNummer" />
            <asp:BoundField DataField="OnderhoudsstatusID" HeaderText="Status" SortExpression="OnderhoudsstatusID" />
            <asp:BoundField DataField="Onderhoudtype" HeaderText="Type" SortExpression="Onderhoudtype" />
            <asp:BoundField DataField="DatumvanConstatering" HeaderText="Datum Constatering" SortExpression="DatumvanConstatering" DataFormatString="{0:d}"/>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="#0E6251" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#0E6251" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#0E6251" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
        </center>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="SELECT [Nummer], [Startdatum], [VerwachteEinddatum], [Kosten], [BungalowNummer], [OnderhoudsstatusID], [Onderhoudtype], [DatumvanConstatering] FROM [Onderhoudsopdracht]"></asp:SqlDataSource>
     <br />
    <div style="text-align:center;">
  <div style="width:65%; margin: 0 auto; text-align:left;">
            <table class="auto-style23">
                 <tr>
                    <td class="auto-style16">Nummer</td>
                    <td class="auto-style17">
                        <asp:Label ID="lblNummerO" runat="server"></asp:Label>
                    </td>
                     <td class="auto-style19">

                         &nbsp;&nbsp;&nbsp;

                         </td>
                </tr>
                 <tr>
                    <td class="auto-style15">Startdatum</td>
                    <td class="auto-style18">
                        <asp:TextBox ID="startdatumTxtbox" runat="server" Width="125px"></asp:TextBox>
                     </td>
                     <td class="auto-style20">

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="startdatumTxtbox" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>

                         &nbsp;&nbsp;&nbsp;

                         </td>

                     <td class="auto-style21">
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="startdatumTxtbox" ErrorMessage="Invoer onjuist" ForeColor="Red" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
                         </td>
                </tr>
                 <tr>
                    <td class="auto-style16">Verwachte Einddatum</td>
                    <td class="auto-style17">
                        <asp:TextBox ID="einddTxtbox" runat="server" Width="125px"></asp:TextBox>
                     </td>
                      <td class="auto-style19">


                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="einddTxtbox" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>


                          &nbsp;&nbsp;&nbsp;


                          </td>
                     <td class="auto-style22">

                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="einddTxtbox" ErrorMessage="Invoer onjuist" ForeColor="Red" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>

                     </td>
                     <td class="auto-style24">

                         <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="startdatumTxtbox" ControlToValidate="einddTxtbox" ErrorMessage="Einddatum moet later" ForeColor="Red" Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>

                     </td>
                </tr>
                 <tr>
                    <td class="auto-style16">Kosten</td>
                    <td class="auto-style17">
                        <asp:TextBox ID="kostenTxtbox" runat="server" Width="125px"></asp:TextBox>
                     </td>
                     <td class="auto-style19">

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="kostenTxtbox" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>

                         &nbsp;&nbsp;&nbsp;
                         &nbsp;</td>
                     <td class="auto-style22">
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="kostenTxtbox" ErrorMessage="Invoer onjuist" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                         </td>
                </tr>
                 <tr>
                    <td class="auto-style16">Bungalownummer</td>
                    <td class="auto-style18">
                        <asp:TextBox ID="bungTxtbox" runat="server" Width="125px"></asp:TextBox>
                     </td>
                      <td class="auto-style20">

                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="bungTxtbox" ErrorMessage="Vul in " ForeColor="Red"></asp:RequiredFieldValidator>
                          &nbsp;&nbsp;
                          
                     </td>
                     <td class="auto-style22">

                         <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="bungTxtbox" ErrorMessage="Invoer onjuist" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>

                     </td>
                     <td class="auto-style24">

                         <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="bungTxtbox" ErrorMessage="Nummer ongeldig" ForeColor="Red" MaximumValue="20" MinimumValue="2" Type="Integer"></asp:RangeValidator>

                     </td>
                </tr>
                 <tr>
                    <td class="auto-style16">Onderhoudsstatus</td>
                    <td class="auto-style17">
                        <asp:DropDownList ID="DropDownList1" runat="server" Width="125px">
                            <asp:ListItem>--Selecteer--</asp:ListItem>
                            <asp:ListItem>Ingepland</asp:ListItem>
                            <asp:ListItem>Bezig</asp:ListItem>
                            <asp:ListItem>Klaar</asp:ListItem>
                        </asp:DropDownList>
                     </td>
                     <td class="auto-style20">

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Selecteer iets" ForeColor="Red" InitialValue="--Selecteer--"></asp:RequiredFieldValidator>
                     </td>
                </tr>
                 <tr>
                    <td class="auto-style16">Onderhoudtype</td>
                    <td class="auto-style18">
                        <asp:DropDownList ID="DropDownList2" runat="server" Width="125px">
                            <asp:ListItem>--Selecteer--</asp:ListItem>
                            <asp:ListItem>Dakwerk</asp:ListItem>
                            <asp:ListItem>Raamwerk</asp:ListItem>
                            <asp:ListItem>Schouwing</asp:ListItem>
                            <asp:ListItem>Schilderwerk</asp:ListItem>
                            <asp:ListItem>Stuckwerk</asp:ListItem>
                            <asp:ListItem>Vloerleggen</asp:ListItem>
                            <asp:ListItem>Interieurwerk</asp:ListItem>
                        </asp:DropDownList>
                     </td>
                     <td class="auto-style20">

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Selecteer iets" ForeColor="Red" InitialValue="--Selecteer--"></asp:RequiredFieldValidator>

&nbsp;&nbsp;&nbsp;&nbsp;</td>
                </tr>
                                 
                <tr>
                     <td style="margin-left: 40px" class="auto-style16">  
                         Datum van Constatering<br />
                     </td>
                    <td class="auto-style17">

                        <asp:TextBox ID="constTxtbox" runat="server" Width="125px"></asp:TextBox>

                    </td>

                   <td class="auto-style19" >
                 
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="constTxtbox" ErrorMessage="Vul in" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp; 

                     </td>
                    <td  style="margin-left: 40px; " class="auto-style22">
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="constTxtbox" ErrorMessage="Invoer onjuist" ForeColor="Red" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>

                     </td>

                </tr>
                <tr>
                    <td class="auto-style16">

                    </td>
                    <td class="auto-style17">

                        &nbsp;</td>
                    <td class="auto-style19">

                        &nbsp;</td>
                    <td class="auto-style22">

                        &nbsp;</td>
                </tr>
                <tr>
                    <td>

                    </td>
                    <td>

                    </td>
                    <td class="auto-style19">

                    </td>
                    <td class="auto-style22">

                        <asp:Button ID="btnTerugNaarO" runat="server" Text="Terug naar Overzicht" BackColor="#0E6251" BorderColor="#0E6251" CssClass="buttonstyle" ForeColor="White" OnClick="btnTerugNaarO_Click" />

                        <td class="auto-style24">

    <asp:Button ID="btnWijzig" runat="server" OnClick="btnWijzig_Click" Text="Wijzig" BackColor="#0E6251" BorderColor="#0E6251" CssClass="buttonstyle" ForeColor="White" BorderStyle="Solid" />

                    </td>
                </tr>
            </table>
      </div>
        </div>
    <br />
    <br />
    </asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style15 {
            width: 264px;
            height: 27px;
        }
        .auto-style16 {
            width: 264px;
        }
        .auto-style17 {
            width: 140px;
        }
        .auto-style18 {
            width: 140px;
            height: 27px;
        }
        .auto-style19 {
            width: 137px;
        }
        .auto-style20 {
            width: 137px;
            height: 27px;
        }
        .auto-style21 {
            width: 132px;
            height: 27px;
        }
        .auto-style22 {
            width: 132px;
        }
        .auto-style23 {
            width: 100%;
        }
        .auto-style24 {
            width: 279px;
        }
    </style>
</asp:Content>

