﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final
{
    public partial class viewJob : System.Web.UI.Page
    {
        public int jobID; 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Convert.ToBoolean(Session["loggedin"]))
            {
                Response.Redirect("~/login.aspx");
            }
            jobID = Convert.ToInt32(Request.QueryString["jobID"].ToString());
            SDT_FinalEntities context = new SDT_FinalEntities();
            var job = context.jobs.Where(j => j.id == jobID).First();
            title.InnerHtml = job.title;
            description.InnerHtml = job.description;
            city.InnerHtml = job.city;
            skills.InnerHtml = job.skills;
            salary.InnerHtml = job.salary.ToString();
            experience.InnerHtml = job.experience.ToString();
        }

        protected void applyNow_Click(object sender, EventArgs e)
        {
            applyNow.Style.Add("display", "none");
            int userID = Convert.ToInt32(Session["uid"]);
            SDT_FinalEntities context = new SDT_FinalEntities();
            if (context.junc_job_applicant.Count(j=> j.job_id == jobID && j.applicant_id == userID) > 0)
            {
                successMsg.InnerHtml = "You have Already applied for this job!";

            }
            else
            {

            
            junc_job_applicant job_user = new junc_job_applicant();
            job_user.applicant_id = userID;
            job_user.job_id = jobID;
            context.junc_job_applicant.Add(job_user);
            context.SaveChanges();
            successMsg.InnerHtml = "You have successfully applied for this job!";
            applyNow.Style.Add("display", "none");
            }

        }
    }
}