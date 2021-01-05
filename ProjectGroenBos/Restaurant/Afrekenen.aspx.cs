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

		protected void Page_Load(object sender, EventArgs e)
        {
			functiescheiding();

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
			factuurregels.SelectCommand = "SELECT [Hoeveel], [Naam], [Prijs], [RegelTotaal], [Item_ID] FROM [RestaurantAfrekenOvericht] WHERE Status = 'Gereed' and Tafelnr =" + nummer + "";
			SqlDataSourceTotaal.SelectCommand = "SELECT cast(SUM(RegelTotaal) AS DECIMAL(18,2)) AS Totaalbedrag FROM RestaurantAfrekenOvericht WHERE Status = 'Gereed' and Tafelnr =" + nummer + "";

			//kijken of het op rekening mag of niet
			if (BungalowresID() >= '1')
			{
				btnRekening.Visible = true;
			}
			else
			{
				btnRekening.Visible = false;
			}


		}

		private void functiescheiding()
		{
			//controleren of de ingelogde persoon geautoriseerd is om af te mogen rekenen
			int functieID = int.Parse(Session["Functie"].ToString());

			if (functieID == 49)
			{

			}
			else if (functieID == 50)
			{

			}
			else if (functieID == 57)
			{

			}
			else if (functieID == 63)
			{

			}
			else if (functieID == 65)
			{

			}
			else if (functieID == 66)
			{

			}
			else
			{
				Response.Redirect("~/Restaurant/home.aspx");
			}
		}

		private int debiteurennummer()
		{
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				// Haal aangemaakte nummer van de factuur op
				connection.Open();
				string selectquery = "SELECT TOP (1) Nummer FROM Debiteurenfactuur ORDER BY Nummer DESC";
				SqlCommand sqlComd = new SqlCommand(selectquery, connection);
				SqlDataReader r;
				r = sqlComd.ExecuteReader();

				int debnummer = 0;

				while (r.Read())
				{
					debnummer = (int)r[0];
				}
				connection.Close();
				return debnummer;
			}
		}

		protected void Factuurregelsmaken()
		{
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
							int ID = (int)GvOrder.DataKeys[i]["Item_ID"];

						//Prijs omzetten naar double
							double Prijs = Convert.ToDouble(Prijsstring);

						//Ophalen van de debiteurenfactuurnummer
							int debnummer = debiteurennummer();				

						//Het aanmaken van de orderregel in de database
							sqlCon.Open();
							String factuurregels = "INSERT INTO [dbo].[Factuurregel] (DebiteurenfactuurNummer, Aantal, Prijs, RestaurantItemID) VALUES" + "(@debiteurfactuurnummer, @Aantal, @Prijs, @RestaurantItemID)";
							SqlCommand command = new SqlCommand(factuurregels, sqlCon);
							command.Parameters.AddWithValue("@debiteurfactuurnummer", debnummer);
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

		private int BungalowresID()
		{
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				int nummer = Convert.ToInt16(Session["tafelnr"].ToString());
				// Haal ID van de reservering op het park op

				connection.Open();
				string selectquery = "Select top (1) [BunglowreserveringsID] from RestaurantReservering inner join [dbo].[Item_RestaurantReservering] ON [RestaurantReserveringID] = [ID] where Tafelnr = " + nummer + " Order by Begintijd DESC";
				SqlCommand sqlComd = new SqlCommand(selectquery, connection);
				SqlDataReader r;
				r = sqlComd.ExecuteReader();

				int ResrID = 0;

				// als er geen id is wordt het null
				try
				{
					while (r.Read())
					{
						ResrID = (int)r[0];
					}
					connection.Close();
					return ResrID;
				}
				catch
				{
					connection.Close();
					return ResrID;
				}
			}
		}

		private void statusverandering()
		{
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				int nummer = Convert.ToInt16(Session["tafelnr"].ToString());


				//Update de status naar klaar zijn

				String myquery = "UPDATE Item_RestaurantReservering SET Status= '" + "Afgerond" + "' WHERE Status = 'Gereed' AND Tafelnr =" + nummer + ""; 
				SqlCommand cmd = new SqlCommand();
				cmd.CommandText = myquery;
				cmd.Connection = connection;
				SqlDataAdapter da = new SqlDataAdapter();
				da.SelectCommand = cmd;
				cmd.CommandText = myquery;
				connection.Open();
				cmd.ExecuteNonQuery();
				connection.Close();

			}
		}



		protected void btnRekening_Click(object sender, EventArgs e)
		{



			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				int nummer = Convert.ToInt16(Session["tafelnr"].ToString());
				//ReserveringsID ophalen
				int resID;
				resID = ReserveringsIDopzoeken();

				//Totaalbedrag ophalen
				string Totaalbedrag = (string)GridViewTotaal.DataKeys[0]["TotaalBedrag"].ToString();
				double Tot = Convert.ToDouble(Totaalbedrag);

				//resrervereringsnummer van de klant ophalen
				int Resnummer;
				Resnummer = BungalowresID();

				// Verbinding met de database maken en een factuur aanmaken voor op rekening
				connection.Open();
				string cmdText = "INSERT INTO [dbo].[Debiteurenfactuur] ([Datum],[Totaalbedrag],[BetaalmethodeID],[BetaalstatusID],[FactuurtypeID],[ReserveringNummer], [RestaurantReserveringID]) VALUES" +
					"(@Datum, @Totaalbedrag, @BetaalmethodeID, @BetaalstatusID, @FactuurtypeID, @Resreveringsnummer, @RestaurantReserveringID)";
				SqlCommand command = new SqlCommand(cmdText, connection);
				command.Parameters.AddWithValue("@Datum", DateTime.Now);
				command.Parameters.AddWithValue("@Totaalbedrag", Tot);
				command.Parameters.AddWithValue("@BetaalmethodeID", "5");
				command.Parameters.AddWithValue("@BetaalstatusID", "2");
				command.Parameters.AddWithValue("@FactuurtypeID", "4");
				command.Parameters.AddWithValue("@Resreveringsnummer", Resnummer);
				command.Parameters.AddWithValue("@RestaurantReserveringID", resID);

				command.ExecuteNonQuery();
				connection.Close();
			}
			//factuurregels laten aanmaken
			Factuurregelsmaken();

			//status veranderen
			statusverandering();

			LblSucces.Text = " SUBMIT SUCCESSFULLY";

		}


		protected void btnBetalen_Click(object sender, EventArgs e)
		{

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				//ReserveringsID ophalen
				int resID;
				resID = ReserveringsIDopzoeken();

				// verbinding maken om de factuur af te maken voor contant
				connection.Open();
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
			//factuurregels laten aanmaken
			Factuurregelsmaken();

			//transactieregel invoegen voor financiën
			transactieregel();

			//status veranderen
			statusverandering();

			LblSucces.Text = " SUBMIT SUCCESSFULLY";


		}

		protected void btnContant_Click(object sender, EventArgs e)
		{

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				//ReserveringsID ophalen
				int resID;
				resID = ReserveringsIDopzoeken();

				// verbinding maken om de factuur af te maken voor contant
				connection.Open();
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
			//factuurregels laten aanmaken
			Factuurregelsmaken();

			//transactieregel invoegen voor financiën
			transactieregel();

			//status veranderen
			statusverandering();

			LblSucces.Text = " SUBMIT SUCCESSFULLY";

		}

		private void transactieregel()
		{
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				//totaalbedrag ophalen ( heeft hier problemen mee omdat het een real in de databse is)
				string Totaalbedrag = (string)GridViewTotaal.DataKeys[0]["TotaalBedrag"].ToString();
				double Tot = Convert.ToDouble(Totaalbedrag);

				//Debiteurennummer ophalen
				int debID;
				debID = debiteurennummer();

				// verbinding maken om de factuur af te maken voor contant
				connection.Open();
				string cmdText = "INSERT INTO [dbo].[Transactie] ([Datum],[Aan],[Bedrag],[Omschrijving],[DebiteurenfactuurNummer],[BankrekeningBanknummer],[TypeID]) VALUES" +
					"(@Datum, @Aan, @Bedrag, @Omschrijving, @DebiteurenfactuurNummer, @BankrekeningBanknummer, @TypeID)";
				SqlCommand command = new SqlCommand(cmdText, connection);
				command.Parameters.AddWithValue("@Datum", DateTime.Now);
				command.Parameters.AddWithValue("@Aan", "Groenbos");
				command.Parameters.AddWithValue("@Bedrag", Tot);
				command.Parameters.AddWithValue("@Omschrijving", "Restaurant");
				command.Parameters.AddWithValue("@DebiteurenfactuurNummer", debID);
				command.Parameters.AddWithValue("@BankrekeningBanknummer", "NL32 RABO 0220.96.13.200");
				command.Parameters.AddWithValue("@TypeID", "2");

				command.ExecuteNonQuery();
				connection.Close();
			}
		}
	}
}