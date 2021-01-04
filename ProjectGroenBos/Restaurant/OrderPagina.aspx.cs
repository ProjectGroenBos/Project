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


            SqlConnection conn = new SqlConnection(constr);
            string sql = "INSERT INTO TableName ([Datum],[Totaal bedrag],[Termijn],[Omschrijving betaalcondities]) VALUES (@Val1,@Val2,@Val3)";
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@Val1", TextBox1.Text);
                cmd.Parameters.AddWithValue("@Val2", TextBox2.Text);
                cmd.Parameters.AddWithValue("@Val3", Label1.Text);
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);


            }
            finally
            {
                conn.Close();
            }
        }

        protected void btnGoedkeuren_Click(object sender, EventArgs e)
        {
            InsertInfo();
        }
    }
}