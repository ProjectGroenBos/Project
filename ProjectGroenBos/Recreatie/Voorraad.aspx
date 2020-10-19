<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="Voorraad.aspx.cs" Inherits="recreatie.paginas.Beheer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/stylevoorraad.css" rel="stylesheet" />
    <script>function openModal(modalnaam) {
            $(modalnaam).modal('show');
        }</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label3" runat="server" Text="Zoeken:" CssClass="labelvoorraad"></asp:Label>
    <asp:Image ID="Image2" runat="server" CssClass="imagevoorraad" Height="171px" ImageUrl="~/Recreatie/img/Logo1.png" Width="212px" />
    <asp:TextBox ID="txtZoekbalk" runat="server" Width="300px" placeholder="Zoek op Artikelnaam of Omschrijving..." OnTextChanged="txtZoeken_TextChanged"  AutoPostBack="True" CssClass="textboxvoorraad"></asp:TextBox>
     <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
     <asp:Button ID="btnSelecteren" runat="server" OnClick="btnSelecteren_Click" Text="Producten selecteren" />
    <asp:Button ID="BtnBestellen" runat="server" Text="Bestellen" OnClick="BtnBestellen_Click" type="button" style="background-color: #009879; color: #fff" class="btn" data-toggle="modal" data-target="#Popup"/>
    <asp:GridView ID="gvVoorraad" runat="server" AutoGenerateColumns="False" AllowSorting="true" OnSorting="OnSorting" ShowFooter="true" DataKeyNames="ID" ShowHeaderWhenEmpty="true"
            OnRowCommand="gvVoorraad_RowCommand" OnRowEditing="gvVoorraad_RowEditing" OnRowCancelingEdit="gvVoorraad_RowCancelingEdit" OnRowUpdating="gvVoorraad_RowUpdating" OnRowDeleting="gvVoorraad_RowDeleting"
            CellPadding="4" ForeColor="#333333" GridLines="none" Width="80%" OnSelectedIndexChanged="gvVoorraad_SelectedIndexChanged" CssClass="content-table" >

          
          

            <Columns>
                <asp:TemplateField HeaderText="Artikelnummer" SortExpression="ID" Visible ="True" >
                    <ItemTemplate>
                        <asp:Label  ID="Label1" Text='<%# Eval("ID") %>' runat="server"/>
                    </ItemTemplate>                     
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Artikelnaam | Omschrijving " SortExpression="Artikelnaam" >  
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Artikelnaam") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Aantal" SortExpression="Aantal">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Aantal") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="In gebruik" SortExpression="Ingebruik">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Ingebruik") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Beschikbaar" SortExpression="Beschikbaar">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Beschikbaar") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Minimale voorraad" SortExpression="[Minimum voorraad]">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("[Minimum voorraad]") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Product selecteren"  Visible="False">
                    <ItemTemplate>
                        <asp:CheckBox ID="cbGeselecteerd" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
        </Columns>           
        </asp:GridView>
    
    <div id="Popup" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Aanvragen inkooporder</h4>
                        </div>
                        <div class="modal-body">
                            <asp:GridView ID="gvOrderaanvragen" runat="server" AutoGenerateColumns="False" ShowFooter="true" DataKeyNames="ID" ShowHeaderWhenEmpty="true"
                             CellPadding="4" ForeColor="#333333" GridLines="none" Width="80%" CssClass="content-table">

          
                             <Columns>
                                <asp:TemplateField HeaderText="Artikelnummer" SortExpression="ID" Visible ="False" >
                                    <ItemTemplate>
                                    <asp:Label Text='<%# Eval("ID") %>' runat="server"/>
                                    </ItemTemplate>
                                
                                    <ItemTemplate>  
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID") %>'></asp:Label>  
                                    </ItemTemplate>   
                
                                </asp:TemplateField>

                
                                 <asp:TemplateField HeaderText="Artikelnaam | Omschrijving " SortExpression="Artikelnaam" >  
                                     <ItemTemplate>
                                         <asp:Label Text='<%# Eval("Artikelnaam") %>' runat="server" />
                                     </ItemTemplate>
                                 </asp:TemplateField>

                
                                 <asp:TemplateField HeaderText="Aantal">
                                     <ItemTemplate>
                                         <asp:TextBox ID="tbAantal" runat="server" Width =" 100%" ></asp:TextBox>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                             </Columns>           
                            </asp:GridView>
                            <asp:Button ID="BtnAanvraag" runat="server" OnClick="BtnAanvraag_Click" type="button" Style="max-width: 80%; margin-left: auto; margin-right: auto;" class="btn btn-primary btn-lg btn-block" Text="Aanvragen" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Sluiten</button>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
