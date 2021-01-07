using System;
using System.Collections.Generic;
using System.Configuration;
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
            DropdownResults();
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropdownResults();
        }

        private void DropdownResults()
        {
            if (DropDownList1.Text == "Alle Afdelingen" && DropDownList2.Text == "Alle Statussen")
            {
                SqlDataSource1.SelectCommand =
                "select * from inkooporderaanvraagmainLev order by datum DESC, opmerking DESC";
                gvInkooporderaanvragerMain.DataBind();
            }

            else if (DropDownList1.Text != "Alle Afdelingen" && DropDownList2.Text == "Alle Statussen")
            {
                SqlDataSource1.SelectCommand =
                "select * from inkooporderaanvraagmainLev where Naam = '" + DropDownList1.Text + "' order by datum DESC, opmerking DESC";
                gvInkooporderaanvragerMain.DataBind();
            }

            else if (DropDownList1.Text == "Alle Afdelingen" && DropDownList2.Text != "Alle Statussen")
            {
                SqlDataSource1.SelectCommand =
                "select * from inkooporderaanvraagmainLev where Status = '" + DropDownList2.Text + "' order by datum DESC, opmerking DESC";
                gvInkooporderaanvragerMain.DataBind();
            }

            else
            {
                SqlDataSource1.SelectCommand =
                "select * from inkooporderaanvraagmainLev where Status = '" + DropDownList2.Text + "' AND Naam = '" + DropDownList1.Text + "' order by datum DESC, opmerking DESC";
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

        protected void DownloadFile(object sender, EventArgs e)
        {
            try
            {
                int id = int.Parse((sender as LinkButton).CommandArgument);
                byte[] bytes;
                string fileName, contentType;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "select Naam, Data, ContentType from Crediteurenfactuur where InkooporderID=@Id";
                        cmd.Parameters.AddWithValue("@Id", id);
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            sdr.Read();
                            bytes = (byte[])sdr["Data"];
                            contentType = sdr["ContentType"].ToString();
                            fileName = sdr["Naam"].ToString();
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
            catch
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Downloadfout();", true);
            }
        }
    }
}