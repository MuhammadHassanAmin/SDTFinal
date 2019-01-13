using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final
{
    public partial class viewAppliedJobs : System.Web.UI.Page
    {

        int userID;
        protected void Page_Load(object sender, EventArgs e)
        {
            userID = Convert.ToInt32(Session["uid"]);
            SDT_FinalEntities context = new SDT_FinalEntities();
            List<job> jobOfCurrentUserr = new List<job>();
            var jobsFromJunction = context.junc_job_applicant.Where(j => j.applicant_id == userID);
            foreach (var application in jobsFromJunction)
            {
                int jobID = Convert.ToInt32(application.job_id);
                job temp = new job();
                temp.id = context.jobs.Where(j => j.id == jobID).First().id;
                temp.salary = context.jobs.Where(j => j.id == jobID).First().salary;
                temp.experience = context.jobs.Where(j => j.id == jobID).First().experience;
                temp.city = context.jobs.Where(j => j.id == jobID).First().city;
                temp.skills = context.jobs.Where(j => j.id == jobID).First().skills;
                temp.description = context.jobs.Where(j => j.id == jobID).First().description;
                temp.title = context.jobs.Where(j => j.id == jobID).First().title;
                jobOfCurrentUserr.Add(temp);
            }
            DGVAppliedJobs.DataSource = jobOfCurrentUserr;
            DGVAppliedJobs.DataBind();
        }
    }
}