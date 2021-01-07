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
    public partial class Voorraadmuteren : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        string connectionstring = ConfigurationManager.ConnectionStrings["dbconnectie"].ToString();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InvullenGridview();
                Security();
            }
        }
        protected void Security()
        {
            string functie = (string)Session["Functie"];
            if (functie == "13" || functie == "1")
            {
                if (functie == "1")
                {
                    Response.Redirect("~/Recreatie/Overzicht.aspx");
                }
            }

            else
            {
                Response.Redirect("~/Financien/Inlogscherm.aspx");
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
                Session["vmDB"] = dtbl;
            }
            if (dtbl.Rows.Count > 0)
            {
                if (sortExpression != null)
                {
                    DataView dv = dtbl.AsDataView();
                    this.SortDirection = this.SortDirection == "ASC" ? "DESC" : "ASC";

                    dv.Sort = sortExpression + " " + this.SortDirection;
                    GvMuteren.DataSource = dv;
                }
                else
                {
                    GvMuteren.DataSource = dtbl;
                }

                GvMuteren.DataBind();
            }

            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GvMuteren.DataSource = dtbl;
                GvMuteren.DataBind();
                GvMuteren.Rows[0].Cells.Clear();
                GvMuteren.Rows[0].Cells.Add(new TableCell());
                GvMuteren.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GvMuteren.Rows[0].Cells[0].Text = "Geen Data Gevonden!";
                GvMuteren.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void GvMuteren_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvMuteren.EditIndex = -1;
            InvullenGridview();
        }

        protected void GvMuteren_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GvMuteren_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GvMuteren_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvMuteren.EditIndex = e.NewEditIndex;
            InvullenGridview();
        }

        protected void GvMuteren_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GvMuteren_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void OnSorting(object sender, GridViewSortEventArgs e)
        {
            InvullenGridview(e.SortExpression);
        }

        protected void txbZoekenVoorraadmuteren_TextChanged1(object sender, EventArgs e)
        {
            if (ckbLeverancier.Checked == true)
            {
                DataTable dtbl = (DataTable)Session["vmDB"];
                DataView dv = dtbl.DefaultView;
                dv.RowFilter = string.Format("[Naam Leverancier] like '%{0}%'", txbZoekenVoorraadmuteren.Text);
                GvMuteren.DataSource = dv.ToTable();
                GvMuteren.DataBind();
            }
            else
            {
                DataTable dtbl = (DataTable)Session["vmDB"];
                DataView dv = dtbl.DefaultView;
                dv.RowFilter = string.Format("Artikelnaam like '%{0}%'", txbZoekenVoorraadmuteren.Text);
                GvMuteren.DataSource = dv.ToTable();
                GvMuteren.DataBind();
            }
        }

        protected void btnAfboeken_Click(object sender, EventArgs e)
        {
            Response.Redirect("VoorraadAfboeken.aspx");
        }
    }
}