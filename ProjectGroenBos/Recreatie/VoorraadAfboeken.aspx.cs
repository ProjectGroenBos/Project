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
    public partial class VoorraadAfboeken : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        string connectionstring = ConfigurationManager.ConnectionStrings["dbconnectie"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InvullenGridview();
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM vRecreatieVoorraadMuteren", sqlCon);
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
                    GvAfboeken.DataSource = dv;
                }
                else
                {
                    GvAfboeken.DataSource = dtbl;
                }

                GvAfboeken.DataBind();
            }

            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GvAfboeken.DataSource = dtbl;
                GvAfboeken.DataBind();
                GvAfboeken.Rows[0].Cells.Clear();
                GvAfboeken.Rows[0].Cells.Add(new TableCell());
                GvAfboeken.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GvAfboeken.Rows[0].Cells[0].Text = "Geen Data Gevonden!";
                GvAfboeken.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void GvAfboeken_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvAfboeken.EditIndex = -1;
            InvullenGridview();
        }

        protected void GvAfboeken_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GvAfboeken_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GvAfboeken_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvAfboeken.EditIndex = e.NewEditIndex;
            InvullenGridview();
        }

        protected void GvAfboeken_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GvAfboeken_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void OnSorting(object sender, GridViewSortEventArgs e)
        {
            InvullenGridview(e.SortExpression);
        }

        protected void txbAfboekenZoeken_TextChanged(object sender, EventArgs e)
        {
            DataTable dtbl = (DataTable)Session["vaDB"];
            DataView dv = dtbl.DefaultView;
            dv.RowFilter = string.Format("Artikelnaam like '%{0}%'", txbAfboekenZoeken.Text);
            GvAfboeken.DataSource = dv.ToTable();
            GvAfboeken.DataBind();
        }

        protected void btnSelecteren_Click(object sender, EventArgs e)
        {
            if (GvAfboeken.Columns[6].Visible == true)
            {
                GvAfboeken.Columns[0].Visible = false;
                GvAfboeken.Columns[6].Visible = false;
            }
            else
            {
                GvAfboeken.Columns[0].Visible = true;
                GvAfboeken.Columns[6].Visible = true;
            }
        }

        protected void btnAfboeken_Click(object sender, EventArgs e)
        {
            DataTable Aanvraag = new DataTable();
            Aanvraag.Columns.Add(new DataColumn("ID", typeof(int)));
            Aanvraag.Columns.Add(new DataColumn("Naam", typeof(string)));

            foreach (GridViewRow item in GvAfboeken.Rows)
            {
                if (item.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chk = (item.FindControl("cbGeselecteerd") as CheckBox);
                    if (chk.Checked)
                    {

                        using (SqlConnection sqlCon = new SqlConnection(connectionstring))
                        {

                            SqlCommand cmd = new SqlCommand("Select [ID], [Artikelnaam] FROM vVoorraadRecreatie where ID=@id", sqlCon);
                            cmd.Parameters.AddWithValue("id", GvAfboeken.DataKeys[item.RowIndex].Value.ToString());
                            sqlCon.Open();
                            int id = cmd.ExecuteNonQuery();
                            SqlDataAdapter da = new SqlDataAdapter(cmd);
                            da.Fill(Aanvraag);


                            sqlCon.Close();
                            GvVoorraadAfboeken.DataSource = Aanvraag;
                        }


                    }
                }
            }


            GvVoorraadAfboeken.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup');", true);
        }
        protected void btnAfboeken2_Click(object sender, EventArgs e)
        {

            using (SqlConnection sqlCon = new SqlConnection(connectionstring))
            {
                sqlCon.Open();

                SqlCommand cmd = new SqlCommand("sp_Recreatie_MuterenVoorraad", sqlCon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();
                sqlCon.Close();

                sqlCon.Open();
                string selectquery = "SELECT TOP 1 Nummer  FROM [dbo].[VooraadMutaties] ORDER BY Nummer DESC";
                SqlCommand sqlComd = new SqlCommand(selectquery, sqlCon);
                SqlDataReader r;
                r = sqlComd.ExecuteReader();

                int ordernummer = -1;


                while (r.Read())
                {
                    ordernummer = (int)r[0];
                }
                sqlCon.Close();
                foreach (GridViewRow ding in GvVoorraadAfboeken.Rows)
                {
                    sqlCon.Open();

                    SqlCommand vul = new SqlCommand("sp_Recreatie_MuterenVoorraad", sqlCon);
                    vul.CommandType = CommandType.StoredProcedure;
                    vul.Parameters.AddWithValue("@ID", (ordernummer));
                    vul.Parameters.AddWithValue("@Aantal", (int.Parse((GvVoorraadAfboeken.Rows[ding.RowIndex].FindControl("tbAantal") as TextBox).Text.Trim())));
                    vul.Parameters.AddWithValue("@VoorraadID", (GvVoorraadAfboeken.DataKeys[ding.RowIndex].Value.ToString()));
                    vul.ExecuteNonQuery();
                    sqlCon.Close();

                }
            }
        }
    }
}