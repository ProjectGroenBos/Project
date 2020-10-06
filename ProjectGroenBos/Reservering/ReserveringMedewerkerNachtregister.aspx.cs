using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.IO;

namespace Reserveringen.Pagina_s
{
    public partial class ReserveringMedewerkerNachtregister : System.Web.UI.Page
    {
        string personen;
        // string mainconn = ConfigurationManager.ConnectionStrings["Defaultconnection"].ConnectionString;
        int aantalPersonen;
        static int count = 0;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Personen"] != null && Session["Voornaam"] != null)
            {
                personen = Session["Personen"].ToString();
                int aantal = int.Parse(personen);

                btnBevestigen.Enabled = false;
                lblOutput.Text = "Geregistreerde bezoekers";
                btnToevoegen.Enabled = true;


            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Uw sessie is verlopen, u moet helaas de gegevens opnieuw invullen.')", true);
                Response.Redirect("ReserveringenMedewerkerHuisje.aspx");
            }
        }

        protected void btnBevestigen_Click(object sender, EventArgs e)
        {
            //sessies ophalen om de data in de database te zetten

            string aankomstdatum = Session["Aankomst"].ToString();
            string vertrekdatum = Session["Vertrek"].ToString();
            string voornaam = Session["Voornaam"].ToString();
            string tussenvoegsel = Session["Tussenvoegsel"].ToString();
            string achternaam = Session["Achternaam"].ToString();
            string email = Session["Email"].ToString();
            string telefoonnummer = Session["Telefoonnummer"].ToString();
            string opmerkingen = Session["Opmerkingen"].ToString();

            string straat = Session["Straat"].ToString();
            string huisnummer = Session["Huisnummer"].ToString();
            string postcode = Session["Postcode"].ToString();
            string land = Session["Land"].ToString();
            int reserveringsStatus = 1;

            DateTime vandaag = DateTime.Today;
            vandaag.ToShortDateString();

            InsGast(voornaam, tussenvoegsel, achternaam, telefoonnummer, email);
            int nummer = GetNummer();
            InsAdres(straat, huisnummer, postcode, land, nummer);
            InsReservering(personen, opmerkingen, vandaag, vertrekdatum, aankomstdatum, reserveringsStatus, nummer);
            //int reservering = GetReservering();
            //InsReserveringBungalow(nummer, reservering);

            StuurMail();

            Response.Redirect("ReserveringenMedewerkerGelukt.aspx");
        }



        private void StuurMail()
        {
            string ontvanger = Session["Email"].ToString();

            //Mail opzetten
            MailMessage mailMessage = new MailMessage("groenbosreservations@gmail.com", ontvanger);
            mailMessage.Subject = "Uw reservering is geplaatst!";
            mailMessage.Body = CreateBody();
            mailMessage.IsBodyHtml = true;

            //Credentails
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "groenbosreservations@gmail.com",
                Password = "MarionenAndries"
            };
            smtpClient.EnableSsl = true;

            //Versturen mail

            smtpClient.Send(mailMessage);

        }

        private string CreateBody()
        {
            {
                //lezen mail.html
                string body = string.Empty;
                using (StreamReader reader = new StreamReader(Server.MapPath("~/MailHuisReserveringGemaakt.html")))
                {
                    body = reader.ReadToEnd();
                }

                //parameters html pagina

                body = body.Replace("{achternaam}", Session["Achternaam"].ToString());
                body = body.Replace("{aankomstdatum}", Session["Aankomst"].ToString());
                body = body.Replace("{vertrekdatum}", Session["Vertrek"].ToString());
                body = body.Replace("{personen}", Session["Personen"].ToString());
                body = body.Replace("{email}", Session["Email"].ToString());

                return body;
            }

        }

        internal class Streamreader : StreamReader
        {
            public Streamreader(string path) : base(path)
            {
            }
        }


        private void InsGast(string voornaam, string tussenvoegsel, string achternaam, string telefoonnummer, string email)
        {
            //database connectie om gegevens in te vullen
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                try
                {
                    con.Open();

                    SqlCommand sqlquery = new SqlCommand("[dbo].[InsertGast]");

                    sqlquery.Parameters.AddWithValue("@Voornaam", voornaam);
                    sqlquery.Parameters.AddWithValue("@Tussenvoegsel", tussenvoegsel);
                    sqlquery.Parameters.AddWithValue("@Achternaam", achternaam);
                    sqlquery.Parameters.AddWithValue("@Telefoonnummer", telefoonnummer);
                    sqlquery.Parameters.AddWithValue("@Email", email);

                    sqlquery.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlquery.Connection = con;
                    sqlquery.ExecuteNonQuery();

                    con.Close();
                }
                catch
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Er ging iets mis, neem contact met ons op.')", true);
                }
            }
        }

        private int GetNummer()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                con.Open();

                string sqlquery = "SELECT max(Nummer) from [dbo].[Gast]";
                SqlCommand cmd = new SqlCommand(sqlquery, con);
                int nummer = (int)cmd.ExecuteScalar();

                con.Close();

                return nummer;

            }
        }
        private void InsAdres(string straat, string huisnummer, string postcode, string land, int nummer)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                try
                {
                    con.Open();

                    SqlCommand sqlquery = new SqlCommand("[dbo].[InsertAdres]");

                    sqlquery.Parameters.AddWithValue("@Straatnaam", straat);
                    sqlquery.Parameters.AddWithValue("@Huisnummer", huisnummer);
                    sqlquery.Parameters.AddWithValue("@Postcode", postcode);
                    sqlquery.Parameters.AddWithValue("@Land", land);
                    sqlquery.Parameters.AddWithValue("@GastNummer", nummer);

                    sqlquery.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlquery.Connection = con;
                    sqlquery.ExecuteNonQuery();

                    con.Close();
                }
                catch
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Er ging iets mis, neem contact met ons op.')", true);
                }
            }
        }

        private void InsReservering(string personen, string opmerking, DateTime plaatsing, string vertrekdatum, string aankomstdatum, int reserveringsStatus, int nummer)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                try
                {
                    con.Open();

                    SqlCommand sqlquery = new SqlCommand("[dbo].[InsertReservering]");

                    sqlquery.Parameters.AddWithValue("@Aantal_Personen", personen);
                    sqlquery.Parameters.AddWithValue("@Opmerking", opmerking);
                    sqlquery.Parameters.AddWithValue("@Datum_Geplaatst", plaatsing);
                    sqlquery.Parameters.AddWithValue("@Vertrekdatum", vertrekdatum);
                    sqlquery.Parameters.AddWithValue("@Aankomstdatum", aankomstdatum);
                    sqlquery.Parameters.AddWithValue("@GastNummer", nummer);
                    sqlquery.Parameters.AddWithValue("@ReserveringsstatusID", reserveringsStatus);

                    sqlquery.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlquery.Connection = con;
                    sqlquery.ExecuteNonQuery();

                    con.Close();
                }
                catch
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Er ging iets mis, neem contact met ons op.')", true);
                }
            }
        }



        private int GetReservering()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                con.Open();

                string sqlquery = "SELECT max(Nummer) from [dbo].[Reservering]";
                SqlCommand cmd = new SqlCommand(sqlquery, con);
                int nummer = (int)cmd.ExecuteScalar();

                con.Close();

                return nummer;

            }
        }

        protected void btnToevoegen_Click1(object sender, EventArgs e)
        {
            string Voornaam = TxBNaam.Text;
            string Tussenvoegsel = TxBtussenvoegsel.Text;
            string Achternaam = TxBAchternaam.Text;
            //DateTime Geboortedatum = new DateTime();
            string geboortedatum = TxBGeboortedatum.Text;
            string bungalow = Session["Bungalow"].ToString();

            aantalPersonen = int.Parse(Session["Personen"].ToString()) - 1;

            lblOutput.Text = lblOutput.Text + Voornaam + " " + Tussenvoegsel + " " + Achternaam + " " + geboortedatum + "<br/>";

            if (count == aantalPersonen)
            {
                btnBevestigen.Enabled = true;
                btnToevoegen.Enabled = false;
            }
            count++;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {

                try
                {
                    con.Open();

                    SqlCommand sqlquery = new SqlCommand("[dbo].[InsertNachtRegister]");

                    sqlquery.Parameters.AddWithValue("@Voornaam", Voornaam);
                    sqlquery.Parameters.AddWithValue("@Tussenvoegsel", Tussenvoegsel);
                    sqlquery.Parameters.AddWithValue("@Achternaam", Achternaam);
                    sqlquery.Parameters.AddWithValue("@Geboortedatum", geboortedatum);
                    sqlquery.Parameters.AddWithValue("@BungalowNummer2", bungalow);

                    sqlquery.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlquery.Connection = con;
                    sqlquery.ExecuteNonQuery();



                    con.Close();
                }

                catch(Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Er ging iets mis, neem contact met ons op.')", true);
                    Console.WriteLine(ex.ToString());

                }
            }
        }
    }
}
