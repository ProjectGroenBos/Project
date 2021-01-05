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
            //Gereserveerd op datum van vandaag.
            DateTime datee = DateTime.Now;
            string Datumm = datee.ToString("yyyy-MM-dd HH:mm:ss");

            DateTime dt = DateTime.Parse(txtTijd.Text);
            //int Aantal = int.Parse(ddlAantal.SelectedValue);


            DateTime date = DateTime.Parse(txtDatum.Text);
            string Datum = date.ToString("yyyy-MM-dd HH:mm:ss");



            DateTime datecompare = date.Add(DateTime.Now.TimeOfDay);
            int value = DateTime.Compare(datecompare, DateTime.Now);
            if (value < 0)
            {
                lblOutput.Text = "U kunt niet in het verleden reserveren";
                return;
            }

            int BungalowreserveringsID;
            BungalowreserveringsID = Ophalen();





            // String constring ="Data Source = SQL.BIM.OSOX.NL; Initial Catalog = 2020 - BIM02 - P1 - P2 - Groenbos; Persist Security Info = True; User ID = BIM022020; Password = BiM@IH2020";
            String constring = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020";
            SqlConnection sqlcon = new SqlConnection(constring);
            String pname = "RestaurantReserveringGoed";
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
            com.Parameters.AddWithValue("@BunglowreserveringsID", BungalowreserveringsID);




            com.ExecuteNonQuery();
            sqlcon.Close(); ;

            lblGelukt.Text = "Reservering is geslaagd";

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
                SqlCommand cmd = new SqlCommand("SELECT Gast.Voornaam, Gast.Tussenvoegsel, Gast.Achternaam FROM Reservering INNER JOIN Gast on reservering.gastnummer = gast.nummer INNER JOIN Reservering_Bungalow ON Reservering.Nummer = Reservering_Bungalow.ReserveringNummer INNER JOIN Bungalow ON Reservering_Bungalow.BungalowNummer = Bungalow.Nummer where Bungalow.Nummer = @Bungalownummer and Aankomstdatum <= getdate() and Vertrekdatum >= getdate()", con);
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
            Ophalen();
        }
        private int Ophalen()
        {
            using (SqlConnection connection = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020"))
            {



                connection.Open();
                string selectquery = "select resbun.ReserveringNummer from Reservering_bungalow resbun inner join Reservering res on res.Nummer = resbun.ReserveringNummer  where GETDATE() >= res.Aankomstdatum and Getdate() < res.Vertrekdatum and resbun.BungalowNummer = @Bungalownummer";

                SqlCommand sqlComd = new SqlCommand(selectquery, connection);
                sqlComd.Parameters.AddWithValue("@Bungalownummer", int.Parse(txtBungalownummer.Text));
                SqlDataReader r;
                r = sqlComd.ExecuteReader();

                int ReserveringNummer = 0;

                while (r.Read())
                {
                    ReserveringNummer = (int)r[0];
                }
                connection.Close();
                return ReserveringNummer;
            }
        }
    }
}