using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace ProjectGroenBos.Restaurant
{
    public partial class OrderGoedkeur : System.Web.UI.Page
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

        protected void gvOrderBekijken_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        void InvullenGridview()
        {
            //Hieronder gebeurt het inladen van gegevens van de database naar de applicatie
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM  VoedselRestaurantInkoopOrder LEFT JOIN Leverancier ON VoedselRestaurantInkoopOrder.LeverancierID = Leverancier.ID; ", sqlCon);
                sqlDa.Fill(dtbl);
                Session["vLE"] = dtbl;
            }
            if (dtbl.Rows.Count > 0)
            {
                gvOrderBekijken.DataSource = dtbl; //!
                gvOrderBekijken.DataBind();
            }

            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvOrderBekijken.DataSource = dtbl;
                gvOrderBekijken.DataBind();
                gvOrderBekijken.Rows[0].Cells.Clear();
                gvOrderBekijken.Rows[0].Cells.Add(new TableCell());
                gvOrderBekijken.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvOrderBekijken.Rows[0].Cells[0].Text = "Geen Data Gevonden!";
                gvOrderBekijken.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void txbZoeken_TextChanged(object sender, EventArgs e)
        {
            //Hieronder staat de code voor de zoekbalk
            DataTable dtbl = (DataTable)Session["vLE"];
            DataView dv = dtbl.DefaultView;
            dv.RowFilter = string.Format("naam like '%{0}%'", txbZoeken.Text);
            gvOrderBekijken.DataSource = dv.ToTable();
            gvOrderBekijken.DataBind();
        }

        protected void gvOrderBekijken_selectedindexchanged(object sender, EventArgs e)
        {

        }

        protected void gvOrderBekijken_rowcommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvOrderBekijken_rowediting(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvOrderBekijken_rowcancelingedit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void gvOrderBekijken_rowdeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void gvOrderBekijken_rowupdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void btnOpen_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string nummer = (string)gvOrderBekijken.DataKeys[0]["Bestelnummer"];
                SqlDataSource2.SelectCommand = "SELECT Voorraad.Naam, VoedselRestaurantInkoopOrder.Bestelnummer, VoedselRestaurantInkoopOrder.Datum, VoedselRestaurantAanvraagRegels.Aantal FROM Voorraad INNER JOIN VoedselRestaurantAanvraagRegels ON Voorraad.ID = VoedselRestaurantAanvraagRegels.VoorraadID INNER JOIN VoedselRestaurantInkoopOrder ON VoedselRestaurantAanvraagRegels.VoedselOrderAanvraag = VoedselRestaurantInkoopOrder.Nummer WHERE VoedselRestaurantInkoopOrder.Bestelnummer =" + nummer + "";
            }
        }
    }
}