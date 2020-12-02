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
                dt.Columns.AddRange(new DataColumn[1] { new DataColumn("Leverancier") });
                //dt.Rows.Add("Yes");
                ViewState["Leverancier"] = dt;

            }

            if (ViewState["Leverancier"] == null)
            {
                ViewState["Leverancier"] = dt;
            }
        }
    }
}