using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class KlantWijzigen : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["gastnummer"] == null)
            {
                Response.Redirect("KlantOverzicht.aspx");
            }
            else
            {
                int gastnummer = int.Parse(Session["gastnummer"].ToString());

                lblGastnummer.Text = gastnummer.ToString();

                txbVoornaam.Text = (string)GridView1.DataKeys[1]["Voornaam"].ToString();

                //txbTussenvoegsel.Text = (string)GridView1.DataKeys[0]["Tussenvoegsel"].ToString();
                //txbAchternaam.Text = (string)GridView1.DataKeys[0]["Achternaam"].ToString();
                //txbGeboortedatum.Text = (string)GridView1.DataKeys[0]["Achternaam"].ToString();
                //txbIBAN.Text = (string)GridView1.DataKeys[0]["Achternaam"].ToString();
               

                //txbEmail.Text = (string)GridView1.DataKeys[0]["Email"].ToString();
                //txbTelefoonnummer.Text = (string)GridView1.DataKeys[0]["Telefoonnummer"].ToString();

                //txbStraatnaam.Text = (string)GridView1.DataKeys[0]["Straatnaam"].ToString();
                //txbHuisnummer.Text = (string)GridView1.DataKeys[0]["Huisnummer"].ToString();
                //txbPostcode.Text = (string)GridView1.DataKeys[0]["POstcode"].ToString();
                //txbWoonplaats.Text = (string)GridView1.DataKeys[0]["Woonplaats"].ToString();
               

               
            }
        }

        protected void btnWijzigen_Click(object sender, EventArgs e)
        {

        }


    }

}


