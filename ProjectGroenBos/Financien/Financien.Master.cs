﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Financien
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(Session["Login"] == null)
            //{
            //Response.Redirect("inlogscherm.aspx");
            //}
        }

        protected void BtnUitloggen_Click(object sender, EventArgs e)
        {
            Session["Login"] = null;
        }
    }
}