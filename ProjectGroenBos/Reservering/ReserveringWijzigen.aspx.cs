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
                Response.Redirect("ReserveringOverzicht.aspx");
            }
            else
            {

                //sessions ophalen voor het vullen van de vakjes
                reserveringsnummer = Session["reserveringsnummer"].ToString();
                //txbAankomstdatum.Text = Session["Aankomstdatum"].ToString();
                //txbAantalPersonen.Text = Session["AantalPersonen"].ToString();
                //txbVertrekdatum.Text = Session["Vertrekdatum"].ToString();


                lblReserveringsnummer.Text = Session["reserveringsnummer"].ToString();
                txbAantalPersonen.Text = (string)GridView1.DataKeys[0]["Aantal_personen"].ToString();
                txbOpmerkingen.Text = (string)GridView1.DataKeys[0]["Opmerking"].ToString();
                txbAankomstdatum.Text = (string)GridView1.DataKeys[0]["Aankomstdatum"].ToString();
                txbVertrekdatum.Text = (string)GridView1.DataKeys[0]["Vertrekdatum"].ToString();




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


                    string reserveringsnummer = lblReserveringsnummer.Text;
                    int aantalPersonen = int.Parse(txbAantalPersonen.Text);
                    string opmerkingen = txbOpmerkingen.Text;


                    DateTime aankomstdatum = new DateTime();
                    DateTime vertrekdatum = new DateTime();
                    aankomstdatum = tussen1;
                    vertrekdatum = tussen2;
                    aankomstdatum.ToShortDateString();
                    vertrekdatum.ToShortDateString();

                    con.Open();

                    //string query2 =
                    //"UPDATE Reservering set Aantal_personen = @personen, Opmerking = @opmerking,
                    //Vertrekdatum = @vertrekdatum, Aankomstdatum = @aankomstdatum where Nummer = @reserveringsnummer";



                    SqlCommand cmd2 = new SqlCommand("UPDATE Reservering set Aantal_personen = @aantalPersonen, Opmerking = @opmerkingen, Vertrekdatum = @vertrekdatum, Aankomstdatum = @aankomstdatum where Nummer = @reserveringsnummer", con);




                    cmd2.Parameters.AddWithValue("@aantalPersonen", aantalPersonen);
                    cmd2.Parameters.AddWithValue("@opmerkingen", opmerkingen);
                    cmd2.Parameters.AddWithValue("@vertrekdatum", vertrekdatum);
                    cmd2.Parameters.AddWithValue("@aankomstdatum", aankomstdatum);
                    cmd2.Parameters.AddWithValue("@reserveringsnummer", reserveringsnummer);




                    cmd2.CommandType = System.Data.CommandType.Text;



                    cmd2.ExecuteNonQuery();


                    con.Close();



                    StuurMail();

                    Session["controle6"] = 1;
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
            string ontvanger = (string)GridView1.DataKeys[0]["Email"].ToString();

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
                body = body.Replace("{achternaam}", (string)GridView1.DataKeys[0]["Achternaam"].ToString());
                body = body.Replace("{aankomstdatum}", txbAankomstdatum.Text);
                body = body.Replace("{vertrekdatum}", txbVertrekdatum.Text);
                body = body.Replace("{personen}", txbAantalPersonen.Text);
                body = body.Replace("{email}", (string)GridView1.DataKeys[0]["Email"].ToString());

                return body;
            }

        }

        protected void btnTerug_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReserveringOverzicht.aspx");
            RequiredFieldValidator1.Enabled = false;
        }

        protected void txbAantalPersonen_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txbAantalPersonen_TextChanged1(object sender, EventArgs e)
        {

        }
    }
}