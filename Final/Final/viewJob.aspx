<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewJob.aspx.cs" Inherits="Final.viewJob" %>
<%@ Register Src="~/Includes/LinksUserControl.ascx" TagPrefix="uc1" TagName="LinksUserControl" %>
<%@ Register Src="~/Includes/NavUserControl.ascx" TagPrefix="uc1" TagName="NavUserControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:LinksUserControl runat="server" ID="LinksUserControl" />
    <title>View Job</title>
   
</head>
<body>
    <uc1:NavUserControl runat="server" ID="NavUserControl" />
    <form id="form1" runat="server">
        <main class="mt-60">
        <div class="section-heading">
            <div class="vertically-align-center width-100p">
                <h3>View<span class="primary-color"> Job</span></h3>
                <span class="lines-png"></span>
            </div>
        </div>
         <div class="form-container">
             <label class="primary-color" runat="server" id="successMsg"></label>
            <span class="fas fa-sign-in-alt"></span>
                <div class="label-input-container">
                    <label>Job Title</label>
                     <p class="m-0 p-0" runat="server" id="title"></p>
                </div>
             <div class="label-input-container">
                    <label>Description</label>
                     <p class="m-0 p-0" runat="server" id="description"></p>
                </div>
                <div class="label-input-container">
                    <label >Skills Required</label>
                     <p class="m-0 p-0" runat="server" id="skills"></p>
                </div>
              <div class="label-input-container">
                    <label >City</label>
                     <p class="m-0 p-0" runat="server" id="city"></p>
                </div>
              <div class="label-input-container">
                    <label >Salary</label>
                     <p class="m-0 p-0" runat="server" id="salary"></p>
                </div>
               <div class="label-input-container">
                    <label >Experience Required</label>
                     <p class="m-0 p-0" runat="server" id="experience"></p>
                </div>
             <asp:Button  CssClass="flat-button  mx-auto my-10"  ID="applyNow" runat="server" Text="Apply Now" OnClick="applyNow_Click" />
        </div>



    </main>
    </form>
</body>
</html>
