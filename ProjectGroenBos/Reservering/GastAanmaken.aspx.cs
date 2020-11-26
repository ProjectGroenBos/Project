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
            string woonplaast = txbWoonplaats.Text;
            string straat = txbStraatnaam.Text;
            string huisnummer = txbHuisnummer.Text;
            string postcode = txbPostcode.Text;

            string land = DropDownList2.Text;

            DateTime control = new DateTime();
            control = DateTime.Today;
            control.AddYears(-18);
            control.ToShortDateString();

            DateTime geboortedatum = new DateTime();
            geboortedatum = DateTime.Parse(txbGeboortedatum.Text);
            geboortedatum.ToShortDateString();

            if (land == "")
            {
                CustomValidator1.IsValid = false;
            }

            if (geboortedatum <= control)
            {
                CustomValidator2.IsValid = false;
                CustomValidator2.Visible = true;
            }
            else if (geboortedatum > control)
            {
                CustomValidator2.IsValid = true;
                CustomValidator2.Visible = false;
            }



        }
    }
}