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
    public partial class ActiviteitVerwijderen : System.Web.UI.Page
    {
        string connectionstring = ConfigurationManager.ConnectionStrings["dbconnectie"].ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString);
        DataTable Activteit;
        int Currentactivity;
        DataTable dt = new DataTable();
        private int index;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            index = int.Parse(GridView1.SelectedRow.Cells[0].Text);
            GetActivityData(index);
            Textboxesvullen();
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
                int index = int.Parse(GridView2.SelectedValue.ToString());
                DataTable dt = (DataTable)ViewState["Medewerker"];
                dt.Rows[index].Delete();
                ViewState["Medewerker"] = dt;
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

        protected void btnActiviteitVerwijderen_Click(object sender, EventArgs e)
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

                int index2 = int.Parse(GridView1.SelectedRow.Cells[0].Text);

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
    }
}