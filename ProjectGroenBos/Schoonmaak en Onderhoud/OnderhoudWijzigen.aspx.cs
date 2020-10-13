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
    public partial class OnderhoudWijzigen : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        protected void TextBox5_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnWijzig_Click(object sender, EventArgs e)
        {
            RequiredFieldValidator1.Validate();
            RequiredFieldValidator2.Validate();
            RequiredFieldValidator3.Validate();
            RequiredFieldValidator4.Validate();
            RequiredFieldValidator5.Validate();
            RequiredFieldValidator6.Validate();
            RequiredFieldValidator7.Validate();
            RegularExpressionValidator1.Validate();
            RegularExpressionValidator2.Validate();
            RegularExpressionValidator3.Validate();
            RegularExpressionValidator4.Validate();
            RegularExpressionValidator5.Validate();
            CompareValidator1.Validate();
            RangeValidator1.Validate();


            if (CompareValidator1.IsValid && RegularExpressionValidator1.IsValid && RegularExpressionValidator2.IsValid && RegularExpressionValidator3.IsValid && RegularExpressionValidator4.IsValid && RegularExpressionValidator5.IsValid && RequiredFieldValidator1.IsValid && RequiredFieldValidator2.IsValid && RequiredFieldValidator3.IsValid && RequiredFieldValidator4.IsValid && RequiredFieldValidator5.IsValid && RequiredFieldValidator6.IsValid && RequiredFieldValidator7.IsValid)
            {
                DateTime date = DateTime.Parse(startdatumTxtbox.Text);
                DateTime date2 = DateTime.Parse(einddTxtbox.Text);
                DateTime date3 = DateTime.Parse(constTxtbox.Text);
                string Datum = date.ToString("yyyy-MM-dd");
                string Datum2 = date2.ToString("yyyy-MM-dd");
                string Datum3 = date3.ToString("yyyy-MM-dd");
                String status = DropDownList1.SelectedValue.ToString();
                String type = DropDownList2.SelectedValue.ToString();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "update [dbo].[Onderhoudsopdracht] set [Startdatum]='" + Datum + "' ,[VerwachteEinddatum]='" + Datum2 + "' ,[Kosten]='" + kostenTxtbox.Text + "' ,[BungalowNummer]='" + bungTxtbox.Text + "' ,[OnderhoudsstatusID]='" + status + "' ,[Onderhoudtype]='" + type + "' ,[DatumvanConstatering]='" + Datum3 + "'where Nummer= " + Convert.ToInt32(lblNummerO.Text) + "";
                cmd.ExecuteNonQuery();
                startdatumTxtbox.Text = "";
                einddTxtbox.Text = "";
                kostenTxtbox.Text = "";
                bungTxtbox.Text = "";
                constTxtbox.Text = "";

                Response.Redirect("OnderhoudsOverzicht.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            lblNummerO.Text = gr.Cells[1].Text;
            startdatumTxtbox.Text = gr.Cells[2].Text;
            einddTxtbox.Text = gr.Cells[3].Text;
            kostenTxtbox.Text = gr.Cells[4].Text;
            bungTxtbox.Text = gr.Cells[5].Text;
            DropDownList1.SelectedValue = gr.Cells[6].Text;
            DropDownList2.SelectedValue = gr.Cells[7].Text;
            constTxtbox.Text = gr.Cells[8].Text;
        }

        protected void btnTerugNaarO_Click(object sender, EventArgs e)
        {
            Response.Redirect("OnderhoudsOverzicht.aspx");
        }
    }
}