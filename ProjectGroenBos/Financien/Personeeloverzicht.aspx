<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="Personeeloverzicht.aspx.cs" Inherits="ProjectGroenBos.Financien.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:GridView ID="PersoneelsOverzicht" runat="server"  style="z-index: 1; left: 208px; top: 78px; position: absolute; height: 587px; width: 704px">
            </asp:GridView>
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" style="z-index: 1; left: 987px; top: 226px; position: absolute; height: 215px; width: 114px">
            </asp:CheckBoxList>
            <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 985px; top: 614px; position: absolute" Text="Verwijderen" />
            <asp:Button ID="Button2" runat="server" style="z-index: 1; left: 984px; top: 566px; position: absolute; width: 158px" Text="Wijzigen" />
            <asp:Button ID="Button3" runat="server" style="z-index: 1; left: 983px; top: 523px; position: absolute; width: 159px" Text="Toevoegen" />
            <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 953px; top: 132px; position: absolute"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 1002px; top: 86px; position: absolute" Text="Zoek:"></asp:Label>
</asp:Content>
