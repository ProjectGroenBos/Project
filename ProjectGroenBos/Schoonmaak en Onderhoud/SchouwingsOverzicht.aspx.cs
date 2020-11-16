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
    }
}