using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace ProjectGroenBos.Reservering
{
    public partial class KlantWijzigen : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {




            if (Session["gastnummer"] == null)
            {
                Response.Redirect("Gastoverzicht.aspx");

            }
            else
            {
                int gastnummer = int.Parse(Session["gastnummer"].ToString());

                lblGastnummer.Text = gastnummer.ToString();

                if (!Page.IsPostBack)
                {

                    foreach (GridViewRow gr in GridView1.Rows)
                    {

                        txbVoornaam.Text = gr.Cells[1].Text;
                        txbTussenvoegsel.Text = gr.Cells[2].Text;
                        txbAchternaam.Text = gr.Cells[3].Text;
                        txbGeboortedatum.Text = gr.Cells[0].Text;
                        txbIBAN.Text = gr.Cells[6].Text;
                        txbEmail.Text = gr.Cells[5].Text;
                        txbStraatnaam.Text = gr.Cells[7].Text;
                        txbHuisnummer.Text = gr.Cells[8].Text;
                        txbPostcode.Text = gr.Cells[9].Text;
                        DropDownList2.Text = gr.Cells[10].Text;
                        txbWoonplaats.Text = gr.Cells[11].Text;

                        if (txbTussenvoegsel.Text == "&nbsp;")
                        {
                            txbTussenvoegsel.Text = "";
                        }

                    }


                }

                GridView1.Visible = false;
            }

        }

        protected void btnWijzigen_Click(object sender, EventArgs e)
        {
            string straatnaam = txbStraatnaam.Text;
            string huisnummer = txbHuisnummer.Text;
            string postcode = txbPostcode.Text;
            string land = DropDownList2.Text;
            string woonplaats = txbWoonplaats.Text;

            string voornaam = txbVoornaam.Text;
            string tussenvoegsel = txbTussenvoegsel.Text;
            string achternaam = txbAchternaam.Text;
            string telefoonnummer = txbTelefoonnummer.Text;
            string email = txbEmail.Text;
            string iban = txbIBAN.Text;
            int gastnummer = int.Parse(lblGastnummer.Text);
            string controle = "";


            if (land == "--Selecteer--")
            {
                CustomValidator1.IsValid = false;
            }

            switch (DropDownList2.SelectedValue)
            {
                case "Nederland(+31)":
                    controle = "+31";
                    break;
                case "Duitsland(+49)":
                    controle = "+49";
                    break;
                case "Frankrijk(+33)":
                    controle = "+33";
                    break;
                case "België(+32)":
                    controle = "+32";
                    break;
            }
            string telefoonnummereind = controle + telefoonnummer;


            if (DropDownList2.SelectedValue == "Duitsland(+49)" || DropDownList2.SelectedValue == "Frankrijk(+33)")
            {
                if (txbPostcode.Text.Length != 5)
                {
                    CustomValidator1.IsValid = false;
                }
            }
            else if (DropDownList2.SelectedValue == "België(+32)")
            {
                if (txbPostcode.Text.Length != 4)
                {
                    CustomValidator1.IsValid = false;
                }
            }
            else if (DropDownList2.SelectedValue == "Nederland(+31)")
            {
                if (txbPostcode.Text.Length != 7)
                {
                    CustomValidator1.IsValid = false;
                }
            }
            else if (DropDownList2.SelectedValue == "--Selecteer--")
            {
                CustomValidator1.IsValid = false;
            }

            if (CheckDatum() == true)
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["2020-BIM02-P1-P2-GroenbosConnectionString"].ConnectionString))
                {
                    con.Open();

                    string query = "update Gast set Voornaam = @voornaam, Tussenvoegsel = @tussenvoegsel, Achternaam = @achternaam, Telefoonnummer = @telefoonnummer, Email = @email, IBAN = @iban where Nummer = @gastnummer";
                    string query2 = "update Adres set Straatnaam =  @straat, Huisnummer = @huisnummer, Postcode = @postcode, Woonplaats = @woonplaats where GastNummer = @gastnummer";

                    SqlCommand cmd1 = new SqlCommand(query, con);
                    SqlCommand cmd2 = new SqlCommand(query2, con);

                    cmd1.Parameters.AddWithValue("@voornaam", voornaam);
                    cmd1.Parameters.AddWithValue("@tussenvoegsel", tussenvoegsel);
                    cmd1.Parameters.AddWithValue("@achternaam", achternaam);
                    cmd1.Parameters.AddWithValue("@telefoonnummer", telefoonnummereind);
                    cmd1.Parameters.AddWithValue("@email", email);
                    cmd1.Parameters.AddWithValue("@iban", iban);
                    cmd1.Parameters.AddWithValue("@gastnummer", gastnummer);

                    cmd2.Parameters.AddWithValue("@straat", straatnaam);
                    cmd2.Parameters.AddWithValue("@huisnummer", huisnummer);
                    cmd2.Parameters.AddWithValue("@postcode", postcode);
                    cmd2.Parameters.AddWithValue("@land", land);
                    cmd2.Parameters.AddWithValue("@woonplaats", woonplaats);
                    cmd2.Parameters.AddWithValue("@gastnummer", gastnummer);

                    cmd1.CommandType = System.Data.CommandType.Text;
                    cmd2.CommandType = System.Data.CommandType.Text;



                    cmd1.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();

                    con.Close();


                    Response.Redirect("Gastoverzicht.aspx");
                }
            }
            else
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
                DateTime control2 = control.AddYears(-18);

                if (control2 >= geboortedatum)
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

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            {
                string expression = "";

                switch (DropDownList2.SelectedValue)
                {
                    case "Nederland(+31)":
                        expression = "^([0-9]{4}) {1}([A-Z]{2})$";
                        break;
                    case "Duitsland(+49)":
                        expression = "^[0-9]{5}$";
                        break;
                    case "Frankrijk(+33)":
                        expression = "^[0-9]{5}$";
                        break;
                    case "België(+32)":
                        expression = "^(?:(?:[1-9])(?:[0-9]{3}))$";
                        break;

                }


                if (Regex.IsMatch(txbPostcode.Text, expression, RegexOptions.IgnoreCase))
                    args.IsValid = true;
                else
                    args.IsValid = false;
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {


        }
    }

}


