using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final
{
    public partial class NavUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Employee Links
            createJobLink.Style.Add("display", "none");
            viewCompanyLink.Style.Add("display", "none");
            //JobSeeker Links
            searchJobLink.Style.Add("display", "none");
            createCVLink.Style.Add("display", "none");
            downloadCVLink.Style.Add("display", "none");
            viewApplicationsLink.Style.Add("display", "none");
            if (Convert.ToBoolean(Session["loggedin"]))
            {
                loginLink.HRef = "~/logout.aspx";
                loginText.InnerHtml= " Logout";
                regstrationLink.Visible = false;
                regstrationLink.Style.Add("display", "none");
                regstrationText.Style.Add("display", "none");
                hideIfLoggedin.Style.Add("display", "none");
                if (Session["utype"].ToString() == "owner")
                {
                    dashboardLink.HRef = "ownerDashboard.aspx";
                }
                else if(Session["utype"].ToString() == "employee")
                {

                    dashboardLink.HRef = "~/employeeDashboard.aspx";
                    createJobLink.Style.Add("display", "inline-block");
                    viewCompanyLink.Style.Add("display", "inline-block");

                }
                else if (Session["utype"].ToString() == "jobseeker")
                {
                    searchJobLink.Style.Add("display", "inline-block");
                    createCVLink.Style.Add("display", "inline-block");
                    downloadCVLink.Style.Add("display", "inline-block");
                    viewApplicationsLink.Style.Add("display", "inline-block");
                    dashboardLink.HRef = "~/jobseekerDashboard.aspx";

                }
            }
            else
            {
                dashboardLi.Style.Add("display", "none");

            }
        }
    }
}