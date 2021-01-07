using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class ReserveringNachtregisterWijzigen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnToevoegen_Click(object sender, EventArgs e)
        {
            //    lblOutput.Text = "";
            //    string Voornaam = TxBNaam.Text;
            //    string Tussenvoegsel = TxBtussenvoegsel.Text;
            //    string Achternaam = TxBAchternaam.Text;

            //    DateTime geboortedatum = DateTime.Parse(TxBGeboortedatum.Text);
            //    geboortedatum.ToShortDateString();

            //    DateTime control = new DateTime();
            //    control = DateTime.Today;

            //    bool check = CheckDatum(geboortedatum, control);

            //    if (check == true)
            //    {
            //        CustomValidator1.Enabled = false;
            //        CustomValidator1.Visible = false;
            //        int reserveringnummer = int.Parse(Session["reserveringnummer"].ToString());

            //        aantalPersonen = int.Parse(Session["personen"].ToString()) - 1;

            //        try
            //        {
            //            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
            //            {
            //                con.Open();

            //                SqlCommand sqlquery = new SqlCommand("[dbo].[InsertNachtRegister]");

            //                sqlquery.Parameters.AddWithValue("@Voornaam", Voornaam);
            //                sqlquery.Parameters.AddWithValue("@Tussenvoegsel", Tussenvoegsel);
            //                sqlquery.Parameters.AddWithValue("@Achternaam", Achternaam);
            //                sqlquery.Parameters.AddWithValue("@Geboortedatum", geboortedatum);
            //                sqlquery.Parameters.AddWithValue("@ReserveringNummer2", reserveringnummer);

            //                sqlquery.CommandType = System.Data.CommandType.StoredProcedure;
            //                sqlquery.Connection = con;
            //                sqlquery.ExecuteNonQuery();
            //                con.Close();
            //            }
            //        }
            //        catch
            //        {
            //            lblOutput.Text = "Er ging iets mis, neem contact met ons op.";
            //        }

            //        GridView1.DataBind();
            //        count++;
            //        if (count == aantalPersonen)
            //        {
            //            Button1.Visible = true;
            //            Button2.Visible = false;
            //        }
            //        lblOutput.Text = "Persoon is toegevoegd.";
            //    }
            //}


        }
    }
}