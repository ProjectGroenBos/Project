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
    public partial class OverzichtRecreatieMiddel : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        string connectionstring = ConfigurationManager.ConnectionStrings["dbconnectie"].ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString);
        DateTime einddatum;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InvullenGridview();
                int i = int.Parse((string)Session["GastNummer"]);

            }

            SqlDataReader rdr;
            using (SqlConnection sqlCon = new SqlConnection(connectionstring))
            {

                var qry = "SELECT EindDatum FROM ReserveringHuurItem";
                var cmd = new SqlCommand(qry, sqlCon);
                sqlCon.Open();
                rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {
                    rdr.Read();
                    einddatum = DateTime.Parse(rdr["EindDatum"].ToString());
                    label3.Text = einddatum.ToString();
                    if (einddatum == DateTime.Now)
                    {
                        label3.Text = "TOTOTOTOTOTO";
                    }
;                }

            }
        }
        private string SortDirection
        {
            get { return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC"; }
            set { ViewState["SortDirection"] = value; }
        }
        void InvullenGridview(string sortExpression = null)
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionstring))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT *  from vRecreatieProductPagina", sqlCon);
                sqlDa.Fill(dtbl);
                Session["vaDB"] = dtbl;
            }
            if (dtbl.Rows.Count > 0)
            {
                if (sortExpression != null)
                {
                    DataView dv = dtbl.AsDataView();
                    this.SortDirection = this.SortDirection == "ASC" ? "DESC" : "ASC";

                    dv.Sort = sortExpression + " " + this.SortDirection;
                    GvAanmeldenRecreatieMiddel.DataSource = dv;
                }
                else
                {
                    GvAanmeldenRecreatieMiddel.DataSource = dtbl;
                }

                GvAanmeldenRecreatieMiddel.DataBind();
            }

            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GvAanmeldenRecreatieMiddel.DataSource = dtbl;
                GvAanmeldenRecreatieMiddel.DataBind();
                GvAanmeldenRecreatieMiddel.Rows[0].Cells.Clear();
                GvAanmeldenRecreatieMiddel.Rows[0].Cells.Add(new TableCell());
                GvAanmeldenRecreatieMiddel.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GvAanmeldenRecreatieMiddel.Rows[0].Cells[0].Text = "Geen Data Gevonden!";
                GvAanmeldenRecreatieMiddel.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void btnAanmelden_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionstring))
            {

                DataTable RecreatieMiddel = new DataTable();
                RecreatieMiddel.Columns.Add(new DataColumn("Nummer", typeof(int)));
                RecreatieMiddel.Columns.Add(new DataColumn("Artikelnaam", typeof(string)));
                RecreatieMiddel.Columns.Add(new DataColumn("Omschrijving", typeof(string)));
                RecreatieMiddel.Columns.Add(new DataColumn("Categorie", typeof(string)));
                RecreatieMiddel.Columns.Add(new DataColumn("Huurtarief", typeof(Double)));
                SqlCommand cmd = new SqlCommand("SELECT [Artikelnaam], [Omschrijving], [Categorie], [Huurtarief], [Nummer] FROM [vRecreatieProductpagina] WHERE ([Nummer] = @Nummer)", sqlCon);
                cmd.Parameters.AddWithValue("Nummer", int.Parse(GvAanmeldenRecreatieMiddel.DataKeys[GvAanmeldenRecreatieMiddel.SelectedIndex].Value.ToString()));
                sqlCon.Open();
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(RecreatieMiddel);
                Session["Nummer"] = GvAanmeldenRecreatieMiddel.DataKeys[GvAanmeldenRecreatieMiddel.SelectedIndex].Value;
                Session["RecreatieMiddel"] = RecreatieMiddel;
                Response.Redirect("ReserverenRecreatieMiddel.aspx");
            }

        }

        protected void GvAanmeldenRecreatieMiddel_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup');", true);
        }
    }
}