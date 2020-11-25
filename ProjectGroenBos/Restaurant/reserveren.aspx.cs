using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ProjectGroenBos.Restaurant
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReserveer_Click(object sender, EventArgs e)
        {
            String constring ="Data Source= SQL.BIM.OSOX.NL;initial Catalog =2020-BIM02 P1-P2- Groenbos; User ID =BIM022020;Password=BiM@IH202"; 
              SqlConnection sqlcon = new SqlConnection(constring);
            String pname = "reserveringaanmaak1"; ;
            sqlcon.Open();
            SqlCommand com = new SqlCommand(pname, sqlcon);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Voornaam", txtVoornaam.Text.ToString());
            com.Parameters.AddWithValue("@Achternaam", txtAchternaam.Text.ToString());
            com.Parameters.AddWithValue("@Tussenvoegsel", txtTussenvoegsel.Text.ToString());
            com.Parameters.AddWithValue("@Email", txtEmail.Text.ToString());
            com.ExecuteNonQuery();
            sqlcon.Close(); ; 
           
        }
    }
}