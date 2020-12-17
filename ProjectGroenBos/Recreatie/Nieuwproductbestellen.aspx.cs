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
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connectionstring = ConfigurationManager.ConnectionStrings["dbconnectie"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MakeDataTableAndDisplay();
            }
        }

        private void MakeDataTableAndDisplay()
        {
            DataTable dtCart = new DataTable();
            DataColumn column;

            column = new DataColumn();
            column.DataType = System.Type.GetType("System.Int32");
            column.AutoIncrement = true;
            column.ColumnName = "Nummer";
            dtCart.Columns.Add(column);

            column = new DataColumn();
            column.DataType = Type.GetType("System.String");
            column.ColumnName = "Productnaam";
            dtCart.Columns.Add(column);

            column = new DataColumn();
            column.DataType = Type.GetType("System.Int32");
            column.ColumnName = "Hoeveelheid";
            dtCart.Columns.Add(column);

            column = new DataColumn();
            column.DataType = Type.GetType("System.String");
            column.ColumnName = "Opmerking";
            dtCart.Columns.Add(column);

            Session["sessiondtCart"] = dtCart;

        }
        protected void btnAanvragen_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionstring))
            {
                sqlCon.Open();

                SqlCommand cmd = new SqlCommand("sp_Recreatie_Nieuweproductenaanvraag", sqlCon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();
                sqlCon.Close();

                sqlCon.Open();
                string selectquery = "SELECT TOP 1 ID FROM [dbo].[InkoopAanvraagNieuwProduct] ORDER BY ID DESC";
                SqlCommand sqlComd = new SqlCommand(selectquery, sqlCon);
                SqlDataReader r;
                r = sqlComd.ExecuteReader();

                int ordernummer = -1;


                while (r.Read())
                {
                    ordernummer = (int)r[0];
                }


                sqlCon.Close();
                foreach (GridViewRow ding in gvNieuwenProductenaanvragen.Rows)
                {
                    {
                        sqlCon.Open();
                        SqlCommand vul = new SqlCommand("sp_Recreatie_Nieuweproductenaanvraagregel", sqlCon);
                        vul.CommandType = CommandType.StoredProcedure;
                        vul.Parameters.AddWithValue("@InkoopAanvraagNieuwProductID", (ordernummer));
                        vul.Parameters.AddWithValue("@Aantal", (int.Parse(gvNieuwenProductenaanvragen.Rows[ding.RowIndex].Cells[2].Text.Trim())));
                        vul.Parameters.AddWithValue("@Naam", (gvNieuwenProductenaanvragen.Rows[ding.RowIndex].Cells[1].Text.Trim()));
                        vul.Parameters.AddWithValue("@Opmerking", (gvNieuwenProductenaanvragen.Rows[ding.RowIndex].Cells[3].Text.Trim()));
                        vul.ExecuteNonQuery();
                        sqlCon.Close();
                    }


                }

                
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup');", true);
        }
        protected void btnToevoegen_Click(object sender, EventArgs e)
        {
            DataTable dtCart = (DataTable)Session["sessiondtCart"];
            DataRow row;
            row = dtCart.NewRow();
            row["Productnaam"] = txtActiviteitNaam.Text.Trim();
            row["Hoeveelheid"] = int.Parse(txtHoeveelheid.Text.Trim());
            row["Opmerking"] = txtOpmerking.Text.Trim();
            dtCart.Rows.Add(row);

            Session["sessiondtCart"] = dtCart;

            gvNieuwenProductenaanvragen.DataSource = dtCart;
            gvNieuwenProductenaanvragen.DataBind();

        }
        protected void btnDoorgaan_Click(object sender, EventArgs e)
        {

        }

        protected void gvNieuwenProductenaanvragen_SelectedIndexChanged1(object sender, EventArgs e)
        {
            DataTable dtCart = (DataTable)Session["sessiondtCart"];
            int index = gvNieuwenProductenaanvragen.SelectedIndex;
            dtCart.Rows.RemoveAt(index);
            gvNieuwenProductenaanvragen.DataSource = dtCart;
            gvNieuwenProductenaanvragen.DataBind();


        }
    }
}
