using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Financien
{
    public partial class WebForm1 : System.Web.UI.Page
    {
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

                SqlCommand cmd = new SqlCommand("select * from winst where datum = MONTH(GETDATE())", con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                rpTopInfo.DataSource = ds;
                rpTopInfo.DataBind();

                SqlCommand cmd1 = new SqlCommand("select * from homecirkel", con);
                DataSet ds1 = new DataSet();
                SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                da1.Fill(ds1);
                rpCirkel.DataSource = ds1;
                rpCirkel.DataBind();

                con.Close();
            }
        }

        [WebMethod]
        public static string GetChart(string country)
        {
            string constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = string.Format("select shipcity, count(orderid) from orders where shipcountry = '{0}' group by shipcity", country);
                string query1 = "select Datum, Winst from WINST";
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = query;
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        StringBuilder sb = new StringBuilder();
                        sb.Append("[");
                        while (sdr.Read())
                        {
                            sb.Append("{");
                            System.Threading.Thread.Sleep(50);
                            string color = String.Format("#{0:X6}", new Random().Next(0x1000000));
                            sb.Append(string.Format("text :'{0}', value:{1}, color: '{2}'", sdr[0], sdr[1], color));
                            sb.Append("},");
                        }
                        sb = sb.Remove(sb.Length - 1, 1);
                        sb.Append("]");
                        con.Close();
                        return sb.ToString();
                    }
                }
            }
        }
    }
}


/*
protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
{
    if (e.Row.RowType == DataControlRowType.DataRow)
    {
        // grab the Label Control.
        Label lblRate = e.Row.FindControl("lblRate") as Label;
        // get the value from the datasoure like this
        Double rate = Convert.ToDouble(Convert.ToString(DataBinder.Eval(e.Row.DataItem, "Rate")));
        if (rate <= .0)
        {
            // grab the cell where that label resides
            DataControlFieldCell d = lblRate.Parent as DataControlFieldCell;
            // change the backcolor like this
            d.BackColor = System.Drawing.Color.Red;
            // change the row color like this
            e.Row.BackColor = System.Drawing.Color.LightBlue;
            // change the text color like this
            lblRate.ForeColor = System.Drawing.Color.White;
        }
    }
}
*/