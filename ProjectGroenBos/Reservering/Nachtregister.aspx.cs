using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
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
                //GridView1.DataBind();
                //GridView1.Visible = false;
            }
            else
            {
                Response.Redirect("GastSelecteren.aspx");
            }

            if (count > aantalPersonen)
            {
                btnBevestigen.Visible = true;
                btnToevoegen.Visible = false;
            }
        }

        protected void btnToevoegen_Click1(object sender, EventArgs e)
        {
            string Voornaam = TxBNaam.Text;
            string Tussenvoegsel = TxBtussenvoegsel.Text;
            string Achternaam = TxBAchternaam.Text;
            //DateTime Geboortedatum = new DateTime();
            string geboortedatum = TxBGeboortedatum.Text;
            int reserveringnummer = int.Parse(Session["reserveringnummer"].ToString());

            aantalPersonen = int.Parse(Session["personen"].ToString()) - 2;

            if (count == aantalPersonen)
            {
                btnBevestigen.Visible = true;
                btnToevoegen.Visible = false;
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

            GridView2.DataBind();
        }

        protected void btnBevestigen_Click(object sender, EventArgs e)
        {
            reserveringnummer = int.Parse(lblReserveringnummer.Text);

            Session["controle4"] = 1;
            Response.Redirect("home.aspx");
        }
    }
}