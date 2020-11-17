using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recreatie.paginas
{
    public partial class ActiviteitOverzicht : System.Web.UI.Page
    {
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Inplannen_Click(object sender, EventArgs e)
        {
            Response.Redirect("ActiviteitInplannen.aspx");
        }

        protected void Wijzigen_Click(object sender, EventArgs e)
        {
            Response.Redirect("ActiviteitWijzigen.aspx");
        }

        protected void Verwijderen_Click(object sender, EventArgs e)
        {
            Response.Redirect("ActiviteitVerwijderen.aspx");
        }
    }
}