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
    public partial class Aanmeldenactiviteitklant2 : System.Web.UI.Page
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
                    GvAanmeldenActiviteit.DataSource = dv;
                }
                else
                {
                    GvAanmeldenActiviteit.DataSource = dtbl;
                }

                GvAanmeldenActiviteit.DataBind();
            }

            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GvAanmeldenActiviteit.DataSource = dtbl;
                GvAanmeldenActiviteit.DataBind();
                GvAanmeldenActiviteit.Rows[0].Cells.Clear();
                GvAanmeldenActiviteit.Rows[0].Cells.Add(new TableCell());
                GvAanmeldenActiviteit.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GvAanmeldenActiviteit.Rows[0].Cells[0].Text = "Geen Data Gevonden!";
                GvAanmeldenActiviteit.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }
       

        protected void Button1_Click(object sender, EventArgs e)
        {
           
        }

        protected void GvAanmeldenActiviteit_PageIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GvAanmeldenActiviteit_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            if (GvAanmeldenActiviteit.EditIndex != -1)
            {
                e.Cancel = true;
                int newPageNumber = e.NewPageIndex + 1;
            }
        }

        protected void GvAanmeldenActiviteit_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvAanmeldenActiviteit.EditIndex = -1;
            InvullenGridview();
        }

        protected void GvAanmeldenActiviteit_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GvAanmeldenActiviteit_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GvAanmeldenActiviteit_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvAanmeldenActiviteit.EditIndex = e.NewEditIndex;
            InvullenGridview();
        }

        protected void GvAanmeldenActiviteit_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup');", true);
        }

        protected void GvAanmeldenActiviteit_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void GvAanmeldenActiviteit_Sorting(object sender, GridViewSortEventArgs e)
        {
            InvullenGridview(e.SortExpression);
        }

        protected void btnAanmelden_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionstring))
            {
               
                DataTable Activiteit = new DataTable();
                Activiteit.Columns.Add(new DataColumn("Nummer", typeof(int)));
                Activiteit.Columns.Add(new DataColumn("Activiteitnaam", typeof(string)));
                Activiteit.Columns.Add(new DataColumn("Datum", typeof(DateTime)));
                Activiteit.Columns.Add(new DataColumn("Begintijd", typeof(TimeSpan)));
                Activiteit.Columns.Add(new DataColumn("Eindtijd", typeof(TimeSpan)));
                Activiteit.Columns.Add(new DataColumn("Naam", typeof(string)));
                Activiteit.Columns.Add(new DataColumn("Inschrijfkosten", typeof(Double)));
                SqlCommand cmd = new SqlCommand("Select [Nummer], [Activiteitnaam],[Datum],[Begintijd],[Eindtijd],[Naam],[Inschrijfkosten],[Locatie],[Maximaal aantal],[Omschrijving] FROM vActiviteit where Nummer= @Nummer", sqlCon);
                cmd.Parameters.AddWithValue("Nummer", int.Parse(GvAanmeldenActiviteit.DataKeys[GvAanmeldenActiviteit.SelectedIndex].Value.ToString()));
                sqlCon.Open();
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(Activiteit);
                Session["Nummer"] = GvAanmeldenActiviteit.DataKeys[GvAanmeldenActiviteit.SelectedIndex].Value;
                Session["Activiteit"] = Activiteit;
                Response.Redirect("MijnAanmeldingen.aspx");
            }

        }
    }
}