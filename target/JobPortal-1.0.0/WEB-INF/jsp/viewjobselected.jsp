<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/jsp/includes.jsp"%> 
<script src="<c:url value="/resources/js/myApp.js" />"></script> 
<!-- <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-83848321-1', 'auto');
  ga('send', 'pageview');

</script> -->

<html ng-app="app">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script> 

    window['adrum-start-time']= new Date().getTime(); 

</script> 

<script src="https://cdn.appdynamics.com/adrum/adrum-latest.js">
</script> 
<title>View Job selected</title>
</head>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular-touch.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular-animate.js"></script>
<script src="http://ui-grid.info/docs/grunt-scripts/csv.js"></script>
<script src="http://ui-grid.info/docs/grunt-scripts/pdfmake.js"></script>
<script src="http://ui-grid.info/docs/grunt-scripts/vfs_fonts.js"></script>
<script src="<c:url value="/resources/js/ngDialog.js" />"></script>
<script src="<c:url value="/resources/js/spin.js" />"></script> 
<script src="<c:url value="/resources/js/angular-spinner.js" />"></script> 
<link href="<c:url value="/resources/css/ngDialog.css" />" rel="stylesheet">

<link href="<c:url value="/resources/css/ngDialog-custom-width.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/ngDialog-theme-default.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/ngDialog-theme-plain.css" />" rel="stylesheet">

<script type="text/javascript">

var app = angular.module('app', ['ngTouch','ngDialog','ui.bootstrap','angularSpinner']);



app.factory('ViewJobService' , ['$rootScope' , '$http' , '$q' , '$location', function($rootScope,$http  , $q ,$location) 
{
	var x=localStorage.getItem("base_url_openshift");
	var x1=localStorage.getItem("base_url_localtomcat");
	var x2=localStorage.getItem("base_url_local");
	console.log(x);
	console.log(x1);
	console.log(x2);
	var base_url = x1;
	//var base_url='http' + '://' +$location.host()+'/'+'JobPortal-1.0.0/';////For the sake of openshift online...
//var base_url='http' + '://' +$location.host()+':'+'8080'+'/'+'JobPortal-1.0.0/';////For the sake of local tomcat...
return {
	
	 
        
};
}]);
  

app.controller('ViewJobCtrl', ['$scope','ViewJobService','ngDialog', function ($scope,UserInfoService,ngDialog) {
	$scope.hideSpinner = true;
	
	ngDialog.open({
        template: '<div class="ngdialog-buttons"><label>An Email will be Sent to Job Enabler Once you click Apply.<br/>Make sure you donot apply twice for the same Job.</label><button class="ngdialog-button ngdialog-button-primary" data-ng-click="closeThisDialog()">Ok</button></div>',
        plain: true,
        showclose: false
      });

	
	 
}]);
</script>
<body ng-controller="ViewJobCtrl">
<div ng-hide="hideSpinner">
	<span us-spinner="{radius:25, width:8, length: 16}"></span>
  	<span us-spinner="{radius:25, width:8, length: 16}"></span>
  	<span us-spinner="{radius:25, width:8, length: 16}"></span>
</div>
<a href="jobs" class="btn btn-primary">Back</a>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="jumbotron">
  	<div class="container text-center">
  	<ul class="list-group">
  	<a  href="<c:url value='/apply-job-${selectedJob.id}' />" class="btn btn-success custom-width">Apply</a>
  		<li class="list-group-item"><h5>Job ID</h5><br/><span class="label label-default">${selectedJob.id}</span></li>
  		<li class="list-group-item"> <h5>Job Title</h5><br/><span class="label label-default">${selectedJob.title}</span></li>
 		<li class="list-group-item"><h5>Job Description</h5><br/><span class="label label-default">${selectedJob.jobdescription}</span></li>
  		<li class="list-group-item"> <h5>Job Location</h5><br/><span class="label label-default">${selectedJob.joblocation}</span></li>
  		<li class="list-group-item"><h5>Organization</h5><br/><span class="label label-default">${selectedJob.organization}</span></li>
  		<li class="list-group-item"> <h5>Salary</h5><br/><span class="label label-default">${selectedJob.salary}/- INR</span></li>
  		<li class="list-group-item"><h5>Key Skills Required</h5><br/><span class="label label-default">${selectedJob.keyskillsrequired}</span></li>
  		<li class="list-group-item"> <h5>Qualification</h5><br/><span class="label label-default">${selectedJob.qualificationrequired} and equivalent</span></li>
  		<li class="list-group-item"><h5>Industry</h5><br/><span class="label label-default">${selectedJob.industry}</span></li>
  		<li class="list-group-item"> <h5>Functional Area</h5><br/><span class="label label-default">${selectedJob.functionalarea}</span></li>
 		 </ul>
  	
  </div>
  <div class="jumbotron">
  	<div class="container text-center">
  	<ul class="list-group">
  		<%-- <li class="list-group-item"><h5>Posted By-<span class="label label-default">${selectedJob.postedby}</span></h5></li> --%>
  		<li class="list-group-item"><h5>Posted On-<span class="label label-default">${selectedJob.postedon}</span></h5></li>
  		<li class="list-group-item"><h5>Number of Vacancies-<span class="label label-default">${selectedJob.vacancies}</span></h5></li>
 		 </ul>
  	
  </div>
</div>
</div>
</nav>



</body>
</html>