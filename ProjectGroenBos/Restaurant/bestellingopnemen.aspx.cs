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
    public partial class WebForm3 : System.Web.UI.Page
    {

		protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["bestelitems"];
            if (dt != null)
            {
                lblSelectedProducts.Text = dt.Rows.Count.ToString();
            }
            else
            {
                lblSelectedProducts.Text = "0";
            }

			if (!IsPostBack)
			{
				DataTable dt2 = new DataTable();
				DataRow dr;
				dt2.Columns.Add("sno");
				dt2.Columns.Add("Afbeelding");
				dt2.Columns.Add("Naam");
				dt2.Columns.Add("Prijs");
				dt2.Columns.Add("Hoeveelheid");
				dt2.Columns.Add("TotalePrijs");

				if (Request.QueryString["id"] != null)
				{
					if (Session["Bestelitems"] == null)
					{
						dr = dt2.NewRow();
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

						double prijs = Convert.ToDouble(ds.Tables[0].Rows[0]["Prijs"].ToString());
						double hoeveelheid = Convert.ToInt16(Request.QueryString["Hoeveelheid"].ToString());
						double totaleprijs = prijs * hoeveelheid;
						dr["TotalePrijs"] = totaleprijs;

						Session["totprijs"] = totaleprijs;

						//
						string PrijsMetEuro = "€" + prijs.ToString();

						dr["Prijs"] = PrijsMetEuro;

						string TotalePrijsMetEuro = "€" + totaleprijs.ToString();

						dr["TotalePrijs"] = TotalePrijsMetEuro;

						string HoeveelheidMetX = hoeveelheid.ToString() + "x";

						dr["Hoeveelheid"] = HoeveelheidMetX;
						//

						dt2.Rows.Add(dr);
						GridView2.DataSource = dt2;
						GridView2.DataBind();

						Session["bestelitems"] = dt2;
						GridView2.FooterRow.Cells[3].Text = "Totaal ";
						GridView2.FooterRow.Cells[5].Text = "€" + grandtotal().ToString();
						Response.Redirect("bestellingopnemen.aspx");
					}
					else
					{
						dt2 = (DataTable)Session["bestelitems"];
						int sr;
						sr = dt2.Rows.Count;

						dr = dt2.NewRow();
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

						double prijs = Convert.ToDouble(ds.Tables[0].Rows[0]["Prijs"].ToString());
						double hoeveelheid = Convert.ToInt16(Request.QueryString["Hoeveelheid"].ToString());
						double totaleprijs = prijs * hoeveelheid;
						dr["TotalePrijs"] = totaleprijs;

						Session["totprijs"] = totaleprijs;

						//
						string PrijsMetEuro = "€" + prijs.ToString();

						dr["Prijs"] = PrijsMetEuro;

						string TotalePrijsMetEuro = "€" + totaleprijs.ToString();

						dr["TotalePrijs"] = TotalePrijsMetEuro;

						string HoeveelheidMetX = hoeveelheid.ToString() + "x";

						dr["Hoeveelheid"] = HoeveelheidMetX;
						//

						dt2.Rows.Add(dr);
						GridView2.DataSource = dt2;
						GridView2.DataBind();

						Session["bestelitems"] = dt2;
						GridView2.FooterRow.Cells[3].Text = "Totaal ";
						GridView2.FooterRow.Cells[5].Text = "€" + grandtotal().ToString();
						Response.Redirect("bestellingopnemen.aspx");
					}
				}
				else
				{
					dt2 = (DataTable)Session["bestelitems"];
					GridView2.DataSource = dt2;
					GridView2.DataBind();
					if (GridView2.Rows.Count > 0)
					{
						GridView2.FooterRow.Cells[3].Text = "Totaal ";
						GridView2.FooterRow.Cells[5].Text = "€" + grandtotal().ToString();
					}
				}
			}

		}

        

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "toevoegen")
            {
                DropDownList ddl = (DropDownList)(e.Item.FindControl("ddlHoeveel"));
                Response.Redirect("Bestelling.aspx?id=" + e.CommandArgument.ToString() + "&Hoeveelheid=" + ddl.SelectedItem.ToString());
            }
        }

		public double grandtotal()
		{
			DataTable dt2 = new DataTable();
			dt2 = (DataTable)Session["bestelitems"];
			int nrow = dt2.Rows.Count;
			int i = 0;
			double gtotal = 0;
			while (i < nrow)
			{
				gtotal = gtotal + Convert.ToDouble(Session["totprijs"]);

				i = i + 1;
			}
			return gtotal;
		}

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
			
		}

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
			DataTable dt2 = new DataTable();
			dt2 = (DataTable)Session["bestelitems"];

			for (int i = 0; i <= dt2.Rows.Count - 1; i++)
			{
				int sr;
				int sr1;
				string qdata;
				string dtdata;
				sr = Convert.ToInt32(dt2.Rows[i]["sno"].ToString());
				TableCell cell = GridView2.Rows[e.RowIndex].Cells[0];
				qdata = cell.Text;
				dtdata = sr.ToString();
				sr1 = Convert.ToInt32(qdata);

				if (sr == sr1)
				{
					dt2.Rows[i].Delete();
					dt2.AcceptChanges();
					//Label1.Text = "Item is verwijderd"
					break;
				}
			}

			for (int i = 1; i <= dt2.Rows.Count; i++)
			{
				dt2.Rows[i - 1]["sno"] = i;
				dt2.AcceptChanges();
			}

			Session["bestelitems"] = dt2;
			Response.Redirect("bestellingopnemen.aspx");
		}

        protected void btnBetalen_Click(object sender, EventArgs e)
        {

        }
    }
}