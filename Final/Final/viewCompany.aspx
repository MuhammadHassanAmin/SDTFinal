<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewCompany.aspx.cs" Inherits="Final.viewCompany" %>
<%@ Register Src="~/Includes/LinksUserControl.ascx" TagPrefix="uc1" TagName="LinksUserControl" %>
<%@ Register Src="~/Includes/NavUserControl.ascx" TagPrefix="uc1" TagName="NavUserControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:LinksUserControl runat="server" ID="LinksUserControl" />
    <title>Company Info</title>
   
</head>
<body>
    <uc1:NavUserControl runat="server" ID="NavUserControl" />
    <form id="form1" runat="server">
        <main class="mt-60">
        <div class="section-heading">
            <div class="vertically-align-center width-100p">
                <h3>My<span class="primary-color"> Company</span></h3>
                <span class="lines-png"></span>
            </div>
        </div>
         <div class="form-container">

            <span class="fas fa-sign-in-alt"></span>
                <div class="label-input-container">
                    <label>Company Name</label>
                    <asp:TextBox CssClass="txt-center" required="required"  ID="companyName" runat="server"></asp:TextBox>
                </div>
             <div class="label-input-container">
                    <label >About</label>
                    <asp:TextBox TextMode="MultiLine" CssClass="txt-center" required="required"  ID="AboutCompnay" runat="server"></asp:TextBox>
                </div>
                <div class="label-input-container">
                    <label>Founded Year</label>
                    <asp:TextBox  type="number" required="required"  CssClass="txt-center w-80p"  ID="foundedYear" runat="server"></asp:TextBox>
                </div>
              <div class="label-input-container">
                    <label >Address</label>
                    <asp:TextBox  required="required"  CssClass="txt-center w-80p"  ID="Address" runat="server"></asp:TextBox>
                </div>
                          <asp:Label ID="result" CssClass="result-msg primary-color" runat="server" Text=""></asp:Label>
           <asp:Button  CssClass="flat-button  mx-auto my-10"  ID="createCompany" runat="server" Text="Create Compnay" OnClick="createCopmany_Click" />
          
        </div>



    </main>
    </form>
</body>
</html>
