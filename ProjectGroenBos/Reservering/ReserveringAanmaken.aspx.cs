using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ProjectGroenBos.Reservering
{
    public partial class ReserveringAanmaken : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //kijken of er op de andere pagina activiteit is geweest
            if (Session["gastnummer"] == null)
            {
                Response.Redirect("GastSelecteren.aspx");
            }
            else
            {
                lblGastnummer.Text = Session["gastnummer"].ToString();
            }
        }

        protected void btnZoek_Click(object sender, EventArgs e)
        {
            //variabelen voor controles
            string aankomst = txbAankomstdatum.Text;
            string aankomst2 = aankomst.Replace("/", "-");

            string vertrek = txbVertrekdatum.Text;
            string vertrek2 = vertrek.Replace("/", "-");

            DateTime aankomstDatum = DateTime.Parse(aankomst2);
            DateTime vertrekDatum = DateTime.Parse(vertrek2);
            DateTime vandaag = DateTime.Today;

            aankomstDatum.ToShortDateString();
            vertrekDatum.ToShortDateString();
            vandaag.ToShortDateString();

            int aantalPersonen = int.Parse(txbAantalPersonen.Text);

            if (aankomstDatum < vertrekDatum && aankomstDatum > vandaag && vertrekDatum > vandaag)
            {

                //dataset om de gridview te vullen
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
                {
                    con.Open();
                    string query = "select * from  [dbo].[ZoekHuisjes](@GewensteAankomstDatum, @GewensteVertrekDatum, @personen)";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@GewensteAankomstDatum", aankomstDatum);
                    cmd.Parameters.AddWithValue("@GewensteVertrekDatum", vertrekDatum);
                    cmd.Parameters.AddWithValue("@personen", aantalPersonen);
                    cmd.ExecuteNonQuery();

                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    con.Close();

                }
            }
            else if (aankomstDatum == vandaag || vertrekDatum == vandaag)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('U kunt niet vertrekken of aankomen op de dag van reservering.')", true);
            }
            else if (vertrekDatum == aankomstDatum)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vertrekdatum is later als de aankomstdatum. Controleer deze nog even alstublieft.')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('U kunt niet voor het verleden reserveren. Probeer het opnieuw.')", true);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //huisjenummer selecteren
            lblHuisjenummer.Text = (string)GridView1.SelectedRow.Cells[1].Text;
        }
    }
}