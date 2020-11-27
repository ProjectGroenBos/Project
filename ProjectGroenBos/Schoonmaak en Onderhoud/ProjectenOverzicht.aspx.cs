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
            DropDownList2.Visible = false;
            drop2.Visible = false;
        }

        protected void btnToevoegen_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProjectToevoegen.aspx");
        }

        protected void gridBungalow_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gridDatum_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Value == "Bungalownummer")
            {
                DropDownList2.Visible = false;
                drop2.Visible = true;
            }
            if (DropDownList1.SelectedItem.Value == "Oplossende Werkzaamheden")
            {
                DropDownList2.Visible = true;
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
            if (DropDownList1.SelectedItem.Value == "Oplossende Werkzaamheden")
            {
                GridView1.Visible = false;
                gridBungalow.Visible = false;
                DropDownList2.Visible = true;
            }
        }
    }
}