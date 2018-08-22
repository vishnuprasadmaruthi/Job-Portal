<%@ include file="/WEB-INF/jsp/includes.jsp"%> 
<div class="menulinks">
<%-- <img src="<c:url value="/resources/images/eplus.png"/>" alt="EPLUS-CONNECTEDIN" height="90" width="140"/> --%>
<sec:authorize access="isAuthenticated()">
	<p><a title="My Home" href="home"><b>Home</b></a></p>
</sec:authorize>
<sec:authorize ifAnyGranted="ROLE_JOB_SEEKER">
        	<p><a title="My Account Details" href="account"><b>Your Account</b></a></p> 
</sec:authorize>
<sec:authorize ifAnyGranted="ROLE_JOB_SEEKER">
	<p><a title="Manage My Profile" href="manageprofile"><b>Manage Documents</b></a></p>
</sec:authorize>
<sec:authorize ifAnyGranted="ROLE_JOB_SEEKER">
	<p><a title="View my Profile as others view it" href="viewby"><b>Profile ViewBy</b></a></p>
</sec:authorize>

<%-- <sec:authorize ifAnyGranted="ROLE_JOB_SEEKER">
        	<p><a title="My Saved Jobs|Recruiters" href="savedlistings">Saved listings</a></p>
</sec:authorize> --%>

<sec:authorize ifAnyGranted="ROLE_JOB_SEEKER">
        	<p><a title="Search for Jobs here" href="jobs"><b>Search Jobs</b></a></p>
</sec:authorize>
<sec:authorize ifAnyGranted="ROLE_JOB_SEEKER">
        		<p><a  title="Other Jobs" href="otherjobs"><b>OtherJobs</b></a></p>
			</sec:authorize>
<sec:authorize ifAnyGranted="ROLE_EMPLOYER">
        <p><a title="Recruit Talent here" href="recruit"><b>Recruit</b></a></p>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<p><a title="Terms and Conditions" href="tc"><b>T&C</b></a></p>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<p><a title="About ConnectedIn" href="about"><b>About</b></a></p>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
	<p><a title="Resetpassword" href="resetpasswordpage"><b>Reset password</b></a></p>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<p><a title="Post an Update" href="postanupdatepage"><b>Post an Update</b></a></p>
</sec:authorize>

<%-- <sec:authorize access="isAuthenticated()">
	<p><a title="Show Updates" href="showupdatespage">Show Updates</a></p>
</sec:authorize>
 --%>
<sec:authorize access="isAuthenticated()">
	<a title="Log me out"  href=" ${pageContext.request.contextPath}/logout"><b>Logout</b></a>
</sec:authorize>
			

</div>