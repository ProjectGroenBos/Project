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
            else
            {
                txbAchternaam.Text = Session["achternaam"].ToString();
                txbTelefoonnummer.Text = Session["telefoonnummer"].ToString();
                txbEmail.Text = Session["email"].ToString();
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

            if (land == "")
            {
                CustomValidator1.IsValid = false;
            }

            if(CheckDatum() == true)
            {

            }

            

        }

        private bool CheckDatum()
        {
            try
            {
                
                DateTime control = new DateTime();
                DateTime geboortedatum = new DateTime();

                geboortedatum = DateTime.Parse(txbGeboortedatum.Text);
                geboortedatum.ToShortDateString();

                control = DateTime.Today;
                control.AddYears(-18);
                control.ToShortDateString();

                if (control >= geboortedatum)
                {
                    return true;
                }
                else
                {
                    return false;
                } 
            }
            catch
            {
                return false;
            }
        }
    }
}