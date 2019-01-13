<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="employeeDashboard.aspx.cs" Inherits="Final.employeeDashboard" %>

<%@ Register Src="~/Includes/LinksUserControl.ascx" TagPrefix="uc1" TagName="LinksUserControl" %>
<%@ Register Src="~/Includes/NavUserControl.ascx" TagPrefix="uc1" TagName="NavUserControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:LinksUserControl runat="server" ID="LinksUserControl" />
    <title>Employee Dashboard</title>

</head>
<body>
    <uc1:NavUserControl runat="server" ID="NavUserControl" />
    <form id="form1" runat="server">
        <main class="mt-60">
            <div class="section-heading">
                <div class="vertically-align-center width-100p">
                    <h3>Employee<span class="primary-color"> Dashboard</span></h3>
                    <span class="lines-png"></span>
                </div>
            </div>
            <div class="form-container">
                <h4>Welcome <%:Session["uname"]%> </h4>
                <h3 class="text-center">All Jobs</h3>
                <asp:GridView ID="dgvJobs" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="dgvJobs_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="title" HeaderText="Job Title" />
                        <asp:TemplateField HeaderText="Operations">
                            <ItemTemplate>
                                <asp:LinkButton CssClass="flat-button  mx-auto my-10" ID="updateJob" Text="Update Job" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="updateJob_Click"> 
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Close Job Opening">
                            <ItemTemplate>
                                <asp:LinkButton CssClass="flat-button  mx-auto my-10" ID="closeJob" Text="Close Job" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="closeJob_Click"> 
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="View Applications">
                            <ItemTemplate>
                                <asp:LinkButton CssClass="flat-button  mx-auto my-10" ID="viewApplications" Text="View Applications" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="viewApplications_Click"> 
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="View Report">
                            <ItemTemplate>
                                <asp:LinkButton CssClass="flat-button  mx-auto my-10" ID="viewReport" Text="View Report" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="viewReport_Click"> 
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete Job">
                            <ItemTemplate>
                                <asp:LinkButton CssClass="flat-button  mx-auto my-10" ID="deleteJob" Text="Delete Job" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="deleteJob_Click"> 
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>

                <h3 class="text-center">Closed Jobs</h3>
                <asp:GridView ID="dgvClosedJobs" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="dgvJobs_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="title" HeaderText="Job Title" />
                    </Columns>
                </asp:GridView>
                <asp:LinkButton CssClass="flat-button  mx-auto my-10" ID="rejectUser" Text="Create Job" runat="server" OnClick="createJob_Click"> 
                </asp:LinkButton>





            </div>



        </main>
    </form>
</body>
</html>
