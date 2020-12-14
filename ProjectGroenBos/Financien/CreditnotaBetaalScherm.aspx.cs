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
    public partial class CreditnotaBetaalScherm : System.Web.UI.Page
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

                SqlCommand cmd = new SqlCommand("select * from betalengauw", con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                rpCreditnota.DataSource = ds;
                rpCreditnota.DataBind();


                con.Close();
            }
        }

        protected void btnUitbetalen_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            int gridviewnr = int.Parse(btn.CommandName);

            HiddenField IBANS = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("IBAN");
            string iban = IBANS.Value;

            HiddenField Bedragen = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("TerugTeBetalen");
            string Bedrag = Bedragen.Value;

            HiddenField nummers = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("Nummer");
            string nummer = nummers.Value;

            HiddenField fNummers = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("fnummer");
            string fnummer = fNummers.Value;

            HiddenField Totaalbedragen = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("Totaalbedrag");
            string Totaalbedrag = Totaalbedragen.Value;

            HiddenField Namen = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("Naamgast");
            string Naam = Namen.Value;

            HiddenField Emails = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("Emailgast");
            string email = Emails.Value;

            //HiddenField Datums = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("datum");
            //string datum = Datums.Value;

            HiddenField Totaalbetaling = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("Totaalbetaald");
            string Totaalbetaald = Totaalbetaling.Value;

            HiddenField Afboeking = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("Afboekenfactuur");
            string Afboeken = Afboeking.Value;

            HiddenField Terugbetalenen = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("TerugTeBetalen");
            string Terugbetalen = Terugbetalenen.Value;

            HiddenField Voornaming = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("Voornaam");
            string Voornaam = Voornaming.Value;

            HiddenField schulding = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("Nogverschuligd");
            string schuldig = schulding.Value;

            Email(gridviewnr, nummer, Totaalbedrag, Naam, email, iban, Afboeken, Terugbetalen, schuldig, Totaalbetaald, Voornaam);


            string commandText = "INSERT INTO [dbo].[Transactie] ([Datum] ,[Aan] ,[Bedrag] ,[Omschrijving], [DebiteurenfactuurNummer] ,[BankrekeningBanknummer] ,[PersoneelNummer] ,[TypeID]) VALUES (CONVERT(date, getdate()), @Aan, @Bedrag, @Omschrijving, @DebiteurenfactuurNummer, @Iban, @PeroneelNummer, @TypeID)";

            using (SqlConnection connection = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand(commandText, connection);
                command.Parameters.AddWithValue("@Wachtwoord", "1");
                command.Parameters.AddWithValue("@Aan", iban);
                command.Parameters.AddWithValue("@Bedrag", Bedrag);
                command.Parameters.AddWithValue("@Omschrijving", nummer);
                command.Parameters.AddWithValue("@DebiteurenfactuurNummer", fnummer);
                command.Parameters.AddWithValue("@Iban", iban);
                command.Parameters.AddWithValue("@PeroneelNummer", "1");
                command.Parameters.AddWithValue("@TypeID", "1");


                connection.Open();

                command.ExecuteNonQuery();
            }
        }

        protected void btnKassa_Click(object sender, EventArgs e)
        {
        }
            protected void btnExport_Click(object sender, EventArgs e)
        {

            Button btn = sender as Button;

            int gridviewnr = int.Parse(btn.CommandName);
            HiddenField nummers = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("Nummer");
            string nummer = nummers.Value;

            HiddenField Totaalbedragen = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("Totaalbedrag");
            string Totaalbedrag = Totaalbedragen.Value;

            HiddenField Namen = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("Naamgast");
            string Naam = Namen.Value;

            HiddenField Emails = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("Emailgast");
            string email = Emails.Value;

            HiddenField fNummers = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("fnummer");
            string fnummer = fNummers.Value;

            //HiddenField Datums = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("datum");
            //string datum = Datums.Value;

            HiddenField IBANS = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("IBAN");
            string iban = IBANS.Value;

            HiddenField Totaalbetaling = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("Totaalbetaald");
            string Totaalbetaald = Totaalbetaling.Value;

            HiddenField Afboeking = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("Afboekenfactuur");
            string Afboeken = Afboeking.Value;

            HiddenField Terugbetalenen = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("TerugTeBetalen");
            string Terugbetalen = Terugbetalenen.Value;

            HiddenField Voornaming = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("Voornaam");
            string Voornaam = Voornaming.Value;

            HiddenField schulding = (HiddenField)rpCreditnota.Items[gridviewnr].FindControl("Nogverschuligd");
            string schuldig = schulding.Value;

            Email(gridviewnr, nummer, Totaalbedrag, Naam, email, iban, Afboeken, Terugbetalen, schuldig, Totaalbetaald, Voornaam);

           /* using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("UPDATE debiteurenfactuur SET ReserveringsstatusID = '6' where nummer = @nummer", con);
                cmd.Parameters.AddWithValue("@nummer", fnummer);

                cmd.ExecuteNonQuery();

                con.Close();
            }*/

            gvReserveringen.DataBind();

            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "emailsuccess();", true);
        }

        protected void Email(int gridviewnr, string nummer, string totaal, string naam, string email, string banknummer, string Afboeken, string Terugbetalen, string schuldig, string Totaalbetaald, string Voornaam)
        {
            
            //Fetching Settings from WEB.CONFIG file.  
            string emailSender = "groenbosfinances@hotmail.com";
            string emailSenderPassword = "MarionenAndries";
            string emailSenderHost = "smtp.live.com";
            int emailSenderPort = 587;
            Boolean emailIsSSL = true;


            //Fetching Email Body Text from EmailTemplate File.  
            string FilePath = "C:\\Users\\telef\\Documents\\GitHub\\Project\\ProjectGroenBos\\Financien\\EmailTemplates\\SignUp.html";
            StreamReader str = new StreamReader(FilePath);
            string MailText = str.ReadToEnd();
            str.Close();

            DateTime today = DateTime.Today;

            //Repalce [newusername] = signup user name   
            MailText = MailText.Replace("[Voornaam]", Voornaam);
            MailText = MailText.Replace("[Totaalbedrag]", totaal);
            MailText = MailText.Replace("[Betaald]", Totaalbetaald);
            MailText = MailText.Replace("[Afboeken]", Afboeken);
            MailText = MailText.Replace("[Terugbetalen]", Terugbetalen);
            MailText = MailText.Replace("[Geldontvangen]", schuldig);
            MailText = MailText.Replace("[Nummer]", nummer);
            MailText = MailText.Replace("[Datum]", today.ToString("dd/MM/yyyy"));
            MailText = MailText.Replace("[Rij]", (GetGridviewData((GridView)rpCreditnota.Items[gridviewnr].FindControl("gvFactuurreservering"))).ToString());
 


            string subject = "Welcome to CSharpCorner.Com";

            //Base class for sending email  
            MailMessage _mailmsg = new MailMessage();

            //Make TRUE because our body text is html  
            _mailmsg.IsBodyHtml = true;

            //Set From Email ID  
            _mailmsg.From = new MailAddress(emailSender);

            //Set To Email ID  
            _mailmsg.To.Add(email);

            //Set Subject  
            _mailmsg.Subject = subject;

            //Set Body Text of Email   
            _mailmsg.Body = MailText;


            //Now set your SMTP   
            SmtpClient _smtp = new SmtpClient();

            //Set HOST server SMTP detail  
            _smtp.Host = emailSenderHost;

            //Set PORT number of SMTP  
            _smtp.Port = emailSenderPort;

            //Set SSL --> True / False  
            _smtp.EnableSsl = emailIsSSL;

            //Set Sender UserEmailID, Password  
            NetworkCredential _network = new NetworkCredential(emailSender, emailSenderPassword);
            _smtp.Credentials = _network;

            //Send Method will send your MailMessage create above.  
            _smtp.Send(_mailmsg);





            /*
            MailMessage mail = new MailMessage();


            MailMessage mailMessage = new MailMessage("groenbosfinances@hotmail.com", email);

            // email body tekst
            StringBuilder sbEmailBody = new StringBuilder();
            sbEmailBody.Append("Geachte meneer/mevrouw " + naam + ",");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("Op TESTDATUM j.l. hebben wij van u een schriftelijke annulering ontvangen met betrekking tot uw reservering die in onze administratie onder nummer " + nummer + " geregistreerd was. ");
            //link veranderen als website wordt gehost.
            sbEmailBody.Append("Wij hebben uw reservering doen vervallen.");
            sbEmailBody.Append("Op grond van ons reglement ontvangt u 40% van de huursom verminderd met de aanbetaling retour. ");
            sbEmailBody.Append("De hoogte van dit bedrag gelieve u aan te treffen aan de onderzijde van dit schrijven.");
            sbEmailBody.Append("Wij hebben het restitutiebedrag heden gestort op bankrekening nummer " + banknummer + ".");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("Het spijt ons zeer u niet te kunnen verwelkomen op ons park.");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append(GetGridviewData((GridView)rpCreditnota.Items[gridviewnr].FindControl("gvFactuurreservering")));
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<h4>Te betalen bedrag: " + totaal + "</h4>");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("Wij verzoeken u vriendelijk het bedrag van " + totaal + " euro voor aanvang van uw bezoek over te maken naar rekeningnummer NL32 RABO 0220.96.13.200 onder vermelding van reserveringsnummer " + nummer + ".");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("Wij hopen u hierbij voldoende geïnformeerd te hebben. Als u vragen heeft kunt u deze email beantwoorden.");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("Met vriendelijke groeten,");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<b>Groenbos recreatie b.v.</b>");
            sbEmailBody.Append("<br/>");
            sbEmailBody.Append("Noorderpark 12, 6755 VB Aalterveld");
            sbEmailBody.Append("<br/>");
            sbEmailBody.Append("<img src='https://cdn.discordapp.com/attachments/749932863847137304/762614070687825950/Logo3.png' width='150' height='150'>");

            mailMessage.IsBodyHtml = true;
            //body naar email tekst
            mailMessage.Body = sbEmailBody.ToString();
            mailMessage.Subject = "Creditnota " + nummer;
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
            */
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