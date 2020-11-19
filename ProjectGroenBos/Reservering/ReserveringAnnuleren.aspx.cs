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
    public partial class ReserveringAnnulerenSherm2 : System.Web.UI.Page
    {
        string query1;
        string reserveringsnummer;

        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["reserveringsnummer"] == null)
            {
                Response.Redirect("ReserveringOverzicht.aspx");
            }
            else
            {
                GridView1.Visible = false;
                GridView2.Visible = false;
                //sessions ophalen om de gegevens weer te geven in labels
                reserveringsnummer = Session["reserveringsnummer"].ToString();

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
                {

                    query1 = "select res.Nummer, res.Aankomstdatum, res.Vertrekdatum, res.Aantal_personen, res.GastNummer, res.Opmerking, gst.Voornaam, gst.Tussenvoegsel, gst.Achternaam, gst.Email, gst.Telefoonnummer, adr.Straatnaam, adr.Huisnummer, adr.Postcode, adr.Land from Reservering res inner join Gast gst on res.GastNummer = gst.Nummer inner join Adres adr on adr.GastNummer = gst.Nummer where res.Nummer = @nummer";

                    DataSet ds = Data();

                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }

                lblGastnummer.Text = (string)GridView1.DataKeys[0]["GastNummer"].ToString();
                lblVoornaam.Text = (string)GridView1.DataKeys[0]["Voornaam"].ToString();
                lblTussenvoegsel.Text = (string)GridView1.DataKeys[0]["Tussenvoegsel"].ToString();
                lblAchternaam.Text = (string)GridView1.DataKeys[0]["Achternaam"].ToString();
                lblEmail.Text = (string)GridView1.DataKeys[0]["Email"].ToString();
                lblTelefoonnummer.Text = (string)GridView1.DataKeys[0]["Telefoonnummer"].ToString();
                lblReserveringsnummer.Text = (string)GridView1.DataKeys[0]["Nummer"].ToString();
                lblAantalPersonen.Text = (string)GridView1.DataKeys[0]["Aantal_personen"].ToString();
                lblOpmerkingen.Text = (string)GridView1.DataKeys[0]["Opmerking"].ToString();
                lblAankomstdatum.Text = (string)GridView1.DataKeys[0]["Aankomstdatum"].ToString();
                lblVertrekdatum.Text = (string)GridView1.DataKeys[0]["Vertrekdatum"].ToString();
                lblStraat.Text = (string)GridView1.DataKeys[0]["Straatnaam"].ToString();
                lblHuisnummer.Text = (string)GridView1.DataKeys[0]["Huisnummer"].ToString();
                lblPostcode.Text = (string)GridView1.DataKeys[0]["Postcode"].ToString();
                lblLand.Text = (string)GridView1.DataKeys[0]["Land"].ToString();

                int tussen = GetDagen(int.Parse(reserveringsnummer));
                for (int i = 0; i < (GridView2.Rows.Count); i++)
                {
                    double verschil = (double)GridView2.DataKeys[i]["Verschil"];
                    double totaal = (double)GridView2.DataKeys[i]["Totaalprijs"];
                    double aanbetaling = (double)GridView2.DataKeys[i]["Aanbetaling"];
                }

                if (tussen < 42)
                {
                    lblTotaalText.Text = "Te betalen:";
                    lblStorten.Text = (string)GridView2.DataKeys[0]["Verschil"].ToString();
                    lblPrijs.Text = (string)GridView2.DataKeys[0]["Totaalprijs"].ToString();
                }
                else if (tussen >= 42)
                {
                    lblTotaalText.Text = "U verkrijgt:";
                    lblStorten.Text = (string)GridView2.DataKeys[0]["Aanbetaling"].ToString();
                    lblPrijs.Text = (string)GridView2.DataKeys[0]["Totaalprijs"].ToString();
                }
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
                    string reserveringsnummer = lblReserveringsnummer.Text;
                    con.Open();
                    string query = "update Reservering set ReserveringsstatusID = 5 where Nummer = @reserveringsnummer";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@reserveringsnummer", reserveringsnummer);
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.ExecuteNonQuery();
                    con.Close();
                    StuurMail();
                    Response.Redirect("ReserveringOverzicht.aspx");
                }
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Er ging iets mis')", true);
            }
        }

        private void StuurMail()
        {
            string ontvanger = lblEmail.Text;

            //Mail opzetten
            MailMessage mailMessage = new MailMessage("groenbosreservations@gmail.com", ontvanger);
            mailMessage.Subject = "Uw reservering is geannuleerd!";
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
                using (StreamReader reader = new StreamReader(Server.MapPath("MailHuisReserveringGeannuleerd.html")))
                {
                    body = reader.ReadToEnd();
                }

                //parameters html pagina
                body = body.Replace("{reserveringsnummer}", lblReserveringsnummer.Text);
                body = body.Replace("{achternaam}", lblAchternaam.Text);
                body = body.Replace("{aankomstdatum}", lblAankomstdatum.Text);
                body = body.Replace("{vertrekdatum}", lblVertrekdatum.Text);
                body = body.Replace("{personen}", lblAantalPersonen.Text);
                body = body.Replace("{email}", lblEmail.Text);

                return body;
            }

        }

        private int GetDagen(int reserveringnummer)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                string query = "select datediff(day, getdate(), Aankomstdatum) as Dagen from Reservering where Nummer = @nummer";

                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@nummer", reserveringnummer);

                var iets = cmd.ExecuteScalar();
                int getal = 0;

                if (iets != null)
                {
                    getal = int.Parse(iets.ToString());
                }



                con.Close();

                return getal;

            }
        }



    }
}
