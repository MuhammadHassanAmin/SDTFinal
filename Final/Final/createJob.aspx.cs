using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final
{
    public partial class createJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void createJobSubmit_Click(object sender, EventArgs e)
        {
            int userid = Convert.ToInt32(Session["uid"]);
            job pJob = new job();
            pJob.user_id = userid;
            pJob.title  = txt_jobTitle.Text;
            pJob.description  = txtArea_jobDescription.Text;
            pJob.skills= txt_Skills.Text;
            pJob.salary = Convert.ToInt32(txt_Salary.Value);
            pJob.experience = Convert.ToInt32(experienceRequired.Value);
            pJob.city = txt_City.Text;
            pJob.isOpen = true;

            SDT_FinalEntities context = new SDT_FinalEntities();
            context.jobs.Add(pJob);
            context.SaveChanges();
            successMsg.InnerText = "New Job Added";
        }
    }
}