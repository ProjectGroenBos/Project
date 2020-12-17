using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;
using System.Data;

namespace ProjectGroenBos.Reservering
{
    public partial class KlantWijzigen : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["gastnummer"] == null)
            {
                Response.Redirect("KlantOverzicht.aspx");
            }
            else
            {
                int gastnummer = int.Parse(Session["gastnummer"].ToString());

                lblGastnummer.Text = gastnummer.ToString();

                GridView1.DataBind();

                txbVoornaam.Text = (string)GridView1.DataKeys[0]["Voornaam"].ToString();

                txbTussenvoegsel.Text = (string)GridView1.DataKeys[0]["Tussenvoegsel"].ToString();
                txbAchternaam.Text = (string)GridView1.DataKeys[0]["Achternaam"].ToString();
                txbIBAN.Text = (string)GridView1.DataKeys[0]["IBAN"].ToString();


                txbEmail.Text = (string)GridView1.DataKeys[0]["Email"].ToString();
                txbTelefoonnummer.Text = (string)GridView1.DataKeys[0]["Telefoonnummer"].ToString();

                txbStraatnaam.Text = (string)GridView1.DataKeys[0]["Straatnaam"].ToString();
                txbHuisnummer.Text = (string)GridView1.DataKeys[0]["Huisnummer"].ToString();
                txbPostcode.Text = (string)GridView1.DataKeys[0]["Postcode"].ToString();
                txbWoonplaats.Text = (string)GridView1.DataKeys[0]["Woonplaats"].ToString();
                txbLand.Text = (string)GridView1.DataKeys[0]["Land"].ToString();


                GridView1.Visible = false;
            }
        }

        protected void btnWijzigen_Click(object sender, EventArgs e)
        {

            string gast = lblGastnummer.Text;
            string voornaam = txbVoornaam.Text;
            string tussenvoegsel = txbTussenvoegsel.Text;
            string achternaam = txbAchternaam.Text;
            string IBAN = txbIBAN.Text;

            string email = txbEmail.Text;
            string telefoonnummer = txbTelefoonnummer.Text;

            string straatnaam = txbStraatnaam.Text;
            string huisnummer = txbHuisnummer.Text;
            string postcode = txbPostcode.Text;
            string woonplaats = txbWoonplaats.Text;
            string land = txbLand.Text;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                con.Open();

                string query = "update Gast set Voornaam = @voornaam, Tussenvoegsel = @tussenvoegsel, Achternaam = @achternaam, Telefoonnummer = @telefoonnummer, Email = @email, IBAN = @iban where Nummer = @gastnummer";
                string query2 = "update Adres set Straatnaam =  @straat, Huisnummer = @huisnummer, Postcode = @postcode, Land = @land, Woonplaats = @woonplaats where GastNummer = @gastnummer";

                SqlCommand cmd1 = new SqlCommand(query, con);
                SqlCommand cmd2 = new SqlCommand(query2, con);

                cmd1.Parameters.AddWithValue("@voornaam", voornaam);
                cmd1.Parameters.AddWithValue("@tussenvoegsel", tussenvoegsel);
                cmd1.Parameters.AddWithValue("@achternaam", achternaam);
                cmd1.Parameters.AddWithValue("@telefoonnummer", telefoonnummer);
                cmd1.Parameters.AddWithValue("@email", email);
                cmd1.Parameters.AddWithValue("@iban", IBAN);
                cmd1.Parameters.AddWithValue("@gastnummer", gast);

                cmd2.Parameters.AddWithValue("@straat", straatnaam);
                cmd2.Parameters.AddWithValue("@huisnummer", huisnummer);
                cmd2.Parameters.AddWithValue("@postcode", postcode);
                cmd2.Parameters.AddWithValue("@land", land);
                cmd2.Parameters.AddWithValue("@woonplaats", woonplaats);
                cmd2.Parameters.AddWithValue("@gastnummer", gast);

                cmd1.CommandType = CommandType.Text;
                cmd2.CommandType = CommandType.Text;



                cmd1.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();

                con.Close();

            }

            Response.Redirect("Klantoverzicht.aspx");

        }


    }

}


