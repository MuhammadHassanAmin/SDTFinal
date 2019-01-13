using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final
{
    public partial class viewCompany : System.Web.UI.Page
    {
        int userID;
        protected void Page_Load(object sender, EventArgs e)
        {
             userID = Convert.ToInt32(Session["uid"]);
            string userType = Session["utype"].ToString();
            if (userType == "employee")
            {
                if (isCompnayExists(userID))
                {
                    companyName.Attributes.Add("disabled", "disabled");
                    AboutCompnay.Attributes.Add("disabled", "disabled");
                    foundedYear.Attributes.Add("disabled", "disabled");
                    Address.Attributes.Add("disabled", "disabled");
                    createCompany.Style.Add("display", "none");
                }
            }
        }

        protected void createCopmany_Click(object sender, EventArgs e)
        {
            SDT_FinalEntities context = new SDT_FinalEntities();
            company newCompany = new company();
            newCompany.user_id = userID;
            newCompany.name = companyName.Text;
            newCompany.about = AboutCompnay.Text;
            newCompany.foundedYear = foundedYear.Text;
            newCompany.address = Address.Text;
            context.companies.Add(newCompany);
            context.SaveChanges();
            createCompany.Style.Add("display", "none");
            result.Text = "Company Added";
        }
        protected bool isCompnayExists(int userID)
        {
            SDT_FinalEntities context = new SDT_FinalEntities();
            company cTemp = new company();
            cTemp = context.companies.Where(c => c.user_id == userID).First();
            if (cTemp == null)
            {
                return false;
            }
            else
            {
                companyName.Text= cTemp.name;
                AboutCompnay.Text = cTemp.about;
                foundedYear.Text = cTemp.foundedYear;
                Address.Text = cTemp.address;
                return true;
            }

        }
    }
}