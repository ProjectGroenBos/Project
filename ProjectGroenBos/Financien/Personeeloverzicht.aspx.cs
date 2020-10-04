using System;
using System.Collections.Generic;
using System.Configuration;
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
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                VulAfdeling();
                VulFunctie();
            }
        }

        protected void VulAfdeling()
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand com = new SqlCommand("select * from Afdeling", con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset
            dlAfdeling.DataTextField = ds.Tables[0].Columns["Naam"].ToString(); // text field name of table dispalyed in dropdown
            dlAfdeling.DataValueField = ds.Tables[0].Columns["id"].ToString();             // to retrive specific  textfield name 
            dlAfdeling.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
            dlAfdeling.DataBind();  //binding dropdownlist
        }

        protected void VulFunctie()
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand com = new SqlCommand("select * from Functie", con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset
            dlFunctie.DataTextField = ds.Tables[0].Columns["Naam"].ToString(); // text field name of table dispalyed in dropdown
            dlFunctie.DataValueField = ds.Tables[0].Columns["id"].ToString();             // to retrive specific  textfield name 
            dlFunctie.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
            dlFunctie.DataBind();  //binding dropdownlist
        }

        protected void btnToevoegen_Click(object sender, EventArgs e)
        {
            string commandText = "INSERT INTO [dbo].[Medewerker] ([Wachtwoord],[Contracturen per week],[In dienst sinds],[Uurloon],[AfdelingID],[Naam],[Geboortedatum],[AdresHuisnummer],[AdresPostcode],[FunctieID]) VALUES" +
                "(@Wachtwoord, @Contract_uren_per_week, convert(datetime,@in_dienst_sinds,104),@Uurloon, @AfdelingID, @Naam, convert(datetime,@Geboortedatum,104), @AdresHuisnummer, @AdresPostcode, @FunctieID)";

            using (SqlConnection connection = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand(commandText, connection);
                command.Parameters.AddWithValue("@Wachtwoord", "1");
                command.Parameters.AddWithValue("@Contract_uren_per_week", txbContracturen.Text);
                command.Parameters.AddWithValue("@in_dienst_sinds", txbInDienst.Text);
                command.Parameters.AddWithValue("@Uurloon", "1");
                command.Parameters.AddWithValue("@AfdelingID", dlAfdeling.SelectedValue);
                command.Parameters.AddWithValue("@Naam", txbNaam.Text);
                command.Parameters.AddWithValue("@Geboortedatum", txbGeboortedatum.Text);
                command.Parameters.AddWithValue("@AdresHuisnummer", txbAdres.Text);
                command.Parameters.AddWithValue("@AdresPostcode", txbPostcode.Text);
                command.Parameters.AddWithValue("@FunctieID", dlFunctie.SelectedValue);

                connection.Open();

                command.ExecuteNonQuery();
            }

            gvPersoneelsOverzicht.DataBind();
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