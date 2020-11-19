using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Schoonmaak_en_Onderhoud
{
    public partial class PlanningWijzigen : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }


        protected void btnWijzigS_Click1(object sender, EventArgs e)
        {
            RequiredFieldValidator1.Validate();
            RequiredFieldValidator6.Validate();
            RequiredFieldValidator7.Validate();
            RegularExpressionValidator1.Validate();
            RangeValidator1.Validate();

            if (RegularExpressionValidator1.IsValid && RangeValidator1.IsValid && RequiredFieldValidator1.IsValid && RequiredFieldValidator6.IsValid && RequiredFieldValidator7.IsValid)
            {
                DateTime date = DateTime.Parse(txtDatum.Text);
                string Datum = date.ToString("yyyy-MM-dd");
                String naam = DropDownList1.SelectedValue.ToString();

                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "update [dbo].[Schoonmaakopdracht] set [Datum]='" + Datum + "' ,[Omschrijving]='" + txtOmschrijving.Text + "' ,[BungalowNummer]='" + txtBNummer.Text + "' ,[MedewerkerNummer]='" + naam + "'where Nummer= " + Convert.ToInt32(lblNummerS.Text) + "";
                cmd.ExecuteNonQuery();

                Response.Redirect("PlanningsOverzicht.aspx");
            }
        }

        protected void btnTerugNO_Click(object sender, EventArgs e)
        {
            Response.Redirect("PlanningsOverzicht.aspx");
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            String naam = DropDownList1.SelectedValue.ToString();
            lblNummerS.Text = gr.Cells[1].Text;
            txtDatum.Text = gr.Cells[2].Text;
            txtOmschrijving.Text = gr.Cells[3].Text;
            txtBNummer.Text = gr.Cells[4].Text;
            naam = gr.Cells[5].Text;
        }
    }
}