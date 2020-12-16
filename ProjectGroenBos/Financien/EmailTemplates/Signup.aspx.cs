using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectGroenBos.Financien.EmailTemplates
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //Fetching Settings from WEB.CONFIG file.  
            string emailSender = "groenbosfinances@hotmail.com";
            string emailSenderPassword = "MarionenAndries";
            string emailSenderHost = "smtp.live.com";
            int emailSenderPort = 587;
            Boolean emailIsSSL = true;


            //Fetching Email Body Text from EmailTemplate File.  
            string FilePath = "C:\\Users\\telef\\Documents\\GitHub\\Project\\ProjectGroenBos\\Financien\\EmailTemplates\\SignUp.html";
            StreamReader str = new StreamReader(FilePath);
            string MailText = str.ReadToEnd();
            str.Close();

            //Repalce [newusername] = signup user name   
            MailText = MailText.Replace("[newusername]", txtUserName.Text.Trim());
            MailText = MailText.Replace("[Totaalbedrag]", txtUserName.Text.Trim());
            MailText = MailText.Replace("[Betaald]", txtUserName.Text.Trim());
            MailText = MailText.Replace("[Afboeken]", txtUserName.Text.Trim());
            MailText = MailText.Replace("[Terugbetalen]", txtUserName.Text.Trim());
            MailText = MailText.Replace("[Geldontvangen]", txtUserName.Text.Trim());



            string subject = "Welcome to CSharpCorner.Com";

            //Base class for sending email  
            MailMessage _mailmsg = new MailMessage();

            //Make TRUE because our body text is html  
            _mailmsg.IsBodyHtml = true;

            //Set From Email ID  
            _mailmsg.From = new MailAddress(emailSender);

            //Set To Email ID  
            _mailmsg.To.Add(txtUserName.Text.ToString());

            //Set Subject  
            _mailmsg.Subject = subject;

            //Set Body Text of Email   
            _mailmsg.Body = MailText;


            //Now set your SMTP   
            SmtpClient _smtp = new SmtpClient();

            //Set HOST server SMTP detail  
            _smtp.Host = emailSenderHost;

            //Set PORT number of SMTP  
            _smtp.Port = emailSenderPort;

            //Set SSL --> True / False  
            _smtp.EnableSsl = emailIsSSL;

            //Set Sender UserEmailID, Password  
            NetworkCredential _network = new NetworkCredential(emailSender, emailSenderPassword);
            _smtp.Credentials = _network;

            //Send Method will send your MailMessage create above.  
            _smtp.Send(_mailmsg);


        }
    }
}