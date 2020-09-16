<%@ Page Title="" Language="C#" MasterPageFile="~/Financien/Financien.Master" AutoEventWireup="true" CodeBehind="Prijstabel.aspx.cs" Inherits="ProjectGroenBos.Financien.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">Prijstabel</div>
    <div class="container">
        <h2>Seizoensindeling 2020</h2>
        <table class="content-table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Points</th>
                    <th>Team</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Domenic</td>
                    <td>88,110</td>
                    <td>dcode</td>
                </tr>
                <tr class="active-row">
                    <td>2</td>
                    <td>Sally</td>
                    <td>72,400</td>
                    <td>Students</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Nick</td>
                    <td>52,300</td>
                    <td>dcode</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="container">
    </div>
</asp:Content>
