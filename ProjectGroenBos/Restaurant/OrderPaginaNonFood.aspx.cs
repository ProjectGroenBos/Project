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

namespace ProjectGroenBos.Restaurant
{
    public partial class OrderPaginaNonFood : System.Web.UI.Page
    {
        //Connectionstring
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;
        int gridviewnr;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Repeater();
            }
            functiescheiding();
        }

        private void functiescheiding()
        {
            //controleren of de ingelogde persoon geautoriseerd is om af te mogen rekenen
            int functieID = int.Parse(Session["Functie"].ToString());

            if (functieID == 5)
            {

            }
            else if (functieID == 6)
            {

            }
            else if (functieID == 10)
            {

            }
            else
            {
                Response.Redirect("~/Restaurant/home.aspx");
            }
        }

        public void Repeater()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("select * FROM InkoopOrderAanvraag INNER JOIN Leverancier ON InkoopOrderAanvraag.LeverancierID = Leverancier.ID", con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                rpReservering.DataSource = ds;
                gvOrderBekijken.DataBind();
                rpReservering.DataBind();


                con.Close();
            }
        }

        //Deze haalt het bestelnummer op om te gebruiken
        private int ophalenbestelnummer()
        {
            using (SqlConnection connection = new SqlConnection(constr))
            {
                HiddenField nummer2 = (HiddenField)rpReservering.Items[gridviewnr].FindControl("Nummer");
                string nummer = nummer2.Value;
                connection.Open();
                string selectquery = "SELECT distinct Bestelnummer FROM     InkoopAanvraagRegels INNER JOIN InkoopOrderAanvraag ON InkoopAanvraagRegels.InkoopOrderAanvraagNummer = InkoopOrderAanvraag.Nummer INNER JOIN InkoopOrderAanvraagStatus ON InkoopOrderAanvraag.InkoopOrderAanvraagStatusID = InkoopOrderAanvraagStatus.ID INNER JOIN Voorraad ON InkoopAanvraagRegels.VoorraadID = Voorraad.ID where nummer = @nummer";
                SqlCommand sqlCmd = new SqlCommand(selectquery, connection);
                SqlParameter sqlParameter0 = sqlCmd.Parameters.AddWithValue("@Nummer", nummer);
                SqlDataReader r;
                string Bestelnummer2 = (string)sqlCmd.ExecuteScalar();
                int Bestelnummer = int.Parse(Bestelnummer2);
                connection.Close();
                return Bestelnummer;
            }
        }

        //Dit stuk code verandert de status van de order
        private void statusverandering()
        {
            using (SqlConnection connection = new SqlConnection(constr))
            {
                int nummer = ophalenbestelnummer();

                String myquery = "UPDATE InkoopOrderAanvraag SET InkoopOrderAanvraagStatusID='5' WHERE Bestelnummer =" + nummer + "";
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = myquery;
                cmd.Connection = connection;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                cmd.CommandText = myquery;
                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();

            }
        }

        //Dit geeft aan wat er gebeurt bij het drukken op de knop
        protected void btnGoedkeuren_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            gridviewnr = int.Parse(btn.CommandName);
            statusverandering();
            gvOrderBekijken.DataBind();
        }
    }
}