using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class ReserveringAanmaken : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["gastnummer"] == null)
            {
                Response.Redirect("GastSelecteren.aspx");
            }
            else
            {
                lblGastnummer.Text = Session["gastnummer"].ToString();
            }
        }
    }
}