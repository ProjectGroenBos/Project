using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Restaurant
{
    public partial class bestellinggelukt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int resnr;
            if (Session["ResNr"] == null)
            {
                //Random rand = new Random();

                //resnr = rand.Next(1, 1000000);

                resnr = 1;

            }
            else
            {
                resnr = (int)Session["ResNr"];
            }
            /*
            //Why take it from the database? Literally no reason to???
              
            //Overal Vars
            String mycon = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020";
            SqlConnection scon = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            String myquery = "select * from Item where RestaurantReserveringID=" + resnr;
            */

            DataTable dt2 = new DataTable();
            dt2 = (DataTable)Session["bestelitems"];

            grvBestelling.DataSource = dt2;
            grvBestelling.DataBind();
        }

        protected void btnTerug_Click(object sender, EventArgs e)
        {
            DataTable dt2 = new DataTable();
            dt2 = (DataTable)Session["bestelitems"];

            dt2.Clear();

            Session["bestelitems"] = dt2;

            Response.Redirect("bestellingopnemen.aspx");
        }
    }
}