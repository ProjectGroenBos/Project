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

namespace recreatie.paginas
{
    public partial class ActiviteitInplannen : System.Web.UI.Page
    {

        DataTable dt = new DataTable();
        string connectionstring = ConfigurationManager.ConnectionStrings["dbconnectie"].ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString);

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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM vActiviteit", sqlCon);
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
                    GvActiviteitInplannen.DataSource = dv;
                }
                else
                {
                    GvActiviteitInplannen.DataSource = dtbl;
                }

                GvActiviteitInplannen.DataBind();
            }

            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GvActiviteitInplannen.DataSource = dtbl;
                GvActiviteitInplannen.DataBind();
                GvActiviteitInplannen.Rows[0].Cells.Clear();
                GvActiviteitInplannen.Rows[0].Cells.Add(new TableCell());
                GvActiviteitInplannen.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GvActiviteitInplannen.Rows[0].Cells[0].Text = "Geen Data Gevonden!";
                GvActiviteitInplannen.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }



        protected void GvActiviteitInplannen_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvActiviteitInplannen.EditIndex = -1;
            InvullenGridview();
        }

        protected void GvActiviteitInplannen_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GvActiviteitInplannen_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GvActiviteitInplannen_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvActiviteitInplannen.EditIndex = e.NewEditIndex;
            InvullenGridview();
        }

        protected void GvActiviteitInplannen_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GvActiviteitInplannen_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void OnSorting(object sender, GridViewSortEventArgs e)
        {
            InvullenGridview(e.SortExpression);
        }

        protected void btnNieuwActiviteit_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup');", true);
        }
    }
}