using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final
{
    public partial class viewApplications : System.Web.UI.Page
    {
        int jobID;
        protected void Page_Load(object sender, EventArgs e)
        {
            jobID = Convert.ToInt32(Request.QueryString["jobID"].ToString());
            SDT_FinalEntities context = new SDT_FinalEntities();
            var applications = context.junc_job_applicant.Where(j => j.job_id == jobID);
            List<user> users = new List<user>();
            foreach (var user in applications)
            {
                int applicantID = Convert.ToInt32(user.applicant_id);
                var temp = context.users.Where(u => u.id == applicantID).First();
                user tempUser = new user();
                tempUser.id = temp.id;
                tempUser.name = temp.name;

                users.Add(tempUser);
            }

            dgvApplications.DataSource = users;
            dgvApplications.DataBind();

        }
        protected void sendCall_Click(object sender, EventArgs e)
        {
            int userID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("~/sendCall.aspx?userID=" + userID + "&jobID=" + jobID);


        }
        protected void viewCV_Click(object sender, EventArgs e)
        {
            int userID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("~/viewCV.aspx?userID=" + userID);

        }
    }
}