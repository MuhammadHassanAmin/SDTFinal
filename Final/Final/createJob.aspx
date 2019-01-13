<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createJob.aspx.cs" Inherits="Final.createJob" %>
<%@ Register Src="~/Includes/LinksUserControl.ascx" TagPrefix="uc1" TagName="LinksUserControl" %>
<%@ Register Src="~/Includes/NavUserControl.ascx" TagPrefix="uc1" TagName="NavUserControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:LinksUserControl runat="server" ID="LinksUserControl" />
    <title>Create Job</title>
   
</head>
<body>
    <uc1:NavUserControl runat="server" ID="NavUserControl" />
    <form id="form1" runat="server">
        <main class="mt-60">
        <div class="section-heading">
            <div class="vertically-align-center width-100p">
                <h3>Create<span class="primary-color"> Job</span></h3>
                <span class="lines-png"></span>
            </div>
        </div>
         <div class="form-container">
            <span class="fas fa-sign-in-alt"></span>
                <div class="label-input-container">
                    <label>Job Title</label>&nbsp;
                    <asp:TextBox CssClass="txt-center" required="required"  ID="txt_jobTitle" runat="server"></asp:TextBox>
                </div>
             <div class="label-input-container">
                    <label >Description</label>&nbsp;
                    <asp:TextBox TextMode="MultiLine" CssClass="txt-center" required="required"  ID="txtArea_jobDescription" runat="server"></asp:TextBox>
                </div>
                <div class="label-input-container">
                    <label >Skills Required</label>&nbsp;
                    <asp:TextBox TextMode="MultiLine"  required="required"  CssClass="txt-center w-80p"  ID="txt_Skills" runat="server"></asp:TextBox>
                </div>
              <div class="label-input-container">
                    <label >City</label>&nbsp;
                    <asp:TextBox  required="required"  CssClass="txt-center w-80p"  ID="txt_City" runat="server"></asp:TextBox>
                </div>
              <div class="label-input-container">
                    <label >Salary</label>&nbsp;
                  <input type="number"  id="txt_Salary" required="required" name="number" runat="server" value="" />
                </div>
               <div class="label-input-container">
                    <label >Experience Required</label>&nbsp;
                  <input type="number"  id="experienceRequired" required="required" name="number" runat="server" value="" />
                </div>
             &nbsp;<asp:Button  CssClass="flat-button  mx-auto my-10"  ID="createJobSubmit" runat="server" Text="Create Job" OnClick="createJobSubmit_Click" />
             <label class="primary-color" runat="server" id="successMsg"></label>
        </div>



    </main>
    </form>
</body>
</html>
