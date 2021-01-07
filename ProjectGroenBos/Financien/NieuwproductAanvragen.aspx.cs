using ProjectGroenBos.Restaurant;
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
    public partial class NieuwproductAanvragen : System.Web.UI.Page
    {
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;
        decimal Voorraad;
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

                SqlCommand cmd = new SqlCommand("select ID, Naam, Opmerking, Aantal from InkoopAanvraagRegelNieuwProduct", con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                Rptoevoegen.DataSource = ds;
                Rptoevoegen.DataBind();

                con.Close();
            }
        }

        protected void btnToevoegen_Click(object sender, EventArgs e)
        {

            Button btn = sender as Button;

            int gridviewnr = int.Parse(btn.CommandName);
            TextBox nummers = (TextBox)Rptoevoegen.Items[gridviewnr].FindControl("txbnaam");
            string txbNaam = nummers.Text;

            TextBox nummers2 = (TextBox)Rptoevoegen.Items[gridviewnr].FindControl("txbPrijs");
            string txbPrijs = nummers2.Text;
            txbPrijs = txbPrijs.Replace(",", ".");

            TextBox nummers3 = (TextBox)Rptoevoegen.Items[gridviewnr].FindControl("txbMinimumVoorraad");
            string txbMinimumVoorraad = nummers3.Text;

            TextBox nummers4 = (TextBox)Rptoevoegen.Items[gridviewnr].FindControl("txbOmschrijving");
            string txbOmschrijving = nummers4.Text;

            DropDownList nummers5 = (DropDownList)Rptoevoegen.Items[gridviewnr].FindControl("DropDownList1");
            string dropdown = nummers5.SelectedItem.Value;

            string commandText = "INSERT INTO [dbo].[Voorraad] ([Aantal],[Naam],[Prijs],[Minimum voorraad],[Omschrijving],[LeverancierID]) VALUES" +
                "(@Aantal, @Naam, @Prijs,@min, @Omschrijving, @Leverancier); SELECT SCOPE_IDENTITY()";

            using (SqlConnection connection = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand(commandText, connection);
                command.Parameters.AddWithValue("@Aantal", 0);
                command.Parameters.AddWithValue("@Naam", txbNaam);
                command.Parameters.AddWithValue("@Prijs", txbPrijs);
                command.Parameters.AddWithValue("@min", txbMinimumVoorraad);
                command.Parameters.AddWithValue("@Omschrijving", txbOmschrijving);
                command.Parameters.AddWithValue("@Leverancier", dropdown);

                connection.Open();

                Voorraad = (decimal)command.ExecuteScalar();
                connection.Close();
            }

            using (SqlConnection connection = new SqlConnection(constr))
            {
                DateTime d = DateTime.Now;
                string datum = d.ToString("dd/MM/yyyy");

                string commandText2 = "INSERT INTO [dbo].[InkoopOrderAanvraag] ([Datum],[InkoopOrderAanvraagStatusID],[AfdelingID],[LeverancierID],[Opmerking]) VALUES(@Datum, @Status, @Afd, @Lev, @Opm); SELECT SCOPE_IDENTITY()";
                SqlCommand command = new SqlCommand(commandText2, connection);
                command.Parameters.AddWithValue("@Datum", datum);
                command.Parameters.AddWithValue("@Status", 1);
                command.Parameters.AddWithValue("@Afd", 1);
                command.Parameters.AddWithValue("@Lev", dropdown);
                command.Parameters.AddWithValue("@Opm", "kappen met die playstations");

                connection.Open();

                decimal modified = (decimal)command.ExecuteScalar();

                HiddenField Aantal2 = (HiddenField)Rptoevoegen.Items[gridviewnr].FindControl("Aantal");
                string Aantal = Aantal2.Value;

                HiddenField ID2 = (HiddenField)Rptoevoegen.Items[gridviewnr].FindControl("ID");
                string ID = ID2.Value;

                string commandText3 = "INSERT INTO [dbo].[InkoopAanvraagRegels] ([VoorraadID],[Aantal],[InkoopOrderAanvraagNummer],[Opmerking]) VALUES(@Voorraad, @Aantal, @Inknum, @opm)";
                SqlCommand command2 = new SqlCommand(commandText3, connection);
                command2.Parameters.AddWithValue("@Voorraad", Voorraad);
                command2.Parameters.AddWithValue("@Aantal", Aantal);
                command2.Parameters.AddWithValue("@Inknum", modified);
                command2.Parameters.AddWithValue("@Opm", "kappen met die playstations");

                command2.ExecuteNonQuery();

                SqlCommand cmd = new SqlCommand("UPDATE InkoopAanvraagRegelNieuwProduct SET Referentie = @aanvraagnummer WHERE ID = @nummer;", connection);
                cmd.Parameters.AddWithValue("@aanvraagnummer", modified);
                cmd.Parameters.AddWithValue("@nummer", ID);
                cmd.ExecuteNonQuery();
                connection.Close();
            }

            gvLeveranciersOverzicht.DataBind();
        }

        protected void btnToevoegen2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Financien/Leverancier.aspx");
        }
    }
}