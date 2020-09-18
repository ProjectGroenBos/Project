using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Recreatie
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbldatumNu.Text = DateTime.Now.ToString("dd" + "-" + "MM" + "-" + "yy");
        }

        protected void OnButtonPress(object sender, EventArgs e)
        {
            if (Session["datacount"] == null)
            {
                Session["datacount"] = 0;
            }
            Session["datacount"] = ((int)Session["datacount"]) + 1;
            lbldatumNu.Text = DateTime.Today.AddDays((int)Session["datacount"]).ToString("dd" + "-"+ "MM" + "-" + "yy");
        }
    }
}