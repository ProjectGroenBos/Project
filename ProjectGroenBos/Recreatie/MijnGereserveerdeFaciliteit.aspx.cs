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
    public partial class MijnGereserveerdeFaciliteit : System.Web.UI.Page
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

               
                dt = (DataTable)Session["Faciliteit"];
                //DateTime datum = DateTime.Parse(dt.Rows[0][2].ToString());
                Label1.Text = Label1.Text + dt.Rows[0][1].ToString();
                Label2.Text = Label2.Text + dt.Rows[0][3].ToString();
                Label4.Text = Label4.Text + dt.Rows[0][4].ToString();
                Label5.Text = Label5.Text + dt.Rows[0][5].ToString();
                Label6.Text = Label6.Text + dt.Rows[0][2].ToString();




            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup');", true);

        }

        protected void btnAanmeldenklant_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Recreatie_ReserverenFaciliteit", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Nummer", (int)Session["Nummer"]);
                cmd.Parameters.AddWithValue("@Datum",(DateTime)Session["Date"]);
                cmd.Parameters.AddWithValue("@GastNummer", int.Parse((string)Session["GastNummer"]));
                cmd.Parameters.AddWithValue("@FaciliteitID", (int)Session["FacaID"]);
                cmd.Parameters.AddWithValue("@TijdvakNummer", (int)Session["Tijdvaknummer"]);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Recreatie/Klantenoverzichtfaciliteit.aspx");
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup2');", true);
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnAanmeldenklantas_Click(object sender, EventArgs e)
        {
            dt = (DataTable)Session["Faciliteit"];
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Recreatie_ReserverenFaciliteit", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Datum", (DateTime)Session["Date"]);
            cmd.Parameters.AddWithValue("@FaciliteitID", (int)Session["FacaID"]);
            cmd.Parameters.AddWithValue("@GastNummer", int.Parse((string)Session["GastNummer"]));
            cmd.Parameters.AddWithValue("@TijdvakNummer", int.Parse(dt.Rows[0][3].ToString()));
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Klantenoverzichtfaciliteit.aspx");
        }
    }
}