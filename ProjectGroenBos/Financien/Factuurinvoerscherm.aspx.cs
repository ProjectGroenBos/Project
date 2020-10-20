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
using System.ComponentModel;
using System.Drawing;
using System.Threading.Tasks;


namespace ProjectGroenBos.Financien
{
    public partial class Factuurinvoerscherm : System.Web.UI.Page
    {
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            dropdownLeverancier();
            dropdownLeverancierAanemers();
        }
        private void dropdownLeverancier()
        {
            string commandText = "select* from Leverancier";
            using (SqlConnection connection = new SqlConnection(constr))
            {
                SqlDataAdapter adpt = new SqlDataAdapter(commandText, connection);
                DataTable dt = new DataTable();
                adpt.Fill(dt);
                leverancier.DataSource = dt;
                leverancier.DataBind();
                leverancier.DataTextField = "Naam";
                leverancier.DataValueField = "ID";
                leverancier.DataBind();
            }
        }
        private void dropdownLeverancierAanemers()
        {
            string commandText = "select Leverancier.Naam from Leverancier union select Aannemers.Naam from Aannemers";
            using (SqlConnection connection = new SqlConnection(constr))
            {
                SqlDataAdapter adpt = new SqlDataAdapter(commandText, connection);
                DataTable dt = new DataTable();
                adpt.Fill(dt);
                leverancieraanemer.DataSource = dt;
                leverancieraanemer.DataBind();
                leverancieraanemer.DataTextField = "Naam";
                leverancieraanemer.DataValueField = "Naam";
                leverancieraanemer.DataBind();
            }
        }


        protected void btnToevoegen_Click(object sender, EventArgs e)
        {

            int ID = int.Parse(txbORDERID.Text);
            double Tbetaald = double.Parse(txbTotaalbedrag.Text);

            if (dlFactuurtype.SelectedItem.Text == "Inkooporder")
            {
                string commandText = "INSERT INTO [dbo].[Crediteurenfactuur] ([Datum],[Betalen aan],[Totaal bedrag],[Termijn],[Omschrijving betaalcondities],[InkooporderID],[FactuurstatusID],[IBAN]) VALUES" +
                    "(@Datum, @Betalen_aan, @Totaal_bedrag, @Termijn, @Omschrijving, @InkooporderID, @FactuurstatusID, @IBAN)";

                using (SqlConnection connection = new SqlConnection(constr))
                {
                    SqlCommand command = new SqlCommand(commandText, connection);
                    command.Parameters.AddWithValue("@Datum", DateTime.Now);
                    command.Parameters.AddWithValue("@Betalen_aan",leverancieraanemer.SelectedItem.Text);
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
            
            else if (dlFactuurtype.SelectedItem.Text == "Offerte")
            {
                try
                {
                    int Offerte = int.Parse(txtbOfferte.Text);
                    string commandText = "INSERT INTO [dbo].[Crediteurenfactuur] ([Datum],[Betalen aan],[OfferteNummer],[Totaal bedrag],[Termijn],[Omschrijving betaalcondities],[OnderhoudsopdrachtNummer],[FactuurstatusID],[IBAN]) VALUES" +
                        "(@Datum, @Betalen_aan, @Totaal_bedrag, @Termijn, @Omschrijving, @OnderhoudsopdrachtNummer, @FactuurstatusID, @IBAN,@OfferteNummer)";

                    using (SqlConnection connection = new SqlConnection(constr))

                    {
                        SqlCommand command = new SqlCommand(commandText, connection);
                        command.Parameters.AddWithValue("@Datum", DateTime.Now);
                        command.Parameters.AddWithValue("@Betalen_aan", leverancieraanemer.SelectedItem.Text);
                        command.Parameters.AddWithValue("@Totaal_bedrag", Tbetaald);
                        command.Parameters.AddWithValue("@Termijn", txbTermijn.Text);
                        command.Parameters.AddWithValue("@Omschrijving", dlFactuurtype.SelectedItem.Text);
                        command.Parameters.AddWithValue("@OnderhoudsopdrachtNummer", ID);
                        command.Parameters.AddWithValue("@FactuurstatusID", "4");
                        command.Parameters.AddWithValue("@OfferteNummer", Offerte);
                        command.Parameters.AddWithValue("@IBAN", txbIBAN.Text);

                        connection.Open();

                        command.ExecuteNonQuery();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Error occured: " + ex.Message.ToString());
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
                    command.Parameters.AddWithValue("@Betalen_aan", leverancieraanemer.SelectedItem.Text);
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
            double totaalprijs = double.Parse(txt.Text);
            int hoeveelheid = int.Parse(txtbHoeveelheid.Text);

            string commandText = "insert into Retourzendingregel (Hoeveelheid, InkooporderID, LeverancierID, Totaalprijsregel,RetourzendingID)  VALUES" +
                "(@Hoeveelheid, @InkooporderID, @LeverancierID, @Totaalprijsregel,@RetourzendingID)";

            using (SqlConnection connection = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand(commandText, connection);
                command.Parameters.AddWithValue("@Hoeveelheid",hoeveelheid);
                command.Parameters.AddWithValue("@InkooporderID", inkoopID);
                command.Parameters.AddWithValue("@LeverancierID", leverancier.SelectedValue);
                command.Parameters.AddWithValue("@Totaalprijsregel", totaalprijs);
                command.Parameters.AddWithValue("@RetourzendingID", "1");

                connection.Open();

                command.ExecuteNonQuery();
            }
        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView2.SelectedRow;
            txbORDERID.Text = row.Cells[1].Text;
            txbTotaalbedrag.Text = row.Cells[2].Text;

        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            txtbInkoopID.Text = row.Cells[1].Text;
            txt.Text = row.Cells[2].Text;
           txtbHoeveelheid.Text = row.Cells[3].Text;

        }
    }
}