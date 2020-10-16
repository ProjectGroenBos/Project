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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			if (!IsPostBack)
			{
				DataTable dt = new DataTable();
				DataRow dr;
				dt.Columns.Add("sno");
				dt.Columns.Add("Afbeelding");
				dt.Columns.Add("Naam");
				dt.Columns.Add("Prijs");
				dt.Columns.Add("Hoeveelheid");
				dt.Columns.Add("TotalePrijs");
				dt.Columns.Add("Id");

				if (Request.QueryString["id"] != null)
				{
					if (Session["Bestelitems"] == null)
					{
						dr = dt.NewRow();
						String mycon = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020";
						SqlConnection scon = new SqlConnection(mycon);
						String myquery = "select * from Item where ID=" + Request.QueryString["id"];
						SqlCommand cmd = new SqlCommand();
						cmd.CommandText = myquery;
						cmd.Connection = scon;
						SqlDataAdapter da = new SqlDataAdapter();
						da.SelectCommand = cmd;
						DataSet ds = new DataSet();
						da.Fill(ds);
						dr["sno"] = 1;
						dr["Afbeelding"] = ds.Tables[0].Rows[0]["Afbeelding"].ToString();
						dr["Naam"] = ds.Tables[0].Rows[0]["Naam"].ToString();
						dr["Prijs"] = ds.Tables[0].Rows[0]["Prijs"].ToString();
						dr["Hoeveelheid"] = Request.QueryString["Hoeveelheid"];
						dr["Id"] = Request.QueryString["id"];

						double prijs = Convert.ToDouble(ds.Tables[0].Rows[0]["Prijs"].ToString());
						double hoeveelheid = Convert.ToInt16(Request.QueryString["Hoeveelheid"].ToString());
						double totaleprijs = prijs * hoeveelheid;
						dr["TotalePrijs"] = totaleprijs;

						dt.Rows.Add(dr);
						GridView1.DataSource = dt;
						GridView1.DataBind();

						Session["bestelitems"] = dt;
						GridView1.FooterRow.Cells[4].Text = "Totale Hoeveelheid";
						GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();
						Response.Redirect("bestellingopnemen.aspx");
					}
					else
					{
						dt = (DataTable)Session["bestelitems"];
						int sr;
						sr = dt.Rows.Count;

						dr = dt.NewRow();
						String mycon = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020";
						SqlConnection scon = new SqlConnection(mycon);
						String myquery = "select * from Item where ID=" + Request.QueryString["id"];
						SqlCommand cmd = new SqlCommand();
						cmd.CommandText = myquery;
						cmd.Connection = scon;
						SqlDataAdapter da = new SqlDataAdapter();
						da.SelectCommand = cmd;
						DataSet ds = new DataSet();
						da.Fill(ds);
						dr["sno"] = sr + 1;
						dr["Afbeelding"] = ds.Tables[0].Rows[0]["Afbeelding"].ToString();
						dr["Naam"] = ds.Tables[0].Rows[0]["Naam"].ToString();
						dr["Prijs"] = ds.Tables[0].Rows[0]["Prijs"].ToString();
						dr["Hoeveelheid"] = Request.QueryString["Hoeveelheid"];
						dr["Id"] = Request.QueryString["id"];

						double prijs = Convert.ToDouble(ds.Tables[0].Rows[0]["Prijs"].ToString());
						double hoeveelheid = Convert.ToInt16(Request.QueryString["Hoeveelheid"].ToString());
						double totaleprijs = prijs * hoeveelheid;
						dr["TotalePrijs"] = totaleprijs;

						dt.Rows.Add(dr);
						GridView1.DataSource = dt;
						GridView1.DataBind();

						Session["bestelitems"] = dt;
						GridView1.FooterRow.Cells[4].Text = "Totale Hoeveelheid";
						GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();
						Response.Redirect("bestellingopnemen.aspx");
					}
				}
				else
				{
					dt = (DataTable)Session["bestelitems"];
					GridView1.DataSource = dt;
					GridView1.DataBind();
					if (GridView1.Rows.Count > 0)
					{
						GridView1.FooterRow.Cells[5].Text = "Totale Hoeveelheid";
						GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
					}
				}
				lblSelectedProducts2.Text = GridView1.Rows.Count.ToString();
			}
		}

		public double grandtotal()
		{
			DataTable dt = new DataTable();
			dt = (DataTable)Session["bestelitems"];
			int nrow = dt.Rows.Count;
			int i = 0;
			double gtotal = 0;
			while (i < nrow)
			{
				gtotal = gtotal + Convert.ToDouble(dt.Rows[i]["TotalePrijs"].ToString());

				i = i + 1;
			}
			return gtotal;
		}

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
			DataTable dt = new DataTable();
			dt = (DataTable)Session["bestelitems"];

			for (int i = 0; i <= dt.Rows.Count - 1; i++)
			{
				int sr;
				int sr1;
				string qdata;
				string dtdata;
				sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
				TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
				qdata = cell.Text;
				dtdata = sr.ToString();
				sr1 = Convert.ToInt32(qdata);

				if (sr == sr1)
				{
					dt.Rows[i].Delete();
					dt.AcceptChanges();
					//Label1.Text = "Item is verwijderd"
					break;
				}
			}

			for (int i = 1; i <= dt.Rows.Count; i++)
			{
				dt.Rows[i - 1]["sno"] = i;
				dt.AcceptChanges();
			}

			Session["bestelitems"] = dt;
			Response.Redirect("Bestelling.aspx");
		}
	}   
}