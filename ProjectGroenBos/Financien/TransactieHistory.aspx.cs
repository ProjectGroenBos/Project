using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Financien
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lblAlles_OnClick(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand =
                "Select Transactie.*, Type.Omschrijving AS 'Type Transactie' from Transactie INNER JOIN Type ON Transactie.TypeID = Type.ID Order By Datum DESC";
            gvTransacties.DataBind();

            lblBetalingen.BackColor = System.Drawing.ColorTranslator.FromHtml("#009879");
            lblAlles.BackColor = Color.ForestGreen;
            lblOntvangsten.BackColor = System.Drawing.ColorTranslator.FromHtml("#009879");
        }

        protected void lblBetalingen_OnClick(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand =
                "Select Transactie.*, Type.Omschrijving AS 'Type Transactie' from Transactie INNER JOIN Type ON Transactie.TypeID = Type.ID Where Type.Omschrijving = 'Betaling' Order By Datum DESC";
            gvTransacties.DataBind();

            lblBetalingen.BackColor = Color.ForestGreen;
            lblAlles.BackColor = System.Drawing.ColorTranslator.FromHtml("#009879");
            lblOntvangsten.BackColor = System.Drawing.ColorTranslator.FromHtml("#009879");
        }

        protected void lblOntvangsten_OnClick(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand =
                "Select Transactie.*, Type.Omschrijving AS 'Type Transactie' from Transactie INNER JOIN Type ON Transactie.TypeID = Type.ID Where Type.Omschrijving = 'Ontvangst' Order By Datum DESC";
            gvTransacties.DataBind();
            
            lblBetalingen.BackColor = System.Drawing.ColorTranslator.FromHtml("#009879");
            lblAlles.BackColor = System.Drawing.ColorTranslator.FromHtml("#009879");
            lblOntvangsten.BackColor =  Color.ForestGreen;
        }

        protected void txbZoeken_OnTextChanged(object sender, EventArgs e)
        {
            if (txbZoeken.Text != "")
            {
                SqlDataSource1.SelectCommand =
                    "Select Transactie.*, Type.Omschrijving AS 'Type Transactie' from Transactie INNER JOIN Type ON Transactie.TypeID = Type.ID Where Transactie.Datum LIKE '" + txbZoeken.Text + "%' OR  Transactie.Aan LIKE '" + txbZoeken.Text + "%' Order By Datum DESC";
                gvTransacties.DataBind();
            }

            else
            {
                SqlDataSource1.SelectCommand =
                    "Select Transactie.*, Type.Omschrijving AS 'Type Transactie' from Transactie INNER JOIN Type ON Transactie.TypeID = Type.ID Order By Datum DESC";
                gvTransacties.DataBind();
            }
        }
    }
}