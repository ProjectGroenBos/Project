using System;
using System.Web.UI;

namespace ProjectGroenBos.Reservering
{
    public partial class ReserveringenMedewerkerGegevens : System.Web.UI.Page
    {
        //checks voor postcode
        string nlCheck = "^([0-9]{4}) {1}([A-Z]{2})$";
        string deCheck = "^[0-9]{5}$";
        string frCheck = "^[0-9]{5}$";
        string beCheck = "^(?:(?:[1-9])(?:[0-9]{3}))$";

        string telefoonnummer;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Personen"] == null)
            {

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Uw sessie is verlopen, u moet helaas de gegevens opnieuw invullen.')", true);
                Response.Redirect("Huisjemedewerker.aspx");
            }
            else
            {
                //testen of de sessie overgaat
                //Label1.Text = Session["Personen"].ToString();
            }
        }

        protected void btnBevestigen_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            if (DropDownList1.SelectedValue == "Leeg")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('U woont in een land, dit is vereist voor het telefoonnummer.')", true);
            }
            Session["Voornaam"] = txbNaam.Text;
            Session["Tussenvoegsel"] = txbTussenvoegsel.Text;
            Session["Achternaam"] = txbAchternaam.Text;
            Session["Email"] = txbEmail.Text;
            Session["Telefoonnummer"] = telefoonnummer + txbTelefoonnummer.Text;
            Session["Opmerkingen"] = txbOpmerkingen.Text;
            Session["Straat"] = txbStraat.Text;
            Session["Huisnummer"] = txbHuisnummer.Text;
            Session["Postcode"] = txbPostcode.Text;
            Session["Land"] = DropDownList1.SelectedValue;
            Session["Geboortedatum"] = txbGeboortedatum.Text;

            Response.Redirect("ReserveringMedewerkerNachtregister.aspx");
            //check of telefoonnummer goed gaat
            //Label1.Text = Session["Telefoonnummer"].ToString();
        }



        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "Nederland")
            {
                RegularExpressionValidator10.ValidationExpression = nlCheck;
                telefoonnummer = "+31";
            }
            else if (DropDownList1.SelectedValue == "Duitsland")
            {
                RegularExpressionValidator10.ValidationExpression = deCheck;
                telefoonnummer = "+49";
            }
            else if (DropDownList1.SelectedValue == "Frankrijk")
            {
                RegularExpressionValidator10.ValidationExpression = frCheck;
                telefoonnummer = "+33";
            }
            else if (DropDownList1.SelectedValue == "België")
            {
                RegularExpressionValidator10.ValidationExpression = beCheck;
                telefoonnummer = "+32";
            }
            else if(DropDownList1.SelectedValue == "Leeg")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('U woont in een land, dit is vereist voor het telefoonnummer.')", true);
            }
        }
    }
}