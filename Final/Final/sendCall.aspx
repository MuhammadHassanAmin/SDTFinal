<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sendCall.aspx.cs" Inherits="Final.sendCall" %>

<%@ Register Src="~/Includes/NavUserControl.ascx" TagPrefix="uc1" TagName="NavUserControl" %>
<%@ Register Src="~/Includes/LinksUserControl.ascx" TagPrefix="uc1" TagName="LinksUserControl" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:LinksUserControl runat="server" id="LinksUserControl" />
    <title>Send Interview Call</title>
   
</head>
<body>
    <uc1:NavUserControl runat="server" ID="NavUserControl" />
    <form id="form1" runat="server">
        <main class="mt-60">
        <div class="section-heading">
            <div class="vertically-align-center width-100p">
                <h3>Send  <span class="primary-color">Interview Call</span></h3>
                <span class="lines-png"></span>
            </div>
        </div>
        <div class="form-container">
            <h4>Send a Email</h4>
            <span class="fas fa-sign-in-alt"></span>
                <div class="label-input-container">
                    <label>From:</label>
                    <input CssClass="txt-center" disabled="disabled" ID="emailFrom" runat="server" type="text" value="" />
                </div>
           
                <div class="label-input-container">
                    <label >Subject:</label>
                    <textarea id="body" runat="server" cols="20" rows="2"></textarea>
                </div>
            <p runat="server" id="successMessage" class="primary-color"></p>
          <asp:Button CssClass="flat-button  mx-auto my-10" ID="send" runat="server" Text="Send Call" OnClick="send_Click" />
        </div>



    </main>
    </form> 
</body>
</html>
