using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Recreatie
{
    public partial class Reserverenfaciliteit : System.Web.UI.Page
    {
        string connectionstring = ConfigurationManager.ConnectionStrings["dbconnectie"].ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString);
        DataTable Activteit;
        int Currentactivity;
        private int index;
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dt.Columns.AddRange(new DataColumn[1] { new DataColumn("Naam") });
                //dt.Rows.Add("Yes");
                ViewState["Medewerker"] = dt;

            }
        }

        private DataSet GetData()
        {
            string connectionString = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020";

            SqlConnection myConnection = new SqlConnection(connectionString);

            string querystring = "SELECT A.Nummer, A.Naam AS Activiteitnaam, A.Locatie, A.Inschrijfkosten, A.[Maximaal aantal], F.Omschrijving, CONVERT(date, A.Datum) AS Datum, CONVERT(VARCHAR(5), A.Begintijd, 108) AS Begintijd, CONVERT(VARCHAR(5), A.Eindtijd, 108) AS Eindtijd, M.Naam FROM dbo.Activiteit AS A LEFT OUTER JOIN dbo.Faciliteit AS F ON A.FaciliteitID = F.ID LEFT OUTER JOIN dbo.Medewerker AS M ON M.Nummer = A.MedewerkerID WHERE(A.ActiviteitActief = 1)";

            using (SqlDataAdapter ad = new SqlDataAdapter(querystring, myConnection))
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

                    lb.Text = "<br />" + row["Activiteitnaam"] + "<br />" + "Loctatie: " + row["Omschrijving"] + " / " + row["Locatie"] + "<br />" + "Aantal Deelnemers  / " + row["Maximaal aantal"] + "<br />" + "Begeleider: " + row["Naam"] as String + "</a>" + "<BR>";

                    e.Cell.Controls.Add(lb);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup');", true);
        }
    }
}