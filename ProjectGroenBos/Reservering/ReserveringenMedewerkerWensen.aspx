<%@ Page Title="" Language="C#" MasterPageFile="~/Reservering/Site1.Master" AutoEventWireup="true" CodeBehind="ReserveringenMedewerkerWensen.aspx.cs" Inherits="ProjectGroenBos.Reservering.ReserveringenMedewerkerWensen1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

<h3>Heeft u nog speciale wensen of een boodschappen lijst dat u wilt doorgeven? Vult u dan het volgende formulier in.
</h3>

<div class="werkgebied">

    <table>
        <tr>
            <th>Optionele wensen:
            </th>
            <br />
            <td>
                <input id="cbKinderBed" type="checkbox" /><label for="cbKinderBed">Kinder bed</label><br>
            </td>
            <td>
                <input id="cbMagnetron" type="checkbox" /><label for="cbMagnetron">Magnetron</label><br>
            </td>
            <td>
                <input id="cbExtraHandoeken" type="checkbox" /><label for="cbExtraHandoeken">Extra Handoeken</label><br>
            </td>
            <td>
                <input id="cbMiniBar" type="checkbox" /><label for="cbMiniBar">Mini Bar</label><br>
            </td>

        </tr>
    </table>

    <br />

    <table>
        <tr>
            <th>Boodschappen lijst:
            </th>
            <br />
            <p>
                Ontbijt
            </p>
            <td>
                <input id="cbJongeKaas" type="checkbox" /><label for="cbJongeKaas">Jonge Kaas </label>
                <br>
            </td>
            <td>
                <input id="cbOudeKaas" type="checkbox" /><label for="cbOudeKaas">Oude Kaas </label>
                <br>
            </td>
            <td>
                <input id="cbHam" type="checkbox" /><label for="cbHam">Ham </label>
                <br>
            </td>
            <td>
                <input id="cbOntbijtSpek" type="checkbox" /><label for="cbOntbijtSpek">Ontbijt Spek </label>
                <br>
            </td>

            <td>
                <input id="cbEieren" type="checkbox" /><label for="cbEieren">Eieren </label>
                <br>
            </td>
            <td>
                <input id="cbWitBrood" type="checkbox" /><label for="cbWitBrood">Wit Brood </label>
                <br>
            </td>
            <td>
                <input id="cbBruinBrood" type="checkbox" /><label for="cbBruinBrood">Bruin Brood </label>
                <br>
            </td>
        </tr>

        <tr>
            <p>
                Dranken
            </p>
            <td>
                <input id="cbKoffie" type="checkbox" /><label for="cbKoffie">Koffie </label>
                <br>
            </td>
            <td>
                <input id="cbThee" type="checkbox" /><label for="cbThee">Thee </label>
                <br>
            </td>
            <td>
                <input id="cbMelk" type="checkbox" /><label for="cbMelk">Melk </label>
                <br>
            </td>
            <td>
                <input id="cbWater" type="checkbox" /><label for="cbWater">Flessen Water </label>
                <br>
            </td>
        </tr>

    </table>

    <br />
