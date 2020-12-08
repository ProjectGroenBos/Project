using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


namespace ProjectGroenBos.Restaurant
{
    public partial class BestellenFood : System.Web.UI.Page
    {

        string connectionString = ConfigurationManager.ConnectionStrings["dbconnectie"].ToString(); // connection string

        DataTable dta;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                dta = new DataTable();
                dta.Columns.Add(new DataColumn("PK_Product", typeof(int)));
                dta.Columns.Add(new DataColumn("Product", typeof(string)));
                dta.Columns.Add(new DataColumn("Hoeveelheid", typeof(string)));
                Session["dte"] = dta;
                gvInkoopOrderregel.DataSource = dta;
                gvInkoopOrderregel.DataBind();
            }
        }

        protected void btnMaakOrderRegel_Click(object sender, EventArgs e)
        {

            DataTable dta = (DataTable)Session["dte"];

            string Product = ddlProduct.SelectedItem.Text.ToString();
            int ProductID = int.Parse(ddlProduct.SelectedItem.Value.ToString());
            int Quantity = int.Parse(txtQty.Text);
            DataRow dr = dta.NewRow();

            dr["PK_Product"] = ProductID;
            dr["Product"] = Product;
            dr["Hoeveelheid"] = Quantity;



            dta.Rows.Add(dr);
            gvInkoopOrderregel.DataSource = dta;
            gvInkoopOrderregel.DataBind();


        }





        protected void gvInkoopOrderregel_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvInkoopOrderregel_RowEditing(object sender, GridViewEditEventArgs e)
        {


        }

        protected void gvInkoopOrderregel_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {


        }

        protected void gvInkoopOrderregel_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void gvInkoopOrderregel_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dta = (DataTable)Session["dte"];
            dta.Rows[e.RowIndex].Delete();
            gvInkoopOrderregel.DataSource = dta;
            gvInkoopOrderregel.DataBind();

        }



        protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void btnPlaatsOrder_Click(object sender, EventArgs e)
        {
            DataTable dta = (DataTable)Session["dte"];

            if (dta.Rows.Count > 0)
            {

                int Leveranciernummer = Int32.Parse(ddlLeverancier.SelectedItem.Value);

                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        // Maak Inkooporder aan
                        sqlCon.Open();
                        String query = "INSERT INTO InkoopOrderAanvraag ([LeverancierID]) VALUES (@Leveranciernummer)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@Leveranciernummer", Leveranciernummer);
                        sqlCmd.ExecuteNonQuery();
                        sqlCon.Close();

                        // Haal zojuist aangemaakt Inkooporder op om ID uit te halen
                        sqlCon.Open();
                        string selectquery = "SELECT TOP 1 PKorder FROM [dbo].[Inkooporder] ORDER BY PKorder DESC";
                        SqlCommand sqlComd = new SqlCommand(selectquery, sqlCon);
                        SqlDataReader r;
                        r = sqlComd.ExecuteReader();

                        int ordernummer = -1;

                        while (r.Read())
                        {
                            ordernummer = (int)r[0];
                        }
                        sqlCon.Close();

                        foreach (DataRow rij in dta.Rows)
                        {
                            /*
                             * dta.Columns.Add(new DataColumn("PK_Product", typeof(int)));
                             * dta.Columns.Add(new DataColumn("Product", typeof(string)));
                             * dta.Columns.Add(new DataColumn("Hoeveelheid", typeof(string)));
                            */

                            int PK_Product = (int)rij[0];
                            string Product = (string)rij[1];
                            string Hoeveelheid = (string)rij[2];


                            sqlCon.Open();
                            String orderregels = "INSERT INTO inkooporderregel (Hoeveelheid,ProductID,InkooporderPKorder) VALUES (@Hoeveelheid,@ProductID,@ordernummer)";
                            SqlCommand sqlCemd = new SqlCommand(orderregels, sqlCon);
                            sqlCemd.Parameters.AddWithValue("@Hoeveelheid", Hoeveelheid);
                            sqlCemd.Parameters.AddWithValue("@ProductID", PK_Product);
                            sqlCemd.Parameters.AddWithValue("@ordernummer", ordernummer);
                            sqlCemd.ExecuteNonQuery();
                            sqlCon.Close();
                        }
                    }

                    Response.Redirect("~/BestellenFood.aspx");


                }



            }

        }
    }



