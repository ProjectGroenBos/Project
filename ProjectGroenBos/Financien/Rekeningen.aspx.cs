using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ProjectGroenBos.Financien
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        int NUmmer = 10;
        object TeklifId = 2;
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbconnectie"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
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

                SqlCommand cmd = new SqlCommand("select * from rekeningen", con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                rpModals.DataSource = ds;
                rpModals.DataBind();

                con.Close();
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            StringWriter sw = new StringWriter();
            HtmlTextWriter ht = new HtmlTextWriter(sw);

            foreach (RepeaterItem item in rpModals.Items)
            {
                Label lbl1 = (Label)item.FindControl("Nummertje");
                string str = lbl1.Text;
                NUmmer = int.Parse(str);
            }


            GridView gvFactuurrekening = (GridView)rpModals.Items[0].FindControl("gvFactuurrekening");
            gvFactuurrekening.RenderControl(ht);

            MailMessage o = new MailMessage("groenbosfinances@hotmail.com", "telefoonkevin02@gmail.com");
            o.Body = "<h1>Gridview</h1><hr/>" + sw.ToString();
            o.IsBodyHtml = true;
            o.Subject = "Factuur";
            NetworkCredential netCred = new NetworkCredential("groenbosfinances@hotmail.com", "MarionenAndries");
            SmtpClient smtpobj = new SmtpClient("smtp.live.com", 587);
            smtpobj.EnableSsl = true;
            smtpobj.Credentials = netCred;
            smtpobj.Send(o);
        }

        protected void Email()
        {

        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
}