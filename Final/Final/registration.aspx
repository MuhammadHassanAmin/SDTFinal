<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="Final.registration" %>

<%@ Register Src="~/Includes/NavUserControl.ascx" TagPrefix="uc1" TagName="NavUserControl" %>
<%@ Register Src="~/Includes/LinksUserControl.ascx" TagPrefix="uc1" TagName="LinksUserControl" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:LinksUserControl runat="server" id="LinksUserControl" />
    <title>Registration</title>
   
</head>
<body>
    <uc1:NavUserControl runat="server" ID="NavUserControl" />
    <form id="form1" runat="server">
        <main class="mt-60">
        <div class="section-heading">
            <div class="vertically-align-center width-100p">
                <h3>Account <span class="primary-color">Registration</span></h3>
                <span class="lines-png"></span>
            </div>
        </div>
        <div class="form-container">
            <h4>Create an Account</h4>
            <span class="fas fa-sign-in-alt"></span>
                <div class="label-input-container">
                    <label >User Name:</label>&nbsp;
                    <asp:TextBox CssClass="txt-center" required="required"  ID="TextBox1" runat="server"></asp:TextBox>
                </div>
             <div class="label-input-container">
                    <label >Email:</label>&nbsp;
                    <asp:TextBox CssClass="txt-center" required="required"  ID="TextBox3" runat="server"></asp:TextBox>
                </div>
                <div class="label-input-container">
                    <label >Password:</label>&nbsp;
                    <asp:TextBox  TextMode="Password" required="required" type="password" CssClass="txt-center w-80p"  ID="TextBox2" runat="server"></asp:TextBox>
                </div>
             <div class="label-input-container">
                    <label >Type:</label>&nbsp;
                   <asp:RadioButton Cssclass="width-49p"    GroupName="accountSelection" ID="RadioButton_AccountType_Employee" Text="Employee" value="Employee" runat="server" />
                   <asp:RadioButton CssClass="width-49p"  GroupName="accountSelection" ID="RadioButton_AccountType_JobSeeker"  Text="JobSeeker"  value="JobSeeker" runat="server" />
                </div>
                                &nbsp;<asp:Button CssClass="flat-button  mx-auto my-10" ID="Button1" runat="server" Text="Register Now" OnClick="Button1_Click" />
        </div>



    </main>
    </form> 
</body>
</html>
