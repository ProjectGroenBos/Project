using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace ProjectGroenBos.Restaurant
{
    public partial class Afrekenen : System.Web.UI.Page
    {
		//Connectionstring
		string connectionString = ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;

		DataTable dta;

		protected void Page_Load(object sender, EventArgs e)
        {

			// neem de tafel op vanuit het tafeloverzicht
			if (Session["tafelnr"] != null)
			{
				lbltafel.Text = "Tafel " + Session["tafelnr"].ToString();
			}
			else
			{
				Response.Redirect("tafeloverzicht.aspx");
			}

			// Kijken welke totaalprijs hij moet berekenen
			int nummer = Convert.ToInt16(Session["tafelnr"].ToString());
			factuurregels.SelectCommand = "SELECT [Hoeveel], [Naam], [Prijs], [RegelTotaal] FROM [RestaurantAfrekenOvericht] WHERE Tafelnr =" + nummer + "";
			SqlDataSourceTotaal.SelectCommand = "SELECT cast(SUM(RegelTotaal) AS DECIMAL(18,2)) AS Totaalbedrag FROM RestaurantAfrekenOvericht WHERE Tafelnr =" + nummer + "";
		}

		protected void Factuurregelsmaken()
		{
			if (dta.Rows.Count > 0)
			{
				using (SqlConnection sqlCon = new SqlConnection(connectionString))
				{
					foreach (DataRow rij in dta.Rows)
					{
						int Aantal = (int)rij[0];
						int Prijs = (int)rij[2];


						sqlCon.Open();
						String factuurregels = "INSERT INTO [dbo].[Factuurregel] (Aantal, Prijs, RestaurantItemID) VALUES" + "(@Aantal, @Prijs, @RestaurantItemID)";
						SqlCommand command = new SqlCommand(factuurregels, sqlCon);
						command.Parameters.AddWithValue("@Aantal", Aantal);
						command.Parameters.AddWithValue("@Prijs", Prijs);
						//command.Parameters.AddWithValue("@RestaurantItemID", );

						command.ExecuteNonQuery();
						sqlCon.Close();
					}
				}
			}
			else
			{
				LblSucces.Text = "Er is niks om af te rekenen";
			}

		}


		protected void btnRekening_Click(object sender, EventArgs e)
		{

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
				connection.Close();
			}

			LblSucces.Text = " SUBMIT SUCCESSFULLY";
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
				connection.Close();
			}

			LblSucces.Text = " SUBMIT SUCCESSFULLY";
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
				connection.Close();
			}

			LblSucces.Text = " SUBMIT SUCCESSFULLY";
			//CLEAR();
		}
	}
}