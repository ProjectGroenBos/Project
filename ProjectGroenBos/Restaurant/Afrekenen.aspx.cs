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
				lbltafel.Text = Session["tafelnr"].ToString();
			}
			else
			{
				Response.Redirect("tafeloverzicht.aspx");
			}

			// Kijken welke totaalprijs hij moet berekenen
			int nummer = Convert.ToInt16(Session["tafelnr"].ToString());
			factuurregels.SelectCommand = "SELECT [Hoeveel], [Naam], [Prijs], [RegelTotaal] FROM [RestaurantAfrekenOvericht] WHERE Tafelnr =" + nummer + "";
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

			// Verbinding met de database maken en een factuur aanmaken voor op rekening

			string cmdText = "INSERT INTO [dbo].[Debiteurenfactuur] ([Datum],[BetaalmethodeID],[BetaalstatusID],[FactuurtypeID],[RestaurantReserveringID]) VALUES" +
				"(@Datum, @Totaal_bedrag, @BetaalmethodeID, @BetaalstatusID, @FactuurtypeID, @RestaurantReserveringID)";

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				SqlCommand command = new SqlCommand(cmdText, connection);
				command.Parameters.AddWithValue("@Datum", DateTime.Now);
				command.Parameters.AddWithValue("@BetaalmethodeID", "5");
				command.Parameters.AddWithValue("@BetaalstatusID", "2");
				command.Parameters.AddWithValue("@FactuurtypeID", "4");
				//command.Parameters.AddWithValue("@RestaurantReserveringID", );

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

			string cmdText = "INSERT INTO [dbo].[Debiteurenfactuur] ([Datum],[BetaalmethodeID],[BetaalstatusID],[FactuurtypeID],[RestaurantReserveringID]) VALUES" +
				"(@Datum, @Totaal_bedrag, @BetaalmethodeID, @BetaalstatusID, @FactuurtypeID, @RestaurantReserveringID)";

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				SqlCommand command = new SqlCommand(cmdText, connection);
				command.Parameters.AddWithValue("@Datum", DateTime.Now);
				command.Parameters.AddWithValue("@BetaalmethodeID", "2");
				command.Parameters.AddWithValue("@BetaalstatusID", "2");
				command.Parameters.AddWithValue("@FactuurtypeID", "4");
				//command.Parameters.AddWithValue("@RestaurantReserveringID", );

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
			string cmdText = "INSERT INTO [dbo].[Debiteurenfactuur] ([Datum],[BetaalmethodeID],[BetaalstatusID],[FactuurtypeID],[RestaurantReserveringID]) VALUES" +
				"(@Datum, @Totaal_bedrag, @BetaalmethodeID, @BetaalstatusID, @FactuurtypeID, @RestaurantReserveringID)";

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				SqlCommand command = new SqlCommand(cmdText, connection);
				command.Parameters.AddWithValue("@Datum", DateTime.Now);
				command.Parameters.AddWithValue("@BetaalmethodeID", "6");
				command.Parameters.AddWithValue("@BetaalstatusID", "2");
				command.Parameters.AddWithValue("@FactuurtypeID", "4");
				//command.Parameters.AddWithValue("@RestaurantReserveringID", );

				connection.Open();

				command.ExecuteNonQuery();
			}

			//sqlCon.Close();
			//LblSucces.Text = " SUBMIT SUCCESSFULLY";
			//CLEAR();
		}
	}
}