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

namespace ProjectGroenBos.Recreatie
{
    public partial class Reserverenfacilitieit : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        string connectionstring = ConfigurationManager.ConnectionStrings["dbconnectie"].ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InvullenGridview();
                int i = int.Parse((string)Session["GastNummer"]);
            }
        }


        protected void ddlFaciliteit_SelectedIndexChanged(object sender, EventArgs e)
        {
            {
                using (SqlConnection Con = new SqlConnection(connectionstring))
                {
                    String getquery;
                    getquery = ddlFaciliteit.Text;

                    Con.Open();
                    SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM VReserveringfaciliteit WHERE Omschrijving='" + getquery + "'", Con);
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        GridViewFaciliteit.DataSource = dt;
                        GridViewFaciliteit.DataBind();
                    }

                    Con.Close();
                }
            }
        }

        void InvullenGridview(string sortExpression = null)
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionstring))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM VReserveringfaciliteit", sqlCon);
                sqlDa.Fill(dtbl);
                Session["vDB"] = dtbl;
                GridViewFaciliteit.DataSource = dtbl;
                GridViewFaciliteit.DataBind();
            }
        }

        protected void GridViewFaciliteit_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup');", true);
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            Label13.Text = "The selected date is " + Calendar1.SelectedDate.ToShortDateString();
            Session["Date"]= Calendar1.SelectedDate;
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {

        }

        protected void btnAanmeldenfaciliteit_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionstring))
            {

                DataTable Faciliteit = new DataTable();
                Faciliteit.Columns.Add(new DataColumn("ID", typeof(int)));
                Faciliteit.Columns.Add(new DataColumn("Omschrijving", typeof(string)));
                Faciliteit.Columns.Add(new DataColumn("Huurtarief", typeof(int)));
                Faciliteit.Columns.Add(new DataColumn("Nummer", typeof(int)));
                Faciliteit.Columns.Add(new DataColumn("Begintijd", typeof(TimeSpan)));
                Faciliteit.Columns.Add(new DataColumn("Eindtijd", typeof(TimeSpan)));
                SqlCommand cmd = new SqlCommand("Select [ID],[Omschrijving],[Huurtarief],[Nummer],[Begintijd],[Eindtijd] FROM VReserveringfaciliteit where Nummer= @Nummer", sqlCon);
                cmd.Parameters.AddWithValue("Nummer", int.Parse(GridViewFaciliteit.DataKeys[GridViewFaciliteit.SelectedIndex].Value.ToString()));
                sqlCon.Open();
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(Faciliteit);
                Session["FacaID"] = ddlFaciliteit.SelectedIndex;
                Session["Nummer"] = GridViewFaciliteit.DataKeys[GridViewFaciliteit.SelectedIndex].Value;
                Session["Tijdvaknummer"] = GridViewFaciliteit.SelectedRow.Cells[3].Text;
                Session["Faciliteit"] = Faciliteit;
                Response.Redirect("MijnGereserveerdeFaciliteit.aspx");
            }
        }
    }
}