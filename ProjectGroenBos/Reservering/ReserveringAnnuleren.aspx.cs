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
                Response.Redirect("ReserveringAnnulerenOverzicht.aspx");
            }
            else
            {
                GridView1.Visible = true;
                //sessions ophalen om de gegevens weer te geven in labels
                reserveringsnummer = Session["reserveringsnummer"].ToString();

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
                {

                    query1 = "select res.*, gst.*, adr.* from Gast gst inner join Reservering res on gst.Nummer = res.GastNummer inner join Adres adr on adr.GastNummer = gst.Nummer where res.Nummer = @nummer";

                    DataSet ds = Data();

                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }

                


                //if (lblTussenvoegsel.Text == "&nbsp;")
                //{
                //    lblTussenvoegsel.Text = "";
                //}
                //if (lblOpmerkingen.Text == "&nbsp;")
                //{
                //    lblOpmerkingen.Text = "";
                //}
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
                var tussen3 = "";

                //clonen van tabel
                DataSet trueset = set.Clone();

                //change kolom datatype
                trueset.Tables[0].Columns[3].DataType = typeof(string);
                trueset.Tables[0].Columns[4].DataType = typeof(string);
                trueset.Tables[0].Columns[5].DataType = typeof(string);

                //data importen
                foreach (DataRow row in set.Tables[0].Rows)
                {
                    trueset.Tables[0].ImportRow(row);
                }

                //elke rij veranderen
                foreach (DataRow row in trueset.Tables[0].Rows)
                {
                    //pak var
                    DateTime dt1 = DateTime.Parse(row[3].ToString());
                    DateTime dt2 = DateTime.Parse(row[4].ToString());
                    DateTime dt3 = DateTime.Parse(row[5].ToString());
                    //pas aan
                    tussen1 = dt1.ToShortDateString();
                    tussen2 = dt2.ToShortDateString();
                    tussen3 = dt3.ToShortDateString();
                    //adjust
                    row[3] = tussen1;
                    row[4] = tussen2;
                    row[5] = tussen3;

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
