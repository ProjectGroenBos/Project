using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string volgnummer = (string)GridView1.SelectedRow.Cells[0].ToString();
            Session["Volgnummer"] = volgnummer;
            Response.Redirect("NachtregisterWijzigen.aspx");
        }

        protected void BtnZoeken_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();

            if (GridView1.Rows.Count == 0)
            {
                lblUitkomst.Text = "Geen resultaten gevonden.";
            }
            else
            {
                lblUitkomst.Text = "";
            }
        }
}