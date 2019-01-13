using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.IO;
using System.Data;

namespace Final
{
    public partial class DownloadCV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
            int userID =Convert.ToInt32(Session["uid"]);
            if (!isCvExist(userID))
            {
                Response.Redirect("~/createCV.aspx");
            }
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
        protected void downloadCVSubmit_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=MyCV.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);
            downloadCVpdf.RenderControl(htmlTextWriter);
            StringReader stringReader = new StringReader(stringWriter.ToString());
            Document Doc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(Doc);
            PdfWriter.GetInstance(Doc, Response.OutputStream);
            Doc.Open();
            htmlparser.Parse(stringReader);
            Doc.Close();
            Response.Write(Doc);
            Response.End();
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