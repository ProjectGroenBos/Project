<%@ Page Title="Overzicht Onderhoud" Language="C#" AutoEventWireup="true"  MasterPageFile="Schoonmaak.Master" CodeBehind="OnderhoudToevoegen.aspx.cs" Inherits="ProjectGroenBos.Schoonmaak_en_Onderhoud.OnderhoudToevoegen" 
    %><asp:Content ID="OnderhoudsToevoegent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
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
       <div class="col-sm-12">
           <br />
&nbsp;<br />
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
                        <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>Verwachte einddatum</td>
                    <td>
                        <asp:TextBox ID="txtEind" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>Kosten</td>
                    <td>
                        <asp:TextBox ID="txtKosten" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>Bungalownummer</td>
                    <td>
                        <asp:TextBox ID="txtBungalownummer" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>Onderhoudsstatus</td>
                    <td>
                        <asp:TextBox ID="txtOnderhoudsstatus" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>Onderhoudstype</td>
                    <td>
                        <asp:TextBox ID="txtOnderhoudstype" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>Datum van constatering</td>
                    <td>
                        <asp:TextBox ID="txtConstatering" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                     <td style="margin-left: 40px">  
                         <asp:Button ID="btnToevoegen" runat="server" Text="Toevoegen" OnClick="btnToevoegen_Click1" />
                     </td>
                </tr>
            </table>
        </div>
            </div>

 

        <p>
            &nbsp;</p>

 

</asp:Content>