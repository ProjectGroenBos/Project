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
            // verstuur mensen naar het plaatsen van een bestelling
            Response.Redirect("opnemenbestelling.aspx");

            

            // geef de tafel een andere kleur om aan te geven dat hij bezet is

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
    }
}