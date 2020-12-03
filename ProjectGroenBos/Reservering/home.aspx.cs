using System;

namespace ProjectGroenBos.Reservering
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["controle"] != null)
            {
                lbluitkomst.Text = "De klacht van de bezoeker is succelvol opgeslagen.";
            }
            else if (Session["controle2"] != null)
            {
                lbluitkomst.Text = "De klacht van de gast is succesvol opgeslagen.";
            }
            else if (Session["controle4"] != null)
            {
                lbluitkomst.Text = "De reservering is aangemaakt.";
            }
            else if (Session["controle5"] != null)
            {
                lbluitkomst.Text = "De reservering is geannuleerd.";
            }
            else if (Session["controle6"] != null)
            {
                lbluitkomst.Text = "De reservering is gewijzigd.";
            }
        }
    }
}