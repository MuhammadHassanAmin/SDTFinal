<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewCV.aspx.cs" Inherits="Final.viewCV" %>

<%@ Register Src="~/Includes/LinksUserControl.ascx" TagPrefix="uc1" TagName="LinksUserControl" %>
<%@ Register Src="~/Includes/NavUserControl.ascx" TagPrefix="uc1" TagName="NavUserControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:LinksUserControl runat="server" ID="LinksUserControl" />
    <title>View CV</title>

</head>
<body>
    <uc1:NavUserControl runat="server" ID="NavUserControl" />


    <form id="form1" runat="server">
        <main class="mt-60">
            <div class="section-heading">
                <div class="vertically-align-center width-100p">
                    <h3>View<span class="primary-color"> CV</span></h3>
                    <span class="lines-png"></span>
                </div>
            </div>
            <div class="form-container">
                <div class="label-input-container">
                    <img id="dp" src="" runat="server" alt="" />
                </div>


                <div class="label-input-container">
                    <label>Full Name</label>
                    <p class="m-0 p-0" runat="server" id="fullname"></p>
                </div>
                <div class="label-input-container">
                    <label>Objectives</label>
                    <p class="m-0 p-0" runat="server" id="Objectives"></p>
                </div>
                <div class="label-input-container">
                    <label>Academic details</label>
                    <p class="m-0 p-0" runat="server" id="Academic"></p>
                </div>
                <div class="label-input-container">
                    <label>Experience</label>
                    <p class="m-0 p-0" runat="server" id="Experience"></p>
                </div>
                <div class="label-input-container">
                    <label>Skills</label>
                    <p class="m-0 p-0" runat="server" id="Skills"></p>
                </div>
                <div class="label-input-container">
                    <label>Achievements</label>
                    <p class="m-0 p-0" runat="server" id="Achievements"></p>
                </div>
                <div class="label-input-container">
                    <label>Other Information</label>
                    <p class="m-0 p-0" runat="server" id="Other"></p>
                </div>

            </div>



        </main>
    </form>
</body>
</html>
