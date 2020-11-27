<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Schoonmaak.Master" CodeBehind="ProjectenOverzicht.aspx.cs" Inherits="ProjectGroenBos.Schoonmaak_en_Onderhoud.ProjectenOverzicht" %>
<asp:Content ID="ProjectOverzicht" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
        <br />

<div class="form-row" style="text-align:center;">
    <h1 class="text-primary">Overzicht Projecten</h1>
    <br />
    <div class="row col-sm-12">
       <div class="col-sm-12" style="text-align:center;">
          <asp:Button ID="btnToevoegen" runat="server" Text="Project Toevoegen" BackColor="#0E6251" BorderColor="#0E6251" ForeColor="White" EnableTheming="True" CssClass="buttonstyle" OnClick="btnToevoegen_Click" />
           <br />
           <br />
           <hr />
          </div>
        <div>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Value="0">-- Selecteer -- </asp:ListItem>
                <asp:ListItem>Bungalownummer</asp:ListItem>
                <asp:ListItem>Oplossende Werkzaamheden</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem Value="0">-- Selecteer --</asp:ListItem>
                <asp:ListItem>Raamwerk</asp:ListItem>
                <asp:ListItem>Vloerwerk</asp:ListItem>
                <asp:ListItem>Dakwerk</asp:ListItem>
                <asp:ListItem>Interieurwerk</asp:ListItem>
                <asp:ListItem>Stucken</asp:ListItem>
                <asp:ListItem>Schilderen</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="drop2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nummer" DataValueField="Nummer">
                <asp:ListItem Text="--Selecteer--" Value="0" />
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Text="Zoek" BackColor="#0E6251" BorderColor="#0E6251" CssClass="buttonstyle" ForeColor="White" OnClick="Button1_Click"/>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [Nummer] FROM [Bungalow]"></asp:SqlDataSource>
            <br />
            <br />
            <br />
        </div>
        <div>
            <center>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="SchouwingID" DataSourceID="SqlDataSource1" Width="70%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="#F0F0F0" />
                <Columns>
                    <asp:CommandField  ButtonType="Image" SelectImageUrl="~/Images/SelectIcon.png" ShowSelectButton="True" />
                    <asp:BoundField DataField="SchouwingID" HeaderText="Nummer" ReadOnly="True" SortExpression="SchouwingID" InsertVisible="False" /> 
                    <asp:BoundField DataField="BungalowID" HeaderText="Bungalow" SortExpression="BungalowID" />
                    <asp:BoundField DataField="Omschrijving" HeaderText="Bevinding" SortExpression="Omschrijving" />
                    <asp:BoundField DataField="Oplossing" HeaderText="Projectcategorie" SortExpression="Oplossing" />
                    <asp:BoundField DataField="Offertestatus" HeaderText="Offertestatus" SortExpression="Offertestatus"/>
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/deleteRow.png" ShowDeleteButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="#0E6251" ForeColor="White" />
                <PagerStyle BackColor="#0E6251" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" ForeColor="Black" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" ForeColor="Black" />
                <SortedAscendingHeaderStyle BackColor="Gray" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [Schouwing]" DeleteCommand="delete from Schouwing where schouwingid = @SchouwingID"></asp:SqlDataSource>
            </center>
        </div>

        <div>
            <center>
            <asp:GridView ID="gridBungalow" runat="server" AutoGenerateColumns="False" DataKeyNames="SchouwingID" DataSourceID="SqlDataSource3" AllowPaging="True" Width="70%" OnSelectedIndexChanged="gridBungalow_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="#F0F0F0" />
                <Columns>
                    <asp:CommandField  ButtonType="Image" SelectImageUrl="~/Images/SelectIcon.png" ShowSelectButton="True" />
                    <asp:BoundField DataField="SchouwingID" HeaderText="Nummer" ReadOnly="True" SortExpression="SchouwingID" InsertVisible="False" /> 
                    <asp:BoundField DataField="BungalowID" HeaderText="Bungalow" SortExpression="BungalowID" />
                    <asp:BoundField DataField="Omschrijving" HeaderText="Bevinding" SortExpression="Omschrijving" />
                    <asp:BoundField DataField="Oplossing" HeaderText="Projectcategorie" SortExpression="Oplossing" />
                    <asp:BoundField DataField="Offertestatus" HeaderText="Offertestatus" SortExpression="Offertestatus"/>
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/deleteRow.png" ShowDeleteButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="#0E6251" ForeColor="White" />
                <PagerStyle BackColor="#0E6251" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" ForeColor="Black" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" ForeColor="Black" />
                <SortedAscendingHeaderStyle BackColor="Gray" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />               
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [Schouwing] WHERE ([BungalowID] = @BungalowID)" DeleteCommand="delete from Schouwing where schouwingid = @SchouwingID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="drop2" Name="BungalowID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
                </center>
        </div>

        <div>
            <center>
                <asp:GridView ID="gridDatum" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="SchouwingID" DataSourceID="SqlDataSource4" Width="70%" OnSelectedIndexChanged="gridDatum_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
              <Columns>
                  <asp:CommandField  ButtonType="Image" SelectImageUrl="~/Images/SelectIcon.png" ShowSelectButton="True" />
                    <asp:BoundField DataField="SchouwingID" HeaderText="Nummer" ReadOnly="True" SortExpression="SchouwingID" InsertVisible="False" /> 
                    <asp:BoundField DataField="BungalowID" HeaderText="Bungalow" SortExpression="BungalowID" />
                    <asp:BoundField DataField="Omschrijving" HeaderText="Bevinding" SortExpression="Omschrijving" />
                    <asp:BoundField DataField="Oplossing" HeaderText="Projectcategorie" SortExpression="Oplossing" />
                    <asp:BoundField DataField="Offertestatus" HeaderText="Offertestatus" SortExpression="Offertestatus" />
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/deleteRow.png" ShowDeleteButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="#0E6251" ForeColor="White" />
                <PagerStyle BackColor="#0E6251" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" ForeColor="Black" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" ForeColor="Black" />
                <SortedAscendingHeaderStyle BackColor="Gray" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [Schouwing] WHERE ([Oplossing] = @Oplossing)" DeleteCommand="delete from Schouwing where schouwingid = @SchouwingID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="Oplossing" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            </center>
        </div>

        </div>
    </div>

</asp:Content>
