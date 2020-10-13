using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Schoonmaak_en_Onderhoud
{
    public partial class PlanningToevoegen : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnToevoegen_Click1(object sender, EventArgs e)
        {
            String nummer = DropDownList1.SelectedValue.ToString();
            DateTime datum = DateTime.Parse(txtSDatum.Text);
            RequiredFieldValidator1.Validate();
            RequiredFieldValidator2.Validate();
            RequiredFieldValidator3.Validate();
            RegularExpressionValidator1.Validate();
            RangeValidator1.Validate();

            if (RangeValidator1.IsValid && RequiredFieldValidator1.IsValid && RequiredFieldValidator2.IsValid && RequiredFieldValidator3.IsValid && RegularExpressionValidator1.IsValid)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO  [dbo].[Schoonmaakopdracht] (Datum,Omschrijving,BungalowNummer,MedewerkerNummer)    values(@datum, @omschrijving, @bungalownummer, @medewerkernummer)", con);

                cmd.Parameters.AddWithValue("@datum", datum);
                cmd.Parameters.AddWithValue("@omschrijving", txtOmschr.Text);
                cmd.Parameters.AddWithValue("@bungalownummer", int.Parse(txtBungalownummer.Text));
                cmd.Parameters.AddWithValue("@medewerkernummer", int.Parse(nummer));

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("PlanningsOverzicht.aspx");
            }
        }

        protected void btnTerugNO_Click(object sender, EventArgs e)
        {
            Response.Redirect("PlanningsOverzicht.aspx");
        }
    }
}