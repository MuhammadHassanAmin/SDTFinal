<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Final.Login" %>

<%@ Register Src="~/Includes/LinksUserControl.ascx" TagPrefix="uc1" TagName="LinksUserControl" %>
<%@ Register Src="~/Includes/NavUserControl.ascx" TagPrefix="uc1" TagName="NavUserControl" %>




<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:LinksUserControl runat="server" ID="LinksUserControl" />
    <title>Login</title>
   
</head>
<body>
    <uc1:NavUserControl runat="server" ID="NavUserControl" />
    <form id="form1" runat="server">
        <main class="mt-60">
        <div class="section-heading">
            <div class="vertically-align-center width-100p">
                <h3>Account <span class="primary-color">Login</span></h3>
                <span class="lines-png"></span>
            </div>
        </div>
        <div class="form-container">
            <h4>Login To Your Account</h4>
            <span class="fas fa-sign-in-alt"></span>
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
                   <asp:RadioButton Cssclass="width-49p" GroupName="accountSelection" ID="RadioButton_AccountType_Employee" Text="Employee" value="Employee" runat="server" />
                   <asp:RadioButton CssClass="width-49p" GroupName="accountSelection" ID="RadioButton_AccountType_JobSeeker"  Text="JobSeeker"  value="JobSeeker" runat="server" />
                </div>
            <asp:Label ID="errorMsg" runat="server" Text=""></asp:Label>
                <asp:Button  CssClass="flat-button  mx-auto my-10"  ID="Button2" runat="server" Text="Login" OnClick="Button2_Click" />
        </div>

    </main>
    </form>
</body>
</html>
