using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Financien
{
    public partial class InzienInkoopTraject : System.Web.UI.Page
    {
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

                SqlCommand cmd = new SqlCommand("SELECT * FROM InkoopOrderAanvraag a LEFT JOIN InkooporderaanvraagItemsTotaalprijs n ON a.Nummer = n.InkooporderaanvraagNummer INNER JOIN Leverancier l ON a.LeverancieriD = l.ID LEFT JOIN FactuurInvullen ON n.InkoopOrderAanvraagNummer = FactuurInvullen.InkoopOrderAanvraagNummer", con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                rpInzienInkoopTraject.DataSource = ds;
                rpInzienInkoopTraject.DataBind();

                con.Close();
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.Text == "Alle Afdelingen")
            {
                SqlDataSource1.SelectCommand =
                "select * from inkooporderaanvraagmainLev order by datum DESC, opmerking DESC";
                gvInkooporderaanvragerMain.DataBind();
            }

            else
            {
                SqlDataSource1.SelectCommand =
                    "select * from inkooporderaanvraagmainLev where Naam = '" + DropDownList1.Text + "' order by datum DESC, opmerking DESC";
                gvInkooporderaanvragerMain.DataBind();
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                SqlDataSource1.SelectCommand =
                "select * from inkooporderaanvraagmainLev where Bestelnummer LIKE '" + TextBox1.Text + "%' order by datum DESC, opmerking DESC";
                gvInkooporderaanvragerMain.DataBind();
            }

            else
            {
                SqlDataSource1.SelectCommand =
                    "select * from inkooporderaanvraagmainLev order by datum DESC, opmerking DESC";
                gvInkooporderaanvragerMain.DataBind();
            }
        }

        protected void btnOpenPDF_OnClick(object sender, EventArgs e)
        {
            string sPathToSaveFileTo = @"C:\SelectedFile.pdf";  // on this path i will create selected PDF File Data    open pdf for checking


            //Read Connection from web config
            using (SqlConnection con = new SqlConnection(constr))
            {
                Button btn = sender as Button;
                int gridviewnr = int.Parse(btn.CommandName);

                con.Open();
                using (SqlCommand cmd = new SqlCommand("select PdfData from Crediteurenfactuur where ID= gridviewnr", con))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader(System.Data.CommandBehavior.Default))
                    {
                        if (dr.Read())
                        {
                            // read in using GetValue and cast to byte array
                            byte[] fileData = (byte[])dr.GetValue(0);


                            // write bytes to disk as file
                            using (System.IO.FileStream fs = new System.IO.FileStream(sPathToSaveFileTo, System.IO.FileMode.Create, System.IO.FileAccess.ReadWrite))
                            {
                                // use a binary writer to write the bytes to disk
                                using (System.IO.BinaryWriter bw = new System.IO.BinaryWriter(fs))
                                {
                                    bw.Write(fileData);
                                    bw.Close();
                                }
                            }
                        }


                        // close reader to database
                        dr.Close();
                    }
                }
            }
        }
    }
}