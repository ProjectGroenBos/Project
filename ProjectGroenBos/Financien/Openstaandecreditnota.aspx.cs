﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Financien
{
    public partial class Betaalscherm : System.Web.UI.Page
    {
        double totaalbedrag2;
        double bedrag2;
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
            HiddenField nummers = (HiddenField)Repeater1.Items[0].FindControl("Nummer");
            string nummer = nummers.Value;

            SqlConnection con = new SqlConnection(constr);
            con.Open();
            Label label1 = (Label)Repeater1.Items[0].FindControl("Lblreedsbetaald");
            SqlCommand ophaal = new SqlCommand("select CAST(SUM(Bedrag) AS real) as [Reeds betaald] from Transactie where CrediteurenfactuurNummer = @nummer", con);
            ophaal.Parameters.AddWithValue("@nummer", nummer);
            SqlDataReader drfactuur = ophaal.ExecuteReader();
            label1.Text = drfactuur["Reeds betaald"].ToString();
            drfactuur.Close();
            con.Close();
        }

        protected void btnToevoegen_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

         //   int gridviewnr = int.Parse(btn.CommandName);

            TextBox txtbedrag = (TextBox)Repeater1.Items[0].FindControl("txtBedrag");
            

            HiddenField fnummers = (HiddenField)Repeater1.Items[0].FindControl("Winkel");
            string Winkel = fnummers.Value;

            HiddenField nummers = (HiddenField)Repeater1.Items[0].FindControl("Nummer");
            string nummer = nummers.Value;

            HiddenField Totaalbedragen = (HiddenField)Repeater1.Items[0].FindControl("Totaalbedrag");
            string Totaalbedrag = Totaalbedragen.Value;
            totaalbedrag2 = double.Parse(Totaalbedrag);
            string bedrag = txtbedrag.Text;
            bedrag2 = double.Parse(bedrag);

            bedrag = bedrag.Replace(",", ".");

            string commandText = "insert into Transactie (Datum, Aan, Bedrag, Omschrijving, CrediteurenfactuurNummer, BankrekeningBanknummer, TypeID) Values ((SELECT CONVERT(date, getdate())), @Winkel, convert(real, @bedrag), @omschrijving, @Nummer, 1, 1)";

            using (SqlConnection connection = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand(commandText, connection);
                command.Parameters.AddWithValue("@Winkel", Winkel);
                command.Parameters.AddWithValue("@Bedrag", bedrag);
                command.Parameters.AddWithValue("@Omschrijving", Winkel);
                command.Parameters.AddWithValue("@Nummer", nummer);


                connection.Open();

                command.ExecuteNonQuery();
            }

            if(totaalbedrag2 >= bedrag2)
                //niet vergeten bedrag2 + reeds betaald op te tellen
            {
                SqlConnection con = new SqlConnection(constr);
                con.Open();
                string status = "Update Crediteurenfactuur set FactuurstatusID = 2 where Nummer = @nummer";
                SqlDataAdapter adapter4 = new SqlDataAdapter();
                adapter4.UpdateCommand = new SqlCommand(status, con);
                adapter4.UpdateCommand.Parameters.AddWithValue("@nummer", nummer);
                int doehet = adapter4.UpdateCommand.ExecuteNonQuery();
                con.Close();
            }

            if(totaalbedrag2 < bedrag2 && bedrag2 >0)
                //niet vergeten reeeds betaald
            {
                SqlConnection con = new SqlConnection(constr);
                con.Open();
                string status = "Update Crediteurenfactuur set FactuurstatusID = 11 where Nummer = @nummer";
                SqlDataAdapter adapter4 = new SqlDataAdapter();
                adapter4.UpdateCommand = new SqlCommand(status, con);
                adapter4.UpdateCommand.Parameters.AddWithValue("@nummer", nummer);
                int doehet = adapter4.UpdateCommand.ExecuteNonQuery();
                con.Close();
            }

            if (bedrag2 == 0)
            //niet vergeten reeeds betaald
            {
                SqlConnection con = new SqlConnection(constr);
                con.Open();
                string status = "Update Crediteurenfactuur set FactuurstatusID = 4 where Nummer = @nummer";
                SqlDataAdapter adapter4 = new SqlDataAdapter();
                adapter4.UpdateCommand = new SqlCommand(status, con);
                adapter4.UpdateCommand.Parameters.AddWithValue("@nummer", nummer);
                int doehet = adapter4.UpdateCommand.ExecuteNonQuery();
                con.Close();
            }






            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "betalingsuccess();", true);

        }
    }


}