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

        private void InsertInfo()
        {
            using (SqlConnection sqlCon = new SqlConnection(constr))
            {
                sqlCon.Open();
                String query = "INSERT INTO [2020-BIM02-P1-P2-Groenbos].[dbo].[Crediteurenfactuur] ([Datum],[Totaal bedrag],[Termijn],[Omschrijving betaalcondities],[VoedselorderID],[FactuurstatusID],[IBAN],[LeverancierID]) VALUES (@datum,@totaalbedrag,@termijn,@betaalcondities,@voedselorderid,@factuurstatusid,@iban,@leverancierid)";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                SqlParameter sqlParameter0 = sqlCmd.Parameters.AddWithValue("@Datum", DateTime.Now);
                cmd.Parameters.AddWithValue("@totaalbedrag", TextBox2.Text);
                cmd.Parameters.AddWithValue("@termijn", Label1.Text);
                cmd.Parameters.AddWithValue("@betaalcondities", Label1.Text);
                cmd.Parameters.AddWithValue("@voedselorderid", Label1.Text);
                cmd.Parameters.AddWithValue("@factuurstatusid", Label1.Text);
                cmd.Parameters.AddWithValue("@iban", Label1.Text);
                cmd.Parameters.AddWithValue("@leverancierid", Label1.Text);
                cmd.CommandType = CommandType.Text;
                sqlCmd.ExecuteNonQuery();
                sqlCon.Close();
            }
        }

            protected void btnGoedkeuren_Click(object sender, EventArgs e)
        {
            InsertInfo();
        }
    }
}