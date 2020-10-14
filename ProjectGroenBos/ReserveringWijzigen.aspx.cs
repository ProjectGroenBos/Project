using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos
{
    public partial class ReserveringWijzigen : System.Web.UI.Page
    {
        string zoek;
        string querieadres;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txbAchternaam_TextChanged(object sender, EventArgs e)
        {
            zoek = txbAchternaam.ToString();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                try
                {
                    if (rdbVoornaam.Checked == true)
                    {
                        querieadres = "select res.Nummer as Reserveringsnummer, gst.Voornaam, gst.Tussenvoegsel, gst.Achternaam, gst.Email, res.Aantal_personen as [Aantal personen], res.Aankomstdatum, res.Vertrekdatum from Gast gst inner join Reservering res on gst.Nummer = res.GastNummer where gst.Voornaam like @zoek or gst.Achternaam like @zoek order by gst.Voornaam";

                    }
                    else if (rdbAchternaam.Checked == true)
                    {
                        querieadres = "select res.Nummer as Reserveringsnummer, gst.Voornaam, gst.Tussenvoegsel, gst.Achternaam, gst.Email, res.Aantal_personen as [Aantal personen], res.Aankomstdatum, res.Vertrekdatum from Gast gst inner join Reservering res on gst.Nummer = res.GastNummer where gst.Voornaam like @zoek or gst.Achternaam like @zoek order by gst.Achternaam";

                    }
                    else
                    {
                        querieadres = "select res.Nummer as Reserveringsnummer, gst.Voornaam, gst.Tussenvoegsel, gst.Achternaam, gst.Email, res.Aantal_personen as [Aantal personen], res.Aankomstdatum, res.Vertrekdatum from Gast gst inner join Reservering res on gst.Nummer = res.GastNummer where gst.Voornaam like @zoek or gst.Achternaam like @zoek order by res.Nummer";
                    }

                    DataSet ds = Data();

                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
                catch (Exception exception)
                {
                    lblUitkomst.Text = exception.ToString();
                }
            }
        }

        protected DataSet Data()
        {
            //dataset om de gridview te vullen
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                con.Open();
                SqlDataAdapter query = new SqlDataAdapter(querieadres, con);
                //parameters

                zoek = "%" + zoek + "%";

                query.SelectCommand.Parameters.AddWithValue("@zoek", zoek);
                DataSet set = new DataSet();
                query.Fill(set);

                var tussen1 = "";
                var tussen2 = "";

                //clonen van tabel
                DataSet trueset = set.Clone();

                //change kolom datatype
                trueset.Tables[0].Columns[6].DataType = typeof(string);
                trueset.Tables[0].Columns[7].DataType = typeof(string);

                //data importen
                foreach (DataRow row in set.Tables[0].Rows)
                {
                    trueset.Tables[0].ImportRow(row);
                }

                //elke rij veranderen
                foreach (DataRow row in trueset.Tables[0].Rows)
                {
                    //pak var
                    DateTime dt1 = DateTime.Parse(row[6].ToString());
                    DateTime dt2 = DateTime.Parse(row[7].ToString());
                    //pas aan
                    tussen1 = dt1.ToShortDateString();
                    tussen2 = dt2.ToShortDateString();
                    //adjust
                    row[6] = tussen1;
                    row[7] = tussen2;
                }


                con.Close();

                if (trueset.Tables[0].Rows.Count == 0)
                {
                    lblUitkomst.Text = "Geen resultaten gevonden.";
                }

                return trueset;
            }
        }
    }
}