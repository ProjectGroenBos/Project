using System;
using System.Collections.Generic;
using System.Configuration;
<<<<<<< HEAD
using System.Data;
=======
>>>>>>> ReserveringTeam/Noah
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;
<<<<<<< HEAD
=======
using System.Data;
>>>>>>> ReserveringTeam/Noah

namespace ProjectGroenBos.Reservering
{
    public partial class test : System.Web.UI.Page
    {
<<<<<<< HEAD
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

=======
        string reserveringsnummer;
        string query1;
        DateTime aankomstDatum;
        DateTime vertrekDatum;
        DateTime vandaag = DateTime.Today;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["reserveringsnummer"] == null)
            {
                Response.Redirect("ReserveringOverzicht.aspx");
            }
            else
            {

                if (!IsPostBack)

                {
                    lblReserveringsnummer.Text = Session["reserveringsnummer"].ToString();
                    //txbAantalPersonen.Text = GridView1.Rows[1].Cells[1].Text;
                    //txbOpmerkingen.Text = (string)GridView1.DataKeys[0]["Opmerking"].ToString();
                    //txbAankomstdatum.Text = (string)GridView1.DataKeys[0]["Aankomstdatum"].ToString();
                    //txbVertrekdatum.Text = (string)GridView1.DataKeys[0]["Vertrekdatum"].ToString();

                    //sessions ophalen voor het vullen van de vakjes
                    reserveringsnummer = Session["reserveringsnummer"].ToString();
                    //txbAankomstdatum.Text = Session["Aankomstdatum"].ToString();
                    //txbAantalPersonen.Text = Session["AantalPersonen"].ToString();
                    //txbVertrekdatum.Text = Session["Vertrekdatum"].ToString();
                    GridView1.Visible = false;
                    GridView2.Visible = false;
                    btnWijzigen.Visible = false;
                    RequiredFieldValidator1.Enabled = false;
                    foreach (GridViewRow gr in GridView1.Rows)
                    {
                        lblReserveringsnummer.Text = Session["reserveringsnummer"].ToString();
                        txbAantalPersonen.Text = gr.Cells[3].Text;
                        txbAankomstdatum.Text = gr.Cells[1].Text;
                        txbVertrekdatum.Text = gr.Cells[2].Text;
                        txbOpmerkingen.Text = gr.Cells[4].Text;

                        if (txbOpmerkingen.Text == "&nbsp;")
                        {
                            txbOpmerkingen.Text = "";
                        }
                    }

                }

            }

        }


>>>>>>> ReserveringTeam/Noah
        protected void btnWijzigen_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
                {
                    DateTime tussen1 = DateTime.Parse(txbAankomstdatum.Text);
                    DateTime tussen2 = DateTime.Parse(txbVertrekdatum.Text);
<<<<<<< HEAD
                    string gast = lblGastnummer.Text;
                    string voornaam = txbVoornaam.Text;
                    string tussenvoegsel = txbTussenvoegsel.Text;
                    string achternaam = txbAchternaam.Text;
                    string email = txbEmail.Text;
                    string telefoonnummer = txbTelefoonnummer.Text;
                    string reserveringsnummer = lblReserveringsnummer.Text;
                    int aantalPersonen = int.Parse(txbAantalPersonen.Text);
                    string opmerkingen = txbOpmerkingen.Text;
=======


                    string reserveringsnummer = lblReserveringsnummer.Text;
                    int aantalPersonen = int.Parse(txbAantalPersonen.Text);
                    string opmerkingen = txbOpmerkingen.Text;
                    int bungalow = int.Parse(lblHuisjenummer.Text);

>>>>>>> ReserveringTeam/Noah

                    DateTime aankomstdatum = new DateTime();
                    DateTime vertrekdatum = new DateTime();
                    aankomstdatum = tussen1;
                    vertrekdatum = tussen2;
                    aankomstdatum.ToShortDateString();
                    vertrekdatum.ToShortDateString();

                    con.Open();
<<<<<<< HEAD
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
=======

                    //string query2 =
                    //"UPDATE Reservering set Aantal_personen = @personen, Opmerking = @opmerking,
                    //Vertrekdatum = @vertrekdatum, Aankomstdatum = @aankomstdatum where Nummer = @reserveringsnummer";

                    SqlCommand cmd = new SqlCommand("update Reservering_Bungalow set BungalowNummer = @bungalow where ReserveringNummer = @reservering", con);
                    SqlCommand cmd2 = new SqlCommand("UPDATE Reservering set Aantal_personen = @aantalPersonen, Opmerking = @opmerkingen, Vertrekdatum = @vertrekdatum, Aankomstdatum = @aankomstdatum where Nummer = @reserveringsnummer", con);

                    cmd.Parameters.AddWithValue("@bungalow", bungalow);
                    cmd.Parameters.AddWithValue("@reservering", reserveringsnummer);

                    cmd2.Parameters.AddWithValue("@aantalPersonen", aantalPersonen);
                    cmd2.Parameters.AddWithValue("@opmerkingen", opmerkingen);
>>>>>>> ReserveringTeam/Noah
                    cmd2.Parameters.AddWithValue("@vertrekdatum", vertrekdatum);
                    cmd2.Parameters.AddWithValue("@aankomstdatum", aankomstdatum);
                    cmd2.Parameters.AddWithValue("@reserveringsnummer", reserveringsnummer);

<<<<<<< HEAD
                    cmd1.CommandType = CommandType.Text;
                    cmd2.CommandType = CommandType.Text;

                    int veranderdeRijen1 = cmd1.ExecuteNonQuery();
                    int veranderdeRijen2 = cmd2.ExecuteNonQuery();

                    con.Close();

                    int totaal = veranderdeRijen1 + veranderdeRijen2;
                    Response.Redirect("ReserveringenOverzicht.aspx");
=======
                    cmd2.CommandType = System.Data.CommandType.Text;
                    cmd.CommandType = CommandType.Text;
                    if (chbHuisje.Checked == false)
                    {
                        cmd.ExecuteNonQuery();
                    }
                    

                    cmd2.ExecuteNonQuery();
                    con.Close();

                    StuurMail();

                    Session["controle6"] = 1;
                    Response.Redirect("ReserveringOverzicht.aspx");
                    //Response.Redirect("ReserveringNachtregisterWijzigen.aspx");
>>>>>>> ReserveringTeam/Noah
                }
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Er ging iets mis')", true);
            }
<<<<<<< HEAD
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

=======

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

        protected void btnZoeken_Click(object sender, EventArgs e)
        {
            //variabelen voor controles
            string aankomst = txbAankomstdatum.Text;
            string aankomst2 = aankomst.Replace("/", "-");

            string vertrek = txbVertrekdatum.Text;
            string vertrek2 = vertrek.Replace("/", "-");

            aankomstDatum = DateTime.Parse(aankomst2);
            vertrekDatum = DateTime.Parse(vertrek2);

            aankomstDatum.ToShortDateString();
            vertrekDatum.ToShortDateString();
            vandaag.ToShortDateString();

            int aantalPersonen = int.Parse(txbAantalPersonen.Text);

            if (aankomstDatum < vertrekDatum && aankomstDatum > vandaag && vertrekDatum > vandaag)
            {

                //dataset om de gridview te vullen
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
                {
                    con.Open();
                    string query = "select * from  [dbo].[ZoekHuisjes](@GewensteAankomstDatum, @GewensteVertrekDatum, @personen)";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@GewensteAankomstDatum", aankomstDatum);
                    cmd.Parameters.AddWithValue("@GewensteVertrekDatum", vertrekDatum);
                    cmd.Parameters.AddWithValue("@personen", aantalPersonen);
                    cmd.ExecuteNonQuery();

                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                    con.Close();
                    GridView2.Visible = true;
                    GridView1.Visible = false;

                }
            }
            else if (aankomstDatum == vandaag || vertrekDatum == vandaag)
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('U kunt niet vertrekken of aankomen op de dag van reservering.')", true);
                lblUitkomst.Text = "U kunt niet vertrekken of aankomen op de dag van reservering.";
            }
            else if (vertrekDatum == aankomstDatum)
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vertrekdatum is later als de aankomstdatum. Controleer deze nog even alstublieft.')", true);
                lblUitkomst.Text = "Vertrekdatum is later als de aankomstdatum. Controleer deze nog even alstublieft.";
            }
            else
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('U kunt niet voor het verleden reserveren. Probeer het opnieuw.')", true);
                lblUitkomst.Text = "U kunt niet voor het verleden reserveren. Probeer het opnieuw.";
            }

            if (GridView2.Rows.Count == 0)
            {
                lblUitkomst.Text = "Geen beschikbare bungalows.";
            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblHuisjenummer.Text = (string)GridView2.SelectedRow.Cells[1].Text;
            GridView1.Visible = false;
            btnWijzigen.Enabled = true;
        }

        protected void chbHuisje_CheckedChanged(object sender, EventArgs e)
        {
            if (chbHuisje.Checked == true)
            {
                btnZoeken.Visible = false;
                btnWijzigen.Visible = true;
                txbAankomstdatum.Enabled = false;
                txbVertrekdatum.Enabled = false;
                txbAantalPersonen.Enabled = false;
            }
            else
            {
                btnZoeken.Visible = true;
                btnWijzigen.Visible = false;
                txbAankomstdatum.Enabled = true;
                txbVertrekdatum.Enabled = true;
                txbAantalPersonen.Enabled = true;
                
            }
            foreach (GridViewRow gr in GridView1.Rows)
            {
                txbAantalPersonen.Text = gr.Cells[3].Text;
                txbAankomstdatum.Text = gr.Cells[1].Text;
                txbVertrekdatum.Text = gr.Cells[2].Text;
                GridView1.Visible = false;
            }
        }
>>>>>>> ReserveringTeam/Noah
    }
}