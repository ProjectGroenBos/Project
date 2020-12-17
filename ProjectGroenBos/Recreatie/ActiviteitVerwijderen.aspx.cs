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
    public partial class ActiviteitVerwijderen : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        string connectionstring = ConfigurationManager.ConnectionStrings["dbconnectie"].ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString);
        DataTable Activteit;

        int Currentactivity;

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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM vActiviteit WHERE ActiviteitActief = 1", sqlCon);
                sqlDa.Fill(dtbl);
                Session["vaDB"] = dtbl;
            }
            //if (dtbl.Rows.Count > 0)
            //{
            //    if (sortExpression != null)
            //    {
            //        DataView dv = dtbl.AsDataView();
            //        this.SortDirection = this.SortDirection == "ASC" ? "DESC" : "ASC";

            //        dv.Sort = sortExpression + " " + this.SortDirection;
            //        gvActiviteitVerwijderen.DataSource = dv;
            //    }
            //    else
            //    {
            //        gvActiviteitVerwijderen.DataSource = dtbl;
            //    }

            //    gvActiviteitVerwijderen.DataBind();
            //}

            //else
            //{
            //    dtbl.Rows.Add(dtbl.NewRow());
            //    gvActiviteitVerwijderen.DataSource = dtbl;
            //    gvActiviteitVerwijderen.DataBind();
            //    gvActiviteitVerwijderen.Rows[0].Cells.Clear();
            //    gvActiviteitVerwijderen.Rows[0].Cells.Add(new TableCell());
            //    gvActiviteitVerwijderen.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
            //    gvActiviteitVerwijderen.Rows[0].Cells[0].Text = "Geen Data Gevonden!";
            //    gvActiviteitVerwijderen.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            //}
        }


        protected void gvActiviteitVerwijderen_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvActiviteitVerwijderen.EditIndex = -1;
            InvullenGridview();
        }

        protected void gvActiviteitVerwijderen_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvActiviteitVerwijderen_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void gvActiviteitVerwijderen_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvActiviteitVerwijderen.EditIndex = e.NewEditIndex;
            InvullenGridview();
        }

        protected void gvActiviteitVerwijderen_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        public void GetActivityData(int Nummer)
        {

            Currentactivity = Nummer;
            Activteit = new DataTable();
            Activteit.Columns.Add(new DataColumn("ID", typeof(int)));
            Activteit.Columns.Add(new DataColumn("Naam", typeof(string)));
            Activteit.Columns.Add(new DataColumn("Locatie", typeof(string)));
            Activteit.Columns.Add(new DataColumn("Inschrijfkosten", typeof(int)));
            Activteit.Columns.Add(new DataColumn("Maximaal aantal", typeof(int)));
            Activteit.Columns.Add(new DataColumn("Omschrijving", typeof(string)));
            Activteit.Columns.Add(new DataColumn("Datum", typeof(DateTime)));
            Activteit.Columns.Add(new DataColumn("Begintijd", typeof(TimeSpan)));
            Activteit.Columns.Add(new DataColumn("Eindtijd", typeof(TimeSpan)));
            Activteit.Columns.Add(new DataColumn("MedewerkerID", typeof(int)));

            using (SqlConnection Sqlcon = new SqlConnection(connectionstring))
            {
                string selectquery = "SELECT * FROM vActiviteit WHERE Nummer = @Nummer";
                SqlCommand sqlComd = new SqlCommand(selectquery, Sqlcon);
                sqlComd.Parameters.AddWithValue("@Nummer", Nummer);
                SqlDataAdapter da = new SqlDataAdapter(sqlComd);
                da.Fill(Activteit);
                Session["Activiteit"] = Activteit;
            }
        }

        //protected void gvActiviteitVerwijderen_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //index = int.Parse(GridView1.SelectedRow.Cells[0].Text.Trim());
        //    GetActivityData(1);
        //    //Textboxesvullen();

        //    DataTable Aanvraag = new DataTable();
        //    Aanvraag.Columns.Add(new DataColumn("ID", typeof(int)));
        //    Aanvraag.Columns.Add(new DataColumn("Naam", typeof(string)));

        //    if (gvActiviteitVerwijderen.SelectedRow.RowType == DataControlRowType.DataRow)
        //    {
        //        using (SqlConnection sqlCon = new SqlConnection(connectionstring))
        //        {

        //            SqlCommand cmd = new SqlCommand("Select [Nummer], [Naam], [Locatie], [Begintijd], [Eindtijd], [Maximaal aantal], [Omschrijving], [Datum], [Inschrijfkosten], [MedewerkerID]  FROM vActiviteit where [Nummer] = @Nummer", sqlCon);
        //            cmd.Parameters.AddWithValue("@Nummer", gvActiviteitVerwijderen.DataKeys[gvActiviteitVerwijderen.SelectedRow.RowIndex].Value.ToString());
        //            sqlCon.Open();
        //            int Nummer = cmd.ExecuteNonQuery();
        //            SqlDataAdapter da = new SqlDataAdapter(cmd);
        //            da.Fill(Aanvraag);


        //            sqlCon.Close();
        //            gvActiviteitVerwijderen.DataSource = Aanvraag;
        //        }
        //    }
        //    gvActiviteitVerwijderen.DataBind();
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup');", true);
        //}

        protected void gvActiviteitVerwijderen_Sorting(object sender, GridViewSortEventArgs e)
        {
            InvullenGridview(e.SortExpression);
        }

        protected void gvActiviteitVerwijderen_SelectedIndexChanged1(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup');", true);
            //Label2.Text = gvActiviteitVerwijderen.SelectedRow.ToString();
        }

        protected void btnDoorgaan_Click(object sender, EventArgs e)
        {
            GridViewRow row = this.gvActiviteitVerwijderen.SelectedRow;
            DataTable dtbl = new DataTable();
            using (SqlConnection Sqlcon = new SqlConnection(connectionstring))
            {

                Sqlcon.Open();

                SqlDataAdapter ada = new SqlDataAdapter();

                int index2 = Convert.ToInt32(gvActiviteitVerwijderen.DataKeys[row.RowIndex].Value);

                string sql = "UPDATE dbo.Activiteit SET ActiviteitActief = 0 WHERE Nummer = @Nummer";

                // gvActiviteitVerwijderen.Rows[gvActiviteitVerwijderen.SelectedIndex].Visible = false;

                SqlCommand command = new SqlCommand(sql, Sqlcon);

                command.Parameters.AddWithValue("@Nummer", Convert.ToInt32(index2));

                command.ExecuteNonQuery();

                //gvActiviteitVerwijderen.DataBind();

                command.Dispose();

                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM vActiviteit WHERE ActiviteitActief = 1", Sqlcon);
                sqlDa.Fill(dtbl);
                //gvActiviteitVerwijderen.DataSource = dtbl;


                Sqlcon.Close();
                gvActiviteitVerwijderen.DataBind();

                }
            }
        }
}