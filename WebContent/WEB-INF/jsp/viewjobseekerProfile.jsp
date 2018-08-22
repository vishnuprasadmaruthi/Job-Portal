<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/jsp/includes.jsp"%> 
<html>
<head>
 <style>
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
<!-- <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-83848321-1', 'auto');
  ga('send', 'pageview');

</script> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script> 

    window['adrum-start-time']= new Date().getTime(); 

</script> 

<script src="https://cdn.appdynamics.com/adrum/adrum-latest.js">
</script> 
<title>Job Seeker</title>
</head>
<body>

<!-- <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="jumbotron">
  	<div class="container text-center">
  	<ul class="list-group"> -->
  	
  	
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <li><a href="recruit" class="navbar-brand">Back</a> <li>
      <!-- <a class="navbar-brand" href="#">Profile</a> -->
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      
        <li class="active"><a href="#">Home</a></li>
        <%-- <li><a href="mailUser">Mail ${selectedJobSeeker.firstname}</a></li> --%>
          <%-- <label align="center">${selectedJobSeeker.firstname}</label> --%>
         
      </ul>
      <ul class="nav navbar-nav navbar-right">
       <!--  <li><a href="#"><span class="glyphicon glyphicon-log-in"></span>Like</a></li> -->
       <li><a  href="<c:url value='/show-interest-${selectedJobSeeker.email}' />" class="navbar-brand">Ping by Email</a> <li>
      </ul>
    </div>
  </div>
</nav>

<%-- <div class="jumbotron">
  <div class="container text-center">
    <!-- <p><img src="/JobPortal-1.0.0/getUserImage" alt="profilepic" height="200" width="200"/></p> -->
    <p><img src="<c:url value="/resources/images/jpuser.jpe"/>" alt="profilepic" height="200" width="200"/></p>
  	<h4>${selectedJobSeeker.aboutself}</h4>
  </div>
</div> --%>
  
<div class="container-fluid bg-3 text-center">
  <h5><label><font face="times new roman">${selectedJobSeeker.firstname}</font></label></h5><br>
  <div class="row">
   <div class="col-md-6">
    <div class="jumbotron">
    <ul class="list-group">
  	<li class="list-group-item"><p><h5><b>My Full Name</b></h5></p><br/><span class="label label-default">${selectedJobSeeker.firstname} ${selectedJobSeeker.lastname}</span></li>
	<li class="list-group-item"><h5><b>House number</b></h5></p><br/><span class="label label-default">${selectedJobSeeker.housenumber}</span></li>
 	 <li class="list-group-item"><h5><b>My Address</b></h5></p><br/><span class="label label-default">${selectedJobSeeker.street}-${selectedJobSeeker.city}-${selectedJobSeeker.country}-${selectedJobSeeker.postcode}</span></li>
  	<li class="list-group-item"><p align="left"><h5><b>Email</b></h5></p><br/><span class="label label-default">${selectedJobSeeker.email}</span></li>
  	<li class="list-group-item"><p align="left"><h5><b>Mobile</b></h5></p><br/><span class="label label-default">${selectedJobSeeker.contactnumber}</span></li>
  	<li class="list-group-item"> <h5><b>Education</b></h5></p><br/><span class="label label-default">${selectedJobSeeker.highesteduqual}</span></li>
  	<li class="list-group-item"> <h5><b>Primary Skill</b></h5></p><br/><span class="label label-default">${selectedJobSeeker.primaryskill}</span></li>
  	<li class="list-group-item"><h5><b>My last Experience</b></h5></p><br/><span class="label label-default">${selectedJobSeeker.experience}</span>years</li>
  	<li class="list-group-item"><h5><b> Language</b></h5></p><br/><label> </label><span class="label label-default">${selectedJobSeeker.nativelanguage}</span></li>
  	<li class="list-group-item"><h5><b>Other Languages</b></h5></p><br/><label> </label><span class="label label-default">${selectedJobSeeker.intlangkn}</span></li>
   	<li class="list-group-item"><h5><b>I can win with</b></h5></p><br/><label> </label><span class="label label-default">${selectedJobSeeker.strengths}</span></li>
 	 <li class="list-group-item"><h5><b>My challenge(s)</b></h5></p><br/><label><span class="label label-default">${selectedJobSeeker.weaknesses}</span></li>
 	</ul>
     </div>
      <div class="jumbotron">
    <ul class="list-group">
  		<li class="list-group-item"><h5>Certifications-<label> </label><span class="label label-default">${selectedJobSeeker.certifications}</span></h5></li>
 	</ul>
    </div>
    
    <div class="jumbotron">
    <ul class="list-group">
    <li class="list-group-item"><h5>Proud to be a(n)-<label> </label><span class="label label-default">${selectedJobSeeker.nationality}</span></h5></li>
  	
	</ul>
      </div>
    </div>
    <div class="col-md-6">
     <div class="jumbotron">
      <ul class="list-group">
  		<li class="list-group-item"><h5><b>Graduation</b></h5><br/><span class="label label-default">${selectedJobSeeker.specgrad}</span></li>
  		<li class="list-group-item"><h5><b>From</b></h5><br/><span class="label label-default">${selectedJobSeeker.gradfrom}</span></li>
 		<li class="list-group-item"><h5><b>Year</b></h5><br/><span class="label label-default">${selectedJobSeeker.gradyear}</span></li>
  		<li class="list-group-item"><h5><b>Score</b></h5><br/><span class="label label-default">${selectedJobSeeker.cgpgrad}</span></li>
  		<li class="list-group-item"><h5><b>Intermediate</b></h5><br/><span class="label label-default">${selectedJobSeeker.specinter}</span></li>
  		<li class="list-group-item"><h5><b>From</b></h5><br/><span class="label label-default">${selectedJobSeeker.interfrom}</span></li>
 		 <li class="list-group-item"><h5><b>Year</b></h5><br/><span class="label label-default">${selectedJobSeeker.interyear}</span></li>
 	 	<li class="list-group-item"><h5><b>Score</b></h5><br/><span class="label label-default">${selectedJobSeeker.cgpinter}</span></li>
 	 	<li class="list-group-item"><h5><b>Highschool</b></h5><br/><span class="label label-default">${selectedJobSeeker.specschool}</span></li>
  		<li class="list-group-item"><h5><b>From</b></h5><br/><span class="label label-default">${selectedJobSeeker.schoolfrom}</span></li>
  		<li class="list-group-item"><h5><b>Year</b></h5><br/><span class="label label-default">${selectedJobSeeker.schoolyear}</span></li>
  		<li class="list-group-item"><h5><b>Score</b></h5><br/><span class="label label-default">${selectedJobSeeker.cgpschool}</span></li>
 		 </ul>
     </div>
    
   
    
    <div class="jumbotron">
    <ul class="list-group">
  		<ul class="list-group">
  		<li class="list-group-item"><h5><b>Recent Employer</b></h5><br/><span class="label label-default">${selectedJobSeeker.recentemp}</span></li>
  		<li class="list-group-item"><h5><b>Achievements</b></h5><br/><span class="label label-default">${selectedJobSeeker.achievements}</span></li>
  		<li class="list-group-item"><h5><b>Last Designation</b></h5><br/><span class="label label-default">${selectedJobSeeker.lastdesig}</span></li>
  		<li class="list-group-item"><h5><b>Domain Worked in</b></h5><br/><span class="label label-default">${selectedJobSeeker.lastdomain}</span></li>
  		<li class="list-group-item"><h5><b>Tools/Technologies Used</b></h5><br/><span class="label label-default">${selectedJobSeeker.lasttoolsused}</span></li>
  		<li class="list-group-item"><h5><b>Responsibilities Served</b></h5><br/><span class="label label-default">${selectedJobSeeker.lastresps}</span></li>
  		<li class="list-group-item"><h5><b>Last CTC</b></h5><br/><span class="label label-default">${selectedJobSeeker.currentctc}</span></li>
  		<li class="list-group-item"><h5><b>Expected CTC</b></h5><br/><span class="label label-default">${selectedJobSeeker.expectedctc}</span></li>
</ul>
 	</ul>
    </div>
    </div>
   </div>
   </div>
<footer class="container-fluid text-center">
  <p>I hereby promise that All the Information is correct.</p>
</footer>



  	
  	
  		<%-- <li class="list-group-item"><h5>Name-<span class="label label-default">${selectedJobSeeker.firstname}</span></h5></li>
  		<li class="list-group-item"> <h5>Currently Living in-<span class="label label-default">${selectedJobSeeker.city}</span></h5></li>
 		<li class="list-group-item"><h5>Qualification-<span class="label label-default">${selectedJobSeeker.highesteduqual}</span></h5></li>
  		<li class="list-group-item"> <h5>Specialization-<span class="label label-default">${selectedJobSeeker.specgrad}</span></h5></li>
  		<li class="list-group-item"><h5>Graduation Year-<span class="label label-default">${selectedJobSeeker.gradyear}</span></h5></li>
  		
  		<li class="list-group-item"><h5>Certifications-<span class="label label-default">${selectedJobSeeker.certifications}</span></h5></li>
  		<li class="list-group-item"> <h5>International Languages Known-<span class="label label-default">${selectedJobSeeker.intlangkn}</span></h5></li>
 		 </ul>
  	
  </div>
  <div class="jumbotron">
  	<div class="container text-center">
  	<ul class="list-group">
  		<li class="list-group-item"><h5>Posted By-<span class="label label-default">${selectedJob.postedby}</span></h5></li>
  		<li class="list-group-item"><h5>Expected Work-<span class="label label-default">${selectedJobSeeker.expectedwork}</span></h5></li>
  		<li class="list-group-item"><h5>Expected CTC-<span class="label label-default">${selectedJobSeeker.expectedctc}</span></h5></li>
 		 </ul> --%>
  	

 Documents Uploaded for -<label>${selectedJobSeeker.firstname}</label>
 <div class="generic-container">
        <div class="panel panel-default">
        <div class="panel-heading"><span class="lead">List of Documents </span></div>
            <div class="tablecontainer">
                
             <table class="table table-hover" border="10">
	<th>ID</th>
	<th>FILE NAME</th>
	<th>DESCRIPTION</th>
	<th>DOWNLOAD</th>
	


	<c:forEach items="${registeredUserDocumentList}" var="registeredUserDocument">
	
		<tr>
			<td>${registeredUserDocument.id}</td>
			<td>${registeredUserDocument.filename}</td>
			<td>${registeredUserDocument.description}</td>
			<td><a href="<c:url value='/download-document-${registeredUserDocument.email}-${registeredUserDocument.id}' />" class="btn btn-success custom-width"><span class="glyphicon glyphicon-download"></span>download</a></td>
            
			
			
		</tr>
	</c:forEach>
</table> 
 </div>
        </div>
            </div>
        </div>

  </div>
</div>
</div>

</nav>
</body>
</html>