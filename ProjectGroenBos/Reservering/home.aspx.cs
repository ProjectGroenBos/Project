using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ProjectGroenBos.Reservering
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["controle"] != null)
            //{
            //    lbluitkomst.Text = "De klacht van de bezoeker is succelvol opgeslagen.";
            //}
            //else if (Session["controle2"] != null)
            //{
            //    lbluitkomst.Text = "De klacht van de gast is succesvol opgeslagen.";
            //}
            //else if (Session["controle4"] != null)
            //{
            //    lbluitkomst.Text = "De reservering is aangemaakt.";
            //}
            //else if (Session["controle5"] != null)
            //{
            //    lbluitkomst.Text = "De reservering is geannuleerd.";
            //}
            //else if (Session["controle6"] != null)
            //{
            //    lbluitkomst.Text = "De reservering is gewijzigd.";
            //}
            //else
            //{
            //    lbluitkomst.Text = "";
            //}


            if (GridView3.Rows.Count==0)
            {
                lblAankomend.Text = "De komende 3 dagen komen er geen gasten binnen.";
            }
            if (GridView4.Rows.Count == 0)
            {
                lblVertrekkend.Text = "De komende 3 dagen gaan er geen gasten vertrekken.";
            }
            
        }

        
    }
}