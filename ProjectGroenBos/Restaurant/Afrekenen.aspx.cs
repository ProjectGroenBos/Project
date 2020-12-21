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
		private DataTable dta;

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
			factuurregels.SelectCommand = "SELECT [Hoeveel], [Naam], [Prijs], [RegelTotaal] FROM [RestaurantAfrekenOvericht] WHERE Status = 'Gereed' and Tafelnr =" + nummer + "";
			SqlDataSourceTotaal.SelectCommand = "SELECT cast(SUM(RegelTotaal) AS DECIMAL(18,2)) AS Totaalbedrag FROM RestaurantAfrekenOvericht WHERE Status = 'Gereed' and Tafelnr =" + nummer + "";

			
		}

		protected void Factuurregelsmaken()
		{
			//foreach(GridViewRow row in GvOrder.Rows)
			//{
			//	//int Aantal = (int)row[0];
			//	//int Prijs = (int)row(2);
			//	String aantal = row.Cells[0].ToString();
			//	String Prijs = row.Cells[2].ToString();
			//}
			// factuurregels aanmaken en in de database zetten
			if (GvOrder.Rows.Count > 0)
			{
				using (SqlConnection sqlCon = new SqlConnection(connectionString))
				{
					for (int i = 0; i < GvOrder.Rows.Count; i++) 
					{

							//uit de tabel de informatie halen die nodig is
							int Aantal = (int)GvOrder.DataKeys[i]["Hoeveel"];
							string Prijsstring = (string)GvOrder.DataKeys[i]["Prijs"].ToString();
							int ID = (int)GvOrder.DataKeys[i]["ID"];

						//Prijs omzetten naar double
							double Prijs = Convert.ToDouble(Prijsstring);

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
					
					connection.Open();
					string selectquery = "SELECT RestaurantReserveringID FROM Item_RestaurantReservering WHERE Tafelnr =" + nummer + "";
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

		private void statusverandering()
		{
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				int nummer = Convert.ToInt16(Session["tafelnr"].ToString());
				

				//Update de status naar klaar zijn
				string Updatequery = "UPDATE Item_RestaurantReservering SET Status = 'Afgerond' WHERE Status = 'Gereed' AND Tafelnr =" + nummer + "";
				SqlCommand cmd = new SqlCommand();
				cmd.CommandText = Updatequery;
				connection.Open();
				cmd.ExecuteNonQuery();
				connection.Close();
			}
		}

		private void Voorraadmuteren()
		{
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				int nummer = Convert.ToInt16(Session["tafelnr"].ToString());


				//Uit de voorraad halen wat er is besteld

			}
		}

		protected void btnRekening_Click(object sender, EventArgs e)
		{
			//factuurregels laten aanmaken
			Factuurregelsmaken();



			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				int nummer = Convert.ToInt16(Session["tafelnr"].ToString());
				//ReserveringsID ophalen
				int resID;
				resID = ReserveringsIDopzoeken();

				//Totaalbedrag ophalen
				int Tot = Convert.ToInt16("SELECT cast(SUM(RegelTotaal) AS DECIMAL(18,2)) AS Totaalbedrag FROM RestaurantAfrekenOvericht WHERE Status = 'Gereed' and Tafelnr =" + nummer + "" );

				// Verbinding met de database maken en een factuur aanmaken voor op rekening
				string cmdText = "INSERT INTO [dbo].[Debiteurenfactuur] ([Datum],[Totaalbedrag],[BetaalmethodeID],[BetaalstatusID],[FactuurtypeID],[RestaurantReserveringID]) VALUES" +
					"(@Datum, @Totaalbedrag, @BetaalmethodeID, @BetaalstatusID, @FactuurtypeID, @RestaurantReserveringID)";
				SqlCommand command = new SqlCommand(cmdText, connection);
				command.Parameters.AddWithValue("@Datum", DateTime.Now);
				command.Parameters.AddWithValue("@Totaalbedrag", Tot);
				command.Parameters.AddWithValue("@BetaalmethodeID", "5");
				command.Parameters.AddWithValue("@BetaalstatusID", "2");
				command.Parameters.AddWithValue("@FactuurtypeID", "4");
				command.Parameters.AddWithValue("@RestaurantReserveringID", resID);

				command.ExecuteNonQuery();
				connection.Close();
			}
			statusverandering();
			Voorraadmuteren();
			LblSucces.Text = " SUBMIT SUCCESSFULLY";
			//CLEAR();

		}


		protected void btnBetalen_Click(object sender, EventArgs e)
		{
			//factuurregels laten aanmaken
			Factuurregelsmaken();


			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				//ReserveringsID ophalen
				int resID;
				resID = ReserveringsIDopzoeken();

				// Verbinding met de database voor een pin betaling tussen de facatures

				string cmdText = "INSERT INTO [dbo].[Debiteurenfactuur] ([Datum],[BetaalmethodeID],[BetaalstatusID],[FactuurtypeID],[RestaurantReserveringID]) VALUES" +
					"(@Datum, @BetaalmethodeID, @BetaalstatusID, @FactuurtypeID, @RestaurantReserveringID)";
				SqlCommand command = new SqlCommand(cmdText, connection);
				command.Parameters.AddWithValue("@Datum", DateTime.Now);
				command.Parameters.AddWithValue("@BetaalmethodeID", "2");
				command.Parameters.AddWithValue("@BetaalstatusID", "2");
				command.Parameters.AddWithValue("@FactuurtypeID", "4");
				command.Parameters.AddWithValue("@RestaurantReserveringID", resID);

				connection.Open();

				command.ExecuteNonQuery();
				connection.Close();
			}
			statusverandering();
			Voorraadmuteren();
			LblSucces.Text = " SUBMIT SUCCESSFULLY";
			//CLEAR();
		}

		protected void btnContant_Click(object sender, EventArgs e)
		{
			//factuurregels laten aanmaken
			Factuurregelsmaken();



			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				//ReserveringsID ophalen
				int resID;
				resID = ReserveringsIDopzoeken();

				// verbinding maken om de factuur af te maken voor contant
				string cmdText = "INSERT INTO [dbo].[Debiteurenfactuur] ([Datum],[BetaalmethodeID],[BetaalstatusID],[FactuurtypeID],[RestaurantReserveringID]) VALUES" +
					"(@Datum, @BetaalmethodeID, @BetaalstatusID, @FactuurtypeID, @RestaurantReserveringID)";
				SqlCommand command = new SqlCommand(cmdText, connection);
				command.Parameters.AddWithValue("@Datum", DateTime.Now);
				command.Parameters.AddWithValue("@BetaalmethodeID", "6");
				command.Parameters.AddWithValue("@BetaalstatusID", "2");
				command.Parameters.AddWithValue("@FactuurtypeID", "4");
				command.Parameters.AddWithValue("@RestaurantReserveringID", resID);

				connection.Open();

				command.ExecuteNonQuery();
				connection.Close();
			}
			statusverandering();
			Voorraadmuteren();
			LblSucces.Text = " SUBMIT SUCCESSFULLY";
			//CLEAR();
		}
	}
}