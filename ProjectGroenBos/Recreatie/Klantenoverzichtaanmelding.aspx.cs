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
    public partial class Klantenoverzichtaanmelding : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        string connectionstring = ConfigurationManager.ConnectionStrings["dbconnectie"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            //sqlCall();
            //Session["GastNummer"] = "7";
        }
        private void sqlCall() 
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionstring))
            {
                sqlCon.Open();
                string query = "select* from vAanmeldingen where GastNummer = @Nummer";

                SqlCommand cmd = new SqlCommand(query, sqlCon);
                cmd.Parameters.AddWithValue("@Nummer", 7);
                cmd.ExecuteNonQuery();
                sqlCon.Close();
                gvAanmeldingAnnuleren.DataBind();

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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM vAanmeldingen", sqlCon);
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
                    gvAanmeldingAnnuleren.DataSource = dv;
                }
                else
                {
                    gvAanmeldingAnnuleren.DataSource = dtbl;
                }

                gvAanmeldingAnnuleren.DataBind();
            }
        }

        protected void BtnDoorgaan_Click1(object sender, EventArgs e)
        {
            DataTable dtbl = new DataTable();
            string rowIndex = gvAanmeldingAnnuleren.SelectedRow.Cells[1].Text;

            using (SqlConnection Sqlcon = new SqlConnection(connectionstring))
            {

                Sqlcon.Open();

                SqlDataAdapter ada = new SqlDataAdapter();
                int index2 = int.Parse(rowIndex);
                string sql = "UPDATE dbo.Aanmelding SET Status = 0 WHERE Nummer = @Nummer";
                SqlCommand command = new SqlCommand(sql, Sqlcon);
                command.Parameters.AddWithValue("@Nummer", Convert.ToInt32(index2));
                command.ExecuteNonQuery();
                command.Dispose();
                gvAanmeldingAnnuleren.DataBind();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM vActiviteit WHERE ActiviteitActief = 1", Sqlcon);
                sqlDa.Fill(dtbl);
                //gvActiviteitVerwijderen.DataSource = dtbl;


                Sqlcon.Close();
                gvAanmeldingAnnuleren.DataBind();
            }
        }

        protected void btnAnnuleren_Click(object sender, EventArgs e)
        {

        }

        protected void gvAanmeldingAnnuleren_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup');", true);
        }


    }
}