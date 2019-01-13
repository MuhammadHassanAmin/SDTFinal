<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ownerDashboard.aspx.cs" Inherits="Final.Dashboard" %>
<%@ Register Src="~/Includes/LinksUserControl.ascx" TagPrefix="uc1" TagName="LinksUserControl" %>
<%@ Register Src="~/Includes/NavUserControl.ascx" TagPrefix="uc1" TagName="NavUserControl" %>
<%@ Register Src="~/Includes/isLoggedIn.ascx" TagPrefix="uc1" TagName="isLoggedIn" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:LinksUserControl runat="server" ID="LinksUserControl" />
    <title>Dashboard</title>
   
</head>
<body>
    <uc1:isLoggedIn runat="server" ID="isLoggedIn" />
    <uc1:NavUserControl runat="server" ID="NavUserControl" />
    <form id="form1" runat="server">
        <main class="mt-60">
        <div class="section-heading">
            <div class="vertically-align-center width-100p">
                <h3>User<span class="primary-color"> Dashboard</span></h3>
                <span class="lines-png"></span>
            </div>
        </div>
        <div class="form-container">
            <h4>Welcome <%:Session["uname"]%> </h4>

            <asp:GridView ID="dgvNewUsers" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="dgvNewUsers_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField  DataField="name" HeaderText="Name"/>
                    <asp:BoundField  DataField="email" HeaderText="Email"/>

                   
                   <asp:TemplateField HeaderText="Approve Account">
                       <ItemTemplate>
                          <asp:LinkButton CssClass="flat-button  mx-auto my-10" ID="approveUser"  text="Approve User" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="approveUser_Click"> 
                          </asp:LinkButton>
                       </ItemTemplate>
                        
                   </asp:TemplateField>
                      <asp:TemplateField HeaderText="Reject Account">
                          <ItemTemplate>
                          <asp:LinkButton CssClass="flat-button  mx-auto my-10" ID="rejectUser"  text="Reject User" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="rejectUser_Click"> 
                          </asp:LinkButton>
                       </ItemTemplate>
                   </asp:TemplateField>
                </Columns>
                    
            </asp:GridView>
            <asp:GridView ID="dgvApprovedUseres" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField  DataField="name" HeaderText="Name"/>
                    <asp:BoundField  DataField="email" HeaderText="Email"/>

                   <asp:TemplateField HeaderText="BlackList Account">
                       <ItemTemplate>
                          <asp:LinkButton CssClass="flat-button  mx-auto my-10" ID="blackListUser"  text="BlackList User" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="blackListUser_Click"> 
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
