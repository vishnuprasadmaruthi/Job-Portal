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
 <script> 

    window['adrum-start-time']= new Date().getTime(); 

</script> 

<script src="https://cdn.appdynamics.com/adrum/adrum-latest.js">
</script> 
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 2px solid #dddddd;
    text-align: center;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
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
            
            var req = {
                method: 'GET',
                url: base_url+'alltalent'
            };

            return $http(req).then(function (result) {
                
                return result.data;
            });
        }
};
}]);
  
app.controller('MainCtrl', ['$scope','uiGridConstants','MainService', function ($scope,uiGridConstants,MainService) {
$scope.users=[];


$scope.getAllTalent = function(){

	
	MainService.getServiceData().
	        then(function (data)
	    	         {
	          if(data.length == 0)
	          {
	           
	          }
	          $scope.users = data;
	            
	        });
	};

}]);

</script>
<head>
<title>All Talent Profiles</title>
</head>
<body>
<div class="generic-container">
<div class="panel panel-default">
<div class="panel-heading"><span class="lead">Job Seekers</span></div>
<div class="tablecontainer">
<table>
	<th></th>
	<th>Email</th>
	<th>Name</th>
	<th>Qualification</th>
	<th>Score in Graduation</th>
	<th>Primary Skill</th>
	<th>Contact</th>
	
	<c:forEach items="${registerUserInformationList}" var="registerUserInformation">
	<tr>	<td><a href="<c:url value='/view-seeker-${registerUserInformation.email}' />" class="btn btn-success custom-width">View</a></td>
			<td>${registerUserInformation.email}</td>
			<td>${registerUserInformation.firstname}</td>
			<td>${registerUserInformation.highesteduqual}</td>
			<td>${registerUserInformation.cgpgrad}</td>
			<td>${registerUserInformation.primaryskill}</td>
			<td>${registerUserInformation.contactnumber}</td>
			
       </tr>
	</c:forEach>
</table> 
 </div>
</div>
</div>
</div>
</body>
</html>