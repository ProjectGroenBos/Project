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
            //String status = DropDownList2.SelectedValue.ToString();
            //String type = DropDownList3.SelectedValue.ToString();
            //DateTime datum1 = DateTime.Parse(txtStart.Text);
            //DateTime datum2 = DateTime.Parse(txtStart.Text);
            //DateTime datum3 = DateTime.Parse(txtStart.Text);

            RequiredFieldValidator1.Validate();
            RequiredFieldValidator2.Validate();
            RequiredFieldValidator3.Validate();
            RequiredFieldValidator4.Validate();
            RequiredFieldValidator7.Validate();
            RequiredFieldValidator8.Validate();
            RequiredFieldValidator9.Validate();

            if (RequiredFieldValidator1.IsValid && RequiredFieldValidator2.IsValid && RequiredFieldValidator3.IsValid && RequiredFieldValidator4.IsValid && RequiredFieldValidator7.IsValid)
            {
                if (RegularExpressionValidator1.IsValid && RegularExpressionValidator2.IsValid && RegularExpressionValidator3.IsValid && RegularExpressionValidator4.IsValid && RegularExpressionValidator5.IsValid && RangeValidator1.IsValid && CompareValidator1.IsValid && RequiredFieldValidator7.IsValid && RequiredFieldValidator8.IsValid && RequiredFieldValidator9.IsValid)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO  [dbo].[Onderhoudsopdracht] (Startdatum,VerwachteEinddatum,Kosten,BungalowNummer,OnderhoudsstatusID,Onderhoudtype,DatumvanConstatering)    values(@startdatum, @verwachteeinddatum, @kosten, @bungalownummer, @onderhoudsstatusID, @onderhoudtype, @datumvanconstatering)", con);

                    String status = DropDownList2.SelectedValue.ToString();
                    String type = DropDownList3.SelectedValue.ToString();
                    DateTime datum1 = DateTime.Parse(txtStart.Text);
                    DateTime datum2 = DateTime.Parse(txtStart.Text);
                    DateTime datum3 = DateTime.Parse(txtStart.Text);
                    cmd.Parameters.AddWithValue("@startdatum", datum1);
                    cmd.Parameters.AddWithValue("@verwachteeinddatum", datum2);
                    cmd.Parameters.AddWithValue("@kosten", txtKosten.Text);
                    cmd.Parameters.AddWithValue("@bungalownummer", int.Parse(txtBungalownummer.Text));
                    cmd.Parameters.AddWithValue("@onderhoudsstatusID", status);
                    cmd.Parameters.AddWithValue("@onderhoudtype", type);
                    cmd.Parameters.AddWithValue("@datumvanconstatering", datum3);


                    cmd.ExecuteNonQuery();
                    con.Close();

                    txtStart.Text = "";
                    txtEind.Text = "";
                    txtKosten.Text = "";
                    txtBungalownummer.Text = "";
                    txtConstatering.Text = "";

                    Response.Redirect("OnderhoudsOverzicht.aspx");
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

        protected void btnTerugNaarO_Click(object sender, EventArgs e)
        {
            Response.Redirect("OnderhoudsOverzicht.aspx");
        }
    }
}