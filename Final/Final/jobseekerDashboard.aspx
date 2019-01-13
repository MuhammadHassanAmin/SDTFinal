<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jobseekerDashboard.aspx.cs" Inherits="Final.jobseekerDashboard" %>

<%@ Register Src="~/Includes/LinksUserControl.ascx" TagPrefix="uc1" TagName="LinksUserControl" %>
<%@ Register Src="~/Includes/NavUserControl.ascx" TagPrefix="uc1" TagName="NavUserControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:LinksUserControl runat="server" ID="LinksUserControl" />
    <title>Dashboard</title>

</head>
<body>
    <uc1:NavUserControl runat="server" ID="NavUserControl" />
    <form id="form1" runat="server">
        <main class="mt-60">
            <div class="section-heading">
                <div class="vertically-align-center width-100p">
                    <h3>JobSeeker<span class="primary-color"> Dashboard</span></h3>
                    <span class="lines-png"></span>
                </div>
            </div>
            <div class="form-container">
                <h4>Welcome <%:Session["uname"]%> </h4>
                    <h3 runat="server" id="dgvLable"></h3>
                    <asp:GridView ID="dgvAllJobs" runat="server" AutoGenerateColumns="false" >
                        <Columns>
                            <asp:BoundField DataField="title" HeaderText="Name" />
                            <asp:BoundField DataField="description" HeaderText="Description" />
                            <asp:BoundField DataField="skills" HeaderText="Required Skills" />
                            <asp:BoundField DataField="experience" HeaderText="Required Experience" />
                            <asp:BoundField DataField="salary" HeaderText="Expected Salary" />
                            <asp:BoundField DataField="city" HeaderText="City" />
                            <asp:TemplateField HeaderText="Apply Now">
                                <ItemTemplate>
                                    <asp:LinkButton CssClass="flat-button  mx-auto my-10" ID="applyNow" Text="Apply Now" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="applyNow_Click"> 
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
            </div>
        </main>
    </form>
</body>
</html>
