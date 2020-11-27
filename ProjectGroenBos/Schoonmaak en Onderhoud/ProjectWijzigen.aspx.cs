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
    public partial class ProjectWijzigen : System.Web.UI.Page
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
                txtOmschrijving.Text = Session["Omschrijving"].ToString();
                DropDownList2.SelectedValue = Session["Oplossing"].ToString();
                DropDownList2.SelectedValue = Session["Offertestatus"].ToString();
            }
        }

        protected void btnWijzigS_Click1(object sender, EventArgs e)
        {
            RequiredFieldValidator1.Validate();
            RequiredFieldValidator3.Validate();
            if (RequiredFieldValidator3.IsValid && RequiredFieldValidator1.IsValid)
            {
                string checkboxselect = "";
                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {
                    if (CheckBoxList1.Items[i].Selected)
                    {
                        if (checkboxselect == "")
                        {
                            checkboxselect = CheckBoxList1.Items[i].Text;
                        }
                        else
                        {
                            checkboxselect += ", " + CheckBoxList1.Items[i].Text;
                        }
                    }
                }
                String status = DropDownList2.SelectedValue.ToString();
                String bungnummer = DropDownList1.SelectedValue.ToString();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "update [dbo].[Schouwing] set [BungalowID]='" + bungnummer + "' ,[Omschrijving]='" + txtOmschrijving.Text + "' ,[Oplossing]='" + checkboxselect + "' ,[Offertestatus]='" + status + "'where SchouwingID= " + Convert.ToInt32(lblID.Text) + "";
                cmd.ExecuteNonQuery();


                Response.Redirect("ProjectenOverzicht.aspx");
            }
        }

        protected void btnTerugNO_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProjectenOverzicht.aspx");

        }
    }
}