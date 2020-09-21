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
        int counter;
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            var cultureInfo = new CultureInfo("en-US");
            if (Session["datacount"] == null && Session["achteruit"] == null)
            {
                Session["datacount"] = 0;
                Session["achteruit"] = 0;
            }
                
            if (!IsPostBack)
            {
                SqlDataSource1.SelectCommand = string.Format("select dbo.Activiteit.Naam , dbo.Activiteit.Locatie,dbo.Recreatieprogramma_Activiteit.RecreatieprogrammaDatum, dbo.Activiteit.Tijd, dbo.Activiteit.[Maximaal aantal], dbo.Activiteit.FaciliteitID from dbo.Activiteit join dbo.Recreatieprogramma_Activiteit on dbo.Activiteit.Nummer = dbo.Recreatieprogramma_Activiteit.ActiviteitNummer where dbo.Recreatieprogramma_Activiteit.RecreatieprogrammaDatum = '{0}'", datum.ToString("MM/dd/yyyy"));
                gvActiveiten.DataBind();

            }
            //lbldatumNu.Text = dateResult;
            lbldatumNu.Text = DateTime.Now.ToString("dd" + "-" + "MM" + "-" + "yy");
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
                    SqlDataSource1.SelectCommand = string.Format("select dbo.Activiteit.Naam , dbo.Activiteit.Locatie,dbo.Recreatieprogramma_Activiteit.RecreatieprogrammaDatum, dbo.Activiteit.Tijd, dbo.Activiteit.[Maximaal aantal], dbo.Activiteit.FaciliteitID from dbo.Activiteit join dbo.Recreatieprogramma_Activiteit on dbo.Activiteit.Nummer = dbo.Recreatieprogramma_Activiteit.ActiviteitNummer where dbo.Recreatieprogramma_Activiteit.RecreatieprogrammaDatum = '{0}'", dt.ToString("MM/dd/yyyy"));
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
                SqlDataSource1.SelectCommand = string.Format("select datepart (week, dbo.Recreatieprogramma_Activiteit.RecreatieprogrammaDatum)as Weeknummer, dbo.Activiteit.Naam , dbo.Faciliteit.Omschrijving as Locatie, dbo.Recreatieprogramma_Activiteit.RecreatieprogrammaDatum, dbo.Activiteit.Tijd, dbo.Activiteit.[Maximaal aantal] from dbo.Activiteit join dbo.Recreatieprogramma_Activiteit on dbo.Activiteit.Nummer = dbo.Recreatieprogramma_Activiteit.ActiviteitNummer join dbo.Faciliteit on dbo.Activiteit.FaciliteitID = dbo.Faciliteit.ID where datediff(day, getdate(), [RecreatieprogrammaDatum]) = {0}", dt.ToString("MM/dd/yyyy"));
                gvActiveiten.DataBind();
            }
            if (CbWeekOverzicht.Checked == true)
            {
                SqlDataSource1.SelectCommand = string.Format("select datepart (week, dbo.Recreatieprogramma_Activiteit.RecreatieprogrammaDatum)as Weeknummer, dbo.Activiteit.Naam , dbo.Activiteit.Locatie,dbo.Recreatieprogramma_Activiteit.RecreatieprogrammaDatum, dbo.Activiteit.Tijd, dbo.Activiteit.[Maximaal aantal], dbo.Activiteit.FaciliteitID from dbo.Activiteit join dbo.Recreatieprogramma_Activiteit on dbo.Activiteit.Nummer = dbo.Recreatieprogramma_Activiteit.ActiviteitNummer where datediff(week, getdate(), [RecreatieprogrammaDatum]) = 0", dt.ToString("MM/dd/yyyy"));
                gvActiveiten.DataBind();
            }
        }
    }
    } 