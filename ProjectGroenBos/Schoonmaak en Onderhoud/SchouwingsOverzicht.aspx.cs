using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Schoonmaak_en_Onderhoud
{
    public partial class SchouwingsOverzicht : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
            txtDatum.Visible = false;
            drop2.Visible = false;
        }

        protected void btnToevoegen_Click(object sender, EventArgs e)
        {
            Response.Redirect("SchouwingToevoegen.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["SchouwingID"] = (string)GridView1.SelectedRow.Cells[1].Text;
            Session["BungalowID"] = (string)GridView1.SelectedRow.Cells[2].Text;
            Session["Schouwingsdatum"] = (string)GridView1.SelectedRow.Cells[3].Text;
            Session["Omschrijving"] = (string)GridView1.SelectedRow.Cells[4].Text;

            Response.Redirect("SchouwingWijzigen.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Value == "Bungalownummer")
            {
                txtDatum.Visible = false;
                drop2.Visible = true;
            }
            if (DropDownList1.SelectedItem.Value == "Schouwingsdatum")
            {
                txtDatum.Visible = true;
                drop2.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Value == "Bungalownummer")
            {
                GridView1.Visible = false;
                gridDatum.Visible = false;
                drop2.Visible = true;

            }
            if (DropDownList1.SelectedItem.Value == "Schouwingsdatum")
            {
                GridView1.Visible = false;
                gridBungalow.Visible = false;
                txtDatum.Visible = true;
            }
        }

        protected void gridBungalow_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["SchouwingID"] = (string)gridBungalow.SelectedRow.Cells[1].Text;
            Session["BungalowID"] = (string)gridBungalow.SelectedRow.Cells[2].Text;
            Session["Schouwingsdatum"] = (string)gridBungalow.SelectedRow.Cells[3].Text;
            Session["Omschrijving"] = (string)gridBungalow.SelectedRow.Cells[4].Text;

            Response.Redirect("SchouwingWijzigen.aspx");
        }

        protected void gridDatum_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["SchouwingID"] = (string)gridDatum.SelectedRow.Cells[1].Text;
            Session["BungalowID"] = (string)gridDatum.SelectedRow.Cells[2].Text;
            Session["Schouwingsdatum"] = (string)gridDatum.SelectedRow.Cells[3].Text;
            Session["Omschrijving"] = (string)gridDatum.SelectedRow.Cells[4].Text;

            Response.Redirect("SchouwingWijzigen.aspx");
        }
    }
}