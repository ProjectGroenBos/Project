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
    public partial class VoorraadZien : System.Web.UI.Page
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
            functiescheiding();
        }

        private void functiescheiding()
        {
            //controleren of de ingelogde persoon geautoriseerd is om af te mogen rekenen
            int functieID = int.Parse(Session["Functie"].ToString());

            if (functieID == 5)
            {

            }
            else if (functieID == 6)
            {

            }
            else if (functieID == 10)
            {

            }
            else if (functieID == 8)
            {

            }
            else if (functieID == 11)
            {

            }
            else if (functieID == 12)
            {

            }
            else
            {
                Response.Redirect("~/Restaurant/home.aspx");
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
            
        }

        protected void gvBekijkenVoorraad_rowediting(object sender, GridViewEditEventArgs e)
        {
            
        }

        protected void gvBekijkenVoorraad_rowcancelingedit(object sender, GridViewCancelEditEventArgs e)
        {
            
        }

        protected void gvBekijkenVoorraad_rowdeleting(object sender, GridViewDeleteEventArgs e)
        {
            
        }

        protected void gvBekijkenVoorraad_rowupdating(object sender, GridViewUpdateEventArgs e)
        {

        }
    }
}