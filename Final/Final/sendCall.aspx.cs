using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final
{
    public partial class sendCall : System.Web.UI.Page
    {
        int jobID,userID;
        string emailOfSender, emailOfReceiver;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Convert.ToBoolean(Session["loggedin"]))
            {
                Response.Redirect("~/login.aspx");
            }
            userID = Convert.ToInt32(Request.QueryString["userID"]);
             jobID  = Convert.ToInt32(Request.QueryString["jobID"]);
            SDT_FinalEntities context = new SDT_FinalEntities();
            int senderID = Convert.ToInt32(Session["uid"]);
             emailOfSender = context.users.Where(u => u.id == senderID).First().email.Trim();
             emailOfReceiver = context.users.Where(u => u.id == userID).First().email.Trim();
            emailFrom.Value = emailOfSender;
        }
        protected void send_Click(object sender, EventArgs e)
        {
            try
            {
                var client = new SmtpClient("smtp.gmail.com", 587)
                {
                    Credentials = new System.Net.NetworkCredential("noman.amin321@gmail.com", "nouman321"),
                    EnableSsl = true
                };
                client.Send(emailOfSender, emailOfReceiver, "You have received a Interview Call From :"+ emailOfReceiver, body.Value);
                successMessage.InnerHtml = "Your Message has successfully Sent!";
                send.Style.Add("display", "none");
            }
            catch (Exception)
            {
             
                throw;
            }

            //SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            //smtpClient.Credentials = new System.Net.NetworkCredential("noman.amin321@gmail.com", "nouman321");
            //smtpClient.UseDefaultCredentials = true;
            //smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            //smtpClient.EnableSsl = true;
            //MailMessage mail = new MailMessage();
            ////Setting From , To and CC
            //mail.From = new MailAddress(emailOfSender, "Job Portal");
            //mail.To.Add(new MailAddress(emailOfReceiver));
            //mail.Subject = "You Have Received a Interview Call From " + emailOfSender;
            //mail.SubjectEncoding = System.Text.Encoding.UTF8;
            //mail.Body = body.InnerText;
            //smtpClient.Send(mail);
    
        }
    }
}