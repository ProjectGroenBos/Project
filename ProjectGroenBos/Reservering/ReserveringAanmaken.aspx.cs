using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ProjectGroenBos.Reservering
{
    public partial class ReserveringAanmaken : System.Web.UI.Page
    {
        DateTime aankomstDatum;
        DateTime vertrekDatum;
        DateTime vandaag = DateTime.Today;

        protected void Page_Load(object sender, EventArgs e)
        {
            //kijken of er op de andere pagina activiteit is geweest
            if (Session["gastnummer"] == null)
            {
                Response.Redirect("GastSelecteren.aspx");
            }
            else
            {
                lblGastnummer.Text = Session["gastnummer"].ToString();
                lblUitkomst.Text = "";
                GridView2.Visible = false;
                btnAanmaken.Enabled = false;
            }
        }

        protected void btnZoek_Click(object sender, EventArgs e)
        {
            //variabelen voor controles
            string aankomst = txbAankomstdatum.Text;
            string aankomst2 = aankomst.Replace("/", "-");

            string vertrek = txbVertrekdatum.Text;
            string vertrek2 = vertrek.Replace("/", "-");

            aankomstDatum = DateTime.Parse(aankomst2);
            vertrekDatum = DateTime.Parse(vertrek2);

            aankomstDatum.ToShortDateString();
            vertrekDatum.ToShortDateString();
            vandaag.ToShortDateString();

            int aantalPersonen = int.Parse(txbAantalPersonen.Text);

            if (aankomstDatum < vertrekDatum && aankomstDatum > vandaag && vertrekDatum > vandaag)
            {

                //dataset om de gridview te vullen
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
                {
                    con.Open();
                    string query = "select * from  [dbo].[ZoekHuisjes](@GewensteAankomstDatum, @GewensteVertrekDatum, @personen)";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@GewensteAankomstDatum", aankomstDatum);
                    cmd.Parameters.AddWithValue("@GewensteVertrekDatum", vertrekDatum);
                    cmd.Parameters.AddWithValue("@personen", aantalPersonen);
                    cmd.ExecuteNonQuery();

                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    con.Close();

                }
            }
            else if (aankomstDatum == vandaag || vertrekDatum == vandaag)
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('U kunt niet vertrekken of aankomen op de dag van reservering.')", true);
                lblUitkomst.Text = "U kunt niet vertrekken of aankomen op de dag van reservering.";
            }
            else if (vertrekDatum == aankomstDatum)
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vertrekdatum is later als de aankomstdatum. Controleer deze nog even alstublieft.')", true);
                lblUitkomst.Text = "Vertrekdatum is later als de aankomstdatum. Controleer deze nog even alstublieft.";
            }
            else
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('U kunt niet voor het verleden reserveren. Probeer het opnieuw.')", true);
                lblUitkomst.Text = "U kunt niet voor het verleden reserveren. Probeer het opnieuw.";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //huisjenummer selecteren
            lblHuisjenummer.Text = (string)GridView1.SelectedRow.Cells[1].Text;
            btnAanmaken.Enabled = true;
        }

        protected void btnAanmaken_Click(object sender, EventArgs e)
        {

            //waarden uit de ingevulde velden
            int bungalownummer = int.Parse(lblHuisjenummer.Text);
            int gastnummer = int.Parse(lblGastnummer.Text);
            int personen = int.Parse(txbAantalPersonen.Text);
            string opmerking = txbOpmerking.Text;

            //datum invullen
            string aankomst = txbAankomstdatum.Text;
            string aankomst2 = aankomst.Replace("/", "-");

            string vertrek = txbVertrekdatum.Text;
            string vertrek2 = vertrek.Replace("/", "-");

            aankomstDatum = DateTime.Parse(aankomst2);
            vertrekDatum = DateTime.Parse(vertrek2);

            aankomstDatum.ToShortDateString();
            vertrekDatum.ToShortDateString();
            vandaag.ToShortDateString();

            int reserveringsStatus = 1;

            //standaardwaardes factuur
            int betaalmethode = 1;
            int betaalstatus = 8;
            int factuurtype = 2;

            //standaardwaardes transactie
            string aan = "Groenbos";
            string rekeningnummer = "NL32 RABO 0220.96.13.200";
            int typeID = 2;

            try
            {
                //invullen database
                InsReservering(personen, opmerking, vandaag, vertrekDatum, aankomstDatum, reserveringsStatus, gastnummer);
                int reserveringnummer = GetReservering();
                InsReserveringBungalow(reserveringnummer, bungalownummer);
                GetKlantgegevens(gastnummer);

                string voornaam = (string)GridView2.DataKeys[0]["Voornaam"].ToString();
                string tussenvoegsel = (string)GridView2.DataKeys[0]["Tussenvoegsel"].ToString();
                string achternaam = (string)GridView2.DataKeys[0]["Achternaam"].ToString();
                string gb = (string)GridView2.DataKeys[0]["Geboortedatum"].ToString();

                DateTime geboortedatum = new DateTime();
                geboortedatum = Convert.ToDateTime(gb);

                geboortedatum.ToShortDateString();

                ReserveerderToevoegen(voornaam, tussenvoegsel, achternaam, geboortedatum, reserveringnummer);

                InsDebiteurenFactuur(vandaag, betaalmethode, betaalstatus, factuurtype, reserveringnummer);
                int debifactuur = GetDebiNummer();

                int feestdag = GetFeestdag(reserveringnummer);
                int lengte = GetLengte(reserveringnummer);
                int seizoen = GetSeizoen(reserveringnummer);

                if (feestdag == 0)
                {
                    UpdateReservering2(seizoen, lengte, reserveringnummer);
                }
                else
                {
                    UpdateReservering(seizoen, lengte, feestdag, reserveringnummer);
                }

                double prijs = GetPrijs(reserveringnummer);

                prijs = prijs / 10;

                if (prijs < 100)
                {
                    prijs = 100;

                }
                else if (prijs >= 100)
                {

                }


                InsTransactie(vandaag, aan, prijs, reserveringnummer, debifactuur, rekeningnummer, typeID);

                Session["prijs"] = prijs.ToString();
                Session["personen"] = txbAantalPersonen.Text;
                Session["reserveringnummer"] = reserveringnummer;
                Response.Redirect("Nachtregister.aspx");
            }
            catch
            {
                lblUitkomst.Text = "Er ging iets mis.";
            }
        }

        private void InsReservering(int personen, string opmerking, DateTime plaatsing, DateTime vertrekdatum, DateTime aankomstdatum, int reserveringsStatus, int gastnummer)
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
            Int32 feestdag;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                con.Open();

                string sqlquery = "declare @Date01 as smalldatetime declare @Date02 as smalldatetime select @Date01 = min(Aankomstdatum), @Date02 = max(Vertrekdatum) from Reservering where Nummer = 49 declare @DateDiff as int select @DateDiff = (select DATEDIFF(DAY, @Date01 - 1, @Date02) as yolo)  WITH Tally(N) AS(SELECT ROW_NUMBER() OVER(ORDER BY(SELECT NULL)FROM sys.all_columns a CROSS JOIN sys.all_columns b)SELECT Feestdag.ID FROM Tally cross join Feestdag where N <= @DateDiff and DATEADD(day, N -1, @Date01) between Begindatum and Einddatum group by Feestdag.ID";
                SqlCommand cmd = new SqlCommand(sqlquery, con);
                cmd.Parameters.AddWithValue("@nummer", reserveringnummer);

                try
                {
                    feestdag = 0;
                    feestdag = (Int32)cmd.ExecuteScalar();
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

        private double GetPrijs(int reserveringnummer)
        {
            string query = "";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                query = "select Prijs from [dbo].[ReserveringHuis] where Nummer = @nummer";

                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = System.Data.CommandType.Text;

                cmd.Parameters.AddWithValue("@nummer", reserveringnummer);

                double prijs = cmd.ExecuteNonQuery();

                con.Close();

                return prijs;
            }
        }

        private void UpdateReservering2(int seizoen, int lengte, int reserveringnummer)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                con.Open();

                string sqlquery = "update Reservering set SeizoenID = @seizoen, ReserveringslengteID = @lengte where Nummer = @nummer";
                SqlCommand cmd = new SqlCommand(sqlquery, con);

                cmd.Parameters.AddWithValue("@seizoen", seizoen);
                cmd.Parameters.AddWithValue("@lengte", lengte);
                cmd.Parameters.AddWithValue("@nummer", reserveringnummer);

                cmd.ExecuteNonQuery();

                con.Close();
            }
        }

        private void GetKlantgegevens(int gastnummer)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                con.Open();

                string query = "select Voornaam, Tussenvoegsel, Achternaam, Geboortedatum from Gast where Nummer = @nummer";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@nummer", gastnummer);

                cmd.ExecuteNonQuery();

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();

                con.Close();
            }
        }

        private void ReserveerderToevoegen(string voornaam, string tussenvoegsel, string achternaam, DateTime geboortedatum, int reserveringnummer)
        {
            geboortedatum.ToShortDateString();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {

                con.Open();

                SqlCommand sqlquery = new SqlCommand("[dbo].[InsertNachtRegister]");

                sqlquery.Parameters.AddWithValue("@Voornaam", voornaam);
                sqlquery.Parameters.AddWithValue("@Tussenvoegsel", tussenvoegsel);
                sqlquery.Parameters.AddWithValue("@Achternaam", achternaam);
                sqlquery.Parameters.AddWithValue("@Geboortedatum", geboortedatum);
                sqlquery.Parameters.AddWithValue("@ReserveringNummer2", reserveringnummer);

                sqlquery.CommandType = System.Data.CommandType.StoredProcedure;
                sqlquery.Connection = con;
                sqlquery.ExecuteNonQuery();

                con.Close();

            }
        }

        protected void btnTerug_Click(object sender, EventArgs e)
        {
            Response.Redirect("GastAanmaken.aspx");
        }
    }
}