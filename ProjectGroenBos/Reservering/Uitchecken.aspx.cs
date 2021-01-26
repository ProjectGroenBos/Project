using System;
using System.Collections.Generic;
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
    }
}