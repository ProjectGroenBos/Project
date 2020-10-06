using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ProjectGroenBos.Financien
{
    public partial class Reserveringen : System.Web.UI.Page
    {
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Repeater();
            }
        }

        public void Repeater()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("select * from reserveringen", con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                rpReservering.DataSource = ds;
                rpReservering.DataBind();

                con.Close();
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {

            Button btn = sender as Button;

            int gridviewnr = int.Parse(btn.CommandName);
            HiddenField nummers = (HiddenField)rpReservering.Items[gridviewnr].FindControl("Nummer");
            string nummer = nummers.Value;

            HiddenField Totaalbedragen = (HiddenField)rpReservering.Items[gridviewnr].FindControl("Totaalbedrag");
            string Totaalbedrag = Totaalbedragen.Value;

            HiddenField Namen = (HiddenField)rpReservering.Items[gridviewnr].FindControl("Naamgast");
            string Naam = Namen.Value;

            HiddenField Emails = (HiddenField)rpReservering.Items[gridviewnr].FindControl("Emailgast");
            string email = Emails.Value;

            Email(gridviewnr, nummer, Totaalbedrag, Naam, email);
        }

        protected void Email(int gridviewnr, string nummer, string totaal, string naam, string email)
        {

            MailMessage mail = new MailMessage();


            MailMessage mailMessage = new MailMessage("groenbosfinances@hotmail.com", email);

            // email body tekst
            StringBuilder sbEmailBody = new StringBuilder();
            sbEmailBody.Append("Hallo " + naam + ",");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("hierbij sturen wij de factuur van de reservering die u heeft gemaakt op.");
            //link veranderen als website wordt gehost.
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append(GetGridviewData((GridView)rpReservering.Items[gridviewnr].FindControl("gvFactuurreservering")));
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<h4>Te betalen bedrag: " + totaal + "</h4>");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("Wij verzoeken u vriendelijk het bedrag van " + totaal + " voor aanvang van uw bezoek over te maken naar rekeningnummer NL32 RABO 0220.96.13.200 onder vermelding van reserveringsnummer " + nummer);
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("Wij hopen u hierbij voldoende geïnformeerd te hebben. Als u vragen heeft kunt u deze email beantwoorden.");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("Met vriendelijke groeten,");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<b>Groenbos recreatie b.v.</b>");
            sbEmailBody.Append("<br/>");
            sbEmailBody.Append("Noorderpark 12, 6755 VB Aalterveld");
            sbEmailBody.Append("<br/>");
            sbEmailBody.Append("<img src='https://cdn.discordapp.com/attachments/749932863847137304/762614070687825950/Logo3.png' style='width: 100px; height: 150px; '>");

            mailMessage.IsBodyHtml = true;
            //body naar email tekst
            mailMessage.Body = sbEmailBody.ToString();
            mailMessage.Subject = "Factuur " + nummer;
            SmtpClient smtpClient = new SmtpClient("smtp.live.com", 587);

            //email login
            smtpClient.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "groenbosfinances@hotmail.com",
                Password = "MarionenAndries"
            };

            //email wordt verzonden
            smtpClient.EnableSsl = true;
            smtpClient.Send(mailMessage);

            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "emailsuccess();", true);

        }

        public string GetGridviewData(GridView gv)
        {
            //Gridviews data krijgen voor de mail
            StringBuilder strBuilder = new StringBuilder();
            StringWriter strWriter = new StringWriter(strBuilder);
            HtmlTextWriter htw = new HtmlTextWriter(strWriter);
            gv.RenderControl(htw);
            return strBuilder.ToString();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
}
