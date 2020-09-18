<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ProjectGroenBos.Recreatie.WebForm1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Groenbos</title>
    <link rel="stylesheet" href="CSS/Main.css">
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
            <div class="navigator">  
                <a href="Start.apsx"><img src="img/Logo6.png" class="logo"></a>  
                <nav>
                    <ul>
                        <li><a href="start.aspx">Home</a></li>
                        <li class="selected"><a href="overzicht.aspx">Overzicht</a></li>
                        <li><a href="#">Bestellingen</a></li>
                        <li><a href="#">Keuken</a></li>
                        <li><a href="#">Reserveringen</a></li>
                        <li class="uitloggen"><a href="#">Uitloggen</a></li>
                    </ul>
                </nav>
            </div>

        <div class="werkgebied">
            
        </div>
    </div>

    <script src="js/app.js"></script>


       <div id="lvActiviteitenSchema" >
           <asp:Label ID="lblActiviteiten" runat="server" Text="Geplande Activiteiten"></asp:Label>
           <asp:Label ID="lblDatum" runat="server" Text="Datum:"></asp:Label>
           <asp:Label ID="lbldatumNu" runat="server" Text=""></asp:Label>
           <asp:Button ID="Button1" runat="server" OnClick="OnButtonPress" Text="&lt;" />
           <asp:Button ID="Button2" runat="server" Height="27px" OnClick="OnButtonPress" Text="&gt;" />
        <asp:ListView ID="lvactiviteitenSchema" runat="server" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Label ID="NaamLabel" runat="server" Text='<%# Eval("Naam") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LocatieLabel" runat="server" Text='<%# Eval("Locatie") %>' />
                    </td>
                    <td>
                        <asp:Label ID="RecreatieprogrammaDatumLabel" runat="server" Text='<%# Eval("RecreatieprogrammaDatum") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TijdLabel" runat="server" Text='<%# Eval("Tijd") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Maximaal_aantalLabel" runat="server" Text='<%# Eval("[Maximaal aantal]") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FaciliteitIDLabel" runat="server" Text='<%# Eval("FaciliteitID") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="NaamTextBox" runat="server" Text='<%# Bind("Naam") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="LocatieTextBox" runat="server" Text='<%# Bind("Locatie") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="RecreatieprogrammaDatumTextBox" runat="server" Text='<%# Bind("RecreatieprogrammaDatum") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="TijdTextBox" runat="server" Text='<%# Bind("Tijd") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Maximaal_aantalTextBox" runat="server" Text='<%# Bind("[Maximaal aantal]") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="FaciliteitIDTextBox" runat="server" Text='<%# Bind("FaciliteitID") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="NaamTextBox" runat="server" Text='<%# Bind("Naam") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="LocatieTextBox" runat="server" Text='<%# Bind("Locatie") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="RecreatieprogrammaDatumTextBox" runat="server" Text='<%# Bind("RecreatieprogrammaDatum") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="TijdTextBox" runat="server" Text='<%# Bind("Tijd") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Maximaal_aantalTextBox" runat="server" Text='<%# Bind("[Maximaal aantal]") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="FaciliteitIDTextBox" runat="server" Text='<%# Bind("FaciliteitID") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Label ID="NaamLabel" runat="server" Text='<%# Eval("Naam") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LocatieLabel" runat="server" Text='<%# Eval("Locatie") %>' />
                    </td>
                    <td>
                        <asp:Label ID="RecreatieprogrammaDatumLabel" runat="server" Text='<%# Eval("RecreatieprogrammaDatum") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TijdLabel" runat="server" Text='<%# Eval("Tijd") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Maximaal_aantalLabel" runat="server" Text='<%# Eval("[Maximaal aantal]") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FaciliteitIDLabel" runat="server" Text='<%# Eval("FaciliteitID") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server">Naam</th>
                                    <th runat="server">Locatie</th>
                                    <th runat="server">RecreatieprogrammaDatum</th>
                                    <th runat="server">Tijd</th>
                                    <th runat="server">Maximaal aantal</th>
                                    <th runat="server">FaciliteitID</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Label ID="NaamLabel" runat="server" Text='<%# Eval("Naam") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LocatieLabel" runat="server" Text='<%# Eval("Locatie") %>' />
                    </td>
                    <td>
                        <asp:Label ID="RecreatieprogrammaDatumLabel" runat="server" Text='<%# Eval("RecreatieprogrammaDatum") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TijdLabel" runat="server" Text='<%# Eval("Tijd") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Maximaal_aantalLabel" runat="server" Text='<%# Eval("[Maximaal aantal]") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FaciliteitIDLabel" runat="server" Text='<%# Eval("FaciliteitID") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
            </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM02-P1-P2-GroenbosConnectionString %>" SelectCommand="select dbo.Activiteit.Naam , dbo.Activiteit.Locatie,dbo.Recreatieprogramma_Activiteit.RecreatieprogrammaDatum, dbo.Activiteit.Tijd, dbo.Activiteit.[Maximaal aantal], dbo.Activiteit.FaciliteitID

 from dbo.Activiteit

 join dbo.Recreatieprogramma_Activiteit on  dbo.Activiteit.Nummer = dbo.Recreatieprogramma_Activiteit.ActiviteitNummer

 where dbo.Recreatieprogramma_Activiteit.RecreatieprogrammaDatum = getDate()"></asp:SqlDataSource>
    </form>
    </body></html>