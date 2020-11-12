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
    public partial class test : System.Web.UI.Page
    {
        string reserveringsnummer;
        string query1;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["reserveringsnummer"] == null)
            {
                Response.Redirect("ReserveringenWijzigenOverzicht.aspx");
            }
            else
            {
                GridView1.Visible = false;
                //sessions ophalen voor het vullen van de vakjes
                reserveringsnummer = Session["reserveringsnummer"].ToString();

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
                {

                    query1 = "select res.Nummer, res.Aankomstdatum, res.Vertrekdatum, res.Aantal_personen, res.GastNummer, res.Opmerking, gst.Voornaam, gst.Tussenvoegsel, gst.Achternaam, gst.Email, gst.Telefoonnummer, adr.Straatnaam, adr.Huisnummer, adr.Postcode, adr.Land from Reservering res inner join Gast gst on res.Nummer = gst.Nummer inner join Adres adr on adr.GastNummer = gst.Nummer where res.Nummer = @nummer";

                    DataSet ds = Data();

                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }

                lblGastnummer.Text = (string)GridView1.DataKeys[0]["GastNummer"].ToString();
                txbVoornaam.Text = (string)GridView1.DataKeys[0]["Voornaam"].ToString();
                txbTussenvoegsel.Text = (string)GridView1.DataKeys[0]["Tussenvoegsel"].ToString();
                txbAchternaam.Text = (string)GridView1.DataKeys[0]["Achternaam"].ToString();
                txbEmail.Text = (string)GridView1.DataKeys[0]["Email"].ToString();
                txbTelefoonnummer.Text = (string)GridView1.DataKeys[0]["Telefoonnummer"].ToString();
                lblReserveringsnummer.Text = (string)GridView1.DataKeys[0]["Nummer"].ToString();
                txbAantalPersonen.Text = (string)GridView1.DataKeys[0]["Aantal_personen"].ToString();
                txbOpmerkingen.Text = (string)GridView1.DataKeys[0]["Opmerking"].ToString();
                txbAankomstdatum.Text = (string)GridView1.DataKeys[0]["Aankomstdatum"].ToString();
                txbVertrekdatum.Text = (string)GridView1.DataKeys[0]["Vertrekdatum"].ToString();
                txtStraat.Text = (string)GridView1.DataKeys[0]["Straatnaam"].ToString();
                txbHuisnummer.Text = (string)GridView1.DataKeys[0]["Huisnummer"].ToString();
                txbPostcode.Text = (string)GridView1.DataKeys[0]["Postcode"].ToString();
                txbLand.Text = (string)GridView1.DataKeys[0]["Land"].ToString();

                lblAankomstdatum.Text = (string)GridView1.DataKeys[0]["Aankomstdatum"].ToString();
                lblVertrekdatum.Text = (string)GridView1.DataKeys[0]["Vertrekdatum"].ToString();
            }
        }

        protected DataSet Data()
        {
            //dataset om de gridview te vullen
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                con.Open();
                SqlDataAdapter query = new SqlDataAdapter(query1, con);

                //parameters
                query.SelectCommand.Parameters.AddWithValue("@nummer", reserveringsnummer);

                DataSet set = new DataSet();
                query.Fill(set);

                var tussen1 = "";
                var tussen2 = "";
                

                //clonen van tabel
                DataSet trueset = set.Clone();

                //change kolom datatype
                trueset.Tables[0].Columns[1].DataType = typeof(string);
                trueset.Tables[0].Columns[2].DataType = typeof(string);
                

                //data importen
                foreach (DataRow row in set.Tables[0].Rows)
                {
                    trueset.Tables[0].ImportRow(row);
                }

                //elke rij veranderen
                foreach (DataRow row in trueset.Tables[0].Rows)
                {
                    //pak var
                    DateTime dt1 = DateTime.Parse(row[1].ToString());
                    DateTime dt2 = DateTime.Parse(row[2].ToString());
                    
                    //pas aan
                    tussen1 = dt1.ToShortDateString();
                    tussen2 = dt2.ToShortDateString();
                    
                    //adjust
                    row[1] = tussen1;
                    row[2] = tussen2;
                    
                }

                con.Close();

                return trueset;
            }
        }

        protected void btnWijzigen_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
                {
                    DateTime tussen1 = DateTime.Parse(txbAankomstdatum.Text);
                    DateTime tussen2 = DateTime.Parse(txbVertrekdatum.Text);
                    string gast = lblGastnummer.Text;
                    string voornaam = txbVoornaam.Text;
                    string tussenvoegsel = txbTussenvoegsel.Text;
                    string achternaam = txbAchternaam.Text;
                    string email = txbEmail.Text;
                    string telefoonnummer = txbTelefoonnummer.Text;

                    string reserveringsnummer = lblReserveringsnummer.Text;
                    int aantalPersonen = int.Parse(txbAantalPersonen.Text);
                    string opmerkingen = txbOpmerkingen.Text;

                    string straatnaam = txtStraat.Text;
                    string huisnummer = txbHuisnummer.Text;
                    string postcode = txbPostcode.Text;
                    string land = txbLand.Text;

                    DateTime aankomstdatum = new DateTime();
                    DateTime vertrekdatum = new DateTime();
                    aankomstdatum = tussen1;
                    vertrekdatum = tussen2;
                    aankomstdatum.ToShortDateString();
                    vertrekdatum.ToShortDateString();

                    con.Open();
                    string query1 = "update Gast set Voornaam = @voornaam, Tussenvoegsel = @tussenvoegsel, Achternaam = @achternaam, Telefoonnummer = @telefoonnummer, Email = @email where Nummer = @gastnummer";
                    string query2 = "update Reservering set Aantal_personen = @personen, Opmerking = @opmerking, Vertrekdatum = @vertrekdatum, Aankomstdatum = @aankomstdatum where Nummer = @reserveringsnummer";
                    string query3 = "Update Adres set Straatnaam = @straat, Huisnummer = @huisnummer, Postcode = @postcode, Land = @land where GastNummer = @gastnummer";

                    SqlCommand cmd1 = new SqlCommand(query1, con);
                    SqlCommand cmd2 = new SqlCommand(query2, con);
                    SqlCommand cmd3 = new SqlCommand(query3, con);

                    cmd1.Parameters.AddWithValue("@voornaam", voornaam);
                    cmd1.Parameters.AddWithValue("@tussenvoegsel", tussenvoegsel);
                    cmd1.Parameters.AddWithValue("@achternaam", achternaam);
                    cmd1.Parameters.AddWithValue("@telefoonnummer", telefoonnummer);
                    cmd1.Parameters.AddWithValue("@email", email);
                    cmd1.Parameters.AddWithValue("@gastnummer", gast);

                    cmd2.Parameters.AddWithValue("@personen", aantalPersonen);
                    cmd2.Parameters.AddWithValue("@opmerking", opmerkingen);
                    cmd2.Parameters.AddWithValue("@vertrekdatum", vertrekdatum);
                    cmd2.Parameters.AddWithValue("@aankomstdatum", aankomstdatum);
                    cmd2.Parameters.AddWithValue("@reserveringsnummer", reserveringsnummer);

                    cmd3.Parameters.AddWithValue("@straat", straatnaam);
                    cmd3.Parameters.AddWithValue("@huisnummer", huisnummer);
                    cmd3.Parameters.AddWithValue("@postcode", postcode);
                    cmd3.Parameters.AddWithValue("@land", land);
                    cmd3.Parameters.AddWithValue("@gastnummer", gast);

                    cmd1.CommandType = System.Data.CommandType.Text;
                    cmd2.CommandType = System.Data.CommandType.Text;
                    cmd3.CommandType = System.Data.CommandType.Text;

                    int veranderdeRijen1 = cmd1.ExecuteNonQuery();
                    int veranderdeRijen2 = cmd2.ExecuteNonQuery();
                    int veranderdeRijen3 = cmd3.ExecuteNonQuery();

                    con.Close();

                    int totaal = veranderdeRijen1 + veranderdeRijen2 + veranderdeRijen3;
                    StuurMail();

                    Response.Redirect("ReserveringenOverzicht.aspx");
                }
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Er ging iets mis')", true);
            }
        }

        private void StuurMail()
        {
            string ontvanger = txbEmail.Text;

            //Mail opzetten
            MailMessage mailMessage = new MailMessage("groenbosreservations@gmail.com", ontvanger);
            mailMessage.Subject = "Uw reservering is gewijzigd!";
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
                using (StreamReader reader = new StreamReader(Server.MapPath("MailReserveringGewijzigd.html")))
                {
                    body = reader.ReadToEnd();
                }

                //parameters html pagina

                body = body.Replace("{reserveringsnummer}", lblReserveringsnummer.Text);
                body = body.Replace("{achternaam}", txbAchternaam.Text);
                body = body.Replace("{aankomstdatum}", txbAankomstdatum.Text);
                body = body.Replace("{vertrekdatum}", txbVertrekdatum.Text);
                body = body.Replace("{personen}", txbAantalPersonen.Text);
                body = body.Replace("{email}", txbEmail.Text);

                return body;
            }

        }

    }
}