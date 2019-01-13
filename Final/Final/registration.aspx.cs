using Final;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Final.BusinessLayer;
namespace Final
{
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            user pU = new user();
            BusinessUsers bU = new BusinessUsers();
            pU.name = TextBox1.Text;
            pU.password = TextBox2.Text;
            pU.email = TextBox3.Text;
            pU.type = "employee";
            pU.account_status = "pendingApproval";
            if (RadioButton_AccountType_JobSeeker.Checked)
            {

                pU.type = "jobseeker";
            }
            

            string validation_result = bU.addUser(pU);

            if (validation_result.Equals("userNameOrEmailAlreadyExsist"))
            {
                Response.Write("<script>alert('This User Name Or Email Already exist')</script>");
            }
            else if (validation_result.Equals("invalidemail"))
            {
                Response.Write("<script>alert('InValid Email Entered')</script>");

            }
            else if (validation_result.Equals("useradded"))
            { 
                Response.Write("<script>alert('Congratulation Your are successfully Registered!')</script>");
                Response.Redirect("~/login.aspx");
            }




        }
    }
}