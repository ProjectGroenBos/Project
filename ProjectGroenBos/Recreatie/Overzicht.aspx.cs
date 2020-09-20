using System;
using System.Collections.Generic;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            var cultureInfo = new CultureInfo("en-US");
            if (Session["datacount"] == null && Session["achteruit"] == null)
            {
                Session["datacount"] = 0;
                Session["achteruit"] = 0;
            }
            string dateResult = datum.ToString("MM/dd/yyy");
            lblActiviteiten.Text = dateResult;
            dt = DateTime.ParseExact(dateResult, "MM/dd/yyyy", null);

            if (!IsPostBack)
            {
                SqlDataSource1.SelectCommand = string.Format("select dbo.Activiteit.Naam , dbo.Activiteit.Locatie,dbo.Recreatieprogramma_Activiteit.RecreatieprogrammaDatum, dbo.Activiteit.Tijd, dbo.Activiteit.[Maximaal aantal], dbo.Activiteit.FaciliteitID from dbo.Activiteit join dbo.Recreatieprogramma_Activiteit on dbo.Activiteit.Nummer = dbo.Recreatieprogramma_Activiteit.ActiviteitNummer where dbo.Recreatieprogramma_Activiteit.RecreatieprogrammaDatum = '{0}'", datum);
                gvActiveiten.DataBind();

            }
            //lbldatumNu.Text = dateResult;
            lbldatumNu.Text = DateTime.Now.ToString("dd" + "-" + "MM" + "-" + "yy");
        }

        protected void OnButtonPress(object sender, EventArgs e)
        {

            Button button = (Button)sender;
            string buttonId = button.ID.Trim();



            if (buttonId == "forwards")
            {
                Session["datacount"] = ((int)Session["datacount"]) + 1;
                lbldatumNu.Text = DateTime.Today.AddDays((int)Session["datacount"]).ToString("dd" + "-" + "MM" + "-" + "yy");
                dt = DateTime.Today.AddDays((int)Session["datacount"]);
            }
            if (buttonId == "backwards")
            {
                Session["achteruit"] = ((int)Session["achteruit"]) - 1;
                Session["datacount"] = ((int)Session["achteruit"]) + 1;
                lbldatumNu.Text = DateTime.Today.AddDays((int)Session["achteruit"]).ToString("dd" + "-" + "MM" + "-" + "yy");
                dt = DateTime.Today.AddDays((int)Session["achteruit"]);
               
            }

                CheckDate(dt);
            }

            protected void CheckDate(DateTime datumactiviteit)
            {
                try
                {
                    SqlDataSource1.SelectCommand = string.Format("select dbo.Activiteit.Naam , dbo.Activiteit.Locatie,dbo.Recreatieprogramma_Activiteit.RecreatieprogrammaDatum, dbo.Activiteit.Tijd, dbo.Activiteit.[Maximaal aantal], dbo.Activiteit.FaciliteitID from dbo.Activiteit join dbo.Recreatieprogramma_Activiteit on dbo.Activiteit.Nummer = dbo.Recreatieprogramma_Activiteit.ActiviteitNummer where dbo.Recreatieprogramma_Activiteit.RecreatieprogrammaDatum = '{0}'", datumactiviteit);
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
        }
    } 