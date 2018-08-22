<%@ include file="/WEB-INF/jsp/includes.jsp"%> 
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<!--   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-83848321-1', 'auto');
  ga('send', 'pageview');

</script>
 -->

<script> 
window["adrum-app-key"] = "AD-AAB-AAD-EMT";
    window['adrum-start-time']= new Date().getTime(); 

</script> 

<script src="https://cdn.appdynamics.com/adrum/adrum-latest.js"/>
<style>
#currentLocation{

position: center;
}
.dropbtn {
    background-color: #4CAF50;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
    position: relative;
    display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

/* Links inside the dropdown */
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
    display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
    background-color: #3e8e41;
}
</style>
<nav class="navbar navbar-default">
<!-- <marquee behavior="alternate">
<small>
<p><b><font color="green">.</font></b></p>
</small>
</marquee> -->

        
        

        
        

        	<%--
			<h3><li><a class="glyphicon glyphicon-flag" title="About Connected In" href="about">Aboutus</a></li></h3>
			<sec:authorize access="isAuthenticated()">
			<h3><li><a class="glyphicon glyphicon-envelope" title="Suggest or Comment about Website" href="suggest">Mailus</a></li></h3>
   			</sec:authorize>
        	 <sec:authorize access="isAuthenticated()">
        	<h3><li><a class="glyphicon glyphicon-italic" title="Instructions" href="instructions">Guide</a></li></h3>
        	</sec:authorize> 
  			<sec:authorize access="isAuthenticated()">
			 	<h3><li><a class="glyphicon glyphicon-home" title="My Home" href="home">MyHome</a></li></h3>
   			</sec:authorize>
   			 <sec:authorize ifAnyGranted="ROLE_JOB_SEEKER">
        		<h3><li><a class="glyphicon glyphicon-hand-right" title="Details about me" href="account">MyProfileInformation</a></li></h3>
			</sec:authorize>
  			<sec:authorize ifAnyGranted="ROLE_JOB_SEEKER">
				<h3><li><a class="glyphicon glyphicon-list-alt" title="Manage my Profile" href="manageprofile">MyDocuments</a></li></h3>
   			</sec:authorize>
   			<sec:authorize ifAnyGranted="ROLE_JOB_SEEKER">
        		<h3><li><a class="glyphicon glyphicon-globe" title="Search for Jobs here" href="jobs">ApplyforJobs</a></li></h3>
			</sec:authorize>
			<sec:authorize ifAnyGranted="ROLE_JOB_SEEKER">
        		<h3><li><a class="glyphicon glyphicon-unchecked" title="Other Jobs" href="otherjobs">OtherJobs</a></li></h3>
			</sec:authorize> --%>
 

			
			
   			<%-- <sec:authorize access="isAuthenticated()">
			 		<h3><li><a class="glyphicon glyphicon-wrench" title="Reset your Password" href="resetpasswordpage">ResetPassword</a></li></h3>
   			</sec:authorize>
   			
         	<sec:authorize ifAnyGranted="ROLE_JOB_SEEKER">
				<h3><li><a class="glyphicon glyphicon-check" title="View my Profile as Others View it" href="viewby">ViewAs</a></li></h3>
   			</sec:authorize> 
          	
			
          	<sec:authorize ifAnyGranted="ROLE_EMPLOYER">
        		<h3><li><a class="glyphicon glyphicon-thumbs-up" title="Recruit Talent here" href="recruit">RecruitSeekers</a></li></h3>
			</sec:authorize>	
			<sec:authorize ifAnyGranted="ROLE_EMPLOYER">
        		<h3><li><a class="glyphicon glyphicon-share-alt" title="Recruit Talent here" href="postjobs">PostJobs</a></li></h3>
			</sec:authorize>	
			<sec:authorize ifAnyGranted="ROLE_EMPLOYER">
        		<h3><li><a class="glyphicon glyphicon-eye-open" title="View Jobs I Posted" href="viewjobspostedbyme">ViewJobsPostedByMe</a></li></h3>
			</sec:authorize>	
			 <sec:authorize access="isAuthenticated()">
			 		<h3><li><a class="glyphicon glyphicon-asterisk" title="Terms and Conditions" href="tc">T&C</a></li></h3>
   			</sec:authorize> --%>
         	
          	
   			<%-- <sec:authorize access="isAuthenticated()">
			<h3><li><a class="glyphicon glyphicon-send" title="Post an Update" href="postanupdatepage">PostAnUpdate</a></li></h3>
   			</sec:authorize>
   			<sec:authorize access="isAuthenticated()">
			 		<h3><li><a class="glyphicon glyphicon-bullhorn" title="Updates" href="showupdatespage">Updates</a></li></h3>
   			</sec:authorize> --%>
   			<%-- <sec:authorize ifAnyGranted="ROLE_JOB_SEEKER">
        		<h3><li><a class="glyphicon glyphicon-option-vertical" title="Saved Jobs" href="account">SavedJobs</a></li></h3>
			</sec:authorize> --%>
          	<%-- <sec:authorize access="isAuthenticated()">
			<h3><li style="float: right"><a class="glyphicon glyphicon-off" title="Log me Out" href="${pageContext.request.contextPath}/logout">Logout</a></li></h3>
   			</sec:authorize> 
   			
   			
   			
   			
    	
			
<ul class="w3-navbar w3-card-8 w3-light-grey">			
</ul>
--%>
<%-- 
<sec:authorize access="isAuthenticated()">
			 	<h3><a class="glyphicon glyphicon-home" title="My Home" href="home">MyHome</a></h3>
</sec:authorize> --%>
<sec:authorize ifAnyGranted="ROLE_JOB_SEEKER">
<div class="btn-group">
  <button type="button" class="btn btn-primary dropdown-toggle"" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="glyphicon glyphicon-user">Profile</span>
  </button>
  <div class="dropdown-menu">
<a class="dropdown-item" title="My Home" href="home"><span class="glyphicon glyphicon-start">Start-here</span></</a>
<a class="dropdown-item"   title="Details about me" href="account"><span class="glyphicon glyphicon-hand-right">MyProfileInformation</span></a>
<a class="dropdown-item"   title="Manage my Profile" href="manageprofile"><span class="glyphicon glyphicon-list-alt">MyDocuments</span></a>
<a class="dropdown-item"   title="View my Profile as Others View it" href="viewby"><span class="glyphicon glyphicon-check">ViewAs</span></a>


<!-- <a class="dropdown-item"   title="Reset your Password" href="resetpasswordpage"><span class="glyphicon glyphicon-wrench">ResetPassword</span></a> -->

</div>
</div>
 </sec:authorize>
 
 <sec:authorize ifAnyGranted="ROLE_JOB_SEEKER">
<div class="btn-group">
  <button type="button" class="btn btn-primary dropdown-toggle"" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="glyphicon glyphicon-spark">Jobs</span>
  </button>
  <div class="dropdown-menu">
 
<a class="dropdown-item"   title="Search for Jobs here" href="jobs"><span class="glyphicon glyphicon-globe">ApplyforJobs</span></a>
<a class="dropdown-item"   title="Other Jobs" href="otherjobs"><span class="glyphicon glyphicon-unchecked">OtherJobs</span></a>

</div>
</div>
 </sec:authorize>

<sec:authorize access="isAuthenticated()">
 <div  style="float: right" class="btn-group">
  <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="glyphicon glyphicon-misct">Other</span>
    
  </button>
 <div class="dropdown-menu">
 <a class="dropdown-item"   title="About Connected In" href="about"><span class="glyphicon glyphicon-flag">Aboutus</span></a>
 <br/>
<a class="dropdown-item"   title="Suggest or Comment about Website" href="suggest"><span class="glyphicon glyphicon-envelope">Mailus</span></a>
</div>
</div>
</sec:authorize>

 <sec:authorize ifAnyGranted="ROLE_EMPLOYER">
<div class="btn-group">
  <button type="button" class="btn btn-primary dropdown-toggle"" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="glyphicon glyphicon-home">Home</span>
  </button>
 <div class="dropdown-menu">
 <a class="dropdown-item" title="My Home" href="home"><span class="glyphicon glyphicon-start">Start-here</span></</a>
<a class="glyphicon glyphicon-thumbs-up" title="Recruit Talent here" href="recruit">RecruitSeekers</a>
<a class="glyphicon glyphicon-share-alt" title="Recruit Talent here" href="postjobs">PostJobs</a>
<a class="glyphicon glyphicon-eye-open" title="View Jobs I Posted" href="viewjobspostedbyme">ViewJobsPostedByMe</a>

<!-- <a class="glyphicon glyphicon-flag" title="About Connected In" href="about">Aboutus</a>
<a class="glyphicon glyphicon-envelope" title="Suggest or Comment about Website" href="suggest">Mailus</a> -->
</div>
</div>
 </sec:authorize>
  <sec:authorize access="isAuthenticated()">
 <div class="btn-group">
  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="glyphicon glyphicon-screenshot">Posts</span>
  </button>
 <div class="dropdown-menu">
  <a class="dropdown-item" title="Post an Update" href="postanupdatepage"><span class="glyphicon glyphicon-send"></span>New post</a>
</div>
</div>
</sec:authorize>
 <sec:authorize access="isAuthenticated()">
 <div  style="float: right" class="btn-group">
  <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="glyphicon glyphicon-reset">My-account</span>
    
  </button>
 <div class="dropdown-menu">
 <a class="glyphicon glyphicon-wrench" title="Reset your Password" href="resetpasswordpage">ResetPassword</a>
 <br/>
 <a class="glyphicon glyphicon-off" title="Log me Out" href="signout">Logout</a>
			<!-- <h3 style="float: right"><a class="glyphicon glyphicon-off" title="Log me Out" href="signout">Signout</a></h3> -->
</div>
</div>
</sec:authorize>





		<b><p align="center" id="currentLocation"></p></b>
</div>
</div>
</nav>
<script>

var locationPath = window.location.pathname;
var pathLength = locationPath.length;
var currentPage = locationPath.substring(17,pathLength).toUpperCase();

document.getElementById("currentLocation").innerHTML =
"/" + currentPage;
</script>