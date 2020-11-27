using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Schoonmaak_en_Onderhoud
{
    public partial class SchouwingToevoegen : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnToevoegen_Click(object sender, EventArgs e)
        {
            RFVSchouwingsdatum.Validate();
            RequiredFieldValidator1.Validate();
            RequiredFieldValidator2.Validate();

            if (RequiredFieldValidator2.IsValid && RFVSchouwingsdatum.IsValid && RequiredFieldValidator1.IsValid)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO  [dbo].[Schouwing] (BungalowID,Schouwingsdatum,Omschrijving,Status)    values(@BungalowID, @Schouwingsdatum, @Omschrijving, @status)", con);

                String status = DropDownList2.SelectedValue.ToString();
                String nummer = DropDownList1.SelectedValue.ToString();
                DateTime datum1 = DateTime.Parse(TxtSchouwingsDatum.Text);
                cmd.Parameters.AddWithValue("@Schouwingsdatum", datum1);
                cmd.Parameters.AddWithValue("@BungalowID", nummer);
                cmd.Parameters.AddWithValue("@Omschrijving", TxtOmschrijving.Text);
                cmd.Parameters.AddWithValue("@status", status);

                cmd.ExecuteNonQuery();
                con.Close();

                TxtSchouwingsDatum.Text = "";
                
                TxtOmschrijving.Text = "";

                Response.Redirect("SchouwingsOverzicht.aspx");
            }
        }

        protected void BtnTerugNaarOverzicht_Click(object sender, EventArgs e)
        {           
            Response.Redirect("SchouwingsOverzicht.aspx");       
        }
    }
}