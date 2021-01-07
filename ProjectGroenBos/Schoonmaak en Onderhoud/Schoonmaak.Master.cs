using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Schoonmaak_en_Onderhoud
{
    public partial class Schoonmaak : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Security();
        }

        protected void Security()
        {
            string functie = (string)Session["Functie"];
            if (functie == "13" || functie == "1")
            {
                Response.Redirect("~/Recreatie/Overzicht.aspx");
            }

        }
    }
}