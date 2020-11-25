using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace ProjectGroenBos.Restaurant
{
    public partial class Voorraad : System.Web.UI.Page
    {
        //Connectionstring
        string connectionString = ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;
        //Dit gebeurt er als de pagina geladen wordt
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InvullenGridview();
            }
        }

        protected void btnBevestig_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void gvBekijkenVoorraad_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        void InvullenGridview()
        {
            //Hieronder gebeurt het inladen van gegevens van de database naar de applicatie
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from Voorraad where Omschrijving='Frisdranken' or Omschrijving='Voedsel';", sqlCon);
                sqlDa.Fill(dtbl);
                Session["vLE"] = dtbl;
            }
            if (dtbl.Rows.Count > 0)
            {
                gvBekijkenVoorraad.DataSource = dtbl; //!
                gvBekijkenVoorraad.DataBind();
            }

            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvBekijkenVoorraad.DataSource = dtbl;
                gvBekijkenVoorraad.DataBind();
                gvBekijkenVoorraad.Rows[0].Cells.Clear();
                gvBekijkenVoorraad.Rows[0].Cells.Add(new TableCell());
                gvBekijkenVoorraad.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvBekijkenVoorraad.Rows[0].Cells[0].Text = "Geen Data Gevonden!";
                gvBekijkenVoorraad.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void txbZoeken_TextChanged(object sender, EventArgs e)
        {
            //Hieronder staat de code voor de zoekbalk
            DataTable dtbl = (DataTable)Session["vLE"];
            DataView dv = dtbl.DefaultView;
            dv.RowFilter = string.Format("naam like '%{0}%'", txbZoeken.Text);
            gvBekijkenVoorraad.DataSource = dv.ToTable();
            gvBekijkenVoorraad.DataBind();
        }

        protected void gvBekijkenVoorraad_selectedindexchanged(object sender, EventArgs e)
        {

        }

        protected void gvBekijkenVoorraad_rowcommand(object sender, GridViewCommandEventArgs e)
        {
            //Hieronder staat de code die inwerking wordt gesteld wanneer er een product wordt toegevoegd
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        String query = "INSERT INTO Voorraad (Aantal, Naam, Prijs, [Minimum voorraad], [BTW tariefID], Omschrijving) VALUES (@aantal,@naam,@prijs,@minimumvoorraad,@btwtarief,@omschrijving)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@aantal", (gvBekijkenVoorraad.FooterRow.FindControl("txtAantalVoorraadFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@naam", (gvBekijkenVoorraad.FooterRow.FindControl("txtProductNaamFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@prijs", (gvBekijkenVoorraad.FooterRow.FindControl("txtPrijsFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@minimumvoorraad", (gvBekijkenVoorraad.FooterRow.FindControl("txtMinimumVoorraadFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@btwtarief", (gvBekijkenVoorraad.FooterRow.FindControl("txtBTWTariefFooter") as TextBox).Text.Trim());
                        SqlParameter sqlParameter = sqlCmd.Parameters.AddWithValue("@omschrijving", "Voedsel".Trim());
                        sqlCmd.ExecuteNonQuery();
                        InvullenGridview();
                        lblSuccessMessage.Text = "Product toegevoegd aan voorraad";
                        lblErrorMessage.Text = "";
                    }
                }
        }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
                throw;
            }
}

        protected void gvBekijkenVoorraad_rowediting(object sender, GridViewEditEventArgs e)
        {
            //Deze code wordt in werking gesteld wanneer er op het bewerk icoontje wordt geklikt
            gvBekijkenVoorraad.EditIndex = e.NewEditIndex;
            InvullenGridview();
        }

        protected void gvBekijkenVoorraad_rowcancelingedit(object sender, GridViewCancelEditEventArgs e)
        {
            //Dit is de code voor het annuleren van een rij bewerking
            gvBekijkenVoorraad.EditIndex = -1;
            InvullenGridview();
        }

        protected void gvBekijkenVoorraad_rowdeleting(object sender, GridViewDeleteEventArgs e)
        {
            //Wanneer er een rij wordt verwijderd wordt deze code in werking gesteld
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    String query = "DELETE FROM Voorraad WHERE ID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvBekijkenVoorraad.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    InvullenGridview();
                    lblSuccessMessage.Text = "Gekozen rij verwijderd";
                    lblErrorMessage.Text = "";
                }
            }

            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
                throw;
            }
        }

        protected void gvBekijkenVoorraad_rowupdating(object sender, GridViewUpdateEventArgs e)
        {
            //Deze code wordt in werking gesteld wanneer een geüpdate rij wordt opgeslagen
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    String query = "UPDATE Voorraad SET Aantal = @aantal, Naam = @naam, Prijs = @prijs, [Minimum voorraad] = @minimumvoorraad, [BTW tariefID] = @BTWTarief WHERE ID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@aantal", (gvBekijkenVoorraad.Rows[e.RowIndex].FindControl("txtAantalVoorraad") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@naam", (gvBekijkenVoorraad.Rows[e.RowIndex].FindControl("txtProductNaam") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@prijs", (gvBekijkenVoorraad.Rows[e.RowIndex].FindControl("txtPrijs") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@minimumvoorraad", (gvBekijkenVoorraad.Rows[e.RowIndex].FindControl("txtMinimumVoorraad") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@BTWTarief", (gvBekijkenVoorraad.Rows[e.RowIndex].FindControl("txtBTWTarief") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvBekijkenVoorraad.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvBekijkenVoorraad.EditIndex = -1;
                    InvullenGridview();
                    lblSuccessMessage.Text = "Product gewijzigd";
                    lblErrorMessage.Text = "";
                }
        }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
                throw;
            }
}
    }
}