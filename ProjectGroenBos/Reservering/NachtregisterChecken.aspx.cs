using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class NachtregisterChecken : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["reserveringnummer300"] != null)
            {
                lblReserveringNummer.Text = Session["reserveringnummer300"].ToString();
                //GridView2.DataBind();
            }
            else
            {
                Response.Redirect("GastSelecteren.aspx");
            }
        }

        protected void btnBevestigen_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReserveringCompleet.aspx");
        }
    }
}