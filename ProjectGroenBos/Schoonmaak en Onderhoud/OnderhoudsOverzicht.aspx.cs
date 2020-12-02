using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;



namespace ProjectGroenBos.Schoonmaak_en_Onderhoud
{
    public partial class OnderhoudsOverzicht : System.Web.UI.Page
    {

        StringBuilder table = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnZoek_Click(object sender, EventArgs e)
        {
            RequiredFieldValidator1.Validate();

            if (RequiredFieldValidator1.IsValid)
            { 
                if (DropDownList1.SelectedItem.Value == "Startdatum")
                {
                    OverzichtGrid.Visible = false;
                    statusgrid.Visible = false;
                    bungalowGrid.Visible = false;
                    typegrid.Visible = false;
                    datumGrid.Visible = true;
                }

                if (DropDownList1.SelectedItem.Value == "Bungalownummer")
                {
                    OverzichtGrid.Visible = false;
                    statusgrid.Visible = false;
                    datumGrid.Visible = false;
                    typegrid.Visible = false;
                    bungalowGrid.Visible = true;
                }

                if (DropDownList1.SelectedItem.Value == "Status")
                {
                    OverzichtGrid.Visible = false;
                    bungalowGrid.Visible = false;
                    datumGrid.Visible = false;
                    typegrid.Visible = false;
                    statusgrid.Visible = true;

                }

                if (DropDownList1.SelectedItem.Value == "Type")
                {
                    OverzichtGrid.Visible = false;
                    bungalowGrid.Visible = false;
                    datumGrid.Visible = false;
                    statusgrid.Visible = false;
                    typegrid.Visible = true;
                }
            }
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("OnderhoudToevoegen.aspx");
        }


        protected void btnWijzigscherm_Click(object sender, EventArgs e)
        {
            Response.Redirect("OnderhoudWijzigen.aspx");
        }
    }
}