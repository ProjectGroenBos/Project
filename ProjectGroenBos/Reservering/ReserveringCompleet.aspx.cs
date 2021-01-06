using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class ReserveringCompleet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["prijs"] != null)
            {
                //double totaal = double.Parse(Session["prijs"].ToString());
                //double betaald = double.Parse(Session["betaald"].ToString());

                //lblTotaal.Text = totaal.ToString();
                //lblBetalen.Text = betaald.ToString();

                //double later = totaal - betaald;

                //lblLater.Text = later.ToString();

                //lblReserveringnummer.Text = Session["reserveringnummer300"].ToString();
                lblReservering.Text = Session["reserveringnummer300"].ToString();
                lblReservering.Visible = false;
                //lblPersonen.Text = Session["personen"].ToString();
                //lblAankomst.Text = Session["aankomstdatum"].ToString();
                //lblVertrek.Text = Session["vertrekdatum"].ToString();
                //lblEmail.Text = Session["email"].ToString();
            }
            else
            {
                Response.Redirect("home.aspx");
            }
        }



        protected void btnBevestigen_Click(object sender, EventArgs e)
        {
            StuurMail();
            //Session[""] = ;
            Response.Redirect("home.aspx");
        }

        private void StuurMail()
        {
            string ontvanger = Session["Email"].ToString();

            //Mail opzetten
            MailMessage mailMessage = new MailMessage("groenbosreservations@gmail.com", ontvanger);
            mailMessage.Subject = "Uw reservering is geplaatst!";
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
                using (StreamReader reader = new StreamReader(Server.MapPath("ReserveringAanmaken.html")))
                {
                    body = reader.ReadToEnd();
                }

                //parameters html pagina
                body = body.Replace("{reserveringsnummer}", Session["reserveringnummer300"].ToString());
                body = body.Replace("{achternaam}", Session["achternaam"].ToString());
                body = body.Replace("{aankomstdatum}", Session["aankomstdatum"].ToString());
                body = body.Replace("{vertrekdatum}", Session["vertrekdatum"].ToString());
                body = body.Replace("{personen}", Session["personen"].ToString());
                body = body.Replace("{email}", Session["email"].ToString());
                body = body.Replace("{prijs}", Session["prijs"].ToString());

                return body;
            }

        }
    }
}