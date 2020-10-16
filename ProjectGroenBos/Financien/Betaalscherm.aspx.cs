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
    public partial class Betaalscherm : System.Web.UI.Page
    {
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

                SqlCommand cmd = new SqlCommand("select * from Crediteurenfactuur inner join Leverancier on Leverancier.Naam = Crediteurenfactuur.[Betalen aan]", con);
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



            string commandText = "insert into Transactie (Datum, Aan, Bedrag, Omschrijving, CrediteurenfactuurNummer, BankrekeningBanknummer, TypeID) Values ((SELECT CONVERT(date, getdate())), '@Winkel', CAST(@bedrag AS REAL), '@omschrijving', @Nummer, 1, 1)";

            using (SqlConnection connection = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand(commandText, connection);
                command.Parameters.AddWithValue("@Winkel", Winkel);
                command.Parameters.AddWithValue("@Bedrag", txtbedrag.ToString());
                command.Parameters.AddWithValue("@Omschrijving", Winkel);
                command.Parameters.AddWithValue("@Nummer", nummer);


                connection.Open();

                command.ExecuteNonQuery();
            }

        }
    }


}