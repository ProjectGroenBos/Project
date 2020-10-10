using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Schoonmaak_en_Onderhoud
{
    public partial class PlanningsOverzicht : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private DataSet GetData()
        {
            string connectionString = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020";

            SqlConnection myConnection = new SqlConnection(connectionString);

            string querystring = "select Schoonmaakopdracht.Nummer, Medewerker.Naam, Datum, Omschrijving, BungalowNummer, MedewerkerNummer   from Schoonmaakopdracht left join Medewerker on Medewerker.Nummer = Schoonmaakopdracht.MedewerkerNummer";

            using SqlDataAdapter ad = new SqlDataAdapter(querystring, myConnection);
            {
                DataSet ds = new DataSet();
                ad.Fill(ds);
                return ds;
            }
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            DataSet ds = GetData();

            string s = e.Day.Date.ToShortDateString();

            e.Cell.Text = e.Day.Date.Day.ToString() + "<BR>";

            LiteralControl l = new LiteralControl();

            l.Text = e.Day.Date.Day.ToString() + "<BR>";

            e.Cell.Controls.Add(l);

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                string scheduledDate = Convert.ToDateTime(row["Datum"]).ToShortDateString();

                if (scheduledDate.Equals(s))
                {
                    LinkButton lb = new LinkButton();

                    lb.Text = "<br />" + row["Naam"] + "<br />" + "Bungalow: " + row["BungalowNummer"] + "<br />" + row["Omschrijving"] as String + "</a>" + "<BR>";

                    e.Cell.Controls.Add(lb);
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("PlanningToevoegen.aspx");
        }
    }
}