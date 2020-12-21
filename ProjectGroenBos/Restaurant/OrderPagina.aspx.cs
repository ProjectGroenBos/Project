using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Restaurant
{
    public partial class OrderPagina : System.Web.UI.Page
    {
        //Connectionstring
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Repeater();
            }
        }

        public void Repeater()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("select * from VoedselRestaurantInkoopOrder inner join Leverancier on Leverancier.ID = VoedselRestaurantInkoopOrder.LeverancierID", con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                rpReservering.DataSource = ds;
                gvOrderBekijken.DataBind();
                rpReservering.DataBind();
                

                con.Close();
            }
        }
    }
}