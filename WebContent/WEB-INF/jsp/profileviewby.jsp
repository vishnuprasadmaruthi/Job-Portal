<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<title>MyProfile</title>
<html ng-app="app">
<head>
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
</head>
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
  <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.js"></script>
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
<script>

var app = angular.module('app', ['ngTouch', 'ui.grid' , 'ngDialog']);



app.factory('UserInfoService' , ['$rootScope' , '$http' , '$q' , '$location', function($rootScope,$http  , $q ,$location) 
{

	var x=localStorage.getItem("base_url_openshift");
	var x1=localStorage.getItem("base_url_localtomcat");
	var x2=localStorage.getItem("base_url_local");
	console.log(x);
	console.log(x1);
	console.log(x2);
	var base_url = x1;
	//var base_url = 'http://localhost:8080/JobPortal/';
//	var base_url='http' + '://' +$location.host()+'/'+'JobPortal-1.0.0/';////For the sake of openshift online...
	//var base_url='http' + '://' +$location.host()+':'+'8080'+'/'+'JobPortal-1.0.0/';////For the sake of local tomcat...
return {
	
        
        getLoggedInEmailAddress : function (body) {
           
            var req = {
                method: 'GET',
                data : body ,
                url: base_url+'getLoggedInMailAdd'
            };

            return $http(req).then(function (result) {
                
                return result;
            });
        },
        getLoggedInAccountDetails : function (body) {
            
            var req = {
                method: 'GET',
                data : body ,
                url: base_url+'regUserInfo'
            };

            return $http(req).then(function (result) {
                
                return result.data;
            });
        }
        
};
}]);
  

app.controller('UserInfoCtrl', ['$scope','UserInfoService','ngDialog', function ($scope,UserInfoService,ngDialog) {


/* $scope.usersInfo=[];
$scope.title="";
$scope.email="";
$scope.firstname="";
$scope.lastname="";
$scope.housenumber="";
$scope.street="";
$scope.city="";
$scope.country="";
$scope.postcode="";
$scope.nationality="";
$scope.contactnumber="";
$scope.highesteduqual="";
$scope.experience="";
$scope.primaryskill="";
$scope.interests="";
$scope.strengths="";
$scope.weaknesses="";
$scope.nativelanguage="";
$scope.intlangkn="";
$scope.aboutself=""; */




$scope.getLoggedInEmailAddress = function(){
	
	UserInfoService.getLoggedInEmailAddress().
    then(function (data)
	 {
   	/*  console.log(JSON.stringify(data)); */
      if(data.length == 0)
      {
    	 
      }
      
      $scope.email = data.data.username;
     
        
    });
	
};

$scope.getLoggedInAccountDetails = function()
{
	UserInfoService.getLoggedInAccountDetails().
	then(function(data){
	if(data.length == 0)
		{
		
		}
	else
		{
		
		/* console.log("------te---t--test"+JSON.stringify(data));
		console.log("title----------->"+data[0].title); */
		$scope.title=data[0].title;
		$scope.firstname=data[0].firstname;
		$scope.lastname = data[0].lastname;
		$scope.housenumber=data[0].housenumber;
		$scope.street=data[0].street;
		$scope.city=data[0].city;
		$scope.country=data[0].country;
		$scope.postcode=data[0].postcode;
		$scope.nationality=data[0].nationality;
		$scope.contactnumber=data[0].contactnumber;
		$scope.highesteduqual=data[0].highesteduqual;
		$scope.experience=data[0].experience;
		$scope.primaryskill=data[0].primaryskill;
		$scope.interests=data[0].interests;
		$scope.strengths=data[0].strengths;
		$scope.weaknesses=data[0].weaknesses;
		$scope.nativelanguage=	data[0].nativelanguage;
		$scope.intlangkn=data[0].intlangkn;
		$scope.aboutself=data[0].aboutself;

		$scope.specgrad=data[0].specgrad;
		$scope.gradfrom=data[0].gradfrom;
		$scope.gradyear=data[0].gradyear;
		$scope.cgpgrad=data[0].cgpgrad;
		$scope.specinter=data[0].specinter;
		$scope.interfrom=data[0].interfrom;
		$scope.interyear=data[0].interyear;
		$scope.cgpinter=data[0].cgpinter;
		$scope.specschool=data[0].specschool;
		$scope.schoolfrom=data[0].schoolfrom;
		$scope.schoolyear=data[0].schoolyear;
		$scope.cgpschool=data[0].cgpschool;
		$scope.certifications=data[0].certifications;
		$scope.recentemp=data[0].recentemp;
		$scope.lastdesig=data[0].lastdesig;
		$scope.lastdomain=data[0].lastdomain;
		$scope.lasttoolsused=data[0].lasttoolsused;
		$scope.lastresps=data[0].lastresps;
		$scope.currentctc=data[0].currentctc;
		$scope.expectedctc=data[0].expectedctc;
		$scope.achievements=data[0].achievements;
		$scope.expectedwork=data[0].expectedwork;


		
		
		$scope.successShow=true;


		}
	
	
		});
	
}



	
	$scope.getLoggedInEmailAddress(); 
	
	$scope.getLoggedInAccountDetails(); 
	 
}]);
</script>

<body ng-controller="UserInfoCtrl">

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Profile</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="mailUser">Mail {{firstname}}</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span>Like</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron">
  <div class="container text-center">
    <p><img src="/JobPortal-1.0.0/getUserImage" alt="profilepic" height="200" width="200"/></p>
  	<h4>{{aboutself}}</h4>
  </div>
</div>
  
<div class="container-fluid bg-3 text-center">
  <h5>About-<label><font face="times new roman">{{firstname}}</font></label></h5><br>
  <div class="row">
   <div class="col-md-6">
    <div class="jumbotron">
    <ul class="list-group">
  	<li class="list-group-item"><p><h5>My Full Name</h5></p><br/><span class="label label-default">{{firstname}} {{lastname}}</span></li>
	<li class="list-group-item"><h5>My Address</h5><br/><span class="label label-default">{{housenumber}}</span></li>
 	 <li class="list-group-item"><h5>My Address</h5><br/><span class="label label-default">{{street}}-{{city}}-{{country}}-{{postcode}}</span></li>
  	<li class="list-group-item"><h5>Email</h5><br/><span class="label label-default">{{email}}</span></li>
  	<li class="list-group-item"><h5>Mobile</h5><br/><span class="label label-default">{{contactnumber}}</span></li>
  	<li class="list-group-item"> <h5>Education</h5><br/><span class="label label-default">{{highesteduqual}}</span></li>
  	<li class="list-group-item"> <h5>Primary Skill</h5><br/><span class="label label-default">{{primaryskill}}</span></li>
  	<li class="list-group-item"><h5>My last Experience</h5><br/><span class="label label-default">{{experience}}</span>years</li>
  	<li class="list-group-item"><h5>Native Language</h5><br/><span class="label label-default">{{nativelanguage}}</span></li>
  	<li class="list-group-item"><h5>Other Languages</h5><br/><span class="label label-default">{{intlangkn}}</span></li>
   	<li class="list-group-item"><h5>I can win with</h5><br/><span class="label label-default">{{strengths}}</span></li>
 	 <li class="list-group-item"><h5>My challenge(s)</h5><br/><span class="label label-default">{{weaknesses}}</span></li>
 	</ul>
     </div>
      <div class="jumbotron">
    <ul class="list-group">
  		<li class="list-group-item"><h5>Certifications-<label> </label><span class="label label-default">{{certifications}}</span></h5></li>
 	</ul>
    </div>
    
    <div class="jumbotron">
    <ul class="list-group">
    <li class="list-group-item"><h5>Proud to be a(n)-<label> </label><span class="label label-default">{{nationality}}</span></h5></li>
  	
	</ul>
      </div>
    </div>
    <div class="col-md-6">
     <div class="jumbotron">
      <ul class="list-group">
  		<li class="list-group-item"><h5>Graduation</h5><br/><span class="label label-default">{{specgrad}}</span></li>
  		<li class="list-group-item"> <h5>From</h5><br/><span class="label label-default">{{gradfrom}}</span></li>
 		<li class="list-group-item"><h5>Year</h5><br/><span class="label label-default">{{gradyear}}</span></li>
  		<li class="list-group-item"><h5>Score</h5><br/></h5><span class="label label-default">{{cgpgrad}}</span></li>
  		<li class="list-group-item"><h5>Intermediate</h5><br/><span class="label label-default">{{specinter}}</span></li>
  		<li class="list-group-item"><h5>From</h5><br/><span class="label label-default">{{interfrom}}</span></li>
 		 <li class="list-group-item"><h5>Year</h5><br/><span class="label label-default">{{interyear}}</span></li>
 	 	<li class="list-group-item"><h5>Score</h5><br/><span class="label label-default">{{cgpinter}}</span></li>
 	 	<li class="list-group-item"><h5>Highschool</h5><br/><span class="label label-default">{{specschool}}</span></li>
  		<li class="list-group-item"><h5>From</h5><br/><span class="label label-default">{{schoolfrom}}</span></li>
  		<li class="list-group-item"><h5>Year</h5><br/><span class="label label-default">{{schoolyear}}</span></li>
  		<li class="list-group-item"><h5>Score</h5><br/></h5><span class="label label-default">{{cgpschool}}</span></li>
 		 </ul>
     </div>
    
   
    
    <div class="jumbotron">
    <ul class="list-group">
  		<ul class="list-group">
  		<li class="list-group-item"><h5>Recent Employer</h5><br/><label> </label><span class="label label-default">{{recentemp}}</span></li>
  		<li class="list-group-item"><h5>Achievements</h5><br/><span class="label label-default">{{achievements}}</span></li>
  		<li class="list-group-item"><h5>Last Designation</h5><br/><span class="label label-default">{{lastdesig}}</span></li>
  		<li class="list-group-item"><h5>Domain Worked in</h5><br/><span class="label label-default">{{lastdomain}}</span></li>
  		<li class="list-group-item"><h5>Tools/Technologies Used</h5><br/><span class="label label-default">{{lasttoolsused}}</span></li>
  		<li class="list-group-item"><h5>Responsibilities Served</h5><br/><span class="label label-default">{{lastresps}}</span></li>
  		<li class="list-group-item"><h5>Last CTC</h5><br/><span class="label label-default">{{currentctc}}</span></li>
  		<li class="list-group-item"><h5>Expected CTC</h5><br/><span class="label label-default">{{expectedctc}}</span></li>
</ul>
 	</ul>
    </div>
   
     

     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
    </div>
   </div>
   </div>
<footer class="container-fluid text-center">
  <p>I hereby promise that All the Information is correct.</p>
</footer>




</body>
</html>