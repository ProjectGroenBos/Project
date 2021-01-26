using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class Uitchecken : System.Web.UI.Page
    {
        //int reserveringsnummer;
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;
        Button btnbetalen;
        Button btninchecken;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Repeater();
            }
            
        }

        protected void btnZoek_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            GridView2.Visible = true;
            GridView2.DataBind();

            if (GridView2.Rows.Count == 0)
            {
                Label5.Text = "Geen gasten die moeten inchecken gevonden. Zijn achternaam en geboortedatum correct ingevuld?";
            }
            else
            {
                Label5.Text = "";
            }
        }

        public void Repeater()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(@"SELECT DISTINCT 
             dbo.Reservering.Nummer, dbo.Gast.Nummer AS Gastnummer, ISNULL(dbo.Gast.Voornaam, ' ') + ' ' + ISNULL(dbo.Gast.Tussenvoegsel, ' ') + ' ' + ISNULL(dbo.Gast.Achternaam, ' ') AS Naam, dbo.Reservering.Aankomstdatum, dbo.Reservering.Vertrekdatum, dbo.Reservering.Aantal_personen, dbo.Reservering_Bungalow.ReserveringNummer, 
             dbo.Adres.Straatnaam + ' ' + dbo.Adres.Huisnummer AS Adres, dbo.Adres.Postcode, dbo.Adres.Land, dbo.Gast.Telefoonnummer, dbo.Gast.Email, ISNULL(ROUND(dbo.RekeningTotaalbedrag.Totaalbedrag, 2), 0) AS Totaalbedrag, dbo.Factuurstatus.Omschrijving, dbo.Debiteurenfactuur.Nummer AS DebiteurenFactuurNummer
FROM     dbo.Reservering left JOIN
             dbo.Gast ON dbo.Reservering.GastNummer = dbo.Gast.Nummer left JOIN
             dbo.Reservering_Bungalow ON dbo.Reservering.Nummer = dbo.Reservering_Bungalow.ReserveringNummer left JOIN
             dbo.Adres ON dbo.Reservering.GastNummer = dbo.Adres.GastNummer left JOIN
             dbo.Debiteurenfactuur ON dbo.Debiteurenfactuur.ReserveringNummer = dbo.Reservering.Nummer left JOIN
             dbo.Factuurstatus ON dbo.Debiteurenfactuur.BetaalstatusID = dbo.Factuurstatus.ID left JOIN
             dbo.RekeningTotaalbedrag ON dbo.Reservering.Nummer = dbo.RekeningTotaalbedrag.ReserveringNummer
WHERE   (dbo.Debiteurenfactuur.FactuurtypeID = 1)", con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                rpModals.DataSource = ds;
                rpModals.DataBind();

                con.Close();
            }
        }
        


        private void UpdateReservering(string nummer, int status)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                con.Open();

                string sqlquery = "update Reservering set ReserveringsstatusID = @status where Nummer = @nummer";
                SqlCommand cmd = new SqlCommand(sqlquery, con);

                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@nummer", nummer);

                cmd.ExecuteNonQuery();

                con.Close();
            }
        }

        protected void btnUitchecken_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            int gridviewnr = int.Parse(btn.CommandName);
            HiddenField vijf = (HiddenField)rpModals.Items[gridviewnr].FindControl("Nummer");

            string nummer = vijf.Value;
            int status = 10;

            UpdateReservering(nummer, status);
            //Repeater();
            Response.Redirect("Uitchecken.aspx");
        }

        protected void btnBetalen_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            int gridviewnr = int.Parse(btn.CommandName);
            HiddenField een = (HiddenField)rpModals.Items[gridviewnr].FindControl("Totaalbedrag");
            HiddenField vijf = (HiddenField)rpModals.Items[gridviewnr].FindControl("Nummer");
            HiddenField zes = (HiddenField)rpModals.Items[gridviewnr].FindControl("DebiteurenFactuurNummer");
            btnbetalen = (Button)rpModals.Items[gridviewnr].FindControl("btnBetalen");
            btninchecken = (Button)rpModals.Items[gridviewnr].FindControl("btnUitchecken");


            string acht = vijf.Value;
            string negen = zes.Value;
            int resNummer = int.Parse(acht);
            int fnummer = int.Parse(negen);

            string twee = een.Value;
            double nuPayen = double.Parse(twee);

            //alles voor de transactie
            string aan = "Groenbos";
            string rekeningnummer = "NL32 RABO 0220.96.13.200";
            int typeID = 2;
            DateTime vandaag = DateTime.Today;

            InsTransactie(vandaag, aan, nuPayen, resNummer, fnummer, rekeningnummer, typeID);

            btnbetalen.Visible = false;
            btninchecken.Visible = true;

        }

        private void btnSelecteer(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            int gridviewnr = int.Parse(btn.CommandName);
            HiddenField een = (HiddenField)rpModals.Items[gridviewnr].FindControl("Totaalbedrag");
            btnbetalen = (Button)rpModals.Items[gridviewnr].FindControl("btnBetalen");
            btninchecken = (Button)rpModals.Items[gridviewnr].FindControl("btnInchecken");

            string twee = een.Value;
            double totaal = double.Parse(twee);

            if (totaal == 0)
            {
                btnbetalen.Visible = false;
                btninchecken.Visible = true;
            }
            else
            {
                btnbetalen.Visible = true;
                btninchecken.Visible = false;
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
    }
}