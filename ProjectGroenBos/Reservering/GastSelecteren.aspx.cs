using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos
{
    public partial class KlantSelecteren : System.Web.UI.Page
    {

        //string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.Visible = false;
        }

        protected void btnZoek_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            GridView1.DataBind();
        }

        protected void btnGastAanmaken_Click(object sender, EventArgs e)
        {
            Response.Redirect("GastAanmaken.aspx");
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow rij = GridView1.Rows[e.NewSelectedIndex];

            Session["reserveringnnummer"] = rij.Cells[0];

            Response.Redirect("ReserveringAanmaken.aspx");
        }
    }
}