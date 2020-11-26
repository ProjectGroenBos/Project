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
            GridView1.Visible = true;
            btnGastAanmaken.Visible = false;
        }

        protected void btnZoek_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            GridView1.DataBind();

            if(GridView1.Rows.Count == 0)
            {
                btnGastAanmaken.Visible = true;
            }
        }

        protected void btnGastAanmaken_Click(object sender, EventArgs e)
        {
            Session["controle"] = 420;
            Session["achternaam"] = txbAchternaam.Text;
            Session["email"] = txbEmail.Text;
            Session["telefoonnummer"] = txbTelefoonnummer.Text;
            Response.Redirect("GastAanmaken.aspx");
        }



        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["gastnummer"] = (string)GridView1.SelectedRow.Cells[1].Text;
            Response.Redirect("ReserveringAanmaken.aspx");
        }
    }
}
