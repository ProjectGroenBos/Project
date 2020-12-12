using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Restaurant
{
    public partial class Afrekenen : System.Web.UI.Page
    {
		//Connectionstring
		string connectionString = ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;
		protected void Page_Load(object sender, EventArgs e)
        {

			// neem de tafel op vanuit het tafeloverzicht
			if (Session["tafelnr"] != null)
			{
				lbltafel.Text = "Tafel " + Session["Tafelnr"].ToString();
			}
			else
			{
				Response.Redirect("tafeloverzicht.aspx");
			}

			// Kijken welke totaalprijs hij moet berekenen

			//lblTotaal.Text = "Totaal: €" + RestaurantAfrekenOvericht.cast(SUM(RegelTotaal) AS DECIMAL(18, 2));
			//lblTotaal.DataBind();
		}

		protected void btnRekening_Click(object sender, EventArgs e)
		{
			//Factuurregels aanmaken
			String commandText = "INSERT INTO [dbo].[Factuurregel] (Aantal, Prijs, RestaurantItemID) VALUES" + 
			"(@Aantal, @Prijs, @RestaurantItemID)";

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				SqlCommand command = new SqlCommand(commandText, connection);
				command.Parameters.AddWithValue("@Aantal", DfHoeveel.Text );
				command.Parameters.AddWithValue("@Prijs",  );
				command.Parameters.AddWithValue("@RestaurantItemID", );
				connection.Open();

				command.ExecuteNonQuery();

			}

			// Verbinding met de database voor een betaling op rekening tussen de facatures af maken
			string commandText = "UPDATE [dbo].[Debiteurenfactuur] ([Datum],[Totaal bedrag],[BetaalmethodeID],[BetaalstatusID]) VALUES" +
			"(@Datum, @Totaal_bedrag, @BetaalmethodeID, @BetaalstatusID)";

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				SqlCommand command = new SqlCommand(commandText, connection);
				command.Parameters.AddWithValue("@Datum", DateTime.Now);
				command.Parameters.AddWithValue("@Totaal_bedrag", lblbetaald.text);
			    command.Parameters.AddWithValue("@BetaalmethodeID", "5");
				command.Parameters.AddWithValue("@BetaalstatusID", "2");

				connection.Open();

				command.ExecuteNonQuery();
			}

			//sqlCon.Close();
			//LblSucces.Text = " SUBMIT SUCCESSFULLY";
			//CLEAR();
		}


		protected void btnBetalen_Click(object sender, EventArgs e)
		{
			// Verbinding met de database voor een pin betaling tussen de facatures

			string commandText = "UPDATE [dbo].[Debiteurenfactuur] ([Datum],[Totaal bedrag],[BetaalmethodeID],[BetaalstatusID]) VALUES" +
			"(@Datum, @Totaal_bedrag, @BetaalmethodeID, @BetaalstatusID)";

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				SqlCommand command = new SqlCommand(commandText, connection);
				command.Parameters.AddWithValue("@Datum", DateTime.Now);
				command.Parameters.AddWithValue("@Totaal_bedrag", lblbetaald.text);
				command.Parameters.AddWithValue("@BetaalmethodeID", "2");
				command.Parameters.AddWithValue("@BetaalstatusID", "2");

				connection.Open();

				command.ExecuteNonQuery();
			}

			//sqlCon.Close();
			//LblSucces.Text = " SUBMIT SUCCESSFULLY";
			//CLEAR();
		}

		protected void btnContant_Click(object sender, EventArgs e)
		{
			// verbinding maken om de factuur af te maken voor contant
			string commandText = "UPDATE [dbo].[Debiteurenfactuur] ([Datum],[Totaal bedrag],[BetaalmethodeID],[BetaalstatusID]) VALUES" +
			"(@Datum, @Totaal_bedrag, @BetaalmethodeID, @BetaalstatusID)";

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				SqlCommand command = new SqlCommand(commandText, connection);
				command.Parameters.AddWithValue("@Datum", DateTime.Now);
				command.Parameters.AddWithValue("@Totaal_bedrag", lblbetaald.text);
				command.Parameters.AddWithValue("@BetaalmethodeID", "6");
				command.Parameters.AddWithValue("@BetaalstatusID", "2");

				connection.Open();

				command.ExecuteNonQuery();
			}

			//sqlCon.Close();
			//LblSucces.Text = " SUBMIT SUCCESSFULLY";
			//CLEAR();
		}
	}
}