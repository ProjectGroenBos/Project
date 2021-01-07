using System;

namespace ProjectGroenBos.Reservering
{
    public partial class Site1 : System.Web.UI.MasterPage
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