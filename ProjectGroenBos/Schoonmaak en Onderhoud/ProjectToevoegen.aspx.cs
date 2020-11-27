using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Schoonmaak_en_Onderhoud
{
    public partial class ProjectToevoegen : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnToevoegen_Click(object sender, EventArgs e)
        {
            RequiredFieldValidator1.Validate();
            RequiredFieldValidator2.Validate();

            if (RequiredFieldValidator2.IsValid && RequiredFieldValidator1.IsValid)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO  [dbo].[Schouwing] (BungalowID,Omschrijving,Oplossing,Offertestatus)    values(@bungalowid, @omschrijving, @oplossing, @offertestatus)", con);

                String status = DropDownList2.SelectedValue.ToString();
                String nummer = DropDownList1.SelectedValue.ToString();
                //String categorie = DropDownList3.SelectedValue.ToString();
                
                string checkboxselect = "";
                for (int i = 0;i< CheckBoxList1.Items.Count;i++)
                    {
                    if (CheckBoxList1.Items[i].Selected)
                    {
                        if(checkboxselect == "")
                        {
                            checkboxselect = CheckBoxList1.Items[i].Text;
                        }
                        else
                        {
                            checkboxselect += ", " + CheckBoxList1.Items[i].Text;
                        }
                    }
                }
                
                cmd.Parameters.AddWithValue("@bungalowid", nummer);
                cmd.Parameters.AddWithValue("@omschrijving", TxtOmschrijving.Text);
                cmd.Parameters.AddWithValue("@offertestatus", status);
                cmd.Parameters.AddWithValue("@oplossing", checkboxselect);

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("ProjectenOverzicht.aspx");
            }
        }

        protected void BtnTerugNaarOverzicht_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProjectenOverzicht.aspx");
        }
    }
}