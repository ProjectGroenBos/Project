using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Recreatie
{
    public partial class Overzicht : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection(Helper.HelperClass.DatabaseConnectieString);
        DateTime datum;
        protected void Page_Load(object sender, EventArgs e)
        {
            lbldatumNu.Text = DateTime.Now.ToString("dd" + "-" + "MM" + "-" + "yy");

            if (!IsPostBack)
            {
                SqlDataSource1.SelectCommand = string.Format("select dbo.Activiteit.Naam , dbo.Activiteit.Locatie,dbo.Recreatieprogramma_Activiteit.RecreatieprogrammaDatum, dbo.Activiteit.Tijd, dbo.Activiteit.[Maximaal aantal], dbo.Activiteit.FaciliteitID from dbo.Activiteit join dbo.Recreatieprogramma_Activiteit on dbo.Activiteit.Nummer = dbo.Recreatieprogramma_Activiteit.ActiviteitNummer where dbo.Recreatieprogramma_Activiteit.RecreatieprogrammaDatum = '{0}'", DateTime.Now.ToShortDateString());
                gvActiveiten.DataBind();

            }
        }

        protected void OnButtonPress(object sender, EventArgs e)
        {
            if (Session["datacount"] == null)
            {
                Session["datacount"] = 0;
            }
            Session["datacount"] = ((int)Session["datacount"]) + 1;
            lbldatumNu.Text = DateTime.Today.AddDays((int)Session["datacount"]).ToString("dd" + "-"+ "MM" + "-" + "yy");
            datum = DateTime.Today.AddDays((int)Session["datacount"]);

            CheckDate(datum);
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