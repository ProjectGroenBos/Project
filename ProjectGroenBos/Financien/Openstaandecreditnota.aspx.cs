using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Financien
{
    public partial class Openstaandecreditnota : System.Web.UI.Page
    {
        double totaalbedrag2;
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;
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

                SqlCommand cmd = new SqlCommand("select * from Crediteurenfactuur inner join Leverancier on Leverancier.Naam = Crediteurenfactuur.[Betalen aan] union select Crediteurenfactuur.*, 1 as ID, Naam, Adres, Contactpersoon, Telefoonnummer, Email, Postcode, Plaats from Crediteurenfactuur inner join Aannemers on Aannemers.Naam = Crediteurenfactuur.[Betalen aan]", con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                rpModals.DataSource = ds;
                rpModals.DataBind();
                Repeater1.DataSource = ds;
                Repeater1.DataBind();

                con.Close();
            }
        }

        protected void btnrekening_Click(object sender, EventArgs e)
        {

        }

        protected void btnToevoegen2_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            int gridviewnr = int.Parse(btn.CommandName);

            

            HiddenField fnummers = (HiddenField)Repeater1.Items[gridviewnr].FindControl("Winkel");
            string Winkel = fnummers.Value;

            HiddenField nummers = (HiddenField)Repeater1.Items[gridviewnr].FindControl("Nummer");
            string nummer = nummers.Value;

            HiddenField Totaalbedragen = (HiddenField)Repeater1.Items[gridviewnr].FindControl("Totaalbedrag");
            string Totaalbedrag = Totaalbedragen.Value;
            totaalbedrag2 = double.Parse(Totaalbedrag);
            string nieuwtotaal = Totaalbedrag.Replace(",", ".");
         

            string commandText = "insert into Transactie (Datum, Aan, Bedrag, Omschrijving, CrediteurenfactuurNummer, BankrekeningBanknummer, TypeID) Values ((SELECT CONVERT(date, getdate())), @Winkel, convert(real, @bedrag), @omschrijving, @Nummer, 1, 1)";

            using (SqlConnection connection = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand(commandText, connection);
                command.Parameters.AddWithValue("@Winkel", Winkel);
                command.Parameters.AddWithValue("@Bedrag", nieuwtotaal);
                command.Parameters.AddWithValue("@Omschrijving", Winkel);
                command.Parameters.AddWithValue("@Nummer", nummer);


                connection.Open();

                command.ExecuteNonQuery();
            }

            SqlConnection con = new SqlConnection(constr);
            con.Open();
            string status = "Update Crediteurenfactuur set FactuurstatusID = 2 where Nummer = @nummer";
            SqlDataAdapter adapter4 = new SqlDataAdapter();
            adapter4.UpdateCommand = new SqlCommand(status, con);
            adapter4.UpdateCommand.Parameters.AddWithValue("@nummer", nummer);
            int doehet = adapter4.UpdateCommand.ExecuteNonQuery();
            con.Close();


            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "betalingsuccess();", true);
            gvRekeningen.DataBind();

        }

        protected void btnBetalen_Click(object sender, EventArgs e)
        {

            string modal = "#modal2" + ((Button)sender).CommandArgument;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('"+modal+"');", true);
        }

        protected void btnRekeningen_Click(object sender, EventArgs e)
        {
            Repeater();
            string querie = "select factuurstatusID from Crediteurenfactuur where Nummer = @nummer";
            SqlConnection connection = new SqlConnection(constr);
            SqlCommand command = new SqlCommand(querie, connection);
            HiddenField nummers = (HiddenField)Repeater1.Items[0].FindControl("Nummer");
            string nummer = nummers.Value;
            command.Parameters.AddWithValue("@nummer", nummer);
            connection.Open();
            SqlDataReader drfactuur = command.ExecuteReader();
            string nummergaatfout = drfactuur["FactuurstatusID"].ToString();
            connection.Close();

            string modal = "#modal" + ((Button)sender).CommandArgument;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('" + modal + "');", true);
        }
    }
}