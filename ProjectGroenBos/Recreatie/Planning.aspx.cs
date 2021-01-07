using System;
using System.Collections.Generic;
<<<<<<< HEAD
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
=======
>>>>>>> ReserveringTeam/Noah
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
<<<<<<< HEAD
=======
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Threading;
>>>>>>> ReserveringTeam/Noah

namespace recreatie.paginas
{
    public partial class Planning : System.Web.UI.Page
    {
<<<<<<< HEAD
=======
<<<<<<<< HEAD:ProjectGroenBos/Recreatie/Planning.aspx.cs
>>>>>>> ReserveringTeam/Noah
        string connectionstring = ConfigurationManager.ConnectionStrings["dbconnectie"].ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString);
        DataTable Activteit;
        int Currentactivity;
        DataTable dt = new DataTable();
<<<<<<< HEAD
        private int index;
=======
========

        DataTable dt = new DataTable();
        string connectionstring = ConfigurationManager.ConnectionStrings["dbconnectie"].ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString);
>>>>>>>> ReserveringTeam/Noah:ProjectGroenBos/Recreatie/ActiviteitInplannen.aspx.cs
>>>>>>> ReserveringTeam/Noah

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
<<<<<<< HEAD
                dt.Columns.AddRange(new DataColumn[1] { new DataColumn("Naam") });
                //dt.Rows.Add("Yes");
                ViewState["Medewerker"] = dt;
                this.BindGrid();
            }

            if (ViewState["Medewerker"] == null)
            {
                ViewState["Medewerker"] = dt;
            }
        }

        protected void BindGrid()
        {
            GridView2.DataSource = (DataTable)ViewState["Medewerker"];
            GridView2.DataBind();
        }

        public void GetActivityData(int Nummer)
        {

=======
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

<<<<<<<< HEAD:ProjectGroenBos/Recreatie/Planning.aspx.cs
>>>>>>> ReserveringTeam/Noah
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
<<<<<<< HEAD
            }
        }

        public void Textboxesvullen()
        {
            txbInschrijfkosten.Text = Activteit.Rows[0][3].ToString();
            TxbActiviteit.Text = Activteit.Rows[0][1].ToString();
            TxbAantal.Text = Activteit.Rows[0][4].ToString();
            txbLocatie.Text = Activteit.Rows[0][2].ToString();
            ddlFaciliteit.SelectedItem.Text = Activteit.Rows[0][5].ToString();
            DateTime datum = DateTime.Parse(Activteit.Rows[0][6].ToString());
            TxbDatum.Text = datum.ToString("dd/MM/yyyy");
            TxbBegintijd.Text = Activteit.Rows[0][7].ToString();
            TxbEindtijd.Text = Activteit.Rows[0][8].ToString();
            GridView2.Dispose();
            DataTable dt = (DataTable)ViewState["Medewerker"];
            dt.Clear();
            TxbMedewerker.SelectedValue = Activteit.Rows[0][9].ToString();
            dt.Rows.Add(TxbMedewerker.SelectedItem.Text.Trim());
            ViewState["Medewerker"] = dt;
            BindGrid();

        }

=======



            }
========
>>>>>>>> ReserveringTeam/Noah:ProjectGroenBos/Recreatie/ActiviteitInplannen.aspx.cs
        }

        protected void GvActiviteitInplannen_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

<<<<<<<< HEAD:ProjectGroenBos/Recreatie/Planning.aspx.cs
>>>>>>> ReserveringTeam/Noah




        protected void btnActiviteitInplannen_Click(object sender, EventArgs e)
        {
            Activteit = (DataTable)Session["Activiteit"];
            if (Activteit == null)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Recreatie_VoegActiviteitToe", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Naam", TxbActiviteit.Text.Trim());
                cmd.Parameters.AddWithValue("@Locatie", txbLocatie.Text);
                cmd.Parameters.AddWithValue("@Begintijd", TxbBegintijd.Text);
                cmd.Parameters.AddWithValue("@Eindtijd", TxbEindtijd.Text);
                cmd.Parameters.AddWithValue("@MaximaalAantal", TxbAantal.Text);
                cmd.Parameters.AddWithValue("@Datum", Convert.ToDateTime(TxbDatum.Text.Trim()));
                cmd.Parameters.AddWithValue("@FaciliteitID", ddlFaciliteit.SelectedValue);
                cmd.Parameters.AddWithValue("@Inschrijfkosten", txbInschrijfkosten.Text);
                cmd.Parameters.AddWithValue("@MedewerkerID", TxbMedewerker.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                TxbActiviteit.Text = "";
                txbLocatie.Text = "";
                TxbBegintijd.Text = "";
                TxbEindtijd.Text = "";
                TxbAantal.Text = "";
                TxbDatum.Text = "";
                txbInschrijfkosten.Text = "";

                LblBevestiging.Text = "Activiteit toegevoegd";

            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Recreatie_WijzigActiviteit", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Nummer", int.Parse(GridView1.SelectedRow.Cells[0].Text));
                cmd.Parameters.AddWithValue("@Naam", TxbActiviteit.Text.Trim());
                cmd.Parameters.AddWithValue("@Locatie", txbLocatie.Text.Trim());
                cmd.Parameters.AddWithValue("@Begintijd", TxbBegintijd.Text.Trim());
                cmd.Parameters.AddWithValue("@Eindtijd", TxbEindtijd.Text.Trim());
                cmd.Parameters.AddWithValue("@MaximaalAantal", TxbAantal.Text.Trim());
                cmd.Parameters.AddWithValue("@Datum", Convert.ToDateTime(TxbDatum.Text.Trim()));
                cmd.Parameters.AddWithValue("@FaciliteitID", ddlFaciliteit.SelectedValue);
                cmd.Parameters.AddWithValue("@Inschrijfkosten", txbInschrijfkosten.Text.Trim());
                cmd.Parameters.AddWithValue("@MedewerkerID", TxbMedewerker.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();

                TxbActiviteit.Text = "";
                txbLocatie.Text = "";
                TxbBegintijd.Text = "";
                TxbEindtijd.Text = "";
                TxbAantal.Text = "";
                TxbDatum.Text = "";
                txbInschrijfkosten.Text = "";

<<<<<<< HEAD
                LblBevestiging.Text = "Activiteit gewijzigd";
=======
                LblBevestiging.Text = "Activiteit gewijziged";
>>>>>>> ReserveringTeam/Noah
                GridView1.DataBind();
                GridView1.SelectedIndex = -1;
                ViewState["Medewerker"] = null;
                Activteit = (DataTable)ViewState["Medewerker"];
<<<<<<< HEAD

                GridView2.DataSource = null;
                ViewState["Medewerker"] = null;
                GridView2.DataBind();
                dt.Columns.AddRange(new DataColumn[1] { new DataColumn("Naam") });
                ViewState["Medewerker"] = dt;
                this.BindGrid();

                btnActiviteitInplannen.Text = "Activiteit inplannen";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            index = int.Parse(GridView1.SelectedRow.Cells[0].Text);
            GetActivityData(index);
            Textboxesvullen();
            btnActiviteitInplannen.Text = "Wijzigen";

        }

        protected void TxbMedewerker_SelectedIndexChanged(object sender, EventArgs e)
        {


            DataTable dt = (DataTable)ViewState["Medewerker"];
            dt.Rows.Add(TxbMedewerker.SelectedItem.Text.Trim());
            ViewState["Medewerker"] = dt;
            this.BindGrid();

        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
                throw;
            }

            if (GridView2.Rows.Count < 0)
            {
=======
            }
========
        protected void GvActiviteitInplannen_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvActiviteitInplannen.EditIndex = e.NewEditIndex;
            InvullenGridview();
        }

        protected void GvActiviteitInplannen_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

>>>>>>>> ReserveringTeam/Noah:ProjectGroenBos/Recreatie/ActiviteitInplannen.aspx.cs
        }

        protected void GvActiviteitInplannen_SelectedIndexChanged(object sender, EventArgs e)
        {
<<<<<<<< HEAD:ProjectGroenBos/Recreatie/Planning.aspx.cs
            GetActivityData(int.Parse(GridView1.SelectedRow.Cells[0].Text));
            Textboxesvullen();
            btnActiviteitInplannen.Text = "Wijzigen";
========
>>>>>>>> ReserveringTeam/Noah:ProjectGroenBos/Recreatie/ActiviteitInplannen.aspx.cs

        }

        protected void OnSorting(object sender, GridViewSortEventArgs e)
        {
            InvullenGridview(e.SortExpression);
        }

        protected void btnNieuwActiviteit_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup');", true);
        }

        protected void btnInplannen_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Recreatie_VoegActiviteitToe", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Naam", txtActiviteitNaam.Text.Trim());
            cmd.Parameters.AddWithValue("@Locatie", txtLocatie.Text);
            cmd.Parameters.AddWithValue("@Inschrijfkosten", txtInschrijfkosten.Text);
            cmd.Parameters.AddWithValue("@MaximaalAantal", txtMaximaalAantal.Text);
            cmd.Parameters.AddWithValue("@FaciliteitID", ddlOmschrijving.SelectedValue);
            cmd.Parameters.AddWithValue("@Datum", Convert.ToDateTime(txtDatum.Text.Trim()));
            cmd.Parameters.AddWithValue("@Begintijd", txtBegintijd.Text);
            cmd.Parameters.AddWithValue("@Eindtijd", txtEindtijd.Text);
            cmd.Parameters.AddWithValue("@MedewerkerID", ddlMedewerker.SelectedValue);
            cmd.ExecuteNonQuery();
            con.Close();
            
            txtActiviteitNaam.Text = "";
            txtLocatie.Text = "";
            txtInschrijfkosten.Text = "";
            txtMaximaalAantal.Text = "";
            txtDatum.Text = "";
            txtBegintijd.Text = "";
            txtEindtijd.Text = "";
        }

        protected void ddlOmschrijving_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList drp = sender as DropDownList;
            FaciliteitID.Value = drp.SelectedValue;
        }

        protected void ddlMedewerker_SelectedIndexChanged(object sender, EventArgs e)
        {
<<<<<<<< HEAD:ProjectGroenBos/Recreatie/Planning.aspx.cs
            if (GridView2.Rows.Count == 0)
            {
                GridView2.EmptyDataText = "Select medewerker";
            }
            else
            {

>>>>>>> ReserveringTeam/Noah
                int index = int.Parse(GridView2.SelectedValue.ToString());
                DataTable dt = (DataTable)ViewState["Medewerker"];
                dt.Rows[index].Delete();
                ViewState["Medewerker"] = dt;
<<<<<<< HEAD
                BindGrid();
              
            }
            else
            {
                GridView2.DataSource = null;
                ViewState["Medewerker"] = null;
                GridView2.DataBind();
                dt.Columns.AddRange(new DataColumn[1] { new DataColumn("Naam") });
                ViewState["Medewerker"] = dt;
                this.BindGrid();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TxbActiviteit.Text = "";
            txbLocatie.Text = "";
            TxbBegintijd.Text = "";
            TxbEindtijd.Text = "";
            TxbAantal.Text = "";
            TxbDatum.Text = "";
            txbInschrijfkosten.Text = "";

            GridView2.DataSource = null;
            ViewState["Medewerker"] = null;
            GridView2.DataBind();
            dt.Columns.AddRange(new DataColumn[1] { new DataColumn("Naam") });
            ViewState["Medewerker"] = dt;
            this.BindGrid();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TxbActiviteit.Text = "";
            txbLocatie.Text = "";
            TxbBegintijd.Text = "";
            TxbEindtijd.Text = "";
            TxbAantal.Text = "";
            TxbDatum.Text = "";
            txbInschrijfkosten.Text = "";

            GridView1.SelectedIndex = -1;

            GridView2.DataSource = null;
            ViewState["Medewerker"] = null;
            GridView2.DataBind();
            dt.Columns.AddRange(new DataColumn[1] { new DataColumn("Naam") });
            ViewState["Medewerker"] = dt;
            this.BindGrid();

            Activteit = (DataTable)ViewState["Medewerker"];

            btnActiviteitInplannen.Text = "Activiteit inplannen";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            TxbActiviteit.Text = "";
            txbLocatie.Text = "";
            TxbBegintijd.Text = "";
            TxbEindtijd.Text = "";
            TxbAantal.Text = "";
            TxbDatum.Text = "";
            txbInschrijfkosten.Text = "";

            GridView2.DataSource = null;
            ViewState["Medewerker"] = null;
            GridView2.DataBind();
            dt.Columns.AddRange(new DataColumn[1] { new DataColumn("Naam") });
            ViewState["Medewerker"] = dt;
            this.BindGrid();
            Activteit = (DataTable)ViewState["Medewerker"];


            using (SqlConnection Sqlcon = new SqlConnection(connectionstring))
            {
                Sqlcon.Open();
                SqlDataAdapter ada = new SqlDataAdapter();

                int  index2 = int.Parse(GridView1.SelectedRow.Cells[0].Text);

                string sql = "UPDATE dbo.Activiteit SET ActiviteitActief = 0 WHERE Nummer = @Nummer";
                GridView1.Rows[GridView1.SelectedIndex].Visible = false;
                SqlCommand command = new SqlCommand(sql, Sqlcon);
                command.Parameters.AddWithValue("@Nummer", Convert.ToInt32(index2));

                command.ExecuteNonQuery();
                GridView1.DataBind();
                command.Dispose();
                Sqlcon.Close();
            }
            GridView1.SelectedIndex = -1;
        }

        protected void ddlFaciliteit_SelectedIndexChanged(object sender, EventArgs e)
        {

=======
                this.BindGrid();
            }

========
            DropDownList drp = sender as DropDownList;
            MedewerkerID.Value = drp.SelectedValue;
        }

        protected void GvActiviteitInplannen_PageIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GvActiviteitInplannen_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (GvActiviteitInplannen.EditIndex != -1)
            {
                e.Cancel = true;
                int newPageNumber = e.NewPageIndex + 1;
            }
>>>>>>>> ReserveringTeam/Noah:ProjectGroenBos/Recreatie/ActiviteitInplannen.aspx.cs
>>>>>>> ReserveringTeam/Noah
        }
    }
}