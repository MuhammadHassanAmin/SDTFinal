using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final
{
    public partial class jobseekerDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Convert.ToBoolean(Session["loggedin"]))
            {
                Response.Redirect("~/login.aspx");
            }
            else if (Session["utype"].ToString() != "jobseeker")
            {
                Response.Redirect("~/logout.aspx");
            }
            SDT_FinalEntities context = new SDT_FinalEntities();
            dgvAllJobs.DataSource = context.jobs.Where(j => j.isOpen == true).ToList();
            dgvAllJobs.DataBind(); 
        }
        protected void applyNow_Click(object sender, EventArgs e)
        {
            int jobID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("~/viewJob.aspx?jobID=" + jobID);
        }
            
    }
}