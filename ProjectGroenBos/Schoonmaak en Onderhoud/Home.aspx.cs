using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Schoonmaak_en_Onderhoud
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] == null)
            {
                Response.Redirect("~/inlogscherm.aspx");
            }
        }

        protected void btnUitloggen_Click(object sender, EventArgs e)
        {
            Session["Login"] = null;
            Response.Redirect("~/inlogscherm.aspx");
        }
    }
}