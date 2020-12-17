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
         //   if (int.Parse(Session["Functie"].ToString()) != 2 | int.Parse(Session["Functie"].ToString()) != 3)
         //   {
        //        Response.Redirect("Home.aspx");
//}

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
                rpTransactiemodals.DataSource = ds;
                rpTransactiemodals.DataBind();

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

            HiddenField fNummers = (HiddenField)rpReservering.Items[gridviewnr].FindControl("fnummer");
            string fnummer = fNummers.Value;

            HiddenField Betalen = (HiddenField)rpReservering.Items[gridviewnr].FindControl("Betaald");
            string betaald = Betalen.Value;

            HiddenField nogbetalen = (HiddenField)rpReservering.Items[gridviewnr].FindControl("Nogbetalen");
            string albetaald = nogbetalen.Value;


            Email(gridviewnr, nummer, Totaalbedrag, Naam, email, betaald, albetaald);

            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("UPDATE debiteurenfactuur SET BetaalstatusID = '5' where nummer = @nummer", con);
                cmd.Parameters.AddWithValue("@nummer", fnummer);

                cmd.ExecuteNonQuery();

                con.Close();
            }

            gvReserveringen.DataBind();

            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "emailsuccess();", true);
        }

        protected void Email(int gridviewnr, string nummer, string totaal, string naam, string email, string betaald, string albetaald)
        {
            //Fetching Settings from WEB.CONFIG file.  
            string emailSender = "groenbosfinances@hotmail.com";
            string emailSenderPassword = "MarionenAndries";
            string emailSenderHost = "smtp.live.com";
            int emailSenderPort = 587;
            Boolean emailIsSSL = true;


            //Fetching Email Body Text from EmailTemplate File.  
            string userPath = Environment.GetFolderPath(Environment.SpecialFolder.UserProfile);

            string FilePath = Path.Combine(userPath, "Documents\\GitHub\\Project\\ProjectGroenBos\\Financien\\EmailTemplates\\Reservering.html");

            StreamReader str = new StreamReader(FilePath);
            string MailText = str.ReadToEnd();
            str.Close();

            DateTime today = DateTime.Today;

            //Repalce [newusername] = signup user name   
            MailText = MailText.Replace("[Voornaam]", naam);
            MailText = MailText.Replace("[nummer]", nummer);
            MailText = MailText.Replace("[Datum]", today.ToString("dd/MM/yyyy"));
            MailText = MailText.Replace("[Rij]", GetGridviewData((GridView)rpReservering.Items[gridviewnr].FindControl("gvFactuurreservering"))).ToString();
            MailText = MailText.Replace("[Totaalbedrag]", '€' + totaal);


            string subject = "Uw rekeningfactuur van Groenbos";

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

        protected void btnTransactiehistory_OnClick(object sender, EventArgs e)
        {
            //HiddenField nummers = (HiddenField)rpTransactiemodals.Items[0].FindControl("Nummer");
            //string nummer = nummers.Value;

            SqlConnection con = new SqlConnection(constr);
            con.Open();
            //Label label1 = (Label)rpTransactiemodals.Items[0].FindControl("Lblreedsbetaald");
            //SqlCommand ophaal = new SqlCommand("select CAST(SUM(Bedrag) AS real) as [Reeds betaald] from Transactie where CrediteurenfactuurNummer = @nummer", con);
            //ophaal.Parameters.AddWithValue("@nummer", nummer);
            //string result = ophaal.ExecuteScalar().ToString();
            //label1.Text = result;
            con.Close();
            string modal = "#modal2" + ((Button)sender).CommandArgument;

            TransactieRepeater(((Button)sender).CommandName, ((Button)sender).CommandArgument);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('" + modal + "');", true);
        }

        public void TransactieRepeater(string repeaternr, string fnummer)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();

                Repeater transacties = (Repeater)rpTransactiemodals.Items[int.Parse(repeaternr)].FindControl("rpTransacties");
                Label NoRecords = (Label)rpTransactiemodals.Items[int.Parse(repeaternr)].FindControl("lblNoRecords");

                SqlCommand cmd = new SqlCommand("select * from reserveringbetalingen where debiteurenfactuurnummer = @nummer", con);
                cmd.Parameters.AddWithValue("@nummer", fnummer);

                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                transacties.DataSource = ds;
                transacties.DataBind();


                if (transacties.Items.Count < 1)
                {
                    NoRecords.Visible = true;
                    transacties.Visible = false;
                }

                con.Close();
            }

        }


    }
}
