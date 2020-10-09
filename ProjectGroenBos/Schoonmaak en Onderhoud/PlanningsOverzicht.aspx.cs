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

            string querystring = "select Onderhoudsopdracht.Nummer, Medewerker.Naam, Startdatum, VerwachteEinddatum, Kosten, BungalowNummer, OnderhoudsstatusID, Onderhoudtype, DatumvanConstatering  from Onderhoudsopdracht left join Medewerker on Medewerker.Nummer = Onderhoudsopdracht.MedewerkerNummer";

            using SqlDataAdapter ad = new SqlDataAdapter(querystring, myConnection);
            {
                DataSet ds = new DataSet();
                ad.Fill(ds);
                return ds;
            }

            //string _query = "select a.* from a where a.col1 = 3; Select b.* form b";

            //using (SqlDataAdapter a = new SqlDataAdapter(_query, connectionString))
            //{

            //    /* Use DataAdapter to fill DataSet*/
            //    DataSet ds = new DataSet();
            //    a.Fill(ds);


            //}
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
               string scheduledDate = Convert.ToDateTime(row["Startdatum"]).ToShortDateString();

                if (scheduledDate.Equals(s))
                {
                    LinkButton lb = new LinkButton();

                    lb.Text = "Medewerker:" + "<br />" + row["Naam"] + "<br />" + "Bungalow: " + row["BungalowNummer"] as String + "</a>" + "<BR>";

                    e.Cell.Controls.Add(lb);
                }
            }
        }
    }
}