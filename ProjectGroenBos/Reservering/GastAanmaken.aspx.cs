using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class GastAanmaken : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["controle"] == null)
            {
                Response.Redirect("GastSelecteren.aspx");
            }
            else
            {
                txbAchternaam.Text = Session["achternaam"].ToString();
                txbTelefoonnummer.Text = Session["telefoonnummer"].ToString();
                txbEmail.Text = Session["email"].ToString();
            }
        }

        protected void btnAanmaken_Click(object sender, EventArgs e)
        {

            string voornaam = txbVoornaam.Text;
            string tussenvoegsel = txbTussenvoegsel.Text;
            string achternaam = txbAchternaam.Text;
            string telefoonnummer = txbTelefoonnummer.Text;
            string email = txbEmail.Text;
            string woonplaats = txbWoonplaats.Text;
            string straat = txbStraatnaam.Text;
            string huisnummer = txbHuisnummer.Text;
            string postcode = txbPostcode.Text;

            DateTime geboortedatum = new DateTime();

            geboortedatum = DateTime.Parse(txbGeboortedatum.Text);
            geboortedatum.ToShortDateString();

            string land = DropDownList2.Text;

            Session["achternaam"] = achternaam;
            Session["telefoonnummer"] = telefoonnummer;
            Session["email"] = email;

            if (land == "")
            {
                CustomValidator1.IsValid = false;
            }

            if (CheckDatum() == true)
            {
                InsGast(voornaam, tussenvoegsel, achternaam, email, telefoonnummer, geboortedatum);
                int gastnummer = GetNummer(achternaam);

                if(gastnummer == 0)
                {
                    lblUitkomst.Text = "Er ging iets mis. Neem zo snel mogelijk contact met ons op.";
                }
                else
                {
                    InsAdres(straat, huisnummer, postcode, land, woonplaats, gastnummer);
                }
            }
        }

        private bool CheckDatum()
        {
            try
            {

                DateTime control = new DateTime();
                DateTime geboortedatum = new DateTime();

                geboortedatum = DateTime.Parse(txbGeboortedatum.Text);
                geboortedatum.ToShortDateString();

                control = DateTime.Today;
                control.AddYears(-18);
                control.ToShortDateString();
                DateTime control2 = control.AddYears(-18);

                if (control2 >= geboortedatum)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
        }

        private void InsGast(string voornaam, string tussenvoegsel, string achternaam, string email, string telefoonnummer, DateTime geboortedatum)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                try
                {
                    string query = "[dbo].[InsertGast]";

                    con.Open();

                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@Voornaam", voornaam);
                    cmd.Parameters.AddWithValue("@Tussenvoegsel", tussenvoegsel);
                    cmd.Parameters.AddWithValue("@Achternaam", achternaam);
                    cmd.Parameters.AddWithValue("@Telefoonnummer", telefoonnummer);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Geboortedatum", geboortedatum);

                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
                catch
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Er ging iets mis, neem contact met ons op.')", true);
                }
            }

        }

        private void InsAdres(string straat, string huisnummer, string postcode, string land, string woonplaats, int gastnummer)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                try
                {
                    string query = "[dbo].[InsertAdres]";

                    con.Open();

                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@Straatnaam", straat);
                    cmd.Parameters.AddWithValue("@Huisnummer", huisnummer);
                    cmd.Parameters.AddWithValue("@Postcode", postcode);
                    cmd.Parameters.AddWithValue("@Land", land);
                    cmd.Parameters.AddWithValue("@Woonplaats", woonplaats);
                    cmd.Parameters.AddWithValue("@GastNummer", gastnummer);

                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
                catch
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Er ging iets mis, neem contact met ons op.')", true);
                }
            }
        }

        private int GetNummer(string achternaam)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                try
                {
                    string query = "SELECT max(Nummer) from [dbo].[Gast] where Achternaam = @achternaam";

                    con.Open();

                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@achternaam", achternaam);

                    cmd.CommandType = System.Data.CommandType.Text;

                    int i = cmd.ExecuteNonQuery();

                    return i;
                }
                catch 
                {
                    int i = 0;

                    return i;
                }
            }
        }

        protected void btnTerug_Click(object sender, EventArgs e)
        {
            Response.Redirect("GastSelecteren.aspx");
        }
    }
}