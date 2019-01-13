<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createCV.aspx.cs" Inherits="Final.createCV" %>
<%@ Register Src="~/Includes/LinksUserControl.ascx" TagPrefix="uc1" TagName="LinksUserControl" %>
<%@ Register Src="~/Includes/NavUserControl.ascx" TagPrefix="uc1" TagName="NavUserControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:LinksUserControl runat="server" ID="LinksUserControl" />
    <title>Create CV</title>
   
</head>
<body>
    <uc1:NavUserControl runat="server" ID="NavUserControl" />
    <form id="form1" runat="server">
        <main class="mt-60">
        <div class="section-heading">
            <div class="vertically-align-center width-100p">
                <h3>Create<span class="primary-color"> CV</span></h3>
                <span class="lines-png"></span>
            </div>
        </div>
         <div class="form-container">
             <label class="primary-color" runat="server" id="successMsg"></label>

            <span class="far fa-id-card"></span>
               <div class="label-input-container">
                    <label>Upload Display Picture</label>&nbsp;
                    <asp:FileUpload ID="dpUpload" runat="server" />
                </div>
               
                <div class="label-input-container">
                    <label>Full Name</label>&nbsp;
                    <asp:TextBox CssClass="txt-center" required="required"  ID="txtFullname" runat="server"></asp:TextBox>
                </div>
             <div class="label-input-container">
                    <label >Objectives</label>&nbsp;
                    <asp:TextBox TextMode="MultiLine" CssClass="txt-center" required="required"  ID="txtObjectives" runat="server"></asp:TextBox>
                </div>
                <div class="label-input-container">
                    <label >Academic details</label>&nbsp;
                    <asp:TextBox TextMode="MultiLine"  required="required"  CssClass="txt-center w-80p"  ID="txtAcademic" runat="server"></asp:TextBox>
                </div>
              <div class="label-input-container">
                    <label >Experience</label>&nbsp;
                    <asp:TextBox TextMode="MultiLine" required="required"  CssClass="txt-center w-80p"  ID="txtExperience" runat="server"></asp:TextBox>
                </div>
               <div class="label-input-container">
                    <label >Skills</label>&nbsp;
                    <asp:TextBox TextMode="MultiLine" required="required"  CssClass="txt-center w-80p"  ID="txtSkills" runat="server"></asp:TextBox>
                </div>
              <div class="label-input-container">
                    <label >Achievements</label>&nbsp;
                    <asp:TextBox TextMode="MultiLine" required="required"  CssClass="txt-center w-80p"  ID="txtAchievements" runat="server"></asp:TextBox>
                </div>
             <div class="label-input-container">
                    <label>Other Information</label>&nbsp;
                    <asp:TextBox TextMode="MultiLine" required="required"  CssClass="txt-center w-80p"  ID="txtOtherInfo" runat="server"></asp:TextBox>
                </div>
                &nbsp;<asp:Button  CssClass="flat-button  mx-auto my-10"  ID="btncreateCV" runat="server" Text="Create CV" OnClick="createCVSubmit_Click" />
        </div>



    </main>
    </form>
</body>
</html>
