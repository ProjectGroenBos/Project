using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace ProjectGroenBos.Schoonmaak_en_Onderhoud
{
    public partial class SchouwingWijzigen : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020");


        protected void Page_Load(object sender, EventArgs e)
        {

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            if (!IsPostBack)
            {
                lblID.Text = Session["SchouwingID"].ToString();
                DropDownList1.SelectedValue = Session["BungalowID"].ToString();
                lblDatumW.Text = Session["Schouwingsdatum"].ToString();
                txtOmschrijving.Text = Session["Omschrijving"].ToString();
                DropDownList2.SelectedValue = Session["Status"].ToString();
            }

        }

        protected void txtBungalowID_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnTerugNO_Click(object sender, EventArgs e)
        {
            Response.Redirect("SchouwingsOverzicht.aspx");
        }

        protected void btnWijzigS_Click1(object sender, EventArgs e)
        {
            RequiredFieldValidator1.Validate();
            RequiredFieldValidator3.Validate();
            if (RequiredFieldValidator3.IsValid && RequiredFieldValidator1.IsValid) 
            {
                String status = DropDownList2.SelectedValue.ToString();
                String bungnummer = DropDownList1.SelectedValue.ToString();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "update [dbo].[Schouwing] set [BungalowID]='" + bungnummer + "' ,[Schouwingsdatum]='" + lblDatumW.Text + "' ,[Omschrijving]='" + txtOmschrijving.Text + "' ,[Status]='" + status + "'where SchouwingID= " + Convert.ToInt32(lblID.Text) + "";
                cmd.ExecuteNonQuery();


                Response.Redirect("SchouwingsOverzicht.aspx");
            }
        }
    }
}