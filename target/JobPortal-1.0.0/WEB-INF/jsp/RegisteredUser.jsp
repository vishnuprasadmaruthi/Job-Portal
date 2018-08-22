<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html ng-app="app">
<title>Registration Form</title>
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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular-touch.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular-animate.js"></script>
<script src="<c:url value="/resources/js/ngDialog.js" />"></script>
<link href="<c:url value="/resources/css/ngDialog.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/ngDialog-custom-width.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/ngDialog-theme-default.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/ngDialog-theme-plain.css" />" rel="stylesheet">
<!-- <style>
#loader {
  position: absolute;
  left: 50%;
  top: 50%;
  z-index: 1;
  width: 150px;
  height: 150px;
  margin: -75px 0 0 -75px;
  border: 16px solid gray;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 50px;
  height: 50px;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}


@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Add animation to "page content" */
.animate-bottom {
  position: relative;
  -webkit-animation-name: animatebottom;
  -webkit-animation-duration: 1s;
  animation-name: animatebottom;
  animation-duration: 1s
}

@-webkit-keyframes animatebottom {
  from { bottom:-100px; opacity:0 }
  to { bottom:0px; opacity:1 }
}

@keyframes animatebottom {
  from{ bottom:-100px; opacity:0 }
  to{ bottom:0; opacity:1 }
}

#myDiv {
  display: none;
  text-align: center;
}
</style> -->
<script>
var myVar;

function myFunction() {
    myVar = setTimeout(showPage, 3000);
}

function showPage() {
  document.getElementById("loader").style.display = "none";
  document.getElementById("myDiv").style.display = "block";
}
</script>
<script type="text/javascript">

  var app = angular.module('app', ['ngTouch']);
  
  app.controller('MainCtrl', ['$scope', function ($scope) {
	  $scope.users=[];
	  
		
	  
	 
  }]);
</script>
<head></head>
 <a href="home">Go to Home</a>
 <br/>
<body ng-controller="MainCtrl">
<!-- <div class="panel panel-info">
<div class="panel-heading"><a href="home">Go to Home</a></div>
 <div class="row">
 <div class="col-md-6"> -->
<form action="registerUser" name="registerForm"  method="POST" commandName="RegisteredUser" novalidate>
<div class="form-group" ng-class="{ 'has-error' : registerForm.email.$invalid && !registerForm.email.$pristine }">
<label>*User Email</label>
<input placeholder="Enter Valid Email address so that the Username and Password are sent to the email address" class="form-control"  type="email" ng-model="email" name="email" ng-required="true"/>
<p ng-show="registerForm.email.$invalid && !registerForm.email.$pristine" class="help-block">Enter a valid email.</p>
</div>
<div class="form-group" ng-class="{ 'has-error' : registerForm.username.$invalid && !registerForm.username.$pristine }">
<label>*First name</label>
<input placeholder="First name" name="username" class="form-control" ng-model="username" name="username" ng-minlength="4" ng-maxlength="15"  ng-required="true"/>
<p ng-show="registerForm.username.$error.minlength" class="help-block">Firstname is too short.</p>
<p ng-show="registerForm.username.$error.maxlength" class="help-block">Firstname is too long.</p>
</div>
<div class="form-group" ng-class="{ 'has-error' : registerForm.password.$invalid && !registerForm.password.$pristine }">
<label>*User Password</label>
<input type="password" placeholder="Secret Password" class="form-control" ng-model="password" id="password" name="password" ng-minlength="6" ng-maxlength="15" ng-required="true"/>
<input type="checkbox" onchange="document.getElementById('password').type = this.checked ? 'text' : 'password'"> Show password
<p ng-show="registerForm.password.$error.minlength" class="help-block">Password is too short.</p>
<p ng-show="registerForm.password.$error.maxlength" class="help-block">Password is too long.</p>
</div>
<div class="form-group" ng-class="{ 'has-error' : registerForm.contactno.$invalid && !registerForm.contactno.$pristine }">
<label>*User Contact</label>
<input placeholder="Contact number" class="form-control" ng-model="contactno" name="contactno" ng-minlength="10" ng-maxlength="13" ng-required="true"/>
<p ng-show="registerForm.contactno.$error.minlength" class="help-block">Enter correct Contactnumber.</p>
<p ng-show="registerForm.contactno.$error.maxlength" class="help-block">Contactnumber is too long.</p>
</div>
<div class="form-group">
<label>*I am</label>
<select class="form-control" name="usertype">
<option value="JOB_SEEKER">THE JOB SEEKER</option>
<option value="EMPLOYER">THE JOB ENABLER</option>
</select>
</div>
<div class="form-group">
<input class="btn btn-primary" ng-disabled="registerForm.$invalid" type="submit" name="action" value="Register" />
</div>
</form>
<!-- 	
</div>
</div>
</div> -->
</body>
<!-- <div class="col-md-6">
<body onload="myFunction()" style="margin:0;">
<div id="loader"></div>
<div style="display:none;" id="myDiv" class="animate-bottom">
<p align=center><u><b>NOTE:</b></u></p>

<p align="center"><b>1.)Use Valid Email Address for Registration.</b></p>
</br>
<p align="center"><b>2.)JOB SEEKER option for a job searcher.</b></p>
</div>
</div>
</body> -->
</html>