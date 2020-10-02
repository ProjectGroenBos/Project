using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ProjectGroenBos.Schoonmaak_en_Onderhoud
{
    public partial class OnderhoudToevoegen : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020");
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnToevoegen_Click1(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO  [dbo].[Onderhoudsopdracht] (Startdatum,VerwachteEinddatum,Kosten,BungalowNummer,OnderhoudsstatusID,OnderhoudtypeID,DatumvanConstatering)    values(@startdatum, @verwachteeinddatum, @kosten, @bungalownummer, @onderhoudsstatusID, @onderhoudtypeID, @datumvanconstatering)", con);

            cmd.Parameters.Add("@startdatum", SqlDbType.Date).Value = txtStart.Text;
            cmd.Parameters.Add("@verwachteeinddatum", SqlDbType.Date).Value = txtEind.Text;
            cmd.Parameters.Add("@kosten", SqlDbType.Real).Value = txtKosten.Text;
            cmd.Parameters.Add("@bungalownummer", SqlDbType.Int).Value = int.Parse(txtBungalownummer.Text);
            cmd.Parameters.Add("@onderhoudsstatusID", SqlDbType.Int).Value = int.Parse(txtOnderhoudsstatus.Text);
            cmd.Parameters.Add("@onderhoudtypeID", SqlDbType.Int).Value = int.Parse(txtOnderhoudstype.Text);
            cmd.Parameters.Add("@datumvanconstatering", SqlDbType.Date).Value = txtConstatering.Text;



            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}