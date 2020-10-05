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
            String nummer = DropDownList1.SelectedValue.ToString();
            RequiredFieldValidator1.Validate();
            RequiredFieldValidator2.Validate();
            RequiredFieldValidator3.Validate();
            RequiredFieldValidator4.Validate();
            RequiredFieldValidator5.Validate();
            RequiredFieldValidator6.Validate();
            RequiredFieldValidator7.Validate();

            if (RequiredFieldValidator1.IsValid && RequiredFieldValidator2.IsValid && RequiredFieldValidator3.IsValid && RequiredFieldValidator4.IsValid && RequiredFieldValidator5.IsValid && RequiredFieldValidator6.IsValid && RequiredFieldValidator7.IsValid)
            {
                if (RegularExpressionValidator1.IsValid && RegularExpressionValidator2.IsValid && RegularExpressionValidator3.IsValid)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO  [dbo].[Onderhoudsopdracht] (Startdatum,VerwachteEinddatum,Kosten,BungalowNummer,OnderhoudsstatusID,Onderhoudtype,DatumvanConstatering,MedewerkerNummer)    values(@startdatum, @verwachteeinddatum, @kosten, @bungalownummer, @onderhoudsstatusID, @onderhoudtype, @datumvanconstatering, @medewerkernummer)", con);

                    cmd.Parameters.AddWithValue("@startdatum", txtStart.Text);
                    cmd.Parameters.AddWithValue("@verwachteeinddatum", txtEind.Text);
                    cmd.Parameters.AddWithValue("@kosten", txtKosten.Text);
                    cmd.Parameters.AddWithValue("@bungalownummer", int.Parse(txtBungalownummer.Text));
                    cmd.Parameters.AddWithValue("@onderhoudsstatusID", txtOnderhoudsstatus.Text);
                    cmd.Parameters.AddWithValue("@onderhoudtype", txtOnderhoudstype.Text);
                    cmd.Parameters.AddWithValue("@datumvanconstatering", txtConstatering.Text);
                    cmd.Parameters.AddWithValue("@medewerkernummer", int.Parse(nummer));


                    cmd.ExecuteNonQuery();
                    con.Close();

                    txtStart.Text = "";
                    txtEind.Text = "";
                    txtKosten.Text = "";
                    txtBungalownummer.Text = "";
                    txtOnderhoudsstatus.Text = "";
                    txtOnderhoudstype.Text = "";
                    txtConstatering.Text = "";
                }
            }

            //con.Open();
            //SqlCommand cmd = new SqlCommand("INSERT INTO  [dbo].[Onderhoudsopdracht] (Startdatum,VerwachteEinddatum,Kosten,BungalowNummer,OnderhoudsstatusID,OnderhoudtypeID,DatumvanConstatering)    values(@startdatum, @verwachteeinddatum, @kosten, @bungalownummer, @onderhoudsstatusID, @onderhoudtypeID, @datumvanconstatering)", con);

            //cmd.Parameters.Add("@startdatum", SqlDbType.Date).Value = txtStart.Text;
            //cmd.Parameters.Add("@verwachteeinddatum", SqlDbType.Date).Value = txtEind.Text;
            //cmd.Parameters.Add("@kosten", SqlDbType.Real).Value = txtKosten.Text;
            //cmd.Parameters.Add("@bungalownummer", SqlDbType.Int).Value = int.Parse(txtBungalownummer.Text);
            //cmd.Parameters.Add("@onderhoudsstatusID", SqlDbType.Int).Value = int.Parse(txtOnderhoudsstatus.Text);
            //cmd.Parameters.Add("@onderhoudtypeID", SqlDbType.Int).Value = int.Parse(txtOnderhoudstype.Text);
            //cmd.Parameters.Add("@datumvanconstatering", SqlDbType.Date).Value = txtConstatering.Text;



            //cmd.ExecuteNonQuery();
            //con.Close();
        }

        protected void btnTerugOOverzicht_Click(object sender, EventArgs e)
        {
            Response.Redirect("OnderhoudsOverzicht.aspx");
        }
    }
}