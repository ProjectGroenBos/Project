using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Financien
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string connectionString = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM02-P1-P2-Groenbos;Persist Security Info=True;User ID=BIM022020;Password=BiM@IH2020";
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                //InvullenGridview();
            }
        }

        void InvullenGridview()
        {
            try
            {
                DataTable dtbl = new DataTable();
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT Med.Nummer, Med.Naam, Med.Geboortedatum, Med.[In dienst sinds] AS In_dienst_sinds, Med.[Salaris per maand] AS Salaris_per_maand, Fun.naam as Functie, Afd.Naam as Afdeling FROM (( dbo.Medewerker Med  inner join dbo.Functie Fun on Med.FunctieID = Fun.ID) inner join dbo.Afdeling Afd on Med.AfdelingID= Afd.ID) where Med.FunctieID= Fun.ID and Med.AfdelingID= Afd.ID", sqlCon);
                    sqlDa.Fill(dtbl);
                }


                if (dtbl.Rows.Count > 0)
                {
                    PersoneelsOverzicht.DataSource = dtbl;
                    PersoneelsOverzicht.DataBind();
                }

                else
                {
                    dtbl.Rows.Add(dtbl.NewRow());
                    PersoneelsOverzicht.DataSource = dtbl;
                    PersoneelsOverzicht.DataBind();
                    PersoneelsOverzicht.Rows[0].Cells.Clear();
                    PersoneelsOverzicht.Rows[0].Cells.Add(new TableCell());
                    PersoneelsOverzicht.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                    PersoneelsOverzicht.Rows[0].Cells[0].Text = "Geen Data Gevonden!";
                    PersoneelsOverzicht.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error occured: " + ex.Message.ToString());
                throw;
            }
        }

        protected void PersoneelsOverzicht_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridview();
            }
        }

        void PopulateGridview()

        { DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT Med.Nummer, Med.Naam, Med.Geboortedatum, Med.[In dienst sinds] AS In_dienst_sinds, Med.[Salaris per maand] AS Salaris_per_maand, Fun.naam as FunctieID, Afd.Naam as AfdelingID FROM (( dbo.Medewerker Med  inner join dbo.Functie Fun on Med.FunctieID = Fun.ID) inner join dbo.Afdeling Afd on Med.AfdelingID= Afd.ID) where Med.FunctieID= Fun.ID and Med.AfdelingID= Afd.ID", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            { 
            GVtoevoegen.DataSource = dtbl;
            GVtoevoegen.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GVtoevoegen.DataSource = dtbl;
                GVtoevoegen.DataBind();
                GVtoevoegen.Rows[0].Cells.Clear();
                GVtoevoegen.Rows[0].Cells.Add(new TableCell());
                GVtoevoegen.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GVtoevoegen.Rows[0].Cells[0].Text = "Geen personeel gevonden..!";
                GVtoevoegen.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


            }
           
        }

        protected void GVtoevoegen_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName.Equals("AddNew"))
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString)) 
                {
                    sqlCon.Open();
                    string query = "INSERT INTO dbo.Medewerker (Naam, Geboortedatum, In_dienst_sinds, Salaris_per_maand, FunctieID, AfdelingID) VALUES (@Naam, @Geboortedatum, @In_dienst_sinds, @Salaris_per_maand, @FunctieID, @AfdelingID)";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Naam",(GVtoevoegen.FooterRow.FindControl("txtNaamFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Geboortedatum", (GVtoevoegen.FooterRow.FindControl("txtGeboortedatumFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@In_dienst_sinds", (GVtoevoegen.FooterRow.FindControl("txtIn_dienst_sindsFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Salaris_per_maand", (GVtoevoegen.FooterRow.FindControl("txtSalaris_per_maandFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@FunctieID", (GVtoevoegen.FooterRow.FindControl("txtFunctieFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@AfdelingID", (GVtoevoegen.FooterRow.FindControl("txtAfdelingFooter") as TextBox).Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    PopulateGridview();
                    lblSuccesMessage.Text = "Nieuw personeel toegevoegd";
                    LblErrorMessage.Text = "";
                }
            }
        }
        protected void GVtoevoegen_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }


    }
}