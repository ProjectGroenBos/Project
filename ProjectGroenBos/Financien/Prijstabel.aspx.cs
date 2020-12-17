using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Financien
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            int functieID = int.Parse(Session["Functie"].ToString());

            if (functieID == 2)
            {

            }
            else if (functieID == 10)
            {

            }
            else
            {
                gvSeizoenen.Columns[4].Visible = false;
                gvFeesdagen.Columns[5].Visible = false;
                gvBungalow.Columns[4].Visible = false;
                gvSeizoentoeslag.Columns[6].Visible = false;
            }
        }
    }
}