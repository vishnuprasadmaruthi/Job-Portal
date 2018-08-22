<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/jsp/includes.jsp"%> 

<html>
<head>
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
 window["adrum-app-key"] = "AD-AAB-AAD-EMT";			
 window['adrum-start-time']= new Date().getTime(); 

</script> 

<script src="https://cdn.appdynamics.com/adrum/adrum-latest.js">
</script> 
<title>viewjobspostedbyme</title>
<style>
blink {
  -webkit-animation: blink 1s steps(5, start) infinite;
  -moz-animation:    blink 1s steps(5, start) infinite;
  -o-animation:      blink 1s steps(5, start) infinite; 
  animation:         blink 1s steps(5, start) infinite;
}

@-webkit-keyframes blink {
  to { visibility: hidden; }
}
@-moz-keyframes blink {
  to { visibility: hidden; }
}
@-o-keyframes blink {
  to { visibility: hidden; }
}
@keyframes blink {
  to { visibility: hidden; }
}

table {
  border-collapse: separate;
  border-spacing: 4px;
}
table,
th,
td {
  border: 1px solid #cecfd5;
}
th,
td {
  padding: 10px 15px;
}
</style>
</head>
<body>
<b>My Posted Jobs</b>
 <div class="generic-container">
        <div class="panel panel-default">
        <div class="panel-heading"><span class="lead">List of Jobs</span></div>
            <div class="tablecontainer">
               <font color="blue"><b>Please Delete outdated Jobs.</b></font>
             <table class="table table-hover" border="10">
    <th></th>       
	<th>Job ID</th>
	<th>Title</th>
	<th>Job Description</th>
	<th>Posted On</th>
	
	


	<c:forEach items="${registerUserJobsList}" var="registerUserJobs">
	
		<tr>
		<td><a href="<c:url value='/delete-job-${registerUserJobs.postedby}-${registerUserJobs.id}' />" class="btn btn-danger custom-width"><span class="glyphicon glyphicon-trash"></span>Delete</a></td>
			<td>${registerUserJobs.id}</td>
			<td>${registerUserJobs.title}</td>
			<td>${registerUserJobs.jobdescription}</td>
			<td>${registerUserJobs.postedon}</td>
			
            
			
			
		</tr>
	</c:forEach>
</table> 
 </div>
        </div>
            </div>
        </div>
</body>
</html>