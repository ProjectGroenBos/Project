using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos
{
    public partial class bestellingenoverzicht : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lnkClickMe_Click(object sender, EventArgs e)
        {
            LinkButton b = (LinkButton)sender;

            string arguments = b.CommandArgument;
            string[] args = arguments.Split(';');

            string Naam = args[0];
            string ReserveringsNr = args[1];
            string RondeNr = args[2];

            String mycon = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020";
            SqlConnection scon = new SqlConnection(mycon);
            String myquery = "SELECT ID FROM Item WHERE Naam = '" + Naam + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = scon;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
           
            scon.Open();
            string ItemID = cmd.ExecuteScalar().ToString();
            scon.Close();
            
            myquery = "UPDATE Item_RestaurantReservering  SET Status = 'Gereed' WHERE ItemID = " + ItemID + " AND RestaurantReserveringID = " + ReserveringsNr + " AND Ronde = " + RondeNr + "";


            cmd.CommandText = myquery;
            scon.Open();
            cmd.ExecuteNonQuery();
            scon.Close();
        }
    }
}
