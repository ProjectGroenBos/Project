using System;
using System.Web.UI;

namespace ProjectGroenBos.Reservering
{
    public partial class Huisjemedewerker : System.Web.UI.Page
    {

        //int personen = 2;

        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
            //    SqlConnection con = new SqlConnection(@"Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;User ID=BIM022020;Password=BiM@IH2020");
            //    // Display data in Gridview
            //    SqlCommand cmd = con.CreateCommand();
            //    cmd.CommandType = CommandType.Text;
            //    cmd.CommandText = "select bun.Nummer, bun.[Maximale bezetting], bun.Borgsom, bun.BungalowtypeCode, loc.Omschrijving from [dbo].[bungalow] bun inner join [dbo].[Locatie] loc on bun.LocatieNaam = loc.Naam where bun.[Maximale bezetting] = @personen;";
            //    cmd.Parameters.AddWithValue("@personen", personen);
            //    cmd.ExecuteNonQuery();
            //    DataTable dt = new DataTable();
            //    SqlDataAdapter da = new SqlDataAdapter(cmd);
            //    da.Fill(dt);
            //    GridView1.DataSource = dt;
            //    GridView1.DataBind();
            //}
            //catch
            //{
            //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Er ging iets mis')", true);
            //}
        }
        protected void btnBevestigen_Click(object sender, EventArgs e)
        {
            //Bij het klikken op de knop worden de gegevens gecheckt en worden gegevens doorgestuurd om het later te gebruiken.

            int aantalPersonen = int.Parse(txbAantalPersonen.Text);
            string aankomstCookie = txbAankomstdatum.Text;
            string vertrekCookie = txbVertrekdatum.Text;
            int bungalow = int.Parse(txbHuisje.Text);
          

            DateTime aankomst = DateTime.Parse(txbAankomstdatum.Text);
            DateTime vertrek = DateTime.Parse(txbVertrekdatum.Text);
            DateTime vandaag = DateTime.Today;

            aankomst.ToShortDateString();
            vertrek.ToShortDateString();
            vandaag.ToShortDateString();


            if (aankomst < vertrek && aankomst > vandaag && vertrek > vandaag)
            {
                Session["Personen"] = txbAantalPersonen.Text;
                Session["Aankomst"] = txbAankomstdatum.Text;
                Session["Vertrek"] = txbVertrekdatum.Text;
                Session["Bungalow"] = bungalow.ToString();

                Response.Redirect("ReserveringenMedewerkerGegevens.aspx");
            }
            else if (aankomst == vandaag || vertrek == vandaag)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('U kunt niet vertrekken of aankomen op de dag van reservering.')", true);
            }
            else if (vertrek == aankomst)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vertrekdatum is later als de aankomstdatum. Controleer deze nog even alstublieft.')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('U kunt niet voor het verleden reserveren. Probeer het opnieuw.')", true);
            }
        }




        //protected void txbAantalPersonen_TextChanged(object sender, EventArgs e)
        //{
        //    if (int.Parse(txbAantalPersonen.Text) == 1 || int.Parse(txbAantalPersonen.Text) == 2)
        //    {
        //        personen = 2;
        //    }
        //    else if (int.Parse(txbAantalPersonen.Text) == 3 || int.Parse(txbAantalPersonen.Text) == 4)
        //    {
        //        personen = 4;
        //    }
        //    else if (int.Parse(txbAantalPersonen.Text) == 5 || int.Parse(txbAantalPersonen.Text) == 6)
        //    {
        //        personen = 6;
        //    }
        //    else
        //    {
        //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Te veel personen. Probeer wat minder personen.')", true);
        //    }

        //    try
        //    {
        //        SqlConnection con = new SqlConnection(@"Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;User ID=BIM022020;Password=BiM@IH2020");
        //        // Display data in Gridview
        //        SqlCommand cmd = con.CreateCommand();
        //        cmd.CommandType = CommandType.Text;
        //        cmd.CommandText = "Select * from [dbo].[Bungalow]";
        //        cmd.Parameters.AddWithValue("@personen", personen);
        //        cmd.ExecuteNonQuery();
        //        DataTable dt = new DataTable();
        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        da.Fill(dt);
        //        GridView1.DataSource = dt;
        //        GridView1.DataBind();
        //    }
        //    catch
        //    {
        //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Er ging iets mis')", true);
        //    }
        //}
    }
}