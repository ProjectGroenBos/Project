using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Financien
{
    public partial class WebForm5 : System.Web.UI.Page
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

        public void changeAfdeling(object sender, EventArgs e)
        {
            var myLI = (HtmlControl)sender;
            string text = myLI.ID;

            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "afkeursuccess();", true);
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

        protected void btnAfkeuren_OnClick(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                int repeaternummer = int.Parse(((Button)sender).CommandName);
                int nummer = int.Parse(((Button)sender).CommandArgument);

                TextBox afkeurTextBox = (TextBox)rpInkoopOrderAanvragen.Items[repeaternummer].FindControl("txbInkoopOrderAfkeuren");

                SqlCommand cmd = new SqlCommand("UPDATE InkoopOrderAanvraag SET Opmerking = @textbox, InkoopOrderAanvraagStatusID = 3, LaatsteUpdate = GETDATE() WHERE Nummer = @nummer", con);
                cmd.Parameters.AddWithValue("@nummer", nummer);
                cmd.Parameters.AddWithValue("@textbox", afkeurTextBox.Text);
                cmd.ExecuteNonQuery();

                con.Close();
            }

            gvInkooporderaanvragerMain.DataBind();
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "afkeursuccess();", true);
        }

        protected void btnGoedkeuren_OnClick(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();

                int nummer = int.Parse(((Button)sender).CommandArgument);


                SqlCommand cmd = new SqlCommand("UPDATE InkoopOrderAanvraag SET InkoopOrderAanvraagStatusID = 2, LaatsteUpdate = GETDATE() WHERE Nummer = @nummer; ", con);
                cmd.Parameters.AddWithValue("@nummer", nummer);
                cmd.ExecuteNonQuery();

                con.Close();
            }

            gvInkooporderaanvragerMain.DataBind();
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "goedkeursuccess();", true);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.Text == "Alle Afdelingen")
            {
                SqlDataSource1.SelectCommand =
                "select * from inkooporderaanvraagmainLev where [Status] = 'Geweigerd' OR [Status] = 'Wachten op goedkeuring' order by datum DESC, opmerking DESC";
                gvInkooporderaanvragerMain.DataBind();
            }

            else
            {
                SqlDataSource1.SelectCommand =
                    "select * from inkooporderaanvraagmainLev where Naam = '" + DropDownList1.Text + "' AND [Status] = 'Geweigerd' OR [Status] = 'Wachten op goedkeuring' order by datum DESC, opmerking DESC";
                gvInkooporderaanvragerMain.DataBind();
            }
        }
    }
}