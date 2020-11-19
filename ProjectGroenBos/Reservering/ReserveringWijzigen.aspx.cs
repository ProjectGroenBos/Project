using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;

namespace ProjectGroenBos.Reservering
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["gastnummer"] == null)
            {
                Response.Redirect("ReserveringenOverzicht.aspx");
            }
            else
            {
                lblGastnummer.Text = Session["gastnummer"].ToString();
                txbVoornaam.Text = Session["voornaam"].ToString();
                txbTussenvoegsel.Text = Session["tussenvoegsel"].ToString();
                txbAchternaam.Text = Session["achternaam"].ToString();
                txbEmail.Text = Session["e-mail"].ToString();
                txbTelefoonnummer.Text = Session["telefoonnummer"].ToString();
                lblReserveringsnummer.Text = Session["reserveringsnummer"].ToString();
                txbAantalPersonen.Text = Session["aantal_personen"].ToString();
                txbOpmerkingen.Text = Session["opmerkingen"].ToString();

                this.txbAankomstdatum.Text = Session["aankomstdatum"].ToString();
                this.txbVertrekdatum.Text = Session["vertrekdatum"].ToString();
                //txbAankomstdatum.Text = Session["aankomstdatum"].ToString();
                //txbVertrekdatum.Text = Session["vertrekdatum"].ToString();
                if (txbTussenvoegsel.Text == "&nbsp;")
                {
                    txbTussenvoegsel.Text = "";
                }
                if (txbOpmerkingen.Text == "&nbsp;")
                {
                    txbOpmerkingen.Text = "";
                }
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

                    DateTime aankomstdatum = new DateTime();
                    DateTime vertrekdatum = new DateTime();
                    aankomstdatum = tussen1;
                    vertrekdatum = tussen2;
                    aankomstdatum.ToShortDateString();
                    vertrekdatum.ToShortDateString();

                    con.Open();
                    string query1 = "update Gast set Voornaam = @voornaam, Tussenvoegsel = @tussenvoegsel, Achternaam = @achternaam, Telefoonnummer = @telefoonnummer, Email = @email where Nummer = @gastnummer";
                    string query2 = "update Reservering set Aantal_personen = @personen, Opmerking = @opmerking, Vertrekdatum = @vertrekdatum, Aankomstdatum = @aankomstdatum where Nummer = @reserveringsnummer";

                    SqlCommand cmd1 = new SqlCommand(query1, con);
                    SqlCommand cmd2 = new SqlCommand(query2, con);

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

                    cmd1.CommandType = CommandType.Text;
                    cmd2.CommandType = CommandType.Text;

                    int veranderdeRijen1 = cmd1.ExecuteNonQuery();
                    int veranderdeRijen2 = cmd2.ExecuteNonQuery();

                    con.Close();

                    int totaal = veranderdeRijen1 + veranderdeRijen2;
                    Response.Redirect("ReserveringenOverzicht.aspx");
                }
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Er ging iets mis')", true);
            }
        }

        //private void StuurMail()
        //{
        //    string ontvanger = lblEmail.Text;

        //    //Mail opzetten
        //    MailMessage mailMessage = new MailMessage("groenbosreservations@gmail.com", ontvanger);
        //    mailMessage.Subject = "Uw reservering is gewijzigd!";
        //    mailMessage.Body = CreateBody();
        //    mailMessage.IsBodyHtml = true;

        //    //Credentails
        //    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
        //    smtpClient.Credentials = new System.Net.NetworkCredential()
        //    {
        //        UserName = "groenbosreservations@gmail.com",
        //        Password = "MarionenAndries"
        //    };
        //    smtpClient.EnableSsl = true;

        //    //Versturen mail

        //    smtpClient.Send(mailMessage);

        //}

        //private string CreateBody()
        //{
        //    {
        //        //lezen mail.html
        //        string body = string.Empty;
        //        using (StreamReader reader = new StreamReader(Server.MapPath("MailReserveringGewijzigd.html")))
        //        {
        //            body = reader.ReadToEnd();
        //        }

        //        //parameters html pagina

        //        body = body.Replace("{achternaam}", lblAchternaam.Text);
        //        body = body.Replace("{aankomstdatum}", txtAankomstDatum.Text);
        //        body = body.Replace("{vertrekdatum}", txtVertrekdatum.Text);
        //        body = body.Replace("{personen}", txtAantalPersonen.Text);
        //        body = body.Replace("{email}", lblEmail.Text);

        //        return body;
        //    }

        //}

    }
}