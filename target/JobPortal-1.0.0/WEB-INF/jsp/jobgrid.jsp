<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
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
<title>Jobs Information</title>
<style>
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
<html ng-app="app">
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular-touch.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular-animate.js"></script>
<script src="http://ui-grid.info/docs/grunt-scripts/csv.js"></script>
<script src="http://ui-grid.info/docs/grunt-scripts/pdfmake.js"></script>
<script src="http://ui-grid.info/docs/grunt-scripts/vfs_fonts.js"></script>

<script type="text/javascript">

var app = angular.module('app', ['ngTouch']);

app.factory('MainService' , ['$rootScope' , '$http' , '$q' , '$location', function($rootScope,$http  , $q ,$location) 
{
	
	var x=localStorage.getItem("base_url_openshift");
	var x1=localStorage.getItem("base_url_localtomcat");
	var x2=localStorage.getItem("base_url_local");
	console.log(x);
	console.log(x1);
	console.log(x2);
	var base_url = x1;
	//var base_url = 'http://localhost:8080/JobPortal/';
	//var base_url='http' + '://' +$location.host()+'/'+'JobPortal-1.0.0/';////For the sake of openshift online...

	//var base_url='http' + '://' +$location.host()+':'+'8080'+'/'+'JobPortal-1.0.0/';////For the sake of local tomcat...
	
	return {
        getServiceData: function () {
        	console.log("in 2");
            
            var req = {
                method: 'GET',
                url: base_url+'allpostedjobs'
            };

            return $http(req).then(function (result) {
                
                return result.data;
            });
        }
};
}]);
  
app.controller('jobsCtrl', ['$scope','MainService', function ($scope,MainService) {
$scope.jobs=[];
$scope.searchByname = "";


$scope.getAllJobs = function(){
	 console.log("in 1");
	
	MainService.getServiceData().
	        then(function (data)
	    	         {
	          if(data.length == 0)
	          {
	           
	          }
	          $scope.jobs = data;
	          console.log("The data is.."+JSON.stringify($scope.jobs));
	            
	        });
	};

	$scope.getAllJobs();
}]);



</script>
<body>

<div ng-controller="jobsCtrl">
<label><b>Search:</b></label>
<input type="text" placeholder="Search Jobs here" ng-model="searchByname"></input>
<div class="generic-container">
<div class="panel panel-default">
<div class="panel-heading"><span class="lead">List of Jobs</span></div>
<div class="tablecontainer">
<table>
	<th></th> 
	<th>Title</th>
	<th>Job Description</th>
	<th>Organization</th>
	<th>Location</th>
	<th>Industry</th>
	<tr ng-repeat="jobsList in jobs | filter:searchByname">	
	<td><a href="<c:url value='/view-job-{{jobsList.id}}' />" class="btn btn-success custom-width">View</a></td>
			<td>{{jobsList.title}}</td>
			<td>{{jobsList.jobdescription}}</td>
			<td>{{jobsList.organization}}</td>
			<td>{{jobsList.joblocation}}</td>
			 <td>{{jobsList.industry}}</td>
			
       </tr>
	
	
</table> 
 </div>
</div>
</div>
</div>
</div>

<br/>
<br/>
 <%-- <div class="generic-container">
 <div class="panel panel-default">
<div class="panel-heading"><span class="lead">List of Jobs</span></div>
<div class="tablecontainer">
<table>
	<th></th>
	<th>Title</th>
	<th>Job Description</th>
	<th>Organization</th>
	<th>Location</th>
	<th>Industry</th>

	 <th>Functional Area</th> 
	<th>Key Skills Required</th>
	<th>Qualification Required</th>
	<th>Experience Required</th>
	<th>Salary</th>
	<th></th> 
	<c:forEach items="${registerUserJobsList}" var="registeredUserJob">
	<tr>	<td><a href="<c:url value='/view-job-${registeredUserJob.id}' />" class="btn btn-success custom-width">View</a></td>
			<td>${registeredUserJob.title}</td>
			<td>${registeredUserJob.jobdescription}</td>
			<td>${registeredUserJob.organization}</td>
			<td>${registeredUserJob.joblocation}</td>
			 <td>${registeredUserJob.industry}</td>
			 
			<td>${registeredUserJob.functionalarea}</td> 
			<td>${registeredUserJob.keyskillsrequired}</td>
			<td>${registeredUserJob.qualificationrequired}</td>
			<td>${registeredUserJob.experiencerequired}</td>
			<td>${registeredUserJob.salary}</td>
			<td><a href="<c:url value='/view-job-${registeredUserJob.id}' />" class="btn btn-success custom-width">Apply</a></td> 
       </tr>
	</c:forEach>
	
	
</table> 
 </div>
</div>
</div>
</div> --%>


</body>
</html>