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

        protected void gvVoorraad_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

        protected void gvVoorraad_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
        }

        protected void gvVoorraad_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

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

        protected void gvVoorraad_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtZoeken_TextChanged(object sender, EventArgs e)
        {
            DataTable dtbl = (DataTable) Session["vDB"];
            DataView dv = dtbl.DefaultView;
            dv.RowFilter = string.Format("Artikelnaam like '%{0}%'", txtZoekbalk.Text);
            gvVoorraad.DataSource = dv.ToTable();
            gvVoorraad.DataBind();

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

        protected void BtnBestellen_Click(object sender, EventArgs e)
        {
            DataTable Aanvraag = new DataTable();
            Aanvraag.Columns.Add(new DataColumn("ID", typeof(int)));
            Aanvraag.Columns.Add(new DataColumn("Naam", typeof(string)));

            foreach (GridViewRow item in gvVoorraad.Rows)
            {
                if (item.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chk = (item.FindControl("cbGeselecteerd") as CheckBox);
                    if (chk.Checked)
                    {

                        using (SqlConnection sqlCon = new SqlConnection(connectionstring))
                        {

                            SqlCommand cmd =
                                new SqlCommand("Select [ID], [Artikelnaam] FROM vVoorraadRecreatie where ID=@id",
                                    sqlCon);
                            cmd.Parameters.AddWithValue("id", gvVoorraad.DataKeys[item.RowIndex].Value.ToString());
                            sqlCon.Open();
                            int id = cmd.ExecuteNonQuery();
                            SqlDataAdapter da = new SqlDataAdapter(cmd);
                            da.Fill(Aanvraag);


                            sqlCon.Close();
                            gvOrderaanvragen.DataSource = Aanvraag;
                        }


                    }
                }
            }


            gvOrderaanvragen.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup');", true);
        }

        protected void BtnAanvraag_Click(object sender, EventArgs e)
        {

            using (SqlConnection sqlCon = new SqlConnection(connectionstring))
            {
                // sqlCon.Open();
                // String query = "UPDATE Product SET Naam = @Naam,Omschrijving=@Omschrijving,Minimale_Voorraad=@Minimale_Voorraad WHERE PK_Product = @id";
                // SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                // sqlCmd.Parameters.AddWithValue("@Naam", (gvMinimaleVoorraad.Rows[--].FindControl("tbAantal") as TextBox).Text.Trim());
            }
        }
    }
}