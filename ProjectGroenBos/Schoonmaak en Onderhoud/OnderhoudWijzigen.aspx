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
    <asp:GridView ID="GridView1" Width="75%" runat="server" AutoGenerateColumns="False" DataKeyNames="Nummer" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#0E6251" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#f0f0f0" />
        <Columns>
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
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#0E6251" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
        </center>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [Nummer], [Startdatum], [VerwachteEinddatum], [Kosten], [BungalowNummer], [OnderhoudsstatusID], [Onderhoudtype], [DatumvanConstatering] FROM [Onderhoudsopdracht]"></asp:SqlDataSource>
     <br />
    <div style="text-align:center;">
  <div style="width:65%; margin: 0 auto; text-align:left;">
            <table style="width:100%;">
                 <tr>
                    <td class="auto-style16">Nummer</td>
                    <td class="auto-style3">
                        <asp:Label ID="lblNummerO" runat="server"></asp:Label>
                    </td>
                     <td class="auto-style18">

                         &nbsp;&nbsp;&nbsp;

                         </td>
                </tr>
                 <tr>
                    <td class="auto-style15">Startdatum</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="startdatumTxtbox" runat="server" Width="125px"></asp:TextBox>
                     </td>
                     <td class="auto-style8">

                         &nbsp;&nbsp;&nbsp;

                         </td>

                     <td class="auto-style9">

                         </td>
                </tr>
                 <tr>
                    <td class="auto-style16">Verwachte Einddatum</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="einddTxtbox" runat="server" Width="125px"></asp:TextBox>
                     </td>
                      <td class="auto-style2">


                          &nbsp;&nbsp;&nbsp;


                          </td>
                </tr>
                 <tr>
                    <td class="auto-style16">Kosten</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="kostenTxtbox" runat="server" Width="125px"></asp:TextBox>
                     </td>
                     <td class="auto-style18">

                         &nbsp;&nbsp;&nbsp;
                         &nbsp;</td>
                     <td class="auto-style1">
                         &nbsp;</td>
                </tr>
                 <tr>
                    <td class="auto-style16">Bungalownummer</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="bungTxtbox" runat="server" Width="125px"></asp:TextBox>
                     </td>
                      <td class="auto-style8">

                     &nbsp;&nbsp;&nbsp;
                          
                     </td>
                </tr>
                 <tr>
                    <td class="auto-style16">Onderhoudsstatus</td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="DropDownList1" runat="server" Width="125px">
                            <asp:ListItem>--Selecteer--</asp:ListItem>
                            <asp:ListItem>Ingepland</asp:ListItem>
                            <asp:ListItem>Bezig</asp:ListItem>
                            <asp:ListItem>Klaar</asp:ListItem>
                        </asp:DropDownList>
                     </td>
                     <td class="auto-style11">

                         &nbsp;</td>
                </tr>
                 <tr>
                    <td class="auto-style16">Onderhoudtype</td>
                    <td class="auto-style13">
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
                     <td class="auto-style14">

&nbsp;&nbsp;&nbsp;&nbsp;</td>
                </tr>
                                 
                <tr>
                     <td style="margin-left: 40px" class="auto-style16">  
                         Datum van Constatering<br />
                     </td>
                    <td class="auto-style3">

                        <asp:TextBox ID="constTxtbox" runat="server" Width="125px"></asp:TextBox>

                    </td>

                   <td class="auto-style18" >
                 
                       &nbsp;</td>
                    <td  style="margin-left: 40px; " class="auto-style1">
                         &nbsp;</td>

                </tr>
                <tr>
                    <td class="auto-style16">

                    </td>
                    <td>

                        &nbsp;</td>
                    <td>

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
        .auto-style1 {
            width: 356px;
        }
        .auto-style2 {
            width: 336px;
        }
        .auto-style3 {
            width: 83px;
        }
        .auto-style4 {
            width: 82px;
        }
        .auto-style7 {
            width: 83px;
            height: 27px;
        }
        .auto-style8 {
            height: 27px;
        }
        .auto-style9 {
            width: 356px;
            height: 27px;
        }
        .auto-style10 {
            width: 355px;
        }
        .auto-style11 {
            width: 355px;
            height: 27px;
        }
        .auto-style13 {
            width: 354px;
            height: 27px;
        }
        .auto-style14 {
            width: 353px;
            height: 27px;
        }
        .auto-style15 {
            width: 264px;
            height: 27px;
        }
        .auto-style16 {
            width: 264px;
        }
    </style>
</asp:Content>

