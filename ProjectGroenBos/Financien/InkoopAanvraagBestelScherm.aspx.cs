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
    public partial class InkoopAanvraagBestelScherm : System.Web.UI.Page
    {
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (int.Parse(Session["Functie"].ToString()) != 4 || int.Parse(Session["Functie"].ToString()) != 10)
            {
                Response.Redirect("~/Financien/nietgeautoriseerd.aspx");
            }

            if (!IsPostBack)
            {
                Repeater();
            }
        }

        public void Repeater()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM InkoopOrderAanvraag a LEFT JOIN InkooporderaanvraagItemsTotaalprijs n ON a.Nummer = n.InkooporderaanvraagNummer INNER JOIN Leverancier l ON a.LeverancieriD = l.ID", con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                rpInkoopOrderAanvragen.DataSource = ds;
                rpInkoopOrderAanvragen.DataBind();

                con.Close();
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.Text == "Alle Afdelingen")
            {
                SqlDataSource1.SelectCommand =
                "select * from inkooporderaanvraagmainLev where [Status] = 'Wachten op bestelling' OR [Status] = 'Besteld' order by datum DESC, opmerking DESC";
                gvInkooporderaanvragerMain.DataBind();
            }

            else
            {
                SqlDataSource1.SelectCommand =
                    "select * from inkooporderaanvraagmainLev where Naam = '" + DropDownList1.Text + "' AND [Status] = 'Wachten op bestelling' OR [Status] = 'Besteld' order by datum DESC, opmerking DESC";
                gvInkooporderaanvragerMain.DataBind();
            }
        }

        protected void btnBestel_OnClick(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                int repeaternummer = int.Parse(((Button)sender).CommandName);

                TextBox bestelnummer = (TextBox)rpInkoopOrderAanvragen.Items[repeaternummer].FindControl("txbBestelnummer");

                if(bestelnummer.Text.Length < 1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Bestelerror();", true);
                }
                else
                {
                    int nummer = int.Parse(((Button)sender).CommandArgument);

                    SqlCommand cmd = new SqlCommand("UPDATE InkoopOrderAanvraag SET InkoopOrderAanvraagStatusID = 4, LaatsteUpdate = GETDATE(), Bestelnummer = @bestelnummer WHERE Nummer = @nummer; ", con);
                    cmd.Parameters.AddWithValue("@nummer", nummer);
                    cmd.Parameters.AddWithValue("@bestelnummer", bestelnummer.Text);
                    cmd.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Bestelsuccess();", true);
                }

                con.Close();
            }

            gvInkooporderaanvragerMain.DataBind();
        }
    }
}