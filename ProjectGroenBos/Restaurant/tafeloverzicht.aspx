<%@ Page Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="tafeloverzicht.aspx.cs" Inherits="ProjectGroenBos.Restaurant.tafeloverzicht" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="css/tafeloverzicht.css">
    <div class="werkgebied">

        <div class="tafels">
        <!-- button voor de keuken -->
        <asp:Button ID="btnkeuken" class="keuken" runat="server" Text="Keuken" OnClick="btnkeuken_Click"/>

        
        <!--tafel 1 -->
        <asp:Button ID="btntafel1" Class="tafelbutton" runat="server" Text="Tafel 1" OnClick="btntafel1_Click"/>
       
            <br />
         <!-- hieronder wordt een pop up aangemaakt voor de tafels met de 2 knoppen om te bestellen of af te reknenen -->   
             <cc1:ToolkitScriptManager ID="ToolkitScriptManager" runat="server">
        </cc1:ToolkitScriptManager>       
        <!-- modal popup extender-->

         <cc1:ModalPopupExtender ID="popuptafel1" TargetControlID="btntafel1" popupControlID="modelpantafel1" CancelcontrolID="btnclose1" runat="server">

        </cc1:ModalPopupExtender>

        <!-- panel design-->
        <asp:Panel ID="modelpantafel1" Class="popup" runat="server">
         
                <div ID="header" class=header>
                    <asp:Label ID="lbltafelpopup" class="Tafelpopup" runat="server" Text="Tafel 1"/>
                <asp:button ID="btnclose1" Class="close" runat="server" text="X"/>
                </div>

            <div class="center">
            <asp:button  runat="server" class="popupbutton" text="Bestelling maken" OnClick="Button1_Click" />
            <asp:button  runat="server" class="popupbutton" text="naar afrekenen" OnClick="Button2_Click" />
            </div>
        </asp:Panel>


        <!--tafel 2 -->
        <asp:Button ID="btntafel2" Class="tafelbutton" runat="server" Text="Tafel 2" OnClick="btntafel2_Click" />

             <cc1:ModalPopupExtender ID="popuptafel2" TargetControlID="btntafel2" popupControlID="modelpantafel2" CancelcontrolID="btnclose2" runat="server">

        </cc1:ModalPopupExtender>

        <!-- panel design-->
        <asp:Panel ID="modelpantafel2" Class="popup" runat="server">
         
                <div ID="header2" class=header>
                    <asp:Label ID="Label1" class="Tafelpopup" runat="server" Text="Tafel 2"/>
                <asp:button ID="btnclose2" Class="close" runat="server" text="X"/>
                </div>

            <div class="center">
            <asp:button  runat="server" class="popupbutton" text="Bestelling maken" OnClick="Button1_Click" />
            <asp:button  runat="server" class="popupbutton" text="naar afrekenen" OnClick="Button2_Click" />
            </div>
        </asp:Panel>


        <!--tafel 3 -->
        <asp:Button ID="btntafel3" Class="tafel3" runat="server" Text="Tafel 3" />

        <cc1:ModalPopupExtender ID="popuptafel3" TargetControlID="btntafel3" popupControlID="modelpantafel3" CancelcontrolID="btnclose3" runat="server">

        </cc1:ModalPopupExtender>

        <!-- panel design-->
        <asp:Panel ID="modelpantafel3" Class="popup" runat="server">
         
                <div ID="header3" class=header>
                    <asp:Label ID="Label2" class="Tafelpopup" runat="server" Text="Tafel 3"/>
                <asp:button ID="btnclose3" Class="close" runat="server" text="X"/>
                </div>

            <div class="center">
            <asp:button  runat="server" class="popupbutton" text="Bestelling maken" OnClick="Button1_Click" />
            <asp:button  runat="server" class="popupbutton" text="naar afrekenen" OnClick="Button2_Click" />
            </div>
        </asp:Panel>

        <!--tafel 4 -->
        <asp:Button ID="btntafel4" Class="tafelbutton" runat="server" Text="Tafel 4" />

        <cc1:ModalPopupExtender ID="popuptafel4" TargetControlID="btntafel4" popupControlID="modelpantafel4" CancelcontrolID="btnclose4" runat="server">

        </cc1:ModalPopupExtender>

        <!-- panel design-->
        <asp:Panel ID="modelpantafel4" Class="popup" runat="server">
         
                <div ID="header4" class=header>
                    <asp:Label ID="Label3" class="Tafelpopup" runat="server" Text="Tafel 4"/>
                <asp:button ID="btnclose4" Class="close" runat="server" text="X"/>
                </div>

            <div class="center">
            <asp:button  runat="server" class="popupbutton" text="Bestelling maken" OnClick="Button1_Click" />
            <asp:button  runat="server" class="popupbutton" text="naar afrekenen" OnClick="Button2_Click" />
            </div>
        </asp:Panel>

        <!--tafel 5 -->
        <asp:Button ID="btntafel5" Class="tafelbutton" runat="server" Text="Tafel 5" />

        <cc1:ModalPopupExtender ID="popuptafel5" TargetControlID="btntafel5" popupControlID="modelpantafel5" CancelcontrolID="btnclose5" runat="server">

        </cc1:ModalPopupExtender>

        <!-- panel design-->
        <asp:Panel ID="modelpantafel5" Class="popup" runat="server">
         
                <div ID="header5" class=header>
                    <asp:Label ID="Label4" class="Tafelpopup" runat="server" Text="Tafel 5"/>
                <asp:button ID="btnclose5" Class="close" runat="server" text="X"/>
                </div>
            <div class="center">
            <asp:button  runat="server" class="popupbutton" text="Bestelling maken" OnClick="Button1_Click" />
            <asp:button  runat="server" class="popupbutton" text="naar afrekenen" OnClick="Button2_Click" />
            </div>
        </asp:Panel>

            <!-- button voor de bar -->
            <asp:Button ID="btnbar" class="bar" runat="server" Text="Bar" OnClick="btnbar_Click"/>
        </div>
    </div>
</asp:Content>
