using System;

namespace ProjectGroenBos.Reservering
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Text = "blaa blaaa blaa " + TextBox1.Text + "";

          
        }
    }
}