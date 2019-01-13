<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewApplications.aspx.cs" Inherits="Final.viewApplications" %>
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
                <h3 id="headingText" runat="server" class="text-center">Following Users Have Applied For this Job</h3>
                <asp:GridView ID="dgvApplications" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="Application Name" />
                        <asp:TemplateField HeaderText="View CV">
                            <ItemTemplate>
                                <asp:LinkButton CssClass="flat-button  mx-auto my-10" ID="viewCV" Text="View CV" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="viewCV_Click"> 
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Send Interview Call">
                            <ItemTemplate>
                                <asp:LinkButton CssClass="flat-button  mx-auto my-10" ID="sendCall" Text="Send Interview Call" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="sendCall_Click"> 
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                    </Columns>

                </asp:GridView>

                </asp:LinkButton>





            </div>



        </main>
    </form>
</body>
</html>
