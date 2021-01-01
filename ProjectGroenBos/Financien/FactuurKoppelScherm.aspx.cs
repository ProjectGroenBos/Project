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

            int functieID = int.Parse(Session["Functie"].ToString());

            if (functieID == 3)
            {

            }
            else if (functieID == 10)
            {

            }
            else
            {
                Response.Redirect("~/Financien/nietgeautoriseerd.aspx");
            }

            if (!IsPostBack)
            {
                Page.Form.Enctype = "multipart/form-data";
                Repeater();
                BindGrid();
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

        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select Id, Name from testtable";
                    cmd.Connection = con;
                    con.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                    con.Close();
                }
            }
        }

        protected void Upload(object sender, EventArgs e)
        {
            int nummer = int.Parse(((Button)sender).CommandName);
            int inkoopnummer = int.Parse(((Button)sender).CommandArgument);

            FileUpload FileUpload1 = (FileUpload)rpFactuurToevoegen.Items[nummer].FindControl("FileUpload1");
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);

            TextBox txbIban = (TextBox)rpFactuurToevoegen.Items[nummer].FindControl("txbIban");

            TextBox txbTermijn = (TextBox)rpFactuurToevoegen.Items[nummer].FindControl("txbTermijn");
            if (txbIban.Text == "" || txbTermijn.Text == "" || FileUpload1 == null)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Bestelfout();", true);
            }
            else
            {
                string contentType = FileUpload1.PostedFile.ContentType;
                using (Stream fs = FileUpload1.PostedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        using (SqlConnection con = new SqlConnection(constr))
                        {
                            string commandText = "INSERT INTO [dbo].[Crediteurenfactuur] ([Datum], [Totaal bedrag], [Termijn], [Omschrijving betaalcondities], [InkooporderID], [FactuurstatusID], [IBAN], [LeverancierID], Data, ContentType, Naam) VALUES (@Datum, @Totaal_bedrag, (convert(datetime,@Termijn,104)), @Omschrijving_betaalcondities, @InkooporderID, @FactuurstatusID, @IBAN, @LeverancierID, @Data, @ContentType, @Name)";

                            using (SqlCommand cmd = new SqlCommand(commandText))
                            {
                                con.Open();
                                SqlConnection constre = new SqlConnection(constr);
                                SqlCommand cmd2 = new SqlCommand("SELECT I.Totaalprijs FROM InkooporderaanvraagItemsTotaalprijs I LEFT JOIN InkoopOrderAanvraag A ON I.InkoopOrderAanvraagNummer = A.Nummer where InkoopOrderAanvraagNummer = @Nummer", con);
                                cmd2.Parameters.AddWithValue("@Nummer", inkoopnummer);
                                SqlCommand cmd3 = new SqlCommand("SELECT A.LeverancierID FROM InkooporderaanvraagItemsTotaalprijs I LEFT JOIN InkoopOrderAanvraag A ON I.InkoopOrderAanvraagNummer = A.Nummer where InkoopOrderAanvraagNummer = @Nummer", con);
                                cmd3.Parameters.AddWithValue("@Nummer", inkoopnummer);

                                double prijske = double.Parse(cmd2.ExecuteScalar().ToString());
                                int leverancier = int.Parse(cmd3.ExecuteScalar().ToString());

                                cmd.Connection = con;
                                cmd.Parameters.AddWithValue("@Name", filename);
                                cmd.Parameters.AddWithValue("@ContentType", contentType);
                                cmd.Parameters.AddWithValue("@Data", bytes);
                                cmd.Parameters.AddWithValue("@Datum", DateTime.Now);
                                cmd.Parameters.AddWithValue("@Totaal_bedrag", prijske);
                                cmd.Parameters.AddWithValue("@Termijn", txbTermijn.Text);
                                cmd.Parameters.AddWithValue("@Omschrijving_betaalcondities", "Inkooporder");
                                cmd.Parameters.AddWithValue("@InkooporderID", inkoopnummer);
                                cmd.Parameters.AddWithValue("@FactuurstatusID", "1");
                                cmd.Parameters.AddWithValue("@IBAN", txbIban.Text);
                                cmd.Parameters.AddWithValue("@LeverancierID", leverancier);
                                cmd.ExecuteNonQuery();
                                con.Close();
                            }
                        }
                    }
                }
            }

            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();

                int nummer2 = int.Parse(((Button)sender).CommandArgument);


                SqlCommand cmd = new SqlCommand("UPDATE InkoopOrderAanvraag SET InkoopOrderAanvraagStatusID = 7 WHERE Nummer = @nummer; ", con);
                cmd.Parameters.AddWithValue("@nummer", nummer2);
                cmd.ExecuteNonQuery();

                con.Close();
            }

            gvInkooporderaanvragerMain.DataBind();
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Bestelsuccess();", true);

        }

        protected void DownloadFile(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    //cmd.CommandText = "select Name, Data, ContentType from [testtable] where Id=@Id";
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["Data"];
                        contentType = sdr["ContentType"].ToString();
                        fileName = sdr["Name"].ToString();
                    }
                    con.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }

        protected void gvInkooporderaanvragerMain_RowCreated(object sender, GridViewRowEventArgs e)
            /// <summary>
            /// Adds an icon next to the title of the column to display the sort direction
            /// </summary>
            /// <param name="sender"></param>
            /// <param name="e"></param>
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                foreach (TableCell tc in e.Row.Cells)
                {
                    if (tc.HasControls())
                    {
                        
                            Image icon = new Image();
                            icon.ImageUrl = "~/img/angle.png.jpg";
                            
                                tc.Controls.Add(new LiteralControl(" "));
                                tc.Controls.Add(icon);
                           
                    }
                }
            }
        }

    }
}


