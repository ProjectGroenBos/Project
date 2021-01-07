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
    public partial class Klantenoverzichtfaciliteit : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        string connectionstring = ConfigurationManager.ConnectionStrings["dbconnectie"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            InvullenGridview();
        }
        void InvullenGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionstring))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM [ReserveringFaciliteit] WHERE ([GastNummer] = @GastNummer AND (NOT (Status = 0)))", sqlCon);
                cmd.Parameters.AddWithValue("@GastNummer", int.Parse((string)Session["GastNummer"]));
                sqlCon.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dtbl);
                Session["vaDB"] = dtbl;
            }

            Gridviewfaciliteitannuleren.DataSource = dtbl;

            Gridviewfaciliteitannuleren.DataBind();
        }

            protected void Gridviewfaciliteitannuleren_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('#Popup');", true);
        }

        protected void BtnDoorgaanproduct_Click(object sender, EventArgs e)
        {
            GridViewRow row = this.Gridviewfaciliteitannuleren.SelectedRow;
            DataTable dtbl = new DataTable();
            using (SqlConnection Sqlcon = new SqlConnection(connectionstring))
            {

                Sqlcon.Open();

                SqlDataAdapter ada = new SqlDataAdapter();

                int index2 = Convert.ToInt32(Gridviewfaciliteitannuleren.DataKeys[row.RowIndex].Value);


                string sql = "UPDATE dbo.[ReserveringFaciliteit] SET Status = 0 WHERE Nummer = @Nummer";

                SqlCommand command = new SqlCommand(sql, Sqlcon);

                command.Parameters.AddWithValue("@Nummer", Convert.ToInt32(index2));

                command.ExecuteNonQuery();

                //gvActiviteitVerwijderen.DataBind();

                command.Dispose();


                Sqlcon.Close();
                InvullenGridview();


            }
        }
    }
}