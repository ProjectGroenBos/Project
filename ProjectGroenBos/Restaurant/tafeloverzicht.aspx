<%@ Page Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="tafeloverzicht.aspx.cs" Inherits="ProjectGroenBos.Restaurant.tafeloverzicht" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="css/tafeloverzicht.css">
    <div class="werkgebied">

        <asp:Label ID="keuken" class="keuken" runat="server" Text="Keuken"/>

        <asp:Label ID="bar" class="bar" runat="server" Text="Bar"/>

        <asp:Button ID="btntafel1" runat="server" Text="Tafel 1" OnClick="btntafel1_Click" />
       
            <br />
         <!-- hieronder wordt een pop up aangemaakt voor de tafels met de 2 knoppen om te bestellen of af te reknenen -->   
             <cc1:ToolkitScriptManager ID="ToolkitScriptManager" runat="server">
        </cc1:ToolkitScriptManager>       
        <!-- modal popup extender-->

         <cc1:ModalPopupExtender ID="popuptafel1" TargetControlID="btntafel1" popupControlID="modelpantafel1" CancelcontrolID="btnclose" PopupDragHandleControlID="header" runat="server">

        </cc1:ModalPopupExtender>

        <!-- panel design-->
        <asp:Panel ID="modelpantafel1" Class="popup" runat="server">
         
                <div ID="header" class=header> tafel 1</div>
                <asp:button ID="btnclose" Class="close" runat="server" text="X"/>
        

            <asp:button ID="Button1" runat="server" text="Bestelling maken" OnClick="Button1_Click" />
            <asp:button ID="Button2" runat="server" text="naar afrekenen" />
        </asp:Panel>

            <br />

        <asp:Button ID="btntafel2" runat="server" Text="Tafel 2" />

        <asp:Button ID="btntafel3" runat="server" Text="Tafel 3" />

        <asp:Button ID="btntafel4" runat="server" Text="Tafel 4" />
    </div>
</asp:Content>
