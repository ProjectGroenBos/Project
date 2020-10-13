<%@ Page Title="Planning Overzicht" Language="C#" AutoEventWireup="true" MasterPageFile="Schoonmaak.Master" CodeBehind="PlanningsOverzicht.aspx.cs" Inherits="ProjectGroenBos.Schoonmaak_en_Onderhoud.PlanningsOverzicht" %>
<asp:Content ID="PlanningsOverzicht" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <br />
    <br />
        <br />

<div class="form-row" style="text-align:center;">
    <h1 class="text-primary">Overzicht Schoonmaakplanning</h1>
    <br />
    <div class="row col-sm-12">
       <div class="col-sm-12" style="text-align:center;">
          <asp:Button ID="Button2" runat="server" Text="Schoonmaak Toevoegen" BackColor="#0E6251" OnClick="Button2_Click" BorderColor="#0E6251" ForeColor="White" EnableTheming="True" CssClass="buttonstyle"/>
           &nbsp;
           <asp:Button ID="btnWijzig" runat="server" BackColor="#0E6251" BorderColor="#0E6251" CssClass="buttonstyle" ForeColor="White" OnClick="btnWijzig_Click" Text="Schoonmaak Wijzigen" />
           &nbsp;
           <asp:Button ID="btnVerwijderenS" runat="server" BackColor="#0E6251" BorderColor="#0E6251" CssClass="buttonstyle" ForeColor="White" OnClick="btnVerwijderenS_Click" Text="Schoonmaak Verwijderen" />
           <br />
           <br />
           <hr />
          </div>
        <br />
        <div>
            <center>

                <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" BackColor="#CCCCCC" BorderColor="Black" BorderWidth="2px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="390px" NextPrevFormat="FullMonth" Width="85%" BorderStyle="Solid">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" />
                    <DayStyle BackColor="White" BorderColor="Black" BorderStyle="Dotted" BorderWidth="2px" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Underline="False" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="#0E6251" BorderColor="#0E6251" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="White" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>

            </center>
        </div>

        <br />
        </div>
    </div>



</asp:Content>
