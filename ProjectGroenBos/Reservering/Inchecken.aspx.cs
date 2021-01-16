using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class Inchecken : System.Web.UI.Page
    {
        int reserveringsnummer;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Gridview1_SelectedIndexChanged(object sender, EventArgs e)
        {
            reserveringsnummer = int.Parse((string)Gridview1.SelectedRow.Cells[0].ToString());
        }
    }
}