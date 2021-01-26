using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class Inchecken : System.Web.UI.Page
    {
        int reserveringsnummer;
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;
        Button btnbetalen;
        Button btninchecken;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Repeater();
            }
        }

        protected void Gridview1_SelectedIndexChanged(object sender, EventArgs e)
        {
            reserveringsnummer = int.Parse((string)GridView1.SelectedRow.Cells[0].ToString());
        }

        protected void btnZoek_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            GridView2.Visible = true;
            GridView2.DataBind();

            if(GridView2.Rows.Count == 0)
            {
                Label5.Text = "Geen gasten die moeten inchecken gevonden.";
            }
            else
            {
                Label5.Text = "";
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

        protected void btnInchecken_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            int gridviewnr = int.Parse(btn.CommandName);
            HiddenField vijf = (HiddenField)rpReservering.Items[gridviewnr].FindControl("ReserveringNummer");

            string nummer = vijf.Value;
            int status = 9;

            UpdateReservering(nummer, status);
            //Repeater();
            Response.Redirect("Inchecken.aspx");
        }

        protected void btnBetalen_Click(object sender, EventArgs e)
        {
            //omzetten van eval naar string, double, etc
            Button btn = sender as Button;

            int gridviewnr = int.Parse(btn.CommandName);
            Label een = (Label)rpReservering.Items[gridviewnr].FindControl("lblTotaal");
            Label twee = (Label)rpReservering.Items[gridviewnr].FindControl("lblBijbetalen");
            HiddenField vijf = (HiddenField)rpReservering.Items[gridviewnr].FindControl("ReserveringNummer");
            HiddenField zes = (HiddenField)rpReservering.Items[gridviewnr].FindControl("fNummer");
            btnbetalen = (Button)rpReservering.Items[gridviewnr].FindControl("btnBetalen");
            btninchecken = (Button)rpReservering.Items[gridviewnr].FindControl("btnInchecken");

            string drie = een.Text;
            string vier = twee.Text;
            string zeven = vijf.Value;
            string acht = zes.Value;

            double totaal = double.Parse(drie);
            double betalen = double.Parse(vier);
            int resNummer = int.Parse(zeven);
            int fNummer = int.Parse(acht);

            double nuPayen = betalen - 100;

            DateTime vandaag = DateTime.Today;

            //alles voor de transactie
            string aan = "Groenbos";
            string rekeningnummer = "NL32 RABO 0220.96.13.200";
            int typeID = 2;

            InsTransactie(vandaag, aan, nuPayen, resNummer, fNummer, rekeningnummer, typeID);

            btnbetalen.Visible = false;
            btninchecken.Visible = true;

            twee.Text = "0";

            Label aanbetaling1 = (Label)rpReservering.Items[gridviewnr].FindControl("lblAanbetaling");

            aanbetaling1.Text = drie;
            //Repeater();

            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "openModal('<%# Eval('Nummer') %>')", true);
        }

        protected void btnSelecteer(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            int gridviewnr = int.Parse(btn.CommandName);

            Label twee = (Label)rpReservering.Items[gridviewnr].FindControl("lblTotaal");
            Label aanbetaling1 = (Label)rpReservering.Items[gridviewnr].FindControl("lblAanbetaling");
            Label tebetalen = (Label)rpReservering.Items[gridviewnr].FindControl("lblBijbetalen");
            
            string vier = twee.Text;
            double aanbetaling = double.Parse(vier);

            aanbetaling = aanbetaling / 10;

            if (aanbetaling < 100)
            {
                aanbetaling = 100;
            }
            else if (aanbetaling >= 100)
            {

            }

            double betalen = double.Parse(vier);
            betalen = betalen - aanbetaling;

            string alBetaald = aanbetaling1.Text;
            aanbetaling1.Text = vier;

            if (betalen == 0)
            {
                btninchecken.Visible = true;
                btnbetalen.Visible = false;
            }
            else
            {
                btnbetalen.Visible = true;
                btninchecken.Visible = false;
            }
        }

        private void InsTransactie(DateTime vandaag, string aan, double bedrag, int reserveringnummer, int debifactuur, string rekeningnummer, int typeID)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {

                try
                {
                    con.Open();

                    SqlCommand query = new SqlCommand("insert Transactie (Datum, Aan, Bedrag, Omschrijving, DebiteurenfactuurNummer, BankrekeningBanknummer, TypeID) values (@datum, @aan, @bedrag, @resnummer, @debifactuur, @rekeningnummer, @type)");

                    query.Parameters.AddWithValue("@datum", vandaag);
                    query.Parameters.AddWithValue("@aan", aan);
                    query.Parameters.AddWithValue("@bedrag", bedrag);
                    query.Parameters.AddWithValue("@resnummer", reserveringnummer);
                    query.Parameters.AddWithValue("@debifactuur", debifactuur);
                    query.Parameters.AddWithValue("@rekeningnummer", rekeningnummer);
                    query.Parameters.AddWithValue("@type", typeID);

                    query.CommandType = System.Data.CommandType.Text;
                    query.Connection = con;
                    query.ExecuteNonQuery();

                    con.Close();
                }
                catch
                {

                }
            }
        }

        private void UpdateReservering(string nummer,int status)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                con.Open();

                string sqlquery = "update Reservering set ReserveringsstatusID = @status where Nummer = @nummer";
                SqlCommand cmd = new SqlCommand(sqlquery, con);

                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@nummer", nummer);

                cmd.ExecuteNonQuery();

                con.Close();
            }
        }
    }
}