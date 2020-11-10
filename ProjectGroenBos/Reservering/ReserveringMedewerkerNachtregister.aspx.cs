using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Net.Mail;
using System.Web.UI;

namespace ProjectGroenBos.Reservering
{
    public partial class ReserveringMedewerkerNachtregister : System.Web.UI.Page
    {
        string personen;
        // string mainconn = ConfigurationManager.ConnectionStrings["Defaultconnection"].ConnectionString;
        int aantalPersonen;
        static int count = 0;
        int reserveringnummer;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Personen"] != null && Session["Voornaam"] != null)
            {
                personen = Session["Personen"].ToString();
                int aantal = int.Parse(personen);

                btnBevestigen.Enabled = false;
                lblOutput.Text = "Geregistreerde bezoekers: ";
                btnToevoegen.Enabled = true;


            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Uw sessie is verlopen, u moet helaas de gegevens opnieuw invullen.')", true);
                Response.Redirect("Huisjemedewerker.aspx");
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
            string geboortedatum = Session["Geboortedatum"].ToString();
            string opmerkingen = Session["Opmerkingen"].ToString();

            string straat = Session["Straat"].ToString();
            string huisnummer = Session["Huisnummer"].ToString();
            string postcode = Session["Postcode"].ToString();
            string land = Session["Land"].ToString();
            int reserveringsStatus = 1;

            string bungalow = Session["Bungalow"].ToString();
            int bungalowGetal = int.Parse(bungalow);

            //standaardwaardes factuur
            int betaalmethode = 1;
            int betaalstatus = 8;
            int factuurtype = 2;

            //standaardwaardes transactie
            string aan = "Groenbos";
            string rekeningnummer = "NL32 RABO 0220.96.13.200";
            int typeID = 2;
            double bedrag = 0;


            DateTime vandaag = DateTime.Today;
            vandaag.ToShortDateString();

            ReserveerderToevoegen(voornaam, tussenvoegsel, achternaam, geboortedatum, bungalow);

            InsGast(voornaam, tussenvoegsel, achternaam, telefoonnummer, email);
            int gastnummer = GetNummer();
            InsAdres(straat, huisnummer, postcode, land, gastnummer);
            InsReservering(personen, opmerkingen, vandaag, vertrekdatum, aankomstdatum, reserveringsStatus, gastnummer);
            reserveringnummer = GetReservering();
            InsReserveringBungalow(reserveringnummer, bungalowGetal);

            InsDebiteurenFactuur(vandaag, betaalmethode, betaalstatus, factuurtype, reserveringnummer);
            int debifactuur = GetDebiNummer();

            InsTransactie(vandaag, aan, bedrag, reserveringnummer, debifactuur, rekeningnummer, typeID);

            int feestdag = GetFeestdag(reserveringnummer);
            int lengte = GetLengte(reserveringnummer);
            int seizoen = GetSeizoen(reserveringnummer);

            UpdateReservering(seizoen, lengte, feestdag, reserveringnummer);

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
                using (StreamReader reader = new StreamReader(Server.MapPath("MailHuisReserveringGemaakt.html")))
                {
                    body = reader.ReadToEnd();
                }

                //parameters html pagina
                body = body.Replace("{reserveringsnummer}", reserveringnummer.ToString());
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

        private void ReserveerderToevoegen(string voornaam, string tussenvoegsel, string achternaam, string geboortedatum, string bungalow)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {

                try
                {
                    con.Open();

                    SqlCommand sqlquery = new SqlCommand("[dbo].[InsertNachtRegister]");

                    sqlquery.Parameters.AddWithValue("@Voornaam", voornaam);
                    sqlquery.Parameters.AddWithValue("@Tussenvoegsel", tussenvoegsel);
                    sqlquery.Parameters.AddWithValue("@Achternaam", achternaam);
                    sqlquery.Parameters.AddWithValue("@Geboortedatum", geboortedatum);
                    sqlquery.Parameters.AddWithValue("@BungalowNummer2", bungalow);

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
                int gastnummer = (int)cmd.ExecuteScalar();

                con.Close();

                return gastnummer;

            }
        }
        private void InsAdres(string straat, string huisnummer, string postcode, string land, int gastnummer)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                try
                {
                    con.Open();

                    SqlCommand sqlquery = new SqlCommand("insert into [dbo].[Adres] (Straatnaam, Huisnummer, Postcode, Land, GastNummer) values (@Straatnaam, @Huisnummer, @Postcode, @Land, @GastNummer)");

                    sqlquery.Parameters.AddWithValue("@Straatnaam", straat);
                    sqlquery.Parameters.AddWithValue("@Huisnummer", huisnummer);
                    sqlquery.Parameters.AddWithValue("@Postcode", postcode);
                    sqlquery.Parameters.AddWithValue("@Land", land);
                    sqlquery.Parameters.AddWithValue("@GastNummer", gastnummer);

                    sqlquery.CommandType = System.Data.CommandType.Text;
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

        private void InsReservering(string personen, string opmerking, DateTime plaatsing, string vertrekdatum, string aankomstdatum, int reserveringsStatus, int gastnummer)
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
                    sqlquery.Parameters.AddWithValue("@GastNummer", gastnummer);
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
                int reserveringnummer = (int)cmd.ExecuteScalar();

                con.Close();

                return reserveringnummer;

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

            aantalPersonen = int.Parse(Session["Personen"].ToString()) - 2;

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

                catch
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Er ging iets mis, neem contact met ons op.')", true);
                }
            }
        }

        private void InsReserveringBungalow(int reserveringnummer, int bungalowGetal)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {

                try
                {
                    con.Open();

                    SqlCommand sqlquery = new SqlCommand("insert into Reservering_Bungalow (ReserveringNummer, BungalowNummer) values (@ReserveringNummer, @BungalowNummer)");

                    sqlquery.Parameters.AddWithValue("@ReserveringNummer", reserveringnummer);
                    sqlquery.Parameters.AddWithValue("@BungalowNummer", bungalowGetal);

                    sqlquery.CommandType = System.Data.CommandType.Text;
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

        private void InsDebiteurenFactuur(DateTime vandaag, int betaalmethode, int betaalstatus, int factuurtype, int reserveringnummer)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {

                try
                {
                    con.Open();

                    SqlCommand query = new SqlCommand("insert Debiteurenfactuur (Datum, BetaalmethodeID, BetaalstatusID, FactuurtypeID, ReserveringNummer) values (@datum, @methode, @betaal, @factuurtype, @resnummer)");

                    query.Parameters.AddWithValue("@datum", vandaag);
                    query.Parameters.AddWithValue("@methode", betaalmethode);
                    query.Parameters.AddWithValue("@betaal", betaalstatus);
                    query.Parameters.AddWithValue("@factuurtype", factuurtype);
                    query.Parameters.AddWithValue("@resnummer", reserveringnummer);

                    query.CommandType = System.Data.CommandType.Text;
                    query.Connection = con;
                    query.ExecuteNonQuery();

                    con.Close();
                }
                catch
                {

                }
            }
        }

        private int GetDebiNummer()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                con.Open();

                string sqlquery = "SELECT max(Nummer) from [dbo].[Debiteurenfactuur]";
                SqlCommand cmd = new SqlCommand(sqlquery, con);
                int debifactuur = (int)cmd.ExecuteScalar();

                con.Close();

                return debifactuur;

            }
        }

        private void InsTransactie(DateTime vandaag, string aan, double bedrag, int reserveringnummer, int debifactuur, string rekeningnummer, int typeID)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {

                try
                {
                    con.Open();

                    SqlCommand query = new SqlCommand("insert Transactie (Datum, Aan, Bedrag, Omschrijving, DebiteurenfactuurNummer, BankrekeningBanknummer, TypeID) values (@datum, @aan, @bedrag, @resnummer, @debifactuur, @rekeningnummer, @type)");

                    query.Parameters.AddWithValue("@datum", vandaag);
                    query.Parameters.AddWithValue("@aan", aan);
                    query.Parameters.AddWithValue("@bedrag", bedrag);
                    query.Parameters.AddWithValue("@resnummer", reserveringnummer);
                    query.Parameters.AddWithValue("@debifactuur", debifactuur);
                    query.Parameters.AddWithValue("@rekeningnummer", rekeningnummer);
                    query.Parameters.AddWithValue("@type", typeID);

                    query.CommandType = System.Data.CommandType.Text;
                    query.Connection = con;
                    query.ExecuteNonQuery();

                    con.Close();
                }
                catch
                {

                }
            }
        }

        private int GetFeestdag(int reserveringnummer)
        {
            int feestdag;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                con.Open();

                string sqlquery = "declare @Date01 as smalldatetime declare @Date02 as smalldatetime select @Date01 = min(Aankomstdatum), @Date02 = max(Vertrekdatum) from Reservering where Nummer = @nummer declare @DateDiff as int select @DateDiff = (select DATEDIFF(DAY, @Date01, @Date02) as yolo) ; WITH Tally(N) AS (SELECT ROW_NUMBER() OVER(ORDER BY(SELECT NULL)) FROM sys.all_columns a CROSS JOIN sys.all_columns b) SELECT Feestdag.ID FROM Tally cross join Feestdag where N <= @DateDiff and DATEADD(day, N, @Date01) between Begindatum and Einddatum group by Feestdag.ID";
                SqlCommand cmd = new SqlCommand(sqlquery, con);
                cmd.Parameters.AddWithValue("@nummer", reserveringnummer);

                try
                {
                    feestdag = (int)cmd.ExecuteScalar(); 
                }
                catch
                {
                    feestdag = 0;
                }
                finally
                {
                    con.Close();
                }
                return feestdag;
            }
        }

        private int GetLengte(int reserveringnummer)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                con.Open();

                string sqlquery = "declare @Date01 as smalldatetime declare @Date02 as smalldatetime select @Date01= min(Aankomstdatum), @Date02 = max(Vertrekdatum) from Reservering where Nummer = @nummer declare @DateDiff as int select @DateDiff = DATEDIFF(DAY, @Date01, @Date02) SELECT CASE WHEN DATEDIFF(DAY, @Date01, @Date02) = 7 then 1 WHEN DATEDIFF(DAY, @Date01, @Date02) = 3 then 3 WHEN DATEDIFF(DAY, @Date01, @Date02) = 4 then 2 END AS lengte";
                SqlCommand cmd = new SqlCommand(sqlquery, con);
                cmd.Parameters.AddWithValue("@nummer", reserveringnummer);
                int lengte = (int)cmd.ExecuteScalar();

                con.Close();

                return lengte;

            }
        }

        private int GetSeizoen(int reserveringnummer)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                con.Open();

                string sqlquery = "declare @Date01 as smalldatetime declare @Date02 as smalldatetime select @Date01= min(Aankomstdatum), @Date02 = max(Vertrekdatum) from Reservering where Nummer = @nummer declare @DateDiff as int select @DateDiff = (select DATEDIFF(DAY, @Date01, @Date02) as yolo)  ; WITH Tally (N) AS ( SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) FROM sys.all_columns a CROSS JOIN sys.all_columns b) SELECT Seizoen.ID FROM Tally cross join Seizoen  where N <= @DateDiff and DATEADD(day, N, @Date01) between Begindatum and Einddatum and prio = (sELECT MAX(prio) FROM Tally cross join Seizoen  where N <= @DateDiff and DATEADD(day, N, @Date01) between Begindatum and Einddatum) group by prio, Seizoen.ID";
                SqlCommand cmd = new SqlCommand(sqlquery, con);
                cmd.Parameters.AddWithValue("@nummer", reserveringnummer);
                int seizoen = (int)cmd.ExecuteScalar();

                con.Close();

                return seizoen;

            }
        }

        private void UpdateReservering(int seizoen, int lengte, int feestdag, int reserveringnummer)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                con.Open();

                string sqlquery = "update Reservering set SeizoenID = @seizoen, ReserveringslengteID = @lengte, FeestdagNummer = @feestdag where Nummer = @nummer";
                SqlCommand cmd = new SqlCommand(sqlquery, con);

                cmd.Parameters.AddWithValue("@seizoen", seizoen);
                cmd.Parameters.AddWithValue("@lengte", lengte);
                cmd.Parameters.AddWithValue("@feestdag", feestdag);
                cmd.Parameters.AddWithValue("@nummer", reserveringnummer);

                cmd.ExecuteNonQuery();

                con.Close();
            }
        }
    }
}
