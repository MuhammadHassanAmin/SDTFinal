using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final
{
    public partial class searchJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SDT_FinalEntities context = new SDT_FinalEntities();
            DGVsearchResult.DataSource = context.jobs.Where(j => j.isOpen == true).ToList();
            DGVsearchResult.DataBind();
            dgvLable.InnerHtml = "All Jobs";
        }
        
             protected void applyNow_Click(object sender, EventArgs e)
                {
            int jobID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("~/viewJob.aspx?jobID=" + jobID);

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            int value = Convert.ToInt32(dropDownSearchBy.SelectedValue);
            SDT_FinalEntities context = new SDT_FinalEntities();

            if (value == 1)
            {
                string city = SearchJobs.Value.ToString().ToLower();
                DGVsearchResult.DataSource = context.jobs.Where(j => j.city == city).ToList();
            }
            else if (value == 2)
            {
                string skill = SearchJobs.Value.ToString().ToLower();
                DGVsearchResult.DataSource = context.jobs.Where(j => j.skills == skill).ToList();

            }
            else if (value == 3)
            {
                if (IsDigitsOnly(SearchJobs.Value.ToString()))
                {
                    int salary = Convert.ToInt32(SearchJobs.Value);
                    DGVsearchResult.DataSource = context.jobs.Where(j => j.salary == salary).ToList();
                }
            

            }
            else if (value == 4)
            {
                if (IsDigitsOnly(SearchJobs.Value.ToString()))
                {
                    int experience = Convert.ToInt32(SearchJobs.Value);
                    DGVsearchResult.DataSource = context.jobs.Where(j => j.experience == experience).ToList();
                }
            }
            dgvLable.InnerHtml = "Here's Your Search Result";
            DGVsearchResult.DataBind();
            searchResult.Style.Add("display", "block");

        }

        protected void dropDownSearchBy_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
        public bool IsDigitsOnly(string str)
        {
            foreach (char c in str)
            {
                if (c < '0' || c > '9')
                    return false;
            }

            return true;
        }

        protected void DGVsearchResult_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}