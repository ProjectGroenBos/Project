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
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["gastnummer"] == null)
            {
                Response.Redirect("ReserveringAnnuleren.aspx");
            }
            else
            {
                lblGastnummer.Text = Session["gastnummer"].ToString();
                lblVoornaam.Text = Session["voornaam"].ToString();
                lblTussenvoegsel.Text = Session["tussenvoegsel"].ToString();
                lblAchternaam.Text = Session["achternaam"].ToString();
                lblEmail.Text = Session["e-mail"].ToString();
                lblTelefoonnummer.Text = Session["telefoonnummer"].ToString();
                lblReserveringsnummer.Text = Session["reserveringsnummer"].ToString();
                lblAantalPersonen.Text = Session["aantal_personen"].ToString();
                lblOpmerkingen.Text = Session["opmerkingen"].ToString();

                this.lblAankomstdatum.Text = Session["aankomstdatum"].ToString();
                this.lblVertrekdatum.Text = Session["vertrekdatum"].ToString();
                //txbAankomstdatum.Text = Session["aankomstdatum"].ToString();
                //txbVertrekdatum.Text = Session["vertrekdatum"].ToString();
                if (lblTussenvoegsel.Text == "&nbsp;")
                {
                    lblTussenvoegsel.Text = "";
                }
                if (lblOpmerkingen.Text == "&nbsp;")
                {
                    lblOpmerkingen.Text = "";
                }
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
                    SqlCommand cmd = new SqlCommand (query, con);
                    cmd.Parameters.AddWithValue("@reserveringsnummer", reserveringsnummer);
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.ExecuteNonQuery();
                    con.Close();
                    StuurMail();
                    Response.Redirect("ReserveringAnnuleren.aspx");
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
                using (StreamReader reader = new StreamReader(Server.MapPath("MailReserveringGewijzigd.html")))
                {
                    body = reader.ReadToEnd();
                }

                //parameters html pagina

                body = body.Replace("{achternaam}", lblAchternaam.Text);
                body = body.Replace("{aankomstdatum}", lblAankomstdatum.Text);
                body = body.Replace("{vertrekdatum}", lblVertrekdatum.Text);
                body = body.Replace("{personen}", lblAantalPersonen.Text);
                body = body.Replace("{email}", lblEmail.Text);

                return body;
            }

        }

    }
}
