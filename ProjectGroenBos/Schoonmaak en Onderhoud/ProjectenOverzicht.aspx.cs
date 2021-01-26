using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Schoonmaak_en_Onderhoud
{
    public partial class ProjectenOverzicht : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gridOverzicht.DataBind();
            drop2.Visible = false;
            DropDownList2.Visible = false;
            cblCategorie.Visible = false;
        }

        protected void btnToevoegen_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProjectToevoegen.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["SchouwingID"] = (string)gridOverzicht.SelectedRow.Cells[1].Text;
            Session["BungalowID"] = (string)gridOverzicht.SelectedRow.Cells[2].Text;
            Session["Omschrijving"] = (string)gridOverzicht.SelectedRow.Cells[3].Text;
            Session["Oplossing"] = (string)gridOverzicht.SelectedRow.Cells[4].Text;
            Session["Offertestatus"] = (string)gridOverzicht.SelectedRow.Cells[5].Text;

            Response.Redirect("ProjectWijzigen.aspx");
        }

        protected void gridBungalow_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["SchouwingID"] = (string)gridBungalow.SelectedRow.Cells[1].Text;
            Session["BungalowID"] = (string)gridBungalow.SelectedRow.Cells[2].Text;
            Session["Omschrijving"] = (string)gridBungalow.SelectedRow.Cells[3].Text;
            Session["Oplossing"] = (string)gridBungalow.SelectedRow.Cells[4].Text;
            Session["Offertestatus"] = (string)gridBungalow.SelectedRow.Cells[5].Text;

            Response.Redirect("ProjectWijzigen.aspx");
        }

        protected void gridDatum_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["SchouwingID"] = (string)gridCategorie.SelectedRow.Cells[1].Text;
            Session["BungalowID"] = (string)gridCategorie.SelectedRow.Cells[2].Text;
            Session["Omschrijving"] = (string)gridCategorie.SelectedRow.Cells[3].Text;
            Session["Oplossing"] = (string)gridCategorie.SelectedRow.Cells[4].Text;
            Session["Offertestatus"] = (string)gridCategorie.SelectedRow.Cells[5].Text;

            Response.Redirect("ProjectWijzigen.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Value == "Bungalownummer")
            {
                DropDownList2.Visible = false;
                drop2.Visible = true;
                cblCategorie.Visible = false;
            }
            if (DropDownList1.SelectedItem.Value == "Offertestatus")
            {
                DropDownList2.Visible = true;
                drop2.Visible = false;
                cblCategorie.Visible = false;
            }
            if (DropDownList1.SelectedItem.Value == "Categorie")
            {
                DropDownList2.Visible = false;
                drop2.Visible = false;
                cblCategorie.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Value == "Bungalownummer")
            {
                gridOverzicht.Visible = false;
                gridStatus.Visible = false;
                gridCategorie.Visible = false;
                drop2.Visible = true;
            }
            if (DropDownList1.SelectedItem.Value == "Categorie")
            {
                gridOverzicht.Visible = false;
                gridBungalow.Visible = false;
                gridStatus.Visible = false;
                cblCategorie.Visible = true;
            }
            if (DropDownList1.SelectedItem.Value == "Offertestatus")
            {
                gridOverzicht.Visible = false;
                gridBungalow.Visible = false;
                gridCategorie.Visible = false;
                gridStatus.Visible = true;
                DropDownList2.Visible = true;
            }
        }

        protected void gridStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["SchouwingID"] = (string)gridStatus.SelectedRow.Cells[1].Text;
            Session["BungalowID"] = (string)gridStatus.SelectedRow.Cells[2].Text;
            Session["Omschrijving"] = (string)gridStatus.SelectedRow.Cells[3].Text;
            Session["Oplossing"] = (string)gridStatus.SelectedRow.Cells[4].Text;
            Session["Offertestatus"] = (string)gridStatus.SelectedRow.Cells[5].Text;

            Response.Redirect("ProjectWijzigen.aspx");
        }
    }
}