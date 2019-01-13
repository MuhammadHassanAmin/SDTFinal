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
            SDT_FinalEntities context = new SDT_FinalEntities();
            jobID = Convert.ToInt32(Request.QueryString["jobID"]);
            var totalApplicants = context.junc_job_applicant.Count(j => j.job_id == jobID);
            numOfApplicants.InnerHtml = totalApplicants.ToString();
        }
    }
}