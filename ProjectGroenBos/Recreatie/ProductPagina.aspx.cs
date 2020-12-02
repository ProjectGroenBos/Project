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
            if (rdbLeverancier.Checked == true)
            {
                DataTable dtbl = (DataTable)ViewState["PB"];
                GridviewVullen();
                DataView dv = dtbl.DefaultView;
                dv.RowFilter = string.Format("[Naam Leverancier] like '%{0}%'", txtProductZoeken.Text);
                GridView1.DataSource = dv.ToTable();
                GridView1.DataBind();
            }
            else if (rdbCategorie.Checked == true)
            {
                DataTable dtbl = (DataTable)ViewState["PB"];
                DataView dv = dtbl.DefaultView;
                dv.RowFilter = string.Format("Categorie like '%{0}%'", txtProductZoeken.Text);
                GridviewVullen();
                GridView1.DataSource = dv.ToTable();
                GridView1.DataBind();
            }
            else
            {
                DataTable dtbl = (DataTable)ViewState["PB"];
                DataView dv = dtbl.DefaultView;
                dv.RowFilter = string.Format("Artikelnaam like '%{0}%'", txtProductZoeken.Text);
                GridviewVullen();
                GridView1.DataSource = dv.ToTable();
                GridView1.DataBind();

                //(GridView1.DataSource as DataTable).DefaultView.RowFilter = string.Format("Artikelnaam LIKE '{0}%'", txtProductZoeken.Text);
                //(GridView1.DataSource as DataTable).DefaultView.RowFilter = string.Format("Artikelnaam LIKE '{0}%'", txtProductZoeken.Text);
            }
        }

  
    }
}