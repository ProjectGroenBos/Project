using System;

namespace ProjectGroenBos.Reservering
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] == null)
            {
                Response.Redirect("~/inlogscherm.aspx");
            }
        }

        protected void BtnUitloggen_Click(object sender, EventArgs e)
        {
            Session["Login"] = null;
            Response.Redirect("~/inlogscherm.aspx");
        }
    }
}