using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Final.BusinessLayer;

namespace Final
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            user pU = new user();
            BusinessUsers bU = new BusinessUsers();
            pU.email = TextBox3.Text;
            pU.password = TextBox2.Text;
            if (RadioButton_AccountType_Employee.Checked)
            {
                pU.type = "employee";
            }
            else if (RadioButton_AccountType_JobSeeker.Checked)
            {

                pU.type = "jobseeker";

            }
            else
            {
                pU.type = "owner";

            }

            if (!bU.IsValidEmail(pU.email))
            {
                // Validating email
                Response.Write("<script>alert('InValid Email Entered')</script>");

            }
            else
            {
                // Login business logic
                pU = bU.login(pU);
                if (pU == null)
                {
                    errorMsg.Text = "Credentials did'nt match or user does'nt exist";
                }
                else
                {
                    if (pU.type == "employee")
                    {
                        if (pU.isBlackList == true)
                        {
                            errorMsg.Text = "Your Account added into Black List You Can't Login!";
                        }
                        else if (pU.account_status == "rejected")
                        {
                            errorMsg.Text = "Your Account is Rejected!";

                        }
                        else if (pU.account_status == "pendingApproval")
                        {
                            errorMsg.Text = "Your Account is Pending For owner Approval!";
                        }
                        else
                        {
                            Session["loggedin"] = true;
                            Session["uid"] = pU.id;
                            Session["uemail"] = pU.email;
                            Session["uname"] = pU.name;
                            Session["utype"] = pU.type;
                            Response.Redirect("employeeDashboard.aspx");

                        }
                    }
                    else
                    {


                        //loggedin 
                        Session["loggedin"] = true;
                        Session["uid"] = pU.id;
                        Session["uemail"] = pU.email;
                        Session["uname"] = pU.name;
                        Session["utype"] = pU.type;

                        if (pU.type == "owner")
                        {
                            Response.Redirect("ownerDashboard.aspx");
                        }
                        else if (pU.type == "jobseeker")
                        {
                            Response.Redirect("jobseekerDashboard.aspx");

                        }
                    }
                }



            }
        }
    }
    }