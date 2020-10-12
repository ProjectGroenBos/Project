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
            DateTime date = DateTime.Parse(startdatumTxtbox.Text);
            DateTime date2 = DateTime.Parse(einddTxtbox.Text);
            DateTime date3 = DateTime.Parse(constTxtbox.Text);
            string Datum = date.ToString("yyyy-MM-dd");
            string Datum2 = date2.ToString("yyyy-MM-dd");
            string Datum3 = date3.ToString("yyyy-MM-dd");
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "update [dbo].[Onderhoudsopdracht] set [Startdatum]='" + Datum + "' ,[VerwachteEinddatum]='" + Datum2 + "' ,[Kosten]='" + kostenTxtbox.Text + "' ,[BungalowNummer]='" + bungTxtbox.Text + "' ,[OnderhoudsstatusID]='" + onderhTxtbox.Text + "' ,[Onderhoudtype]='" + ondhtypeTxtbox.Text + "' ,[DatumvanConstatering]='" + Datum3 + "'where Nummer= " + Convert.ToInt32(nmrTxtbox.Text) + "";
            cmd.ExecuteNonQuery();
            nmrTxtbox.Text = "'";
            startdatumTxtbox.Text = "";
            einddTxtbox.Text = "";
            kostenTxtbox.Text = "";
            bungTxtbox.Text = "";
            onderhTxtbox.Text = "";
            ondhtypeTxtbox.Text = "";
            constTxtbox.Text = "";

            Response.Redirect("OnderhoudsOverzicht.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            nmrTxtbox.Text = gr.Cells[1].Text;
            startdatumTxtbox.Text = gr.Cells[2].Text;
            einddTxtbox.Text = gr.Cells[3].Text;
            kostenTxtbox.Text = gr.Cells[4].Text;
            bungTxtbox.Text = gr.Cells[5].Text;
            onderhTxtbox.Text = gr.Cells[6].Text;
            ondhtypeTxtbox.Text = gr.Cells[7].Text;
            constTxtbox.Text = gr.Cells[8].Text;
        }
    }
}