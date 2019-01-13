using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final
{
    public partial class employeeDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (  Session["loggedin"] != null)
            {
                if ((bool)Session["loggedin"])
                {
                    int uid = Convert.ToInt32(Session["uid"]);
                    SDT_FinalEntities context = new SDT_FinalEntities();
                    dgvJobs.DataSource = context.jobs.Where(j => j.user_id == uid && j.isOpen == true ).ToList();
                    dgvJobs.DataBind();
                    dgvClosedJobs.DataSource = context.jobs.Where(j => j.user_id == uid && j.isOpen == false).ToList();
                    dgvClosedJobs.DataBind();
                }
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }
        
        protected void viewReport_Click(object sender, EventArgs e)
        {
            int job_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("jobReport.aspx?jobID=" + job_id);
        }
        protected void viewApplications_Click(object sender, EventArgs e)
        {
            int job_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("viewApplications.aspx?jobID=" + job_id);

        }
        protected void createJob_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/createJob.aspx");

        }
        protected void closeJob_Click(object sender, EventArgs e)
        {
            int job_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            SDT_FinalEntities context = new SDT_FinalEntities();
            var job = context.jobs.Where(j => j.id == job_id).FirstOrDefault();
            job.isOpen = false;
            context.SaveChanges();
            Response.Redirect(Request.RawUrl);
        }
        protected void deleteJob_Click(object sender, EventArgs e)
        {
            int job_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            SDT_FinalEntities context = new SDT_FinalEntities();
            context.jobs.Remove(context.jobs.Where(j => j.id == job_id).FirstOrDefault());
            context.SaveChanges();
            Response.Redirect(Request.RawUrl);

        }
        protected void updateJob_Click(object sender, EventArgs e)
        {
            int jobID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("~/updateJob.aspx?job_id=" + jobID);

        }

        protected void dgvJobs_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}