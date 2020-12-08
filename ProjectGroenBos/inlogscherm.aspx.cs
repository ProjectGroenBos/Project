using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Financien
{
    public partial class Inlogscherm : System.Web.UI.Page
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

                string query = "SELECT[Nummer], [Wachtwoord], [Naam], [FunctieID] FROM [Medewerker] WHERE(([Nummer] = @Personeelsnummer) AND([Wachtwoord] = @Wachtwoord))";



                string Id = TextBox1.Text;
                string password = TextBox2.Text;

                SqlCommand cmdSchedule = new SqlCommand(query, cnn);

                cmdSchedule.Parameters.AddWithValue("@Personeelsnummer", Id);
                cmdSchedule.Parameters.AddWithValue("@Wachtwoord", password);

                SqlDataReader dr = cmdSchedule.ExecuteReader();
                string resulaat = dr.Read().ToString();

                if (dr["Nummer"].ToString() == Id && dr["Wachtwoord"].ToString() == password)
                {

                    string functie = dr["FunctieID"].ToString();
                    if (functie == "2")
                    {
                        Session["Login"] = Id;
                        Response.Redirect("Financien/Home.aspx");
                    }
                    if (functie == "7")
                    {
                        Session["Login"] = Id;
                        Response.Redirect("Schoonmaak en Onderhoud/Home.aspx");
                    }
                    if (functie == "4")
                    {
                        Session["Login"] = Id;
                        Response.Redirect("Restaurant/home.aspx");
                    }
                    else
                    {
                        Session["Login"] = Id;
                        Response.Redirect("Restaurant/home.aspx");
                    }
                    ////////////////////////

                }
                dr.Close();
            }

            catch
            {
                Label3.Text = "inloggen mislukt";
            }
            finally
            {
                cnn.Close();
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}