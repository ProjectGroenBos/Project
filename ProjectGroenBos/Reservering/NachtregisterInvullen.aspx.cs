using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class Nachtregister : System.Web.UI.Page
    {
        string personen;
        static int count = 0;
        int reserveringnummer;
        int aantalPersonen = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["prijs"] != null)
            {
                personen = Session["Personen"].ToString();
                int aantal = int.Parse(personen);
                lblReserveringnummer.Text = Session["reserveringnummer"].ToString();
                reserveringnummer = int.Parse(lblReserveringnummer.Text);

                btnBevestigen.Visible = false;
                lblOutput.Text = "Geregistreerde bezoekers:";
                btnToevoegen.Visible = true;
                lblControle.Text = DateTime.Today.ToShortDateString();


            }
            else
            {
                Response.Redirect("GastSelecteren.aspx");
            }


        }

        protected void btnToevoegen_Click1(object sender, EventArgs e)
        {
            lblOutput.Text = "";
            string Voornaam = TxBNaam.Text;
            string Tussenvoegsel = TxBtussenvoegsel.Text;
            string Achternaam = TxBAchternaam.Text;

            DateTime geboortedatum = DateTime.Parse(TxBGeboortedatum.Text);
            geboortedatum.ToShortDateString();

            DateTime control = new DateTime();
            control = DateTime.Today;

            bool check = CheckDatum(geboortedatum, control);

            if (check == true)
            {
                CustomValidator1.Enabled = false;
                CustomValidator1.Visible = false;
                int reserveringnummer = int.Parse(Session["reserveringnummer"].ToString());

                aantalPersonen = int.Parse(Session["personen"].ToString()) - 1;

                try
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
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
                }

                catch
                {
                    lblOutput.Text = "Er ging iets mis, neem contact met ons op.";
                }

                GridView1.DataBind();
                count++;
                if (count == aantalPersonen)
                {
                    btnBevestigen.Visible = true;
                    btnToevoegen.Visible = false;
                }
                lblOutput.Text = "Persoon is toegevoegd.";
            }
            else
            {
                CustomValidator1.Enabled = true;
                CustomValidator1.Visible = true;
                lblOutput.Text = "Persoon is niet toegevoegd, omdat je niet een datum in de toekomst kan weten.";
            }

        }

        protected bool CheckDatum(DateTime geboortedatum, DateTime control)
        {
            if (geboortedatum <= control)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

    }
}