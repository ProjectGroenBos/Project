using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ProjectGroenBos.Restaurant
{
    public partial class WebForm1 : System.Web.UI.Page
    {


        protected void btnGereed1_Click(object sender, EventArgs e)
        {
            String mycon = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020";
            SqlConnection scon = new SqlConnection(mycon);
            String myquery = "SELECT Status FROM(Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde = (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld')";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = scon;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            myquery = "UPDATE Item_RestaurantReservering SET Status = 'Gereed' WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde = (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld')";

            cmd.CommandText = myquery;
            scon.Open();
            cmd.ExecuteNonQuery();
            scon.Close();
            this.dtlBestelling1.DataBind();
            this.dtlBestelling2.DataBind();
            this.dtlBestelling3.DataBind();
            this.dtlBestelling4.DataBind();
            this.dtlBestelling5.DataBind();

            this.dtlTafelnr.DataBind();
            this.dtlTafelnr0.DataBind();
            this.dtlTafelnr1.DataBind();
            this.dtlTafelnr2.DataBind();
            this.dtlTafelnr3.DataBind();
        }

        protected void btnGereed2_Click(object sender, EventArgs e)
        {
            String mycon = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020";
            SqlConnection scon = new SqlConnection(mycon);
            String myquery = "SELECT Status FROM(Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde = (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld'))";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = scon;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            myquery = "UPDATE Item_RestaurantReservering SET Status = 'Gereed' WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde = (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld'))";

            cmd.CommandText = myquery;
            scon.Open();
            cmd.ExecuteNonQuery();
            scon.Close();
            this.dtlBestelling1.DataBind();
            this.dtlBestelling2.DataBind();
            this.dtlBestelling3.DataBind();
            this.dtlBestelling4.DataBind();
            this.dtlBestelling5.DataBind();

            this.dtlTafelnr.DataBind();
            this.dtlTafelnr0.DataBind();
            this.dtlTafelnr1.DataBind();
            this.dtlTafelnr2.DataBind();
            this.dtlTafelnr3.DataBind();
        }

        protected void btnGereed3_Click(object sender, EventArgs e)
        {
            String mycon = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020";
            SqlConnection scon = new SqlConnection(mycon);
            String myquery = "SELECT Status FROM(Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde = (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld')))";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = scon;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            myquery = "UPDATE Item_RestaurantReservering SET Status = 'Gereed' WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde = (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld')))";

            cmd.CommandText = myquery;
            scon.Open();
            cmd.ExecuteNonQuery();
            scon.Close();
            this.dtlBestelling1.DataBind();
            this.dtlBestelling2.DataBind();
            this.dtlBestelling3.DataBind();
            this.dtlBestelling4.DataBind();
            this.dtlBestelling5.DataBind();

            this.dtlTafelnr.DataBind();
            this.dtlTafelnr0.DataBind();
            this.dtlTafelnr1.DataBind();
            this.dtlTafelnr2.DataBind();
            this.dtlTafelnr3.DataBind();
        }

        protected void btnGereed4_Click(object sender, EventArgs e)
        {
            String mycon = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020";
            SqlConnection scon = new SqlConnection(mycon);
            String myquery = "SELECT Status FROM(Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde = (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld'))))";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = scon;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            myquery = "UPDATE Item_RestaurantReservering SET Status = 'Gereed' WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde = (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld'))))";

            cmd.CommandText = myquery;
            scon.Open();
            cmd.ExecuteNonQuery();
            scon.Close();
            this.dtlBestelling1.DataBind();
            this.dtlBestelling2.DataBind();
            this.dtlBestelling3.DataBind();
            this.dtlBestelling4.DataBind();
            this.dtlBestelling5.DataBind();

            this.dtlTafelnr.DataBind();
            this.dtlTafelnr0.DataBind();
            this.dtlTafelnr1.DataBind();
            this.dtlTafelnr2.DataBind();
            this.dtlTafelnr3.DataBind();
        }

        protected void btnGereed5_Click(object sender, EventArgs e)
        {
            String mycon = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020";
            SqlConnection scon = new SqlConnection(mycon);
            String myquery = "SELECT Status FROM(Item INNER JOIN Item_RestaurantReservering ON Item.ID = Item_RestaurantReservering.ItemID) INNER JOIN RestaurantReservering ON Item_RestaurantReservering.RestaurantReserveringID = RestaurantReservering.ID WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde = (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld')))))";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = scon;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            myquery = "UPDATE Item_RestaurantReservering SET Status = 'Gereed' WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde = (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld' AND Item_RestaurantReservering.Ronde > (SELECT MIN(Item_RestaurantReservering.Ronde) FROM Item_RestaurantReservering WHERE Status = 'Besteld')))))";

            cmd.CommandText = myquery;
            scon.Open();
            cmd.ExecuteNonQuery();
            scon.Close();
            this.dtlBestelling1.DataBind();
            this.dtlBestelling2.DataBind();
            this.dtlBestelling3.DataBind();
            this.dtlBestelling4.DataBind();
            this.dtlBestelling5.DataBind();

            this.dtlTafelnr.DataBind();
            this.dtlTafelnr0.DataBind();
            this.dtlTafelnr1.DataBind();
            this.dtlTafelnr2.DataBind();
            this.dtlTafelnr3.DataBind();
        }
    }
}