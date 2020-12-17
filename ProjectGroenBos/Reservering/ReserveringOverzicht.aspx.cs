using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class ReserveringAnnuleren : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnToAnnuleren.Enabled = false;
            btnToWijzigen.Enabled = false;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //sessions aanmaken om op de volgende pagina gegevens mee in te vullen

            
        }

        protected void btnZoek_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();

            //btnToAnnuleren.Visible = true;
            //btnToWijzigen.Visible = true;
        }

        protected void btnToWijzigen_Click(object sender, EventArgs e)
        {
            
            if (Session["reserveringsnummer"] == null)
            {
                lblUitkomst.Text = "Selecteer een reservering.";
            }
            else
            {
                Response.Redirect("ReserveringWijzigen.aspx");
            }
        }

        protected void btnToAnnuleren_Click(object sender, EventArgs e)
        {
            if (Session["reserveringsnummer"] == null)
            {
                lblUitkomst.Text = "Selecteer een reservering.";
            }
            else
            {
                Response.Redirect("ReserveringAnnuleren.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            Session["reserveringsnummer"] = (string)GridView1.SelectedRow.Cells[1].Text;

            btnToAnnuleren.Enabled = true;
            btnToWijzigen.Enabled = true;
        }
    }
}
