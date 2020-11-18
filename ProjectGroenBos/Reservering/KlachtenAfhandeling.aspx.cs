﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class KlachtenAfhandeling : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (rdbBezoeker.Checked == true)
            {

                txbVoornaam.Visible = true;
                txbAchternaam.Visible = true;
                txbEmail.Visible = true;
                txbGastnummer.Visible = false;
                txbGastnummer.Text = "";
            }
            else if (rdbGast.Checked == true)
            {
                txbVoornaam.Visible = false;
                txbAchternaam.Visible = false;
                txbEmail.Visible = false;
                txbGastnummer.Visible = true;
                txbVoornaam.Text = "";
                txbAchternaam.Text = "";
                txbEmail.Text = "";
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Er moet een radiobutton geselecteerd zijn.')", true);
            }
        }

        protected void btnVerzenden_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            {
                string voornaam = txbVoornaam.Text;
                string achternaam = txbAchternaam.Text;
                string email = txbEmail.Text;
                string categorie = ddlCategorie.Text;
                string klacht = txbKlacht.Text;

                if (rdbBezoeker.Checked == true)
                {

                    con.Open();


                    string query = "insert into Klacht (Categorie, Omschrijving, Voornaam, Achternaam, Email)values(@categorie, @klachtomschrijving, @voornaam, @achternaam, @email)";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@categorie", categorie);
                    cmd.Parameters.AddWithValue("@klachtomschrijving", klacht);
                    cmd.Parameters.AddWithValue("@voornaam", voornaam);
                    cmd.Parameters.AddWithValue("@achternaam", achternaam);
                    cmd.Parameters.AddWithValue("@email", email);


                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.ExecuteNonQuery();

                    con.Close();

                    Response.Redirect("Huisjemedewerker.aspx");

                }
                else
                {

                    int gastnummer = int.Parse(txbGastnummer.Text);

                    con.Open();


                    string query = "insert into Klacht (Categorie, Omschrijving, GastNummer, Voornaam, Achternaam)values(@categorie, @klachtomschrijving, @gastnummer, @voornaam, @achternaam)";

                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@categorie", categorie);
                    cmd.Parameters.AddWithValue("@klachtomschrijving", klacht);
                    cmd.Parameters.AddWithValue("@gastnummer", gastnummer);
                    cmd.Parameters.AddWithValue("@voornaam", voornaam);
                    cmd.Parameters.AddWithValue("@achternaam", achternaam);
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.ExecuteNonQuery();

                    con.Close();

                    Response.Redirect("Huisjemedewerker.aspx");
                }

            }
        }
    }
}