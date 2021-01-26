<%@ Page Language="C#" MasterPageFile="~/Restaurant/Restaurant.Master" AutoEventWireup="true" CodeBehind="tafeloverzicht.aspx.cs" Inherits="ProjectGroenBos.Restaurant.tafeloverzicht" %>

<%@ Register TagPrefix="jaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=20.1.0.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/tafeloverzicht.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="header">
        Tafel overzicht
    </header>

    <div class="cocacontainer">

        <div class="werkgebied">

            <div class="tafels">
                <!-- button voor de keuken -->
                <asp:Button ID="btnkeuken" class="keuken" runat="server" Text="Keuken" OnClick="btnkeuken_Click" />


                <!--tafel 1 -->
                <asp:Button ID="btntafel1" Class="tafelbutton" runat="server" Text="Tafel 1" OnClick="btntafel1_Click" />

                <br />
                <!-- hieronder wordt een pop up aangemaakt voor de tafels met de 2 knoppen om te bestellen of af te reknenen -->
                <!-- modal popup extender-->
                <asp:ScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ScriptManager>

                <ajaxToolkit:ModalPopupExtender ID="popuptafel1" TargetControlID="btntafel1" PopupControlID="modelpantafel1" CancelControlID="btnclose1" runat="server">
                </ajaxToolkit:ModalPopupExtender>

                <!-- panel design-->
                <asp:Panel ID="modelpantafel1" Class="popup" runat="server">

                    <div id="header" class="popupheader">
                        <asp:Label ID="lbltafel1popup" class="Tafelpopup" runat="server" Text="1" />
                        <asp:Button ID="btnclose1" Class="close" runat="server" Text="X" />
                    </div>

                    <div class="center">
                        <asp:Button runat="server" class="popupbutton" Text="Reserveren" OnClick="Reserveer1_Click" />
                        <asp:Button runat="server" class="popupbutton" Text="Bestellen" OnClick="Bestelling1_Click" />
                        <asp:Button runat="server" class="popupbutton" Text="Afrekenen" OnClick="Afreken1_Click" />

                    </div>
                </asp:Panel>


                <!--tafel 2 -->
                <asp:Button ID="btntafel2" Class="tafelbutton" runat="server" Text="Tafel 2" OnClick="btntafel2_Click" />

                <ajaxToolkit:ModalPopupExtender ID="popuptafel2" TargetControlID="btntafel2" PopupControlID="modelpantafel2" CancelControlID="btnclose2" runat="server">
                </ajaxToolkit:ModalPopupExtender>

                <!-- panel design-->
                <asp:Panel ID="modelpantafel2" Class="popup" runat="server">

                    <div id="header2" class="popupheader">
                        <asp:Label ID="lbltafel2popup" class="Tafelpopup" runat="server" Text="2" />
                        <asp:Button ID="btnclose2" Class="close" runat="server" Text="X" />
                    </div>

                    <div class="center">
                        <asp:Button runat="server" class="popupbutton" Text="Reserveren" OnClick="Reserveer2_Click" />
                        <asp:Button runat="server" class="popupbutton" Text="Bestellen" OnClick="Bestelling2_Click" />
                        <asp:Button runat="server" class="popupbutton" Text="Afrekenen" OnClick="Afreken2_Click" />

                    </div>
                </asp:Panel>


                <!--tafel 3 -->
                <asp:Button ID="btntafel3" Class="tafelbutton" runat="server" Text="Tafel 3" />

                <ajaxToolkit:ModalPopupExtender ID="popuptafel3" TargetControlID="btntafel3" PopupControlID="modelpantafel3" CancelControlID="btnclose3" runat="server">
                </ajaxToolkit:ModalPopupExtender>

                <!-- panel design-->
                <asp:Panel ID="modelpantafel3" Class="popup" runat="server">

                    <div id="header3" class="popupheader">
                        <asp:Label ID="lbltafel3popup" class="Tafelpopup" runat="server" Text="3" />
                        <asp:Button ID="btnclose3" Class="close" runat="server" Text="X" />
                    </div>

                    <div class="center">
                        <asp:Button runat="server" class="popupbutton" Text="Reserveren" OnClick="Reserveer3_Click" />
                        <asp:Button runat="server" class="popupbutton" Text="Bestellen" OnClick="Bestelling3_Click" />
                        <asp:Button runat="server" class="popupbutton" Text="Afrekenen" OnClick="Afreken3_Click" />

                    </div>
                </asp:Panel>

                <!--tafel 4 -->
                <asp:Button ID="btntafel4" Class="tafelbutton" runat="server" Text="Tafel 4" />

                <ajaxToolkit:ModalPopupExtender ID="popuptafel4" TargetControlID="btntafel4" PopupControlID="modelpantafel4" CancelControlID="btnclose4" runat="server">
                </ajaxToolkit:ModalPopupExtender>

                <!-- panel design-->
                <asp:Panel ID="modelpantafel4" Class="popup" runat="server">

                    <div id="header4" class="popupheader">
                        <asp:Label ID="lbltafel4popup" class="Tafelpopup" runat="server" Text="4" />
                        <asp:Button ID="btnclose4" Class="close" runat="server" Text="X" />
                    </div>

                    <div class="center">
                        <asp:Button runat="server" class="popupbutton" Text="Reserveren" OnClick="Reserveer4_Click" />
                        <asp:Button runat="server" class="popupbutton" Text="Bestellen" OnClick="Bestelling4_Click" />
                        <asp:Button runat="server" class="popupbutton" Text="Afrekenen" OnClick="Afreken4_Click" />

                    </div>
                </asp:Panel>

                <!--tafel 5 -->
                <asp:Button ID="btntafel5" Class="tafelbutton" runat="server" Text="Tafel 5" />

                <ajaxToolkit:ModalPopupExtender ID="popuptafel5" TargetControlID="btntafel5" PopupControlID="modelpantafel5" CancelControlID="btnclose5" runat="server">
                </ajaxToolkit:ModalPopupExtender>

                <!-- panel design-->
                <asp:Panel ID="modelpantafel5" Class="popup" runat="server">

                    <div id="header5" class="popupheader">
                        <asp:Label ID="lbltafel5popup" class="Tafelpopup" runat="server" Text="5" />
                        <asp:Button ID="btnclose5" Class="close" runat="server" Text="X" />
                    </div>
                    <div class="center">
                        <asp:Button runat="server" class="popupbutton" Text="Reserveren" OnClick="Reserveer5_Click" />
                        <asp:Button runat="server" class="popupbutton" Text="Bestellen" OnClick="Bestelling5_Click" />
                        <asp:Button runat="server" class="popupbutton" Text="Afrekenen" OnClick="Afreken5_Click" />
                    </div>
                </asp:Panel>

                <!-- button voor de bar -->
                <asp:Button ID="btnbar" class="bar" runat="server" Text="Bar" OnClick="btnbar_Click" />
            </div>
        </div>
    </div>
</asp:Content>
