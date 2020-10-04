using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recreatie.paginas
{
    public partial class Planning : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[1] {new DataColumn("Naam")});
                //dt.Rows.Add("Yes");
                ViewState["Medewerker"] = dt;
                this.BindGrid();
            }
        }

        protected void BindGrid()
        {
            GridView2.DataSource = (DataTable)ViewState["Medewerker"];
            GridView2.DataBind();
        }

        protected void btnActiviteitInplannen_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Recreatie_VoegActiviteitToe", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Naam", TxbActiviteit.Text);
            cmd.Parameters.AddWithValue("@Locatie", txbLocatie.Text);
            cmd.Parameters.AddWithValue("@Begintijd", TxbBegintijd.Text);
            cmd.Parameters.AddWithValue("@Eindtijd", TxbEindtijd.Text);
            cmd.Parameters.AddWithValue("@MaximaalAantal", TxbAantal.Text);
            cmd.Parameters.AddWithValue("@Datum", TxbDatum.Text);
            cmd.Parameters.AddWithValue("@FaciliteitID", TxbFaciliteitenID.Text);
            cmd.Parameters.AddWithValue("@Inschrijfkosten", txbInschrijfkosten.Text);
            cmd.Parameters.AddWithValue("@MedewerkerID", TxbMedewerker.Text);

            cmd.ExecuteNonQuery();
            con.Close();

            LblBevestiging.Text = "Activiteit toegevoegd";

        }

        protected void TxbMedewerker_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = (DataTable) ViewState["Medewerker"];
            dt.Rows.Add(TxbMedewerker.SelectedValue.Trim());
            ViewState["Medewerker"] = dt;
            this.BindGrid();


        }
    }
}