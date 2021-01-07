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
    public partial class WebForm4 : System.Web.UI.Page
    {
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
         //   if (int.Parse(Session["Functie"].ToString()) != 2 | int.Parse(Session["Functie"].ToString()) != 3)
           // {
             //   Response.Redirect("Home.aspx");
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

                SqlCommand cmd = new SqlCommand("select * from rekeningen", con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                rpModals.DataSource = ds;
                rpModals.DataBind();

                con.Close();
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {

            Button btn = sender as Button;

            int gridviewnr = int.Parse(btn.CommandName);

            HiddenField fnummers = (HiddenField)rpModals.Items[gridviewnr].FindControl("DebiteurNr");
            string fnummer = fnummers.Value;

            HiddenField nummers = (HiddenField)rpModals.Items[gridviewnr].FindControl("Nummer");
            string nummer = nummers.Value;

            HiddenField Totaalbedragen = (HiddenField)rpModals.Items[gridviewnr].FindControl("Totaalbedrag");
            string Totaalbedrag = Totaalbedragen.Value;

            HiddenField Namen = (HiddenField)rpModals.Items[gridviewnr].FindControl("Naamgast");
            string Naam = Namen.Value;

            HiddenField Emails = (HiddenField)rpModals.Items[gridviewnr].FindControl("Emailgast");
            string email = Emails.Value;

            Email(gridviewnr, nummer, Totaalbedrag, Naam, email);

            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("UPDATE debiteurenfactuur SET BetaalstatusID = '5' where nummer = @nummer", con);
                cmd.Parameters.AddWithValue("@nummer", fnummer);

                cmd.ExecuteNonQuery();

                con.Close();
            }

            gvRekeningen.DataBind();

            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "emailsuccess();", true);

        }

        protected void Email(int gridviewnr, string nummer, string totaal, string naam, string email)
        {
             //Fetching Settings from WEB.CONFIG file.  
            string emailSender = "groenbosfinances@hotmail.com";
            string emailSenderPassword = "MarionenAndries";
            string emailSenderHost = "smtp.live.com";
            int emailSenderPort = 587;
            Boolean emailIsSSL = true;


            //Fetching Email Body Text from EmailTemplate File.  
            string userPath = Environment.GetFolderPath(Environment.SpecialFolder.UserProfile);

            string FilePath = Path.Combine(userPath, "Documents\\GitHub\\Project\\ProjectGroenBos\\Financien\\EmailTemplates\\Rekening.html");

            StreamReader str = new StreamReader(FilePath);
            string MailText = str.ReadToEnd();
            str.Close();

            DateTime today = DateTime.Today;

            //Repalce [newusername] = signup user name   
            MailText = MailText.Replace("[Voornaam]", naam);
            MailText = MailText.Replace("[nummer]", nummer);
            MailText = MailText.Replace("[Datum]", today.ToString("dd/MM/yyyy"));
            MailText = MailText.Replace("[Rij]", GetGridviewData((GridView)rpModals.Items[gridviewnr].FindControl("gvFactuurrekening"))).ToString();
            MailText = MailText.Replace("[Totaalbedrag]", '€' + totaal);


            string subject = "Uw factuur van Groenbos";

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
    }
}