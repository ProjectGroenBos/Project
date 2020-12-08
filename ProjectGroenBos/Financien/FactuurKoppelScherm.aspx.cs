using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Financien
{
    public partial class FactuurKoppelScherm : System.Web.UI.Page
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
                rpFactuurToevoegen.DataSource = ds;
                rpFactuurToevoegen.DataBind();

                con.Close();
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.Text == "Alle Afdelingen")
            {
                SqlDataSource1.SelectCommand =
                "select * from inkooporderaanvraagmainLev where [Status] = 'Pakbon goedgekeurd' order by datum DESC, opmerking DESC";
                gvInkooporderaanvragerMain.DataBind();
            }

            else
            {
                SqlDataSource1.SelectCommand =
                    "select * from inkooporderaanvraagmainLev where Naam = '" + DropDownList1.Text + "' AND [Status] = 'Pakbon goedgekeurd' order by datum DESC, opmerking DESC";
                gvInkooporderaanvragerMain.DataBind();
            }
        }

        protected void btnFactuurKoppelen_OnClick(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();

                int nummer = int.Parse(((Button)sender).CommandArgument);


                SqlCommand cmd = new SqlCommand("UPDATE InkoopOrderAanvraag SET InkoopOrderAanvraagStatusID = 7, LaatsteUpdate = GETDATE() WHERE Nummer = @nummer; ", con);
                cmd.Parameters.AddWithValue("@nummer", nummer);
                cmd.ExecuteNonQuery();

                con.Close();
            }

            gvInkooporderaanvragerMain.DataBind();
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Bestelsuccess();", true);
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                SqlDataSource1.SelectCommand =
                "select * from inkooporderaanvraagmainLev where Bestelnummer LIKE '" + TextBox1.Text + "%' AND [Status] = 'Pakbon goedgekeurd' order by datum DESC, opmerking DESC";
                gvInkooporderaanvragerMain.DataBind();
            }

            else
            {
                SqlDataSource1.SelectCommand =
                    "select * from inkooporderaanvraagmainLev where [Status] = 'Pakbon goedgekeurd' order by datum DESC, opmerking DESC";
                gvInkooporderaanvragerMain.DataBind();
            }
        }



        protected void rep_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            RepeaterItem RI1 = e.Item; FileUpload FU = RI1.FindControl("FileUpload1") as FileUpload;
        }


        protected void btnSavePdf_OnClick(object sender, EventArgs e)
        {
            int gridviewnr = int.Parse(((Button)sender).CommandArgument);


                   FileUpload FileUpload1 = ((FileUpload)rpFactuurToevoegen.FindControl("FileUpload1"));
            string file = Path.GetFileName(FileUpload1.FileName);
            using (SqlConnection con = new SqlConnection(constr))
            {

                con.Open();
                //Convert pdf in Binary formate
                int lenght = FileUpload1.PostedFile.ContentLength;
                byte[] data = new byte[lenght];
                FileUpload1.PostedFile.InputStream.Read(data, 0, lenght);


                using (SqlCommand cmd = new SqlCommand("insert into Crediteurenfactuur " + "(PdfData) values(@data)", con))
                {
                    cmd.Parameters.AddWithValue("@data", data);
                    cmd.ExecuteNonQuery();
                    Response.Write("Pdf File Save in Dab");
                }
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

