﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Final
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Convert.ToBoolean(Session["loggedin"]))
            {
                Response.Redirect("~/login.aspx");
            }
            else if (Session["utype"].ToString() != "owner")
            {
                Response.Redirect("~/logout.aspx");
            }
            SDT_FinalEntities context = new SDT_FinalEntities();
            dgvNewUsers.DataSource = context.users.Where(u => u.type == "employee" && u.account_status == "pendingApproval").ToList();
            dgvNewUsers.DataBind();
            dgvApprovedUseres.DataSource = context.users.Where(u => u.type == "employee" && u.account_status == "approved" && (u.isBlackList == false || u.isBlackList == null)).ToList();
            dgvApprovedUseres.DataBind();
        }

        protected void blackListUser_Click(object sender, EventArgs e)
        {
            int userID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            SDT_FinalEntities context = new SDT_FinalEntities();
            var user = context.users
                            .Where(u => u.id == userID && (u.isBlackList == false  || u.isBlackList == null))
                            .FirstOrDefault();
            user.isBlackList = true;
            context.SaveChanges();
            Response.Redirect(Request.RawUrl);

        }
        protected void approveUser_Click(object sender, EventArgs e)
        {
            int userID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            SDT_FinalEntities context = new SDT_FinalEntities();
            var user = context.users
                            .Where(u => u.id == userID)
                            .FirstOrDefault();
            user.account_status = "approved";
            context.SaveChanges();
            Response.Redirect(Request.RawUrl);
        }
        protected void rejectUser_Click(object sender, EventArgs e)
        {
            int userID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            SDT_FinalEntities context = new SDT_FinalEntities();
            var user = context.users
                            .Where(u => u.id == userID)
                            .FirstOrDefault();
            user.account_status = "rejected";
            context.SaveChanges();
            dgvNewUsersRefresh();
        }
       
        protected void dgvNewUsersRefresh()
        {
            SDT_FinalEntities context = new SDT_FinalEntities();
            dgvNewUsers.DataSource = context.users.Where(u => u.type == "employee" && u.account_status == null).ToList();
            dgvNewUsers.DataBind();
            Response.Write("<script>alert('Updated')</script>");
            Response.Redirect(Request.RawUrl);
        }

        protected void dgvNewUsers_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}