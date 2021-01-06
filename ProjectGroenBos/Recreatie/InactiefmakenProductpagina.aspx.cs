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
    public partial class InactiefmakenProductpagina : System.Web.UI.Page
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
                    GVProductpaginaInactiefMaken.DataSource = dv;
                }
                else
                {
                    GVProductpaginaInactiefMaken.DataSource = dtbl;
                }

                GVProductpaginaInactiefMaken.DataBind();
            }

        }





        protected void txbZoekenProductpaginainactief_TextChanged(object sender, EventArgs e)
        {
            if (RdbProductpaginaLeverancier.Checked == true)
            {
                DataTable dtbl = (DataTable)Session["vaDB"];
                DataView dv = dtbl.DefaultView;
                dv.RowFilter = string.Format("[Naam Leverancier] like '%{0}%'", txbZoekenProductpaginainactief.Text);
                GVProductpaginaInactiefMaken.DataSource = dv.ToTable();
                GVProductpaginaInactiefMaken.DataBind();
                RdbProductpaginaLeverancier.Checked = false;
            }
            else if (RdbProductpaginaCategorie.Checked == true)
            {
                DataTable dtbl = (DataTable)Session["vaDB"];
                DataView dv = dtbl.DefaultView;
                dv.RowFilter = string.Format("Categorie like '%{0}%'", txbZoekenProductpaginainactief.Text);
                GVProductpaginaInactiefMaken.DataSource = dv.ToTable();
                GVProductpaginaInactiefMaken.DataBind();
                RdbProductpaginaCategorie.Checked = false;
            }
            else
            {
                DataTable dtbl = (DataTable)Session["vaDB"];
                DataView dv = dtbl.DefaultView;
                dv.RowFilter = string.Format("Artikelnaam like '%{0}%'", txbZoekenProductpaginainactief.Text);
                GVProductpaginaInactiefMaken.DataSource = dv.ToTable();
                GVProductpaginaInactiefMaken.DataBind();
            }
        }



        protected void GVProductpaginaInactiefMaken_Sorting1(object sender, GridViewSortEventArgs e)
        {
            InvullenGridview(e.SortExpression);
        }





        protected void GVProductpaginaInactiefMaken_SelectedIndexChanged1(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup');", true);
        }

        protected void BtnDoorgaanproduct_Click1(object sender, EventArgs e)
        {
            GridViewRow row = this.GVProductpaginaInactiefMaken.SelectedRow;
            DataTable dtbl = new DataTable();
            using (SqlConnection Sqlcon = new SqlConnection(connectionstring))
            {

                Sqlcon.Open();

                SqlDataAdapter ada = new SqlDataAdapter();

                int index2 = Convert.ToInt32(GVProductpaginaInactiefMaken.DataKeys[row.RowIndex].Value);


                string sql = "UPDATE dbo.Huuritem SET ItemstatusID = 3 WHERE Nummer = @Nummer";

                SqlCommand command = new SqlCommand(sql, Sqlcon);

                command.Parameters.AddWithValue("@Nummer", Convert.ToInt32(index2));

                command.ExecuteNonQuery();

                //gvActiviteitVerwijderen.DataBind();

                command.Dispose();

                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM vRecreatieProductpagina", Sqlcon);
                sqlDa.Fill(dtbl);
                //gvActiviteitVerwijderen.DataSource = dtbl;


                Sqlcon.Close();
                InvullenGridview();


            }
        }
    }
}