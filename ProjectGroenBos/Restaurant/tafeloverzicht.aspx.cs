using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Restaurant
{
    public partial class tafeloverzicht : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btntafel1_Click(object sender, EventArgs e)
        {
            //Hier open je de pop up om de bestelling op de tafel te kunnen zetten of kan kiezen voor afrekenen voor de tafel
            popuptafel1.Show();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // haal de kleur van de tafel af

        }

        protected void btntafel2_Click(object sender, EventArgs e)
        {
            //Hier open je de pop up om de bestelling op de tafel te kunnen zetten of kan kiezen voor afrekenen voor de tafel
            popuptafel2.Show();
        }

        protected void btntafel3_Click(object sender, EventArgs e)
        {
            //Hier open je de pop up om de bestelling op de tafel te kunnen zetten of kan kiezen voor afrekenen voor de tafel
            popuptafel3.Show();
        }

        protected void btntafel4_Click(object sender, EventArgs e)
        {
            //Hier open je de pop up om de bestelling op de tafel te kunnen zetten of kan kiezen voor afrekenen voor de tafel
            popuptafel4.Show();
        }

        protected void btntafel5_Click(object sender, EventArgs e)
        {
            //Hier open je de pop up om de bestelling op de tafel te kunnen zetten of kan kiezen voor afrekenen voor de tafel
            popuptafel5.Show();
        }

        protected void btnkeuken_Click(object sender, EventArgs e)
        {
            //bregnt je naar het keukenscherm
        }

        protected void btnbar_Click(object sender, EventArgs e)
        {
            //brengt je naar het barscherm
        }

        protected void Bestelling1_Click(object sender, EventArgs e)
        {
            //Neem tafelnummer mee
            Session["Tafelnr"] = lbltafel1popup.Text;
            // verstuur mensen naar het plaatsen van een bestelling
            Response.Redirect("bestellingopnemen.aspx");



            // geef de tafel een andere kleur om aan te geven dat hij bezet is

        }

        protected void Bestelling2_Click(object sender, EventArgs e)
        {
            //Neem tafelnummer mee
            Session["Tafelnr"] = lbltafel2popup.Text;
            // verstuur mensen naar het plaatsen van een bestelling
            Response.Redirect("bestellingopnemen.aspx");



            // geef de tafel een andere kleur om aan te geven dat hij bezet is
        }

        protected void Bestelling3_Click(object sender, EventArgs e)
        {
            //Neem tafelnummer mee
            Session["Tafelnr"] = lbltafel3popup.Text;
            // verstuur mensen naar het plaatsen van een bestelling
            Response.Redirect("bestellingopnemen.aspx");



            // geef de tafel een andere kleur om aan te geven dat hij bezet is
        }

        protected void Bestelling4_Click(object sender, EventArgs e)
        {
            //Neem tafelnummer mee
            Session["Tafelnr"] = lbltafel4popup.Text;
            // verstuur mensen naar het plaatsen van een bestelling
            Response.Redirect("bestellingopnemen.aspx");



            // geef de tafel een andere kleur om aan te geven dat hij bezet is
        }

        protected void Bestelling5_Click(object sender, EventArgs e)
        {
            //Neem tafelnummer mee
            Session["Tafelnr"] = lbltafel5popup.Text;
            // verstuur mensen naar het plaatsen van een bestelling
            Response.Redirect("bestellingopnemen.aspx");



            // geef de tafel een andere kleur om aan te geven dat hij bezet is
        }
    }
}