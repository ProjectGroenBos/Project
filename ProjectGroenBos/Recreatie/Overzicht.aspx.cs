using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Recreatie
{
    public partial class Overzicht : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection(Helper.HelperClass.DatabaseConnectieString);
        protected void Page_Load(object sender, EventArgs e)
        {
            lbldatumNu.Text = DateTime.Now.ToString("dd" + "-" + "MM" + "-" + "yy");
        }

        protected void OnButtonPress(object sender, EventArgs e)
        {
            if (Session["datacount"] == null)
            {
                Session["datacount"] = 0;
            }
            Session["datacount"] = ((int)Session["datacount"]) + 1;
            lbldatumNu.Text = DateTime.Today.AddDays((int)Session["datacount"]).ToString("dd" + "-"+ "MM" + "-" + "yy");

            CheckDate(lbldatumNu.Text);
           
        }

        protected void CheckDate(string DatumCount) 
        {
            try
            {
                cnn.Open();
                string query = "SELECT [RecreatieprogrammaDatum] FROM [Recreatieprogramma_Activiteit]";

                SqlCommand cmdSchedule = new SqlCommand(query, cnn);

                SqlDataReader dr = cmdSchedule.ExecuteReader();
                string resulaat = dr.Read().ToString();
                lblActiviteiten.Text = dr["RecreatieprogrammaDatum"].ToString();
                if (dr["RecreatieprogrammaDatum"].ToString() == DatumCount)
                {
                    lbldatumNu.Text = "is gelijk";
                }
                dr.Close();
            }
            catch
            {
                //lbldatumNu.Text = "Error";
            }
            finally
            {
                cnn.Close();
            }
        }
    }
}