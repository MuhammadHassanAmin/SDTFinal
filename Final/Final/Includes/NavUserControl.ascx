<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavUserControl.ascx.cs" Inherits="Final.NavUserControl" %>
<header>
    
    <a href=" http://hassanamin.website/web3ds/index.php">
        <h1>Job<span class="primary-color">Portal</span></h1>
    </a>
    <nav>
        <input type="checkbox" id="nav-links">
        <label for="nav-links"></label>
        <ul>
            <li> <a href="http://hassanamin.website/web3ds/index.php"><span class="fas fa-home"></span> Home</a></li>
              <%--Employee Links Start--%>
            <li runat="server" id="createJobLink"><a href="createJob.aspx"><span class="fas fa-clipboard-list"></span> Create Job</a></li>
            <%--Job Seeker Links Start--%>
            <li runat="server" id="searchJobLink"><a href="searchJob.aspx"><span class="fas fa-search"></span> Search Job</a></li>
            <li runat="server" id="createCVLink"><a href="createCV.aspx"><span class="far fa-id-card"></span> Create CV</a></li>
            <li runat="server" id="downloadCVLink"><a href="downloadCV.aspx"><span class="fas fa-file-download"></span> Download CV</a></li>
            <li runat="server" id="viewApplicationsLink"><a href="viewApplications.aspx"><span class="fas fa-file-invoice"></span> View Applications</a></li>

            <%--Global Links--%>
            <li runat="server"  id="dashboardLi"><a  runat="server"  id="dashboardLink" href=""><span class="fas fa-clipboard-list"></span> Dashboard</a></li>
            <li runat="server"  id="hideIfLoggedin"><a runat="server" id="regstrationLink" href="~/registration.aspx"><span class="fas fa-user-plus"></span> <span runat="server" id="regstrationText">Registration</span></a></li>
            <li><a runat="server" id="loginLink" href="~/login.aspx"><span class="fas fa-key"></span> <span runat="server" id="loginText">Login</span></a></li> 
        </ul>
    </nav>
</header>