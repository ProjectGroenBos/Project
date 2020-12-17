using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Recreatie
{
    public partial class Klantenoverzichtaanmelding : System.Web.UI.Page
    {
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

        protected void BtnDoorgaanproduct_Click1(object sender, EventArgs e)
        {

        }

        protected void btnAnnuleren_Click(object sender, EventArgs e)
        {

        }
    }
}