﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Reservering
{
    public partial class KlantWijzigen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int gastnummer = int.Parse(Session["gastnummer"].ToString());

        }
    }
}