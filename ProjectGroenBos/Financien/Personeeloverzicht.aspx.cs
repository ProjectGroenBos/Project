using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Financien
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            int functieID = int.Parse(Session["Functie"].ToString());

            if (functieID == 2)
            {

            }
            else if (functieID == 10)
            {

            }
            else
            {
                Response.Redirect("~/Financien/nietgeautoriseerd.aspx");
            }

            if (!IsPostBack)
            {
                VulAfdeling();
                VulFunctie();
            }
        }

        protected void VulAfdeling()
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand com = new SqlCommand("select * from Afdeling", con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset
            dlAfdeling.DataTextField = ds.Tables[0].Columns["Naam"].ToString(); // text field name of table dispalyed in dropdown
            dlAfdeling.DataValueField = ds.Tables[0].Columns["id"].ToString();             // to retrive specific  textfield name 
            dlAfdeling.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
            dlAfdeling.DataBind();  //binding dropdownlist
        }

        protected void VulFunctie()
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand com = new SqlCommand("select * from Functie", con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset
            dlFunctie.DataTextField = ds.Tables[0].Columns["Naam"].ToString(); // text field name of table dispalyed in dropdown
            dlFunctie.DataValueField = ds.Tables[0].Columns["id"].ToString();             // to retrive specific  textfield name 
            dlFunctie.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
            dlFunctie.DataBind();  //binding dropdownlist
        }

        protected void btnToevoegen_Click(object sender, EventArgs e)
        {
            string commandText = "INSERT INTO [dbo].[Medewerker] ([Wachtwoord],[Contracturen per week],[In dienst sinds],[Uurloon], [Salaris per maand], [AfdelingID],[Naam],[Geboortedatum],[AdresHuisnummer],[AdresPostcode],[FunctieID]) VALUES" +
                "(@Wachtwoord, @Contract_uren_per_week, convert(datetime,@in_dienst_sinds,104),@Uurloon, @Salaris_per_maand, @AfdelingID, @Naam, convert(datetime,@Geboortedatum,104), @AdresHuisnummer, @AdresPostcode, @FunctieID)";

            using (SqlConnection connection = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand(commandText, connection);
                command.Parameters.AddWithValue("@Wachtwoord", "1");
                command.Parameters.AddWithValue("@Contract_uren_per_week", txbContracturen.Text);
                command.Parameters.AddWithValue("@in_dienst_sinds", txbInDienst.Text);
                command.Parameters.AddWithValue("@Uurloon", "1");
                command.Parameters.AddWithValue("@Salaris_per_maand", txbSalaris.Text);
                command.Parameters.AddWithValue("@AfdelingID", dlAfdeling.SelectedValue);
                command.Parameters.AddWithValue("@Naam", txbNaam.Text);
                command.Parameters.AddWithValue("@Geboortedatum", txbGeboortedatum.Text);
                command.Parameters.AddWithValue("@AdresHuisnummer", txbAdres.Text);
                command.Parameters.AddWithValue("@AdresPostcode", txbPostcode.Text);
                command.Parameters.AddWithValue("@FunctieID", dlFunctie.SelectedValue);

                connection.Open();

                command.ExecuteNonQuery();
            }

            gvPersoneelsOverzicht.DataBind();
        }
    }
}