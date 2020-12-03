﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;

namespace ProjectGroenBos.Reservering
{
    public partial class ReserveringenwijzigenMASTER : System.Web.UI.Page
    {
        string zoek;
        string datum;
        string querieadres;

        protected void Page_Load(object sender, EventArgs e)
        {
            
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
                query.SelectCommand.Parameters.AddWithValue("@datum", datum);
                DataSet set = new DataSet();
                query.Fill(set);

                var tussen1 = "";
                var tussen2 = "";

                //clonen van tabel
                DataSet trueset = set.Clone();

                //change kolom datatype
                trueset.Tables[0].Columns[5].DataType = typeof(string);
                trueset.Tables[0].Columns[6].DataType = typeof(string);


                //data importen
                foreach (DataRow row in set.Tables[0].Rows)
                {
                    trueset.Tables[0].ImportRow(row);
                }

                //elke rij veranderen
                foreach (DataRow row in trueset.Tables[0].Rows)
                {
                    //pak var
                    DateTime dt1 = DateTime.Parse(row[5].ToString());
                    DateTime dt2 = DateTime.Parse(row[6].ToString());
                    //pas aan
                    tussen1 = dt1.ToShortDateString();
                    tussen2 = dt2.ToShortDateString();
                    //adjust
                    row[5] = tussen1;
                    row[6] = tussen2;
                    
                }


                con.Close();

                if (trueset.Tables[0].Rows.Count == 0)
                {
                    lblUitkomst.Text = "Geen resultaten gevonden.";
                }

                return trueset;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //sessions aanmaken om op de volgende pagina de gegevens in te vullen
            
            Session["reserveringsnummer"] = (string)GridView1.SelectedRow.Cells[1].Text;
            
            Response.Redirect("ReserveringWijzigen.aspx");
        }

        protected void btnZoek_Click(object sender, EventArgs e)
        {
            lblUitkomst.Text = "";
            zoek = txbAchternaam.Text;
            datum = txbDatum.Text;
            //this.txbDatum.Text = DateTime.Now.ToString("yyyy-MM-dd");

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                try
                {
                    //radiobuttons om te kijken waarop de tabel gesorteerd moet worden
                    if (rdbVoornaam.Checked == true)
                    {
                        querieadres = "select res.Nummer as Reserveringsnummer, gst.Achternaam, gst.Email, gst.Telefoonnummer,  res.Aantal_personen as [Aantal personen], res.Aankomstdatum, res.Vertrekdatum from Gast gst inner join Reservering res on gst.Nummer = res.GastNummer where gst.Achternaam like @zoek and Aankomstdatum >= convert(date, GETDATE()) and Aankomstdatum <= @datum and ReserveringsstatusID != 5 order by gst.Voornaam ";

                    }
                    else if (rdbAchternaam.Checked == true)
                    {
                        querieadres = "select res.Nummer as Reserveringsnummer, gst.Achternaam, gst.Email, gst.Telefoonnummer,  res.Aantal_personen as [Aantal personen], res.Aankomstdatum, res.Vertrekdatum from Gast gst inner join Reservering res on gst.Nummer = res.GastNummer where gst.Achternaam like @zoek and Aankomstdatum >= convert(date, GETDATE()) and Aankomstdatum <= @datum and ReserveringsstatusID != 5 order by gst.Achternaam";

                    }
                    else
                    {
                        querieadres = "select res.Nummer as Reserveringsnummer, gst.Achternaam, gst.Email, gst.Telefoonnummer,  res.Aantal_personen as [Aantal personen], res.Aankomstdatum, res.Vertrekdatum from Gast gst inner join Reservering res on gst.Nummer = res.GastNummer where gst.Achternaam like @zoek and Aankomstdatum >= convert(date, GETDATE()) and Aankomstdatum <= @datum and ReserveringsstatusID != 5 order by res.Nummer";
                    }

                    //laden van de info uit de database
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
    }
}


