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
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Tafelnr"] != null)
            {
                lblTafelnummer.Text = Session["Tafelnr"].ToString();
            }
            else
            {
                Response.Redirect("Tafeloverzicht.aspx");
            }



        }

        protected void btnReserveer_Click(object sender, EventArgs e)
        {

            DateTime dt = DateTime.Parse(txtTijd.Text);
            //int Aantal = int.Parse(ddlAantal.SelectedValue);




            // String constring ="Data Source = SQL.BIM.OSOX.NL; Initial Catalog = 2020 - BIM02 - P1 - P2 - Groenbos; Persist Security Info = True; User ID = BIM022020; Password = BiM@IH2020";
            String constring = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020";
            SqlConnection sqlcon = new SqlConnection(constring);
            String pname = "RestaurantReserveringGoed"; ;
            sqlcon.Open();
            SqlCommand com = new SqlCommand(pname, sqlcon);
            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@BeginTijd", dt);
            com.Parameters.AddWithValue("@Datum", DateTime.Now);
            com.Parameters.AddWithValue("@AantalPersonen", TxtAantalP.Text);
            com.Parameters.AddWithValue("@Opmerking", TxtOpmerkingen.Text);
            com.Parameters.AddWithValue("@Betaalt", "0");
            com.Parameters.AddWithValue("@Voornaam", txtVoornaam.Text);
            com.Parameters.AddWithValue("@Achternaam", txtAchternaam.Text);
            com.Parameters.AddWithValue("@Tussenvoegsel", txtTussenvoegsel.Text);
            com.Parameters.AddWithValue("@Email", txtEmail.Text);




            com.ExecuteNonQuery();
            sqlcon.Close(); ;

        }

        protected void btnJa_Click(object sender, EventArgs e)
        {
            txtBungalownummer.Enabled = true;
            btnJa.Enabled = false;
            btnNee.Enabled = true;
        }

        protected void btnNee_Click(object sender, EventArgs e)
        {
            txtBungalownummer.Enabled = false;
            btnJa.Enabled = true;
            btnNee.Enabled = false;
        }

        protected void txtBungalownummer_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020");
            con.Open();
            if (txtBungalownummer.Text != "")
            {
                SqlCommand cmd = new SqlCommand("SELECT Gast.Voornaam, Gast.Tussenvoegsel, Gast.Achternaam FROM Reservering INNER JOIN Reservering_Bungalow ON Reservering.Nummer = Reservering_Bungalow.ReserveringNummer INNER JOIN Bungalow ON Reservering_Bungalow.BungalowNummer = Bungalow.Nummer INNER JOIN Gast ON Reservering.GastNummer = Gast.Nummer where Bungalow.Nummer = @BungalowNummer and Aankomstdatum <= getdate() and Vertrekdatum >= getdate()",con);
                cmd.Parameters.AddWithValue("@Bungalownummer", int.Parse(txtBungalownummer.Text));
                SqlDataReader da = cmd.ExecuteReader();
                while (da.Read())
                {
                    txtVoornaam.Text = da.GetValue(0).ToString();
                    txtTussenvoegsel.Text = da.GetValue(1).ToString();
                    txtAchternaam.Text = da.GetValue(2).ToString();
                }
                con.Close();
            }
        }
    }
}