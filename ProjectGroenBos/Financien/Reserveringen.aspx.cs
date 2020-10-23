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


            Email(gridviewnr, nummer, Totaalbedrag, Naam, email);

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
            mailMessage.Subject = "Reservering Factuur " + nummer;
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
