<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewAppliedJobs.aspx.cs" Inherits="Final.viewAppliedJobs" %>
<%@ Register Src="~/Includes/LinksUserControl.ascx" TagPrefix="uc1" TagName="LinksUserControl" %>
<%@ Register Src="~/Includes/NavUserControl.ascx" TagPrefix="uc1" TagName="NavUserControl" %>
<%@ Register Src="~/Includes/isLoggedIn.ascx" TagPrefix="uc1" TagName="isLoggedIn" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:LinksUserControl runat="server" ID="LinksUserControl" />
    <title>View Applications</title>

</head>
<body>
    <uc1:isLoggedIn runat="server" ID="isLoggedIn" />
    <uc1:NavUserControl runat="server" ID="NavUserControl" />
    <form id="form1" runat="server">
        <main class="mt-60">
            <div class="section-heading">
                <div class="vertically-align-center width-100p">
                    <h3>View<span class="primary-color"> Applications</span></h3>
                    <span class="lines-png"></span>
                </div>
            </div>
            <div class="form-container">
                <h4>Welcome <%:Session["uname"]%> </h4>
                <h3 class="text-center">You have applied on following Jobs</h3>
               <asp:GridView ID="DGVAppliedJobs" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="title" HeaderText="Name" />
                            <asp:BoundField DataField="description" HeaderText="Description" />
                            <asp:BoundField DataField="skills" HeaderText="Required Skills" />
                            <asp:BoundField DataField="experience" HeaderText="Required Experience" />
                            <asp:BoundField DataField="salary" HeaderText="Expected Salary" />
                            <asp:BoundField DataField="city" HeaderText="City" />
                        </Columns>
                    </asp:GridView>
            </div>
        </main>
    </form>
</body>
</html>
