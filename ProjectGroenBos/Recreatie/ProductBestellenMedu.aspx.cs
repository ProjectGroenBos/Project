using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Recreatie
{
    public partial class ProductBestellenMedu : System.Web.UI.Page
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
                if (functie == "1")
                {
                    Response.Redirect("~/Recreatie/Overzicht.aspx");
                }
            }

            else
            {
                Response.Redirect("~/Financien/Inlogscherm.aspx");
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Voorraad.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Nieuwproductbestellen.aspx");
        }
    }
}