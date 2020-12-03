using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class Nachtregister : System.Web.UI.Page
    {
        string personen;
        static int count = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["prijs"] != null)
            //{
            //    personen = Session["Personen"].ToString();
            //    int aantal = int.Parse(personen);

            //    btnBevestigen.Enabled = false;
            //    lblOutput.Text = "Geregistreerde bezoekers: ";
            //    btnToevoegen.Enabled = true;
            //}
            //else
            //{
            //    Response.Redirect("GastSelecteren");
            //}
        }

        protected void btnToevoegen_Click1(object sender, EventArgs e)
        {


            string Voornaam = TxBNaam.Text;
            string Tussenvoegsel = TxBtussenvoegsel.Text;
            string Achternaam = TxBAchternaam.Text;
            //DateTime Geboortedatum = new DateTime();
            string geboortedatum = TxBGeboortedatum.Text;
            int reserveringnummer = int.Parse(Session["reserveringnummer"].ToString());

            int aantalPersonen = int.Parse(Session["Personen"].ToString()) - 2;

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
                    sqlquery.Parameters.AddWithValue("@ReserveringNummer2", reserveringnummer);

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

        protected void btnBevestigen_Click(object sender, EventArgs e)
        {

        }
    }
}