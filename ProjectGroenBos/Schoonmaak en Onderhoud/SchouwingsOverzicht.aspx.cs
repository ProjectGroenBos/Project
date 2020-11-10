using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Schoonmaak_en_Onderhoud
{
    public partial class SchouwingsOverzicht : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnToevoegen_Click(object sender, EventArgs e)
        {
            Response.Redirect("SchouwingToevoegen.aspx");
        }

        protected void btnWijzigen_Click(object sender, EventArgs e)
        {
            Response.Redirect("SchouwingWijzigen.aspx");
        }
    }
}