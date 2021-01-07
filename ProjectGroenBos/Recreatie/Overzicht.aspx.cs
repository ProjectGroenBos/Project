using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Recreatie
{
    public partial class Overzicht : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection(Helper.HelperClass.DatabaseConnectieString);

        DateTime datum = DateTime.Now;
        DateTime dt;
        SqlCommand cmdDag = new SqlCommand();
        SqlCommand cmdWeek = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            Security();
            cmdDag = new SqlCommand("sp_Recreatie_VulDagLijst", cnn);
            cmdWeek = new SqlCommand("sp_Recreatie_VulWeekLijst", cnn);
            if (Session["datacount"] == null && Session["achteruit"] == null)
            {
                Session["datacount"] = 0;
                Session["achteruit"] = 0;
            }


            if (!IsPostBack)
            {
                //cmdDag.Parameters.Add(new SqlParameter("@DatumFormat", datum.ToString("MM/dd/yyyy")));
                //cnn.Open();
                //cmdDag.CommandType = CommandType.StoredProcedure;
                SqlDataSource1.SelectCommand = string.Format("select datepart (week, dbo.Activiteit.Datum)as Weeknummer, dbo.Activiteit.Naam, dbo.Faciliteit.Omschrijving as Locatie,dbo.Activiteit.Locatie as Specificatie, dbo.Activiteit.Inschrijfkosten, dbo.Activiteit.Datum, dbo.Activiteit.Begintijd, dbo.Activiteit.Eindtijd, dbo.Activiteit.[Maximaal aantal], dbo.Medewerker.Naam as Naam_Medewerker from dbo.Activiteit join dbo.Faciliteit on dbo.Activiteit.FaciliteitID = dbo.Faciliteit.ID JOIN dbo.Medewerker on dbo.Activiteit.MedewerkerID = dbo.Medewerker.Nummer where dbo.Activiteit.Datum = '{0}'", datum.ToString("MM/dd/yyyy"));
                //dataTable.Load(cmdDag.ExecuteReader());
                //a.Fill(ds);
                //gvActiveiten.DataSource = ds;
                gvActiveiten.DataBind();

            }
            //lbldatumNu.Text = dateResult;
            lbldatumNu.Text = DateTime.Now.ToString("dd" + "-" + "MM" + "-" + "yy");
        }

            protected void Security()
            {
                string functie = (string)Session["Functie"];
                if (functie == "13" || functie == "1")
                {
                    if (functie == "1")
                    {
                    }
                }

                else
                {
                    Response.Redirect("~/Financien/Inlogscherm.aspx");
                }
            }
        protected void OnButtonPress(object sender, EventArgs e)
        {

            Button button = (Button)sender;
            string buttonId = button.ID.Trim();
            if (buttonId == "Forward")
            {
                Session["datacount"] = ((int)Session["datacount"]) + 1;
                lbldatumNu.Text = DateTime.Now.AddDays((int)Session["datacount"]).ToString("dd" + "-" + "MM" + "-" + "yy");
                dt = DateTime.Now.AddDays((int)Session["datacount"]);
            }
            if (buttonId == "backwards")
            {
                Session["datacount"] = ((int)Session["datacount"]) - 1;
                lbldatumNu.Text = DateTime.Now.AddDays((int)Session["datacount"]).ToString("dd" + "-" + "MM" + "-" + "yy");
                dt = DateTime.Now.AddDays((int)Session["datacount"]);
            }


            CheckDate(dt);
        }

        protected void CheckDate(DateTime datumactiviteit)
        {
            dt = datumactiviteit;
            try
            {
                SqlDataSource1.SelectCommand = string.Format("select datepart (week, dbo.Activiteit.Datum)as Weeknummer, dbo.Activiteit.Naam , dbo.Faciliteit.Omschrijving as Locatie,dbo.Activiteit.Locatie as Specificatie, dbo.Activiteit.Inschrijfkosten, dbo.Activiteit.Datum, dbo.Activiteit.Begintijd, dbo.Activiteit.Eindtijd, dbo.Activiteit.[Maximaal aantal], dbo.Medewerker.Naam as Naam_Medewerker from dbo.Activiteit join dbo.Faciliteit on dbo.Activiteit.FaciliteitID = dbo.Faciliteit.ID JOIN dbo.Medewerker on dbo.Activiteit.MedewerkerID = dbo.Medewerker.Nummer where dbo.Activiteit.Datum = '{0}'", dt.ToString("MM/dd/yyyy"));
                gvActiveiten.DataBind();
            }
            catch
            {
                //lbldatumNu.Text = "Error";
            }
            finally
            {
            }
        }

        protected void CbWeekOverzicht_CheckedChanged(object sender, EventArgs e)
        {

            if (CbWeekOverzicht.Checked == false)
            {
                Forward.Enabled = true;
                backwards.Enabled = true;
                SqlDataSource1.SelectCommand = string.Format("select datepart (week, dbo.Activiteit.Datum)as Weeknummer, dbo.Activiteit.Naam , dbo.Faciliteit.Omschrijving as Locatie,dbo.Activiteit.Locatie as Specificatie, dbo.Activiteit.Inschrijfkosten, dbo.Activiteit.Datum, dbo.Activiteit.Begintijd, dbo.Activiteit.Eindtijd, dbo.Activiteit.[Maximaal aantal], dbo.Medewerker.Naam as Naam_Medewerker from dbo.Activiteit join dbo.Faciliteit on dbo.Activiteit.FaciliteitID = dbo.Faciliteit.ID JOIN dbo.Medewerker on dbo.Activiteit.MedewerkerID = dbo.Medewerker.Nummer where dbo.Activiteit.Datum = '{0}'", datum.ToString("MM/dd/yyyy"));
                gvActiveiten.DataBind();
            }
            if (CbWeekOverzicht.Checked == true)
            {
                lbldatumNu.Text = "Weekoverzicht";
                Forward.Enabled = false;
                backwards.Enabled = false;
                SqlDataSource1.SelectCommand = string.Format("SELECT datepart (week, dbo.Activiteit.Datum)AS  Weeknummer, dbo.Activiteit.Naam , dbo.Faciliteit.Omschrijving AS Locatie,dbo.Activiteit.Locatie AS Specificatie, dbo.Activiteit.Inschrijfkosten, dbo.Activiteit.Datum, dbo.Activiteit.Begintijd, dbo.Activiteit.Eindtijd, dbo.Activiteit.[Maximaal aantal], dbo.Medewerker.Naam as Naam_Medewerker FROM dbo.Activiteit JOIN dbo.Faciliteit on dbo.Activiteit.FaciliteitID = dbo.Faciliteit.ID JOIN dbo.Medewerker on dbo.Activiteit.MedewerkerID = dbo.Medewerker.Nummer WHERE datediff(week, getdate(), dbo.Activiteit.Datum) = 0", dt.ToString("MM/dd/yyyy"));
                gvActiveiten.DataBind();
            }
        }
    }
}