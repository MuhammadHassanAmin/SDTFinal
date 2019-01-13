<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jobReport.aspx.cs" Inherits="Final.jobReport" %>
<%@ Register Src="~/Includes/LinksUserControl.ascx" TagPrefix="uc1" TagName="LinksUserControl" %>
<%@ Register Src="~/Includes/NavUserControl.ascx" TagPrefix="uc1" TagName="NavUserControl" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:LinksUserControl runat="server" ID="LinksUserControl" />
    <title>View Reports</title>

</head>
<body>
    <uc1:NavUserControl runat="server" ID="NavUserControl" />
    <form id="form1" runat="server">
        <main class="mt-60">
            <div class="section-heading">
                <div class="vertically-align-center width-100p">
                    <h3>Job<span class="primary-color"> Report</span></h3>
                    <span class="lines-png"></span>
                </div>
            </div>
            <div class="form-container">
                <h4>Welcome <%:Session["uname"]%></h4>
                <p>Total Number of Applications Received For this Job Are:</p>
                <p id="numOfApplicants" runat="server"></p>
            </div>
        </main>
    </form>
</body>
</html>
