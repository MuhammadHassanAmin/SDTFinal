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

            var jobTOupdate = context.jobs.Where(j => j.id == job_id).FirstOrDefault(); 
          txt_jobTitle.Text =  jobTOupdate.title.Trim();
            txtArea_jobDescription.Text = jobTOupdate.description.Trim();
          txt_Skills.Text = jobTOupdate.skills.Trim();
           txt_Salary.Value = jobTOupdate.salary.ToString();
           experienceRequired.Value = jobTOupdate.experience.ToString();
            txt_City.Text = jobTOupdate.city.Trim();
            experienceRequired.Value = jobTOupdate.experience.ToString();
        }

        protected void updateJobSubmit_Click(object sender, EventArgs e)
        {

        }
    }
}