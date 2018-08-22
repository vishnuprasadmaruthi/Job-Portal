<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/jsp/includes.jsp"%> 
<html ng-app="app">
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

#myProgress {
  position: relative;
  width: 100%;
  height: 30px;
  background-color: #ddd;
}

#myBar {
  position: absolute;
  width: 1%;
  height: 100%;
  background-color: #4CAF50;
}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.3.2/firebase.js"></script>
<script src="https://cdn.firebase.com/libs/angularfire/2.0.1/angularfire.min.js"></script>
<script>

</script>
<!-- <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-83848321-1', 'auto');
  ga('send', 'pageview');

</script> -->
 <script> 
 window["adrum-app-key"] = "AD-AAB-AAD-EMT";
    window['adrum-start-time']= new Date().getTime(); 

</script> 

<script src="https://cdn.appdynamics.com/adrum/adrum-latest.js">
</script> 
<script>
function move() {
  var elem = document.getElementById("myBar");
  var width = 1;
  var id = setInterval(frame, 10);
  function frame() {
    if (width >= 100) {
      clearInterval(id);
    } else {
      width++;
      elem.style.width = width + '%';
    }
  }
}
</script>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular-touch.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular-animate.js"></script>
<script src="http://ui-grid.info/docs/grunt-scripts/csv.js"></script>
<script src="http://ui-grid.info/docs/grunt-scripts/pdfmake.js"></script>
<script src="http://ui-grid.info/docs/grunt-scripts/vfs_fonts.js"></script>
<script src="<c:url value="/resources/js/ngDialog.js" />"></script>
<link href="<c:url value="/resources/css/ngDialog.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/ngDialog-custom-width.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/ngDialog-theme-default.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/ngDialog-theme-plain.css" />" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-grid/3.2.6/ui-grid.js"></script>
<link rel="stylesheet" type="text/css" href=" https://cdnjs.cloudflare.com/ajax/libs/angular-ui-grid/3.2.6/ui-grid.css"/>
<script type="text/javascript">
var app = angular.module('app', ['ngTouch', 'ui.grid' , 'ngDialog','ui.bootstrap','firebase']);
app.controller('UserInfoCtrl', ['$firebaseArray','$scope','ngDialog', function ($firebaseArray,$scope,ngDialog) {
	var config = {
		    apiKey: "AIzaSyDfdIygV0b80evtDaQT7gOkGves52nVsRg",
		    authDomain: "eplus-37eb3.firebaseapp.com",
		    databaseURL: "https://eplus-37eb3.firebaseio.com",
		    storageBucket: "",
		    messagingSenderId: "706510000357"
		  };
		  firebase.initializeApp(config);

$scope.jobs = "";
$scope.onLoadPageGetChildren = function(){

	  

	var ref = firebase.database().ref().child("postjobs");

	var list = $firebaseArray(ref);

	list.$loaded()
	  .then(function(x) {
	    x === list; // true

	    for(var iter=0 ; iter < list.length ; iter++ )
	    {

	    var key = list.$keyAt(iter);
	    console.log("camehere"+key);
	    $scope.onLoadPageGetDataAssigned(key);
	  }
	 })
	  .catch(function(error) {
	  //  console.log("Error:", error);
	  });
	}












$scope.onLoadPageGetDataAssigned = function(){


var ref = firebase.database().ref().child("postjobs");
var list = $scope.profileinfo= $firebaseArray(ref);
console.log(list);
list.$loaded()
	.then(function(x) {
	x === list; // true
	var key = list.$keyAt(0);
	var rec = list.$getRecord(key); 
	$scope.enablername = rec.enablername;
	console.log(rec);
	if(list.length != 0)
	{
	$scope.jobs =list;
	console.log("--------------------------->"+$scope.jobs);
	
	}
	})
	.catch(function(error) {
	 console.log("Error:", error);
	});
}
$scope.onLoadPageGetDataAssigned();
//$scope.onLoadPageGetChildren();
}]);
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Other Job Information</title>
<%@ include file="/WEB-INF/jsp/includes.jsp"%> 
</head>
<body ng-controller="UserInfoCtrl">


 <div class="generic-container">
 <div class="panel panel-default">
<div class="panel-heading"><span class="lead"><u><b><font color="green">List of Other Jobs</font></b></u></span></div>
<div class="tablecontainer">
<table>
<tr>
	<th>Id</th>
	<th>Date</th>
	<th>Email</th>
	<th>Enablername</th>
	<th>Details</th>
</tr>
<tr ng-repeat = "job in jobs track by $index">
	<td>{{job.$id}}</td>
     <td>{{job.date}}</td>
     <td>{{job.email}}</td>
      <td>{{job.enablername}}</td>
      <td>{{job.jobdetails}}</td>
</tr>
</table> 
 </div>
</div>
</div>
</div>







</body>
</html>