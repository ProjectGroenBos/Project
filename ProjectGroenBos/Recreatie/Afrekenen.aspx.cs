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
				// Response.Redirect("tafeloverzicht.aspx");
			}

			// Kijken welke totaalprijs hij moet berekenen

		}

		protected void btnRekening_Click(object sender, EventArgs e)
		{
			//Factuurregels plaatsen
			//String commandText = "INSERT INTO [dbo].[Factuurregel] VALUES" + 
			
			// Verbinding met de database maken en een factuur aanmaken voor op rekening

			//string commandText = "INSERT INTO [dbo].[Debiteurenfactuur] ([Datum],[Totaal bedrag],[BetaalmethodeID],[BetaalstatusID],[RetourzendingID],[FactuurtypeID],[Reserveringnummer]) VALUES" +
			//	"(@Datum, @Totaal_bedrag, @BetaalmethodeID, @BetaalstatusID, @RetourzendingID, @FactuurtypeID, @Reserveringnummer),@Offerte";

			//using (SqlConnection connection = new SqlConnection(connectionString))
			//{
			//	SqlCommand command = new SqlCommand(commandText, connection);
			//	command.Parameters.AddWithValue("@Datum", DateTime.Now);
			//	command.Parameters.AddWithValue("@Totaal_bedrag", Tbetaald);
			//	command.Parameters.AddWithValue("@BetaalmethodeID", "5");
			//	command.Parameters.AddWithValue("@BetaalstatusID", "2");
			//	command.Parameters.AddWithValue("@RetourzendingID", ID);
			//	command.Parameters.AddWithValue("@FactuurtypeID", "4");
			//	command.Parameters.AddWithValue("@Offerte", Offerte);
			//	command.Parameters.AddWithValue("@Reserveringnummer", Text);

			//	connection.Open();

			//	command.ExecuteNonQuery();
			//}

			//sqlCon.Close();
			//LblSucces.Text = " SUBMIT SUCCESSFULLY";
			//CLEAR();
		}
		

		protected void btnBetalen_Click(object sender, EventArgs e)
		{
			// Verbinding met de database voor een pin betaling tussen de facatures

			//string commandText = "INSERT INTO [dbo].[Debiteurenfactuur] ([Datum],[Totaal bedrag],[BetaalmethodeID],[BetaalstatusID],[RetourzendingID],[FactuurtypeID]) VALUES" +
			//	"(@Datum, @Totaal_bedrag, @BetaalmethodeID, @BetaalstatusID, @RetourzendingID, @FactuurtypeID),@Offerte";

			//using (SqlConnection connection = new SqlConnection(connectionString))
			//{
			//	SqlCommand command = new SqlCommand(commandText, connection);
			//	command.Parameters.AddWithValue("@Datum", DateTime.Now);
			//	command.Parameters.AddWithValue("@Totaal_bedrag", Tbetaald);
			//	command.Parameters.AddWithValue("@BetaalmethodeID", "2");
			//	command.Parameters.AddWithValue("@BetaalstatusID", "2");
			//	command.Parameters.AddWithValue("@RetourzendingID", ID);
			//	command.Parameters.AddWithValue("@FactuurtypeID", "4");
			//	command.Parameters.AddWithValue("@Offerte", Offerte);

			//	connection.Open();

			//	command.ExecuteNonQuery();
			//}
		}

		protected void btnContant_Click(object sender, EventArgs e)
		{

		}
	}
}