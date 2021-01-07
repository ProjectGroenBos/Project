<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="TransactieHistory.aspx.cs" Inherits="ProjectGroenBos.Financien.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .groen {
            background-color: #009879;
        }

        .searchbar {
            margin-bottom: auto;
            margin-top: auto;
            height: 60px;
            background-color: #009879;
            border-radius: 30px;
            padding: 10px;
        }

        .search_input {
            color: white;
            border: 0;
            outline: 0;
            background: none;
            width: 0;
            caret-color: transparent;
            line-height: 40px;
            transition: width 0.4s linear;
        }

        .searchbar:hover > .search_input {
            padding: 0 10px;
            width: 450px;
            caret-color: #009879;
            transition: width 0.4s linear;
        }

        .searchbar:hover > .search_icon {
            background: white;
            color: #009879;
        }

        .search_icon {
            height: 40px;
            width: 40px;
            float: right;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%;
            color: white;
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Transactie Historie</div>
    <div class="container" runat="server">
        <div style="margin-top: 10px">
            <h2>Filter op type</h2>
            <div class="btn-group btn-group-toggle">
                <asp:LinkButton CssClass="btn btn-secondary groen" OnClick="lblAlles_OnClick" ID="lblAlles" runat="server">
                    <input type="radio" name="options" id="option1" checked>
                    Alles
                </asp:LinkButton>
                <asp:LinkButton CssClass="btn btn-secondary groen" OnClick="lblOntvangsten_OnClick" ID="lblOntvangsten" runat="server">
                    <input type="radio" name="options" id="option2" autocomplete="off">
                    Ontvangsten
                </asp:LinkButton>
                <asp:LinkButton CssClass="btn btn-secondary groen" OnClick="lblBetalingen_OnClick" ID="lblBetalingen" runat="server">
                    <input type="radio" name="options" id="option3" autocomplete="off">
                    Betalingen
                </asp:LinkButton>
            </div>
        </div>
        <div class="d-flex justify-content-center h-100" style="margin-top: 20px">
            <div class="searchbar">
                <asp:TextBox ID="txbZoeken" runat="server" placeholder="Zoeken op leverancier..." CssClass="search_input" Style="color: #fff" AutoPostBack="True" BorderStyle="Solid" OnTextChanged="txbZoeken_OnTextChanged"></asp:TextBox>
                <a href="#" class="search_icon"><i class="fas fa-search"></i></a>
            </div>
        </div>
        <asp:GridView ID="gvTransacties" CssClass="content-table eerstetable" runat="server" AutoGenerateColumns="False" DataKeyNames="Kenmerk" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="Datum" DataFormatString="{0:d}" HeaderText="Datum" SortExpression="Datum" />
                <asp:BoundField DataField="Aan" HeaderText="Aan" SortExpression="Aan" />
                <asp:BoundField DataField="Bedrag" HeaderText="Bedrag" SortExpression="Bedrag" />
                <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
                <asp:BoundField DataField="BankrekeningBanknummer" HeaderText="BankrekeningBanknummer" SortExpression="BankrekeningBanknummer" />
                <asp:BoundField DataField="Type Transactie" HeaderText="Type Transactie" SortExpression="Type Transactie" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectie %>" SelectCommand="Select Transactie.*, Type.Omschrijving AS 'Type Transactie' from Transactie
INNER JOIN Type ON Transactie.TypeID = Type.ID
Order By Datum DESC"></asp:SqlDataSource>
    </div>

</asp:Content>
