using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Recreatie
{
    public partial class klant2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btninloggen_Click(object sender, EventArgs e)
        {
            Session["GastNummer"] = null;
            Session["Nummer"] = null;
            Response.Redirect("InlogschermKlanten.aspx");
            
        }
    }
}