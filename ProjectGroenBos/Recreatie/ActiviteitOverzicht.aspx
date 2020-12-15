<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="ActiviteitOverzicht.aspx.cs" Inherits="recreatie.paginas.ActiviteitOverzicht" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Activiteiten Overzicht</div>
    <div class="row col-sm-12">
       <div class="col-sm-12" style="text-align:center;">
          <asp:Button ID="Button2" runat="server" Text="Activiteit Toevoegen" BackColor="#009879"  BorderColor="#0E6251" ForeColor="White" EnableTheming="True" CssClass="btnToevoegenactiviteit" OnClick="Inplannen_Click"/>
           &nbsp;
           <asp:Button ID="btnWijzig" runat="server" BackColor="#009879" BorderColor="#009879" CssClass="btnwijzigenactiviteit" ForeColor="White" Text="Activiteit Wijzigen" OnClick="Wijzigen_Click" />
           &nbsp;
           <asp:Button ID="btnVerwijderenS" runat="server" BackColor="#009879" BorderColor="#009879" CssClass="btnverwijderenactiviteit" ForeColor="White"  Text="Activiteit Verwijderen" OnClick="Verwijderen_Click" />
           </div>
        </div>
   
           <br />
           <br />
           <hr />
        <br />
        <div>
            
                <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" BackColor="#CCCCCC" BorderColor="#009879" BorderWidth="2px" Font-Names="Verdana" Font-Size="9pt" ForeColor="black" Height="390px" NextPrevFormat="FullMonth" Width="85%" BorderStyle="Solid" style="margin-left:5%">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" />
                    <DayStyle BackColor="White" BorderColor="Black" BorderStyle="Dotted" BorderWidth="2px" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Underline="False" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="#009879" BorderColor="#009879" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="White" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>
 
         
        </div>

        <br />
        </div>
    </div>

</asp:Content>
