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
            Response.Redirect("opnemenbestelling.aspx");
        }
    }
}