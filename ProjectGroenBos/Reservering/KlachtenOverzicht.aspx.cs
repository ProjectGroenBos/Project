using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class KlachtenOverzicht : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnZoek_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["klachtnummer"] = (string)GridView1.SelectedRow.Cells[1].Text;
            Session["voornaam"] = (string)GridView1.SelectedRow.Cells[2].Text;
            Session["tussenvoegsel"] = (string)GridView1.SelectedRow.Cells[3].Text;
            Session["achternaam"] = (string)GridView1.SelectedRow.Cells[4].Text;
            Session["email"] = (string)GridView1.SelectedRow.Cells[5].Text;
            Session["categorie"] = (string)GridView1.SelectedRow.Cells[6].Text;
            Session["omschrijving"] = (string)GridView1.SelectedRow.Cells[7].Text;
            Session["gastnummer"] = (string)GridView1.SelectedRow.Cells[8].Text;


            Response.Redirect("KlachtenAfhandeling.aspx");
        }

    }
}