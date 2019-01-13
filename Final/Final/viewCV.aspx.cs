using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final
{
    public partial class viewCV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Convert.ToBoolean(Session["loggedin"]))
            {
                Response.Redirect("~/login.aspx");
            }
            int userID = Convert.ToInt32(Request.QueryString["userID"]);
            SDT_FinalEntities context = new SDT_FinalEntities();
            var cv = context.CVs.Where(c => c.user_id == userID).FirstOrDefault();
            string base64String = Convert.ToBase64String(cv.dp, 0, cv.dp.Length);
            dp.Src = "data:image/jpg;base64," + base64String;
            Skills.InnerHtml = cv.skills.Trim();
            Objectives.InnerHtml = cv.objectives.Trim();
            fullname.InnerHtml = cv.fullName.Trim();
            Academic.InnerHtml = cv.academicDetails.Trim();
            Achievements.InnerHtml = cv.achievements.Trim();
            Experience.InnerHtml = cv.experience.Trim();
            Other.InnerHtml = cv.otherInformation.Trim();
        }
    }
}