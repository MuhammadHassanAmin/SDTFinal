using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final
{
    public partial class jobReport : System.Web.UI.Page
    {
        int jobID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Convert.ToBoolean(Session["loggedin"]))
            {
                Response.Redirect("~/login.aspx");
            }
            else if (Session["utype"].ToString() != "employee")
            {
                Response.Redirect("~/logout.aspx");
            }
            SDT_FinalEntities context = new SDT_FinalEntities();
            jobID = Convert.ToInt32(Request.QueryString["jobID"]);
            int uid = Convert.ToInt32(Session["uid"]);
            if (context.jobs.Count(j => j.id == jobID && j.user_id == uid) > 0 )
            {
                var totalApplicants = context.junc_job_applicant.Count(j => j.job_id == jobID);
                numOfApplicants.InnerHtml = totalApplicants.ToString();
            }
            else
            {
                Response.Redirect("~/employeeDashboard.aspx");
            }
          
        }
    }
}