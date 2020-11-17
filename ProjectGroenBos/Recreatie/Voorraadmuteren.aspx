﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Recreatie/Site1.Master" AutoEventWireup="true" CodeBehind="Voorraadmuteren.aspx.cs" Inherits="ProjectGroenBos.Recreatie.Voorraadmuteren" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">





    <asp:Label ID="Label1" runat="server" Text="Voorraad muteren" CssClass="labelvoorraadmuteren"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="Zoeken" CssClass="labelzoekenvoorraadmuteren"></asp:Label>
    <asp:TextBox ID="txbZoekenVoorraadmuteren" runat="server" CssClass="txbzoekenvoorraadmuteren" OnTextChanged="txbZoekenVoorraadmuteren_TextChanged1"></asp:TextBox>
    <asp:CheckBox ID="ckbLeverancier" runat="server" CssClass="checkboxleverancier" Text="Leverancier" />
    </asp:GridView>

    <asp:GridView ID="GvMuteren" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="content-table" DataKeyNames="ID" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GvMuteren_RowCancelingEdit" OnRowCommand="GvMuteren_RowCommand" OnRowDeleting="GvMuteren_RowDeleting" OnRowEditing="GvMuteren_RowEditing" OnRowUpdating="GvMuteren_RowUpdating" OnSelectedIndexChanged="GvMuteren_SelectedIndexChanged" OnSorting="OnSorting" ShowFooter="True" ShowHeaderWhenEmpty="True" Width="80%">
        
        
        
        
        <Columns>
            <asp:TemplateField HeaderText="Artikelnummer" SortExpression="ID" Visible="true" >
                <ItemTemplate>
                    <asp:Label ID ="Label1" Text='<%# Eval("ID") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Artikelnaam | Omschrijving" SortExpression="Artikelnaam" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Artikelnaam") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Prijs" SortExpression="Prijs" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Prijs") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Aantal" SortExpression="Aantal" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Aantal") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Minimum Voorraad" SortExpression="Minimumvoorraad" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Minimum voorraad") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Naam Leverancier" SortExpression="Leverancier" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Naam Leverancier") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Huurtarief" SortExpression="Huurtarief" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Huurtarief") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>





    </asp:Content>
