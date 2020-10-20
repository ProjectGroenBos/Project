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
    public partial class ReserveringenwijzigenMASTER : System.Web.UI.Page
    {
        string zoek;
        string querieadres;

        protected void Page_Load(object sender, EventArgs e)
        {
            txtAankomstDatum.Visible = false;
            txtAantalPersonen.Visible = false;
            txtVertrekdatum.Visible = false;
            lblReserveringsnummer.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            btnWijzigen.Visible = false;
            Label6.Visible = false;
            lblAchternaam.Visible = false;
            lblEmail.Visible = false;
        }

        protected void txbAchternaam_TextChanged(object sender, EventArgs e)
        {
            lblUitkomst.Text = "";
            zoek = txbAchternaam.Text;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                try
                {
                    //radiobuttons om te kijken waarop de tabel gesorteerd moet worden
                    if (rdbVoornaam.Checked == true)
                    {
                        querieadres = "select res.Nummer as Reserveringsnummer, gst.Voornaam, gst.Tussenvoegsel, gst.Achternaam, gst.Email, res.Aantal_personen as [Aantal personen], res.Aankomstdatum, res.Vertrekdatum from Gast gst inner join Reservering res on gst.Nummer = res.GastNummer where gst.Voornaam like @zoek or gst.Achternaam like @zoek order by gst.Voornaam";

                    }
                    else if (rdbAchternaam.Checked == true)
                    {
                        querieadres = "select res.Nummer as Reserveringsnummer, gst.Voornaam, gst.Tussenvoegsel, gst.Achternaam, gst.Email, res.Aantal_personen as [Aantal personen], res.Aankomstdatum, res.Vertrekdatum from Gast gst inner join Reservering res on gst.Nummer = res.GastNummer where gst.Voornaam like @zoek or gst.Achternaam like @zoek order by gst.Achternaam";

                    }
                    else
                    {
                        querieadres = "select res.Nummer as Reserveringsnummer, gst.Voornaam, gst.Tussenvoegsel, gst.Achternaam, gst.Email, res.Aantal_personen as [Aantal personen], res.Aankomstdatum, res.Vertrekdatum from Gast gst inner join Reservering res on gst.Nummer = res.GastNummer where gst.Voornaam like @zoek or gst.Achternaam like @zoek order by res.Nummer";
                    }

                    //laden van de info uit de database
                    DataSet ds = Data();

                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
                catch (Exception exception)
                {
                    lblUitkomst.Text = exception.ToString();
                }
            }
        }
        protected DataSet Data()
        {
            //dataset om de gridview te vullen
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                con.Open();
                SqlDataAdapter query = new SqlDataAdapter(querieadres, con);
                //parameters

                zoek = "%" + zoek + "%";

                query.SelectCommand.Parameters.AddWithValue("@zoek", zoek);
                DataSet set = new DataSet();
                query.Fill(set);

                var tussen1 = "";
                var tussen2 = "";

                //clonen van tabel
                DataSet trueset = set.Clone();

                //change kolom datatype
                trueset.Tables[0].Columns[6].DataType = typeof(string);
                trueset.Tables[0].Columns[7].DataType = typeof(string);

                //data importen
                foreach (DataRow row in set.Tables[0].Rows)
                {
                    trueset.Tables[0].ImportRow(row);
                }

                //elke rij veranderen
                foreach (DataRow row in trueset.Tables[0].Rows)
                {
                    //pak var
                    DateTime dt1 = DateTime.Parse(row[6].ToString());
                    DateTime dt2 = DateTime.Parse(row[7].ToString());
                    //pas aan
                    tussen1 = dt1.ToShortDateString();
                    tussen2 = dt2.ToShortDateString();
                    //adjust
                    row[6] = tussen1;
                    row[7] = tussen2;
                }


                con.Close();

                if (trueset.Tables[0].Rows.Count == 0)
                {
                    lblUitkomst.Text = "Geen resultaten gevonden.";
                }

                return trueset;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Session["reserveringsnummer"] = (string)GridView1.SelectedRow.Cells[1].Text;
            //Session["aantal_personen"] = (string)GridView1.SelectedRow.Cells[6].Text;
            //Session["aankomstdatum"] = (string)GridView1.SelectedRow.Cells[7].Text;
            //Session["vertrekdatum"] = (string)GridView1.SelectedRow.Cells[8].Text;

            txtAankomstDatum.Visible = true;
            txtAantalPersonen.Visible = true;
            txtVertrekdatum.Visible = true;
            lblReserveringsnummer.Visible = true;
            Label2.Visible = true;
            Label3.Visible = true;
            Label4.Visible = true;
            Label5.Visible = true;
            btnWijzigen.Visible = true;
            Label6.Visible = true;
            lblAchternaam.Visible = true;
            lblEmail.Visible = true;

            //test of het werkt, nog niet
            lblAchternaam.Text = GridView1.SelectedRow.Cells[4].Text;
            lblReserveringsnummer.Text = GridView1.SelectedRow.Cells[1].Text;
            txtAantalPersonen.Text = GridView1.SelectedRow.Cells[6].Text;
            txtAankomstDatum.Text = GridView1.SelectedRow.Cells[7].Text;
            txtVertrekdatum.Text = GridView1.SelectedRow.Cells[8].Text;
        }

        protected void btnWijzigen_Click(object sender, EventArgs e)
        {
            try
            {

                int veranderdeRijen;
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
                {
                    con.Open();
                    string query = "update Reservering set Aantal_personen = @AantalPersonen, Vertrekdatum = @Vertrekdatum, Aankomstdatum = @Aankomstdatum where Nummer = @Nummer";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@AantalPersonen", txtAantalPersonen.Text);
                    cmd.Parameters.AddWithValue("@Vertrekdatum", txtVertrekdatum.Text);
                    cmd.Parameters.AddWithValue("@Aankomstdatum", txtAankomstDatum.Text);
                    cmd.Parameters.AddWithValue("@Nummer", lblReserveringsnummer.Text);
                    veranderdeRijen = cmd.ExecuteNonQuery();
                    con.Close();
                }
                lblUitkomst.Text = "Er zijn " + veranderdeRijen + "rijen veranderd.";
                StuurMail();
            }
            catch
            {
                lblUitkomst.Text = "Geen mail verstuurd.";
            }

        }

        private void StuurMail()
        {
            string ontvanger = lblEmail.Text;

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

                body = body.Replace("{achternaam}", lblAchternaam.Text);
                body = body.Replace("{aankomstdatum}", txtAankomstDatum.Text);
                body = body.Replace("{vertrekdatum}", txtVertrekdatum.Text);
                body = body.Replace("{personen}", txtAantalPersonen.Text);
                body = body.Replace("{email}", lblEmail.Text);

                return body;
            }

        }
    }


}