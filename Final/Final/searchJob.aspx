<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="searchJob.aspx.cs" Inherits="Final.searchJob" %>

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
                    <h3>Search<span class="primary-color"> Job</span></h3>
                    <span class="lines-png"></span>
                </div>
            </div>


            <div class="form-container">
                <h4>Welcome <%:Session["uname"]%> </h4>
                <h4>Search Job</h4>
                <span class="fas fa-search"></span>
                <div class="label-input-container">
                    <input class="txt-center" runat="server" placeholder="Search Jobs" id="SearchJobs" type="text" />
                    <asp:DropDownList ID="dropDownSearchBy" runat="server" OnSelectedIndexChanged="dropDownSearchBy_SelectedIndexChanged">
                        <asp:ListItem Enabled="true" Text="Search By" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="City" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Skills" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Salary" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Experience" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button CssClass="flat-button  mx-auto my-10" ID="Search" runat="server" Text="Search" OnClick="btnSearch_Click" />
                </div>
                <div id="searchResult" runat="server">
                    <h3 runat="server" id="dgvLable"></h3>
                    <asp:GridView ID="DGVsearchResult" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="DGVsearchResult_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="title" HeaderText="Name" />
                            <asp:BoundField DataField="description" HeaderText="Description" />
                            <asp:BoundField DataField="skills" HeaderText="Required Skills" />
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

            </div>



        </main>
    </form>
</body>
</html>
