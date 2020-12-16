﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Recreatie
{
    public partial class InlogschermKlanten : System.Web.UI.Page
    {
        string connetionString;
        SqlConnection cnn;
        private int IsManager;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            connetionString = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;User ID=BIM022020;Password=BiM@IH2020";
            
            cnn = new SqlConnection(connetionString);
        }
            
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                cnn.Open();

                string query = "Select GastNummer, Wachtwoord from GastAccount where Wachtwoord = @Wachtwoord and GastNummer = @Nummer";

                string Email = TextBox1.Text;
                string password = TextBox2.Text;

                SqlCommand cmdSchedule = new SqlCommand(query, cnn);

                cmdSchedule.Parameters.AddWithValue("@Nummer", Email);
                cmdSchedule.Parameters.AddWithValue("@Wachtwoord", password);

                SqlDataReader dr = cmdSchedule.ExecuteReader();
                string resulaat = dr.Read().ToString();

                Label3.Text = dr["GastNummer"].ToString();

                if (dr["GastNummer"].ToString() == Email && dr["Wachtwoord"].ToString() == password)
                {
                    //Label3.Text = "in";
                    Response.Redirect("Home.aspx");

                }
                dr.Close();
            }

            catch
            {
                //Label3.Text = "inloggen mislukt";
            }
            finally
            {
                cnn.Close();
            }
        }
    }
}


