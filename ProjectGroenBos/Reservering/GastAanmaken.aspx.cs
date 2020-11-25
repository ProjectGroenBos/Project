using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class GastAanmaken : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["controle"] == null)
            {
                Response.Redirect("GastSelecteren.aspx");
            }
        }

        protected void btnAanmaken_Click(object sender, EventArgs e)
        {
           
            string voornaam = txbVoornaam.Text;
            string tussenvoegsel = txbTussenvoegsel.Text;
            string achternaam = txbAchternaam.Text;
            string telefoonnummer = txbTelefoonnummer.Text;
            string email = txbEmail.Text;
            DateTime geboortedatum = new DateTime();
            geboortedatum = Convert.ToDateTime(txbGeboortedatum.Text);
            geboortedatum.ToShortDateString();
            string woonplaast = txbWoonplaats.Text;
            string straat = txbStraatnaam.Text;
            string huisnummer = txbHuisnummer.Text;
            string postcode = txbPostcode.Text;
        }
    }
}