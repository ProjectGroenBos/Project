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
    public partial class Leverancier : System.Web.UI.Page
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
            string commandText = "INSERT INTO [dbo].[Leverancier] ([Naam],[Adres],[Contactpersoon],[Telefoonnummer],[Email],[Postcode],[Plaats]) VALUES" +
                "(@Naam, @Adres,@Contactpersoon, @Telefoonnummer, @Email, @Postcode, @Plaats)";

            using (SqlConnection connection = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand(commandText, connection);
                command.Parameters.AddWithValue("@Naam", txbNaam.Text);
                command.Parameters.AddWithValue("@Adres", txbAdres.Text);
                command.Parameters.AddWithValue("@Contactpersoon", txbContactpersoon.Text);
                command.Parameters.AddWithValue("@Telefoonnummer", txbTelefoonnummer.Text);
                command.Parameters.AddWithValue("@Email", txbEmail.Text);
                command.Parameters.AddWithValue("@Postcode", txbPostcode.Text);
                command.Parameters.AddWithValue("@Plaats", txbPlaats.Text);

                connection.Open();

                command.ExecuteNonQuery();
            }

            gvLeveranciersOverzicht.DataBind();
        }
    }
}