using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class KlantWijzigen : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!Page.IsPostBack)
            {

                getData(this.User.Identity.Name);
            }

            if (Session["gastnummer"] == null)
            {
                Response.Redirect("Gastoverzicht.aspx");
               
            }
            else
            {
                int gastnummer = int.Parse(Session["gastnummer"].ToString());

                lblGastnummer.Text = gastnummer.ToString();
                
                GridView1.DataBind();

                //txbVoornaam.Text = (string)GridView1.DataKeys[0]["Voornaam"].ToString();

                //txbTussenvoegsel.Text = (string)GridView1.DataKeys[0]["Tussenvoegsel"].ToString();
                //txbAchternaam.Text = (string)GridView1.DataKeys[0]["Achternaam"].ToString();
                //txbGeboortedatum.Text = (string)GridView1.DataKeys[0]["Achternaam"].ToString();
                //txbIBAN.Text = (string)GridView1.DataKeys[0]["IBAN"].ToString();


                //txbEmail.Text = (string)GridView1.DataKeys[0]["Email"].ToString();
                //txbTelefoonnummer.Text = (string)GridView1.DataKeys[0]["Telefoonnummer"].ToString();

                //txbStraatnaam.Text = (string)GridView1.DataKeys[0]["Straatnaam"].ToString();
                //txbHuisnummer.Text = (string)GridView1.DataKeys[0]["Huisnummer"].ToString();
                //txbPostcode.Text = (string)GridView1.DataKeys[0]["Postcode"].ToString();
                //txbWoonplaats.Text = (string)GridView1.DataKeys[0]["Woonplaats"].ToString();


                GridView1.Visible = false;
                Button1_Click(Button1, null);
            }
            
        }

        protected void btnWijzigen_Click(object sender, EventArgs e)
        {
            string voornaam = txbVoornaam.Text;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                con.Open();

                string query = "update Gast set Voornaam = @voornaam, Tussenvoegsel = @tussenvoegsel, Achternaam = @achternaam, Telefoonnummer = @telefoonnummer, Email = @email, IBAN = @iban where Nummer = @gastnummer";
                string query2 = "update Adres set Straatnaam =  @straat, Huisnummer = @huisnummer, Postcode = @postcode, Woonplaats = @woonplaats where GastNummer = @gastnummer";

                SqlCommand cmd1 = new SqlCommand(query, con);
                SqlCommand cmd2 = new SqlCommand(query2, con);

                cmd1.Parameters.AddWithValue("@voornaam", txbVoornaam.Text);
                cmd1.Parameters.AddWithValue("@tussenvoegsel", txbTussenvoegsel.Text);
                cmd1.Parameters.AddWithValue("@achternaam", txbAchternaam.Text);
                cmd1.Parameters.AddWithValue("@telefoonnummer", txbTelefoonnummer.Text);
                cmd1.Parameters.AddWithValue("@email", txbEmail.Text);
                cmd1.Parameters.AddWithValue("@iban", txbIBAN.Text);
                cmd1.Parameters.AddWithValue("@gastnummer", lblGastnummer.Text);

                cmd2.Parameters.AddWithValue("@straat", txbStraatnaam.Text);
                cmd2.Parameters.AddWithValue("@huisnummer", txbHuisnummer.Text);
                cmd2.Parameters.AddWithValue("@postcode", txbPostcode.Text);
             //   cmd2.Parameters.AddWithValue("@land", land);
                cmd2.Parameters.AddWithValue("@woonplaats", txbWoonplaats.Text);
                cmd2.Parameters.AddWithValue("@gastnummer", lblGastnummer.Text);

                cmd1.CommandType = System.Data.CommandType.Text;
                cmd2.CommandType = System.Data.CommandType.Text;



                cmd1.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();

                con.Close();

            }

            Response.Redirect("Gastoverzicht.aspx");
        }
        private void getData(string user)
        {
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;User ID=BIM022020;Password=BiM@IH2020");
            connection.Open();
            SqlCommand sqlCmd = new SqlCommand("SELECT * from Gast WHERE Nummer = @gastnummer", connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);


            sqlCmd.Parameters.AddWithValue("@gastnummer", lblGastnummer.Text);
            sqlDa.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                txbVoornaam.Text = dt.Rows[0]["Voornaam"].ToString(); //Where ColumnName is the Field from the DB that you want to display
                txbTussenvoegsel.Text = dt.Rows[0]["Tussenvoegsel"].ToString();
                txbAchternaam.Text = dt.Rows[0]["Achternaam"].ToString();
                txbGeboortedatum.Text = dt.Rows[0]["Geboortedatum"].ToString();
                txbIBAN.Text = dt.Rows[0]["IBAN"].ToString();
            }
            connection.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            txbVoornaam.Text = Session["voornaam"].ToString();
            txbTussenvoegsel.Text = Session["tussenvoegsel"].ToString();
            txbAchternaam.Text = Session["achternaam"].ToString();
            txbTelefoonnummer.Text = Session["telefoonnummer"].ToString();
            txbEmail.Text = Session["email"].ToString();
            txbGeboortedatum.Text = Session["geboortedatum"].ToString();

        }
    }

}


