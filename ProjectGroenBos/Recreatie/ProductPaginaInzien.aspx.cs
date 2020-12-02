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
    public partial class ProductPaginaInzien : System.Web.UI.Page
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM vRecreatieProductpagina", sqlCon);
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
                    GVProductpagInzien.DataSource = dv;
                }
                else
                {
                    GVProductpagInzien.DataSource = dtbl;
                }

                GVProductpagInzien.DataBind();
            }

        }

        protected void GVProductpagInzien_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void TxbZoekenproductpagina_TextChanged(object sender, EventArgs e)
        {
            if (CkbLeverancierinzien.Checked == true)
            {
                DataTable dtbl = (DataTable)Session["vaDB"];
                DataView dv = dtbl.DefaultView;
                dv.RowFilter = string.Format("[Naam Leverancier] like '%{0}%'", TxbZoekenproductpagina.Text);
                GVProductpagInzien.DataSource = dv.ToTable();
                GVProductpagInzien.DataBind();
            }
            else if (CkbCategorieproductpaginainzien.Checked == true)
            {
                DataTable dtbl = (DataTable)Session["vaDB"];
                DataView dv = dtbl.DefaultView;
                dv.RowFilter = string.Format("Categorie like '%{0}%'", TxbZoekenproductpagina.Text);
                GVProductpagInzien.DataSource = dv.ToTable();
                GVProductpagInzien.DataBind();
            }
            else
            {
                DataTable dtbl = (DataTable)Session["vaDB"];
                DataView dv = dtbl.DefaultView;
                dv.RowFilter = string.Format("Artikelnaam like '%{0}%'", TxbZoekenproductpagina.Text);
                GVProductpagInzien.DataSource = dv.ToTable();
                GVProductpagInzien.DataBind();
            }
        }

        protected void GVProductpagInzien_Sorting(object sender, GridViewSortEventArgs e)
        {
            InvullenGridview(e.SortExpression);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("InactiefmakenProductpagina.aspx");
        }
    }
}