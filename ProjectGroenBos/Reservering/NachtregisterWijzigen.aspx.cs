using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class NachtregisterWijzigen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Volgnummer"] != null)
            {
                lblUitkomst.Text = Session["Volgnummer"].ToString();
             //   GridView1.DataBind();
            }
            else 
            { 
                Response.Redirect("NachtregisterOverzicht.aspx");
            }
            
        }

        protected void btnTerug_Click(object sender, EventArgs e)
        {
            Response.Redirect("NachtregisterOverzicht.aspx");
        }
    }
}