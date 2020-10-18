using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Financien
{
    public partial class Factuurinvoerscherm : System.Web.UI.Page
    {
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        

        protected void btnToevoegen_Click(object sender, EventArgs e)
        {

            int ID = int.Parse(txbORDERID.Text);
            int Offerte= int.Parse(txtbOfferte.Text);
            int Tbetaald = int.Parse(txbTotaalbedrag.Text);

            if (dlFactuurtype.SelectedItem.Text == "Inkooporder")
            {
                string commandText = "INSERT INTO [dbo].[Crediteurenfactuur] ([Datum],[Betalen aan],[Totaal bedrag],[Termijn],[Omschrijving betaalcondities],[InkooporderID],[FactuurstatusID],[IBAN]) VALUES" +
                    "(@Datum, @Betalen_aan, @Totaal_bedrag, @Termijn, @Omschrijving, @InkooporderID, @FactuurstatusID, @IBAN)";

                using (SqlConnection connection = new SqlConnection(constr))
                {
                    SqlCommand command = new SqlCommand(commandText, connection);
                    command.Parameters.AddWithValue("@Datum", DateTime.Now);
                    command.Parameters.AddWithValue("@Betalen_aan", txbLeverancier.Text);
                    command.Parameters.AddWithValue("@Totaal_bedrag", Tbetaald);
                    command.Parameters.AddWithValue("@Termijn", txbTermijn.Text);
                    command.Parameters.AddWithValue("@Omschrijving", dlFactuurtype.SelectedItem.Text);
                    command.Parameters.AddWithValue("@InkooporderID", ID);
                    command.Parameters.AddWithValue("@FactuurstatusID", "4");
                    command.Parameters.AddWithValue("@IBAN", txbIBAN.Text);

                    connection.Open();

                    command.ExecuteNonQuery();
                }
            }

            else if (dlFactuurtype.SelectedItem.Text == "Onderhoudsopdracht")
            {
                string commandText = "INSERT INTO [dbo].[Crediteurenfactuur] ([Datum],[Betalen aan],[Offerte],[Totaal bedrag],[Termijn],[Omschrijving betaalcondities],[OnderhoudsopdrachtNummer],[FactuurstatusID],[IBAN]) VALUES" +
                    "(@Datum, @Betalen_aan, @Totaal_bedrag, @Termijn, @Omschrijving, @OnderhoudsopdrachtNummer, @FactuurstatusID, @IBAN),@Offerte";

                using (SqlConnection connection = new SqlConnection(constr))
                {
                    SqlCommand command = new SqlCommand(commandText, connection);
                    command.Parameters.AddWithValue("@Datum", DateTime.Now);
                    command.Parameters.AddWithValue("@Betalen_aan", txbLeverancier.Text);
                    command.Parameters.AddWithValue("@Totaal_bedrag", Tbetaald);
                    command.Parameters.AddWithValue("@Termijn", txbTermijn.Text);
                    command.Parameters.AddWithValue("@Omschrijving", dlFactuurtype.SelectedItem.Text);
                    command.Parameters.AddWithValue("@OnderhoudsopdrachtNummer", ID);
                    command.Parameters.AddWithValue("@FactuurstatusID", "4");
                    command.Parameters.AddWithValue("@Offerte", Offerte);
                    command.Parameters.AddWithValue("@IBAN", txbIBAN.Text);

                    connection.Open();

                    command.ExecuteNonQuery();
                }
            }
           
            else 
            {
                string commandText = "INSERT INTO [dbo].[Crediteurenfactuur] ([Datum],[Betalen aan],[Totaal bedrag],[Termijn],[Omschrijving betaalcondities],[FactuurstatusID],[IBAN]) VALUES" +
                    "(@Datum, @Betalen_aan, @Totaal_bedrag, @Termijn, @Omschrijving, @Offerte, @FactuurstatusID, @IBAN)";

                using (SqlConnection connection = new SqlConnection(constr))
                {
                    SqlCommand command = new SqlCommand(commandText, connection);
                    command.Parameters.AddWithValue("@Datum", DateTime.Now);
                    command.Parameters.AddWithValue("@Betalen_aan", txbLeverancier.Text);
                    command.Parameters.AddWithValue("@Totaal_bedrag", Tbetaald);     
                    command.Parameters.AddWithValue("@Termijn", txbTermijn.Text);
                    command.Parameters.AddWithValue("@Omschrijving", dlFactuurtype.SelectedItem.Text);
                    command.Parameters.AddWithValue("@FactuurstatusID", "4");
                    command.Parameters.AddWithValue("@IBAN", txbIBAN.Text);

                    connection.Open();

                    command.ExecuteNonQuery();
                }
            }
        }
        protected void BtnRetour_Click(object sender, EventArgs e)
        {

            int inkoopID = int.Parse(txtbInkoopID.Text);
            int leverancierID = int.Parse(txtbLeverancierID.Text);
            int totaalprijs = int.Parse(txt.Text);
            int hoeveelheid = int.Parse(txtbHoeveelheid.Text);

            string commandText = "insert into Retourzendingregel (Hoeveelheid, InkooporderID, LeverancierID, Totaalprijsregel)  VALUES" +
                "(@Hoeveelheid, @InkooporderID, @LeverancierID, @Totaalprijsregel)";

            using (SqlConnection connection = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand(commandText, connection);
                command.Parameters.AddWithValue("@Hoeveelheid",hoeveelheid);
                command.Parameters.AddWithValue("@InkooporderID", inkoopID);
                command.Parameters.AddWithValue("@LeverancierID", leverancierID);
                command.Parameters.AddWithValue("@Totaalprijsregel", totaalprijs);

                connection.Open();

                command.ExecuteNonQuery();
            }
        }
    }
}