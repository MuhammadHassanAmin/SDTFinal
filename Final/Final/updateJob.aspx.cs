using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final
{
    public partial class updateJob : System.Web.UI.Page
    {
         int job_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            job_id = Convert.ToInt32(Request.QueryString["job_id"]);
            SDT_FinalEntities context = new SDT_FinalEntities();
            if (!Page.IsPostBack) { 
                var jobTOupdate = context.jobs.Where(j => j.id == job_id).FirstOrDefault(); 
          txt_jobTitle.Text =  jobTOupdate.title.Trim();
            txtArea_jobDescription.Text = jobTOupdate.description.Trim();
          txt_Skills.Text = jobTOupdate.skills.Trim();
           txt_Salary.Value = jobTOupdate.salary.ToString();
           experienceRequired.Value = jobTOupdate.experience.ToString();
            txt_City.Text = jobTOupdate.city.Trim();
            experienceRequired.Value = jobTOupdate.experience.ToString();
            }
        }

        protected void updateJobSubmit_Click(object sender, EventArgs e)
        {
            SDT_FinalEntities context = new SDT_FinalEntities();
            var job = context.jobs.Where(j => j.id == job_id).First();
            job.title = txt_jobTitle.Text;
            job.description = txtArea_jobDescription.Text;
            job.skills =txt_Skills.Text;
            job.salary =Convert.ToInt32(txt_Salary.Value);
            job.experience=Convert.ToInt32(experienceRequired.Value);
            job.city = txt_City.Text;
            context.SaveChanges();
            successMsg.InnerHtml = "Job Has been updated";
        }
    
    }
}