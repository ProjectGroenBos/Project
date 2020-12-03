using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Recreatie
{
    public partial class ProductPagina : System.Web.UI.Page
    {
        public bool zoeken = false;
        DataTable dtbl = new DataTable();
        string connectionstring = ConfigurationManager.ConnectionStrings["dbconnectie"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionstring))
                {
                    sqlCon.Open();
                    SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT Nummer, Artikelnaam, Omschrijving, Prijs, Aantal, [Minimum voorraad] AS 'MinimumVoorraad', [Naam Leverancier] AS 'NaamLeverancier', Categorie, Huurtarief, LeverancierID, CategorieID FROM vRecreatieProductpagina", sqlCon);
                    sqlDa.Fill(dtbl);
                    ViewState["PB"] = dtbl;
                    Session["Zoeken"] = zoeken;
                }
            }
        }

        protected void ddlLeverancier_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList drp = sender as DropDownList;
            LeverancierID.Value = drp.SelectedValue;
        }

        protected void ddlCategorie_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList drp = sender as DropDownList;
            CategorieID.Value = drp.SelectedValue;
        }

        protected void GridviewVullen(string sortExpression = null)
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionstring))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT Nummer, Artikelnaam, Omschrijving, Prijs, Aantal, [Minimum voorraad] AS 'MinimumVoorraad', [Naam Leverancier] AS 'NaamLeverancier', Categorie, Huurtarief, LeverancierID, CategorieID FROM vRecreatieProductpagina", sqlCon);
                sqlDa.Fill(dtbl);
                ViewState["PB"] = dtbl;
            }

            GridView1.DataSourceID = "";
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
        }



        protected void txtProductZoeken_TextChanged(object sender, EventArgs e)
        {

            //    if (rdbLeverancier.Checked == true)
            //    {

            //        DataTable dtbl = (DataTable)ViewState["PB"];
            //        DataView dv = dtbl.DefaultView;
            //        dv.RowFilter = string.Format("NaamLeverancier like '%{0}%'", txtProductZoeken.Text);
            //        GridviewVullen();
            //        GridView1.DataSource = dv.ToTable();
            //        GridView1.DataBind();

            //        rdbLeverancier.Checked = false;
            //    }
            //    else if (rdbCategorie.Checked == true)
            //    {
            //        DataTable dtbl = (DataTable)ViewState["PB"];
            //        DataView dv = dtbl.DefaultView;
            //        dv.RowFilter = string.Format("Categorie like '%{0}%'", txtProductZoeken.Text);
            //        GridviewVullen();
            //        GridView1.DataSource = dv.ToTable();
            //        GridView1.DataBind();

            //        rdbCategorie.Checked = false;
            //    }
            //    else
            //    {
            //        DataTable dtbl = (DataTable)ViewState["PB"];
            //        DataView dv = dtbl.DefaultView;
            //        dv.RowFilter = string.Format("Artikelnaam like '%{0}%'", txtProductZoeken.Text);
            //        GridviewVullen();
            //        GridView1.DataSource = dv.ToTable();
            //        GridView1.DataBind();

            //    }
            //    //GridView1.DataBind();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            if ((bool)Session["zoeken"] == true)
            {
                DataTable dtbl = (DataTable)ViewState["PB"];
                DataView dv = dtbl.DefaultView;
                dv.RowFilter = string.Format("Artikelnaam like '%{0}%'", txtProductZoeken.Text);
                GridView1.DataSource = dv.ToTable();

                txtProductZoeken.Text = "";
            }

            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if ((bool)Session["Zoeken"] == true)
            {
                GridView1.DataSourceID = "";
                GridView1.DataSource = SqlDataSource1;
            }

            GridView1.EditIndex = -1;
            GridView1.DataBind();

        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void btnZoeken_Click(object sender, EventArgs e)
        {
            Session["zoeken"] = true;

            if (rdbLeverancier.Checked == true)
            {

                DataTable dtbl = (DataTable)ViewState["PB"];
                DataView dv = dtbl.DefaultView;
                dv.RowFilter = string.Format("NaamLeverancier like '%{0}%'", txtProductZoeken.Text);
                GridviewVullen();
                GridView1.DataSource = dv.ToTable();
                GridView1.DataBind();

                rdbLeverancier.Checked = false;
            }
            else if (rdbCategorie.Checked == true)
            {
                DataTable dtbl = (DataTable)ViewState["PB"];
                DataView dv = dtbl.DefaultView;
                dv.RowFilter = string.Format("Categorie like '%{0}%'", txtProductZoeken.Text);
                GridviewVullen();
                GridView1.DataSource = dv.ToTable();
                GridView1.DataBind();

                rdbCategorie.Checked = false;
            }
            else
            {
                GridviewVullen();
                DataTable dtbl = (DataTable)ViewState["PB"];
                DataView dv = dtbl.DefaultView;
                dv.RowFilter = string.Format("Artikelnaam like '%{0}%'", txtProductZoeken.Text);
                GridView1.DataSource = dv.ToTable();
                GridView1.DataBind();

            }
            //    //GridView1.DataBind();

        }
    }
}