using System;

namespace ProjectGroenBos.Reservering
{
    public partial class ReserveringenMedewerkerGelukt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["prijs"] != null)
            {
                double prijs = double.Parse(Session["prijs"].ToString());

                lblBedrag.Text = prijs.ToString();
            }
            else
            {
                Response.Redirect("huisjemedewerker.aspx");
            }
        }
            
    }
}