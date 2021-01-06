using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Threading;

namespace ProjectGroenBos.Recreatie.Klanten_Pagina_s
{
    public partial class ReserverenRecreatieMiddel : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();
        string connectionstring = ConfigurationManager.ConnectionStrings["dbconnectie"].ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Nummer"] == null)
            {
                int num = (int)Session["Nummer"];
            }
            if (!Page.IsPostBack)
            {

                dt.Columns.Add("Naam");
                //dt.Rows.Add("Yes");
                //ViewState["Klanten"] = dt2;
                this.BindGrid();
                dt = (DataTable)Session["RecreatieMiddel"];
                DateTime datum = DateTime.Parse(dt.Rows[0][2].ToString());
                Label1.Text = Label1.Text + dt.Rows[0][1].ToString();
                Label2.Text = Label2.Text + dt.Rows[0][7].ToString();
                Label3.Text = Label3.Text + dt.Rows[0][6].ToString();
                Label4.Text = Label4.Text + dt.Rows[0][8].ToString();
                Label5.Text = Label5.Text + dt.Rows[0][9].ToString();
                Label6.Text = Label6.Text + datum.ToString("dd/MM/yyyy");
                Label7.Text = Label7.Text + dt.Rows[0][3].ToString();
                Label8.Text = Label8.Text + dt.Rows[0][4].ToString();

            }


        }

        protected void Txbnamen_TextChanged(object sender, EventArgs e)
        {
            //dt2 = (DataTable)ViewState["Klanten"];
            //dt2.Rows.Add(Txbnamen.Text.Trim());
            //ViewState["Klanten"] = dt;
            //this.BindGrid();
        }
        protected void BindGrid()
        {
            GridView1.DataSource = (DataTable)ViewState["Klanten"];
            GridView1.DataBind();
        }

        protected void BtnVoegtoe_Click(object sender, EventArgs e)
        {
            DataTable dt2 = new DataTable();
            dt2.Columns.Add("Namen");
            DataRow dr = null;

            if (ViewState["Klanten"] != null)
            {
                for (int i = 0; i < 1; i++)
                {
                    dt2 = (DataTable)ViewState["Klanten"];
                    if (dt2.Rows.Count > 0)
                    {
                        dr = dt2.NewRow();
                        dr["Namen"] = Txbnamen.Text;
                        dt2.Rows.Add(dr);
                        GridView1.DataSource = dt2;

                        GridView1.DataBind();




                    }
                }
            }
            else
            {
                dr = dt2.NewRow();
                dr["Namen"] = Txbnamen.Text;
                dt2.Rows.Add(dr);
                GridView1.DataSource = dt2;
                GridView1.DataBind();
            }
            ViewState["Klanten"] = dt2;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup');", true);
        }

        protected void btnAanmeldenklant_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Recreatie_Aanmeldenactiviteitklant", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ActiviteitNummer", (int)Session["Nummer"]);
            cmd.Parameters.AddWithValue("@GastNummer", int.Parse((string)Session["GastNummer"]));
            cmd.Parameters.AddWithValue("@Aantalpersonen", GridView1.Rows.Count);
            cmd.Parameters.AddWithValue("@Nummer", counter());
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Klantenoverzichtaanmelding.aspx");
        }
        public int counter()
        {
            string stmt = "select MAX(Nummer) from Aanmelding";
            int count = 0;

            using (SqlConnection thisConnection = new SqlConnection(connectionstring))
            {
                using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
                {
                    thisConnection.Open();
                    count = (int)cmdCount.ExecuteScalar();
                    count++;
                }
            }
            return count;
        }
    }
}