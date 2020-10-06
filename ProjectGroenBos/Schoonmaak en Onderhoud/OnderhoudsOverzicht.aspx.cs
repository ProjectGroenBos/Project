﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;



namespace ProjectGroenBos.Schoonmaak_en_Onderhoud
{
    public partial class OnderhoudsOverzicht : System.Web.UI.Page
    {
        StringBuilder table = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (!this.IsPostBack)
            //{
                ////Populating a DataTable from database.
                //DataTable dt = this.GetData();



                ////Building an HTML string.
                //StringBuilder html = new StringBuilder();



                ////Table start.
                //html.Append("<table border = '1'>");



                ////Building the Header row.
                //html.Append("<tr>");
                ////foreach (DataColumn column in dt.Columns)
                ////{
                ////html.Append("<th>");
                ////html.Append(column.ColumnName);
                //html.Append("<th>Nummer</th><th>Startdatum</th><th>[Verwachte einddatum]</th><th>Kosten</th><th>Bungalownummer</th><th>Onderhoudsstatusnummer</th><th>Onderhoudstypenummer</th><th>[Datum van constatering]</th>");

                ////html.Append("</th>");
                ////}
                //html.Append("</tr>");



                ////Building the Data rows.
                //foreach (DataRow row in dt.Rows)
                //{
                //    html.Append("<tr>");
                //    foreach (DataColumn column in dt.Columns)
                //    {
                //        html.Append("<td>");
                //        html.Append(row[column.ColumnName]);
                //        html.Append("</td>");
                //    }
                //    html.Append("</tr>");
                //}



                ////Table end.
                //html.Append("</table>");



                ////Append the HTML string to Placeholder.
                //PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
            }

        protected void btnZoek_Click(object sender, EventArgs e)
        {
            {
                //if (string.IsNullOrWhiteSpace(datumTxtbox.Text))
                //{
                //    datumGrid.Visible = false;

                //}

                //if(string.IsNullOrWhiteSpace(bungalowTxtbox.Text))
                //{
                //    bungalowGrid.Visible = false;
                //}

                //if(string.IsNullOrWhiteSpace(onderhoudTxtbox.Text))
                //{
                //    onderhoudGrid.Visible = false;
                //}

                if (DropDownList1.SelectedItem.Value == "Startdatum")
                {
                    OverzichtGrid.Visible = false;
                    naamGrid.Visible = false;
                    bungalowGrid.Visible = false;

                }

                if (DropDownList1.SelectedItem.Value == "Bungalownummer")
                {
                    OverzichtGrid.Visible = false;
                    naamGrid.Visible = false;
                    datumGrid.Visible = false;
                }

                if (DropDownList1.SelectedItem.Value == "Naam Medewerker")
                {
                    OverzichtGrid.Visible = false;
                    bungalowGrid.Visible = false;
                    datumGrid.Visible = false;

                }

                if (string.IsNullOrEmpty(naamTxtbox.Text))
                {

                }
                else
                {
                    OverzichtGrid.Visible = false;
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("OnderhoudToevoegen.aspx");
        }

        protected void btnAndersZoeken_Click1(object sender, EventArgs e)
        {
            lblNM.Visible = false;
            naamTxtbox.Visible = false;
            DropDownList1.Visible = true;
            searchBox.Visible = true;
        }
    }



    //private DataTable GetData()
    //{
    //    string constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand("SELECT Nummer, Startdatum, [VerwachteEinddatum], Kosten, BungalowNummer, OnderhoudsstatusID, OnderhoudtypeID, [DatumvanConstatering] FROM Onderhoudsopdracht"))
    //        {
    //            using (SqlDataAdapter sda = new SqlDataAdapter())
    //            {
    //                cmd.Connection = con;
    //                sda.SelectCommand = cmd;
    //                using (DataTable dt = new DataTable())
    //                {
    //                    sda.Fill(dt);
    //                    return dt;
    //                }
    //            }
    //        }
    //    }
    //}



    //private DataTable GetData1()
    //{
    //    string constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand("select Nummer, Startdatum, [VerwachteEinddatum], Kosten, BungalowNummer, OnderhoudsstatusID, OnderhoudtypeID, [DatumvanConstatering] from Onderhoudsopdracht where Nummer= '" + searchBox.Text + "'"))
    //        {
    //            using (SqlDataAdapter sda = new SqlDataAdapter())
    //            {
    //                cmd.Connection = con;
    //                sda.SelectCommand = cmd;
    //                using (DataTable dt = new DataTable())
    //                {
    //                    sda.Fill(dt);
    //                    return dt;
    //                }
    //            }
    //        }
    //    }
    //}




    //protected void searchButton_Click(object sender, EventArgs e)
    //    {

    //    }



    //    protected void searchBox_TextChanged(object sender, EventArgs e)
    //    {

    //    }



    //    protected void Button1_Click(object sender, EventArgs e)
    //    {
    ////"select * from [dbo].[Onderhoudsopdracht] where Nummer= '" + searchBox.Text + "'"


    ////Populating a DataTable from database.
    //DataTable dt = this.GetData1();



    ////Building an HTML string.
    //StringBuilder html = new StringBuilder();



    ////Table start.
    //html.Append("<table border = '1'>");



    ////Building the Header row.
    //html.Append("<tr>");
    ////foreach (DataColumn column in dt.Columns)
    ////{
    ////html.Append("<th>");
    ////html.Append(column.ColumnName);
    //html.Append("<th>Nummer</th><th>Startdatum</th><th>Verwachte einddatum</th><th>Kosten</th><th>Bungalownummer</th><th>Onderhoudsstatusnummer</th><th>Onderhoudstypenummer</th><th>Datum van constatering</th>");



    ////html.Append("</th>");
    ////}
    //html.Append("</tr>");



    //Building the Data rows.
    //    foreach (DataRow row in dt.Rows)
    //    {
    //        html.Append("<tr>");
    //        foreach (DataColumn column in dt.Columns)
    //        {
    //            html.Append("<td>");
    //            html.Append(row[column.ColumnName]);
    //            html.Append("</td>");
    //        }
    //        html.Append("</tr>");
    //    }



    //    //Table end.
    //    html.Append("</table>");



    //    //Append the HTML string to Placeholder.
    //    PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });

    //}

    //protected void Button2_Click(object sender, EventArgs e)
    //    {
    //        Response.Redirect("OnderhoudToevoegen.aspx");
    //    }
    //}
}