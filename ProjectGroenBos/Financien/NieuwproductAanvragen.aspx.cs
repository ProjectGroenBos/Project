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
    public partial class NieuwproductAanvragen : System.Web.UI.Page
    {
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Repeater();
            }
        }
        public void Repeater()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM LeverancierDetails", con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                rpInzienLeverancier.DataSource = ds;
                rpInzienLeverancier.DataBind();

                con.Close();
            }
        }

        protected void btnToevoegen_Click(object sender, EventArgs e)
        {
            string commandText = "INSERT INTO [dbo].[Voorraad] ([Aantal],[Naam],[Prijs],[Minimum voorraad],[Omschrijving],[LeverancierID]) VALUES" +
                "(@Aantal, @Naam, @Prijs,@min, @Omschrijving, @Leverancier)";

            using (SqlConnection connection = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand(commandText, connection);
                command.Parameters.AddWithValue("@Aantal", 0);
                command.Parameters.AddWithValue("@Naam", txbNaam.Text);
                
                command.Parameters.AddWithValue("@Prijs", txbPrijs.Text);
                command.Parameters.AddWithValue("@min", txbMinimumVoorraad.Text);
                command.Parameters.AddWithValue("@Omschrijving", txbOmschrijving.Text);
                command.Parameters.AddWithValue("@Leverancier", 1);

                connection.Open();

                command.ExecuteNonQuery();
            }

            gvLeveranciersOverzicht.DataBind();
        }


    }
}