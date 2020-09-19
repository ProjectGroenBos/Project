<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="Personeeloverzicht.aspx.cs" Inherits="ProjectGroenBos.Financien.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%-- Main grid --%>
 <div class="header">Personeellijst</div>
<div class="wrapper">
    <div class="mainpanel">
        <div class="container">
            <h2>Personeelscherm 2020</h2>
            <p>Dit is de indeling van alle werknemers bij recreatiepark Groenbos periode 2020/2021.</p>
        <asp:GridView CssClass="content-table"  ID="PersoneelsOverzicht" runat="server">
                </asp:GridView>
        </div>
    </div>

    <%-- side --%>
    <div class="sidepanel">

            <asp:Button CssClass="button" ID="Button1" runat="server" />
            <asp:Button CssClass="button" ID="Button2" runat="server" />
            <asp:Button CssClass="button" ID="Button3" runat="server" />

    </div>
</div>
</asp:Content>
