using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Restaurant
{
    public partial class OrderPagina : System.Web.UI.Page
    {
        //Connectionstring
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Repeater();
            }
        }

        public void Repeater()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("select * from VoedselRestaurantInkoopOrder inner join Leverancier on Leverancier.ID = VoedselRestaurantInkoopOrder.LeverancierID", con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                rpReservering.DataSource = ds;
                gvOrderBekijken.DataBind();
                rpReservering.DataBind();
                

                con.Close();
            }
        }

        private int Totaalbedrag()
        {
            using (SqlConnection connection = new SqlConnection(constr))
            {
                int nummer = ophalenbestelnummer();
                connection.Open();
                string selectquery = "SELECT cast(SUM(RegelTotaal) AS DECIMAL(18,2)) AS Totaalbedrag FROM InkoopOrderFoodView WHERE Bestelnummer =" + nummer + "";
                SqlCommand sqlComd = new SqlCommand(selectquery, connection);
                SqlDataReader r;
                r = sqlComd.ExecuteReader();

                int Bestelnummer = 0;

                while (r.Read())
                {
                    Bestelnummer = (int)r[0];
                }
                connection.Close();
                return Bestelnummer;
            }
        }
        
        private int ophalenbestelnummer()
        {
            using (SqlConnection connection = new SqlConnection(constr))
            {

                connection.Open();
                string selectquery = "SELECT Bestelnummer FROM VoedselRestaurantAanvraagRegels INNER JOIN VoedselRestaurantInkoopOrder ON VoedselRestaurantAanvraagRegels.VoedselOrderAanvraag = VoedselRestaurantInkoopOrder.Nummer INNER JOIN InkoopOrderAanvraagStatus ON VoedselRestaurantInkoopOrder.Aanvraagstatus = InkoopOrderAanvraagStatus.ID INNER JOIN Voorraad ON VoedselRestaurantAanvraagRegels.VoorraadID = Voorraad.ID where nummer = @nummer";
                SqlCommand sqlComd = new SqlCommand(selectquery, connection);
                SqlDataReader r;
                r = sqlComd.ExecuteReader();

                int Bestelnummer = 0;

                while (r.Read())
                {
                    Bestelnummer = (int)r[0];
                }
                connection.Close();
                return Bestelnummer;
            }
        }

        private int voedselorderid()
        {
            using (SqlConnection connection = new SqlConnection(constr))
            {
                int nummer = ophalenbestelnummer();
                connection.Open();
                string selectquery = "SELECT Nummer FROM VoedselRestaurantInkoopOrder WHERE Bestelnummer =" + nummer + "";
                SqlCommand sqlComd = new SqlCommand(selectquery, connection);
                SqlDataReader r;
                r = sqlComd.ExecuteReader();

                int voedselorderid = 0;

                while (r.Read())
                {
                    voedselorderid = (int)r[0];
                }
                connection.Close();
                return voedselorderid;
            }
        }

        private int leverancierid()
        {
            using (SqlConnection connection = new SqlConnection(constr))
            {
                int nummer = ophalenbestelnummer();
                connection.Open();
                string selectquery = "SELECT ID FROM Leverancier WHERE Bestelnummer =" + nummer + "";
                SqlCommand sqlComd = new SqlCommand(selectquery, connection);
                SqlDataReader r;
                r = sqlComd.ExecuteReader();

                int leverancierid = 0;

                while (r.Read())
                {
                    leverancierid = (int)r[0];
                }
                connection.Close();
                return leverancierid;
            }
        }

        private void InsertInfo()
        {
            using (SqlConnection sqlCon = new SqlConnection(constr))
            {
                int Totaalbedragen = Totaalbedrag();
                double Tot = Convert.ToDouble(Totaalbedragen);

                int voedselorder = voedselorderid();
                int leverancier = leverancierid();

                sqlCon.Open();
                String query = "INSERT INTO [2020-BIM02-P1-P2-Groenbos].[dbo].[Crediteurenfactuur] ([Datum],[Totaal bedrag],[Termijn],[Omschrijving betaalcondities],[VoedselorderID],[FactuurstatusID],[IBAN],[LeverancierID]) VALUES (@datum,@totaalbedrag,@termijn,@betaalcondities,@voedselorderid,@factuurstatusid,@iban,@leverancierid)";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                SqlParameter sqlParameter0 = sqlCmd.Parameters.AddWithValue("@Datum", DateTime.Now);
                SqlParameter sqlParameter1 = sqlCmd.Parameters.AddWithValue("@totaalbedrag", Tot);
                SqlParameter sqlParameter2 = sqlCmd.Parameters.AddWithValue("@termijn", DateTime.Now.AddMonths(1));
                SqlParameter sqlParameter3 = sqlCmd.Parameters.AddWithValue("@betaalcondities", "Inkooporder".Trim());
                SqlParameter sqlParameter4 = sqlCmd.Parameters.AddWithValue("@voedselorderid", voedselorder);
                SqlParameter sqlParameter5 = sqlCmd.Parameters.AddWithValue("@factuurstatusid", "1".Trim());
                SqlParameter sqlParameter6 = sqlCmd.Parameters.AddWithValue("@iban", "NL32 RABO 0920.96.13.256".Trim());
                SqlParameter sqlParameter7 = sqlCmd.Parameters.AddWithValue("@leverancierid", leverancier);
                sqlCmd.ExecuteNonQuery();
                sqlCon.Close();
            }
        }

        private void statusverandering()
        {
            using (SqlConnection connection = new SqlConnection(constr))
            {
                int nummer = ophalenbestelnummer();


                //Update de status naar klaar zijn

                String myquery = "UPDATE VoedselRestaurantInkoopOrder SET Aanvraagstatus='7' WHERE Bestelnummer =" + nummer + "";
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = myquery;
                cmd.Connection = connection;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                cmd.CommandText = myquery;
                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();

            }
        }

        protected void btnGoedkeuren_Click(object sender, EventArgs e)
        {
            InsertInfo();
            statusverandering();
        }
    }
}