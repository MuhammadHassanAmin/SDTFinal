﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final
{
    public partial class createCV : System.Web.UI.Page
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
            int userID = Convert.ToInt32(Session["uid"]);
            if (isCvExist(userID))
            {
                Response.Redirect("~/downloadCV.aspx");
            }
        }

        protected void createCVSubmit_Click(object sender, EventArgs e)
        {
            SDT_FinalEntities context = new SDT_FinalEntities();
            int uid = Convert.ToInt32(Session["uid"]);
            CV cv = new CV();
            using (Stream fs = dpUpload.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    cv.dp = bytes;
               
                }
            }
            cv.user_id = uid; 
            cv.academicDetails = txtAcademic.Text;
            cv.achievements = txtAchievements.Text;
            cv.experience= txtExperience.Text;
            cv.objectives= txtObjectives.Text;
            cv.skills = txtSkills.Text;
            cv.otherInformation= txtOtherInfo.Text;
            cv.fullName = txtFullname.Text;
            context.CVs.Add(cv);
            context.SaveChanges();
            successMsg.InnerHtml="Your CV has been created!";
        }
        protected void dpUpload_Click(object sender, EventArgs e)
        {
      
        }
        protected bool isCvExist(int uid)
        {
            SDT_FinalEntities context = new SDT_FinalEntities();

            if (context.CVs.Count(u => u.user_id == uid) > 0)
            {
                return true;
            }
            else { return false; }
        }
    }
}