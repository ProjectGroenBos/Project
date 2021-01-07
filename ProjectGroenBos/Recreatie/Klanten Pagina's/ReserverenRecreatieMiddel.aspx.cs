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
        float Total;
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
                if (Session["StartDatum"] == null || Session["EindDatum"] == null )
                {
                    Response.Redirect("OverzichtRecreatieMiddel.aspx");
                }

                dt = (DataTable)Session["RecreatieMiddel"];

                DateTime startdatum = DateTime.Parse(Session["StartDatum"].ToString());  
                DateTime Einddatum = DateTime.Parse(Session["EindDatum"].ToString());

                double totaal = (Einddatum - startdatum).TotalDays * double.Parse(dt.Rows[0][4].ToString());
                Total = float.Parse(totaal.ToString()); ;

                Label1.Text = Label1.Text + dt.Rows[0][1].ToString();
                Label3.Text = Label3.Text + dt.Rows[0][2].ToString();
                Label4.Text = Label4.Text + dt.Rows[0][3].ToString();
                Label5.Text = Label5.Text + Total.ToString();

                Label6.Text = Label6.Text + Session["StartDatum"].ToString();
                Label7.Text = Label7.Text + Session["EindDatum"].ToString();


            }


        }


        protected void BtnVoegtoe_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup');", true);
        }

        protected void btnAanmeldenklant_Click(object sender, EventArgs e)
        {
            dt = (DataTable)Session["RecreatieMiddel"];

            DateTime startdatum = DateTime.Parse(Session["StartDatum"].ToString());
            DateTime Einddatum = DateTime.Parse(Session["EindDatum"].ToString());

            double totaal = (Einddatum - startdatum).TotalDays * double.Parse(dt.Rows[0][4].ToString());
            Total = float.Parse(totaal.ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Recreatie_ReserverenHuuritem", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@BeginDatum", DateTime.Parse(Session["StartDatum"].ToString()));
            cmd.Parameters.AddWithValue("@EindDatum", DateTime.Parse(Session["EindDatum"].ToString()));
            cmd.Parameters.AddWithValue("@HuuritemNummer", (int)Session["Nummer"]);
            cmd.Parameters.AddWithValue("@GastNummer", int.Parse((string)Session["GastNummer"]));
            cmd.Parameters.AddWithValue("@Status", 1);
            cmd.Parameters.AddWithValue("@TotaalPrijs", Total);
            cmd.ExecuteNonQuery();
            con.Close();

            using (SqlConnection sqlCon = new SqlConnection(connectionstring))
            {

                var sql = "UPDATE dbo.Huuritem SET ItemstatusID = 2, [Uitgegeven op] = @BeginDatum, [Uitgeleend tot] = @EindDatum where Nummer = @Nummer";
                var cmd2 = new SqlCommand(sql, sqlCon);
                sqlCon.Open();
                cmd2.Parameters.AddWithValue("@Nummer", (int)Session["Nummer"]);
                cmd2.Parameters.AddWithValue("@BeginDatum", DateTime.Parse(Session["StartDatum"].ToString()));
                cmd2.Parameters.AddWithValue("@EindDatum", DateTime.Parse(Session["EindDatum"].ToString()));
                cmd2.ExecuteNonQuery();
                sqlCon.Close();
            }
            Response.Redirect("OverzichtGehuurdeRecreatieMiddelen.aspx");
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