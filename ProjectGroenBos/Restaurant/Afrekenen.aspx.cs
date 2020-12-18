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
			// factuurregels aanmaken en inde database zetten
			if (dta.Rows.Count > 0)
			{
				using (SqlConnection sqlCon = new SqlConnection(connectionString))
				{
					foreach (DataRow rij in dta.Rows)
					{
						//uit de tabel de informatie halen die nodig is
						int Aantal = (int)rij[0];
						int Prijs = (int)rij[2];
						int ID = (int)rij[4];


						sqlCon.Open();
						String factuurregels = "INSERT INTO [dbo].[Factuurregel] (Aantal, Prijs, RestaurantItemID) VALUES" + "(@Aantal, @Prijs, @RestaurantItemID)";
						SqlCommand command = new SqlCommand(factuurregels, sqlCon);
						command.Parameters.AddWithValue("@Aantal", Aantal);
						command.Parameters.AddWithValue("@Prijs", Prijs);
						command.Parameters.AddWithValue("@RestaurantItemID", ID);

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

		private int ReserveringsIDopzoeken()
		{
				using (SqlConnection connection = new SqlConnection(connectionString))
				{
					int nummer = Convert.ToInt16(Session["tafelnr"].ToString());
					// Haal aangemaakte ID van de reservering op
					//verbinding klopt nog niet en de status moet op een andere manier.
					connection.Open();
					string selectquery = "SELECT ReserveringsID FROM [dbo].[RestaurantReservering] WHERE Tafelnr =" + nummer + "And Where Status = Actief";
					SqlCommand sqlComd = new SqlCommand(selectquery, connection);
					SqlDataReader r;
					r = sqlComd.ExecuteReader();

					int ResrID = 0;

					while (r.Read())
                    {
                      ResrID = (int)r[0];
                    }
                    connection.Close();
					return ResrID;
				}
			
		}

		protected void btnRekening_Click(object sender, EventArgs e)
		{
			//factuurregels laten aanmaken
			Factuurregelsmaken();



			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				int resID;
				resID = ReserveringsIDopzoeken();
				
				// Verbinding met de database maken en een factuur aanmaken voor op rekening
				string cmdText = "INSERT INTO [dbo].[Debiteurenfactuur] ([Datum],[BetaalmethodeID],[BetaalstatusID],[FactuurtypeID],[RestaurantReserveringID]) VALUES" +
					"(@Datum, @BetaalmethodeID, @BetaalstatusID, @FactuurtypeID, @RestaurantReserveringID)";
				SqlCommand command = new SqlCommand(cmdText, connection);
				command.Parameters.AddWithValue("@Datum", DateTime.Now);
				command.Parameters.AddWithValue("@BetaalmethodeID", "5");
				command.Parameters.AddWithValue("@BetaalstatusID", "2");
				command.Parameters.AddWithValue("@FactuurtypeID", "4");
				command.Parameters.AddWithValue("@RestaurantReserveringID", resID);

				command.ExecuteNonQuery();
				connection.Close();
			}

			LblSucces.Text = " SUBMIT SUCCESSFULLY";
			//CLEAR();

		}


		protected void btnBetalen_Click(object sender, EventArgs e)
		{
			//factuurregels laten aanmaken
			Factuurregelsmaken();

			// Verbinding met de database voor een pin betaling tussen de facatures

			string cmdText = "INSERT INTO [dbo].[Debiteurenfactuur] ([Datum],[BetaalmethodeID],[BetaalstatusID],[FactuurtypeID],[RestaurantReserveringID]) VALUES" +
				"(@Datum, @BetaalmethodeID, @BetaalstatusID, @FactuurtypeID, @RestaurantReserveringID)";

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
			//factuurregels laten aanmaken
			Factuurregelsmaken();

			// verbinding maken om de factuur af te maken voor contant
			string cmdText = "INSERT INTO [dbo].[Debiteurenfactuur] ([Datum],[BetaalmethodeID],[BetaalstatusID],[FactuurtypeID],[RestaurantReserveringID]) VALUES" +
				"(@Datum, @BetaalmethodeID, @BetaalstatusID, @FactuurtypeID, @RestaurantReserveringID)";

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