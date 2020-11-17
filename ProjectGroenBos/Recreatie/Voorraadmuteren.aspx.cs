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
    public partial class Beheer : System.Web.UI.Page
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM vVoorraadRecreatie", sqlCon);
                sqlDa.Fill(dtbl);
                Session["vDB"] = dtbl;
            }
            if (dtbl.Rows.Count > 0)
            {
                if (sortExpression != null)
                {
                    DataView dv = dtbl.AsDataView();
                    this.SortDirection = this.SortDirection == "ASC" ? "DESC" : "ASC";

                    dv.Sort = sortExpression + " " + this.SortDirection;
                    gvVoorraad.DataSource = dv;
                }
                else
                {
                    gvVoorraad.DataSource = dtbl;
                }

                gvVoorraad.DataBind();
            }

            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvVoorraad.DataSource = dtbl;
                gvVoorraad.DataBind();
                gvVoorraad.Rows[0].Cells.Clear();
                gvVoorraad.Rows[0].Cells.Add(new TableCell());
                gvVoorraad.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvVoorraad.Rows[0].Cells[0].Text = "Geen Data Gevonden!";
                gvVoorraad.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void gvVoorraad_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvVoorraad.EditIndex = e.NewEditIndex;
            InvullenGridview();
        }

        protected void gvVoorraad_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvVoorraad.EditIndex = -1;
            InvullenGridview();
        }

 

        protected void txbZoekenVoorraadmuteren_TextChanged(object sender, EventArgs e)
        {
            DataTable dtbl = (DataTable)Session["vDB"];
            DataView dv = dtbl.DefaultView;
            dv.RowFilter = string.Format("Artikelnaam like '%{0}%'", txbZoekenVoorraadmuteren.Text);
            GvMuteren.DataSource = dv.ToTable();
            GvMuteren.DataBind();

        }

        protected void OnSorting(object sender, GridViewSortEventArgs e)
        {
            InvullenGridview(e.SortExpression);
        }


        protected void btnSelecteren_Click(object sender, EventArgs e)
        {
            if (gvVoorraad.Columns[6].Visible == true)
            {
                gvVoorraad.Columns[0].Visible = false;
                gvVoorraad.Columns[6].Visible = false;
            }
            else
            {
                gvVoorraad.Columns[0].Visible = true;
                gvVoorraad.Columns[6].Visible = true;
            }

        }

       