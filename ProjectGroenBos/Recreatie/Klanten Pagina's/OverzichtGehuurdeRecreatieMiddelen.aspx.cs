using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Recreatie.Klanten_Pagina_s
{
    public partial class OverzichtGehuurdeRecreatieMiddelen : System.Web.UI.Page
    {
        string connectionstring = ConfigurationManager.ConnectionStrings["dbconnectie"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Aids(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup');", true);
        }

        protected void btnAnnuleren_Click(object sender, EventArgs e)
        {

            using (SqlConnection sqlCon = new SqlConnection(connectionstring))
            {

                var sql = "UPDATE dbo.Huuritem SET ItemstatusID = 1, [Uitgegeven op] = NULL, [Uitgeleend tot] = NULL where Nummer = @Nummer";
                var sql2  = "UPDATE dbo.ReserveringHuuritem SET Status = 0 Where Nummer = @Nummer";
                var cmd2 = new SqlCommand(sql, sqlCon);
                var cmd3 = new SqlCommand(sql2, sqlCon);
                Session["Nummer4"] = GridView1.DataKeys[GridView1.SelectedIndex].Value;
                sqlCon.Open();
                cmd2.Parameters.AddWithValue("@Nummer", (int)Session["Nummer4"]);
                
                cmd2.ExecuteNonQuery();
                cmd3.Parameters.AddWithValue("@Nummer", (int)Session["Nummer4"]);
                cmd3.ExecuteNonQuery();
                sqlCon.Close();
                Response.Redirect("OverzichtGehuurdeRecreatieMiddelen.aspx");
            }
        }
    }
}