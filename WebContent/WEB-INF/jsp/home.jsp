<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script> 
window["adrum-app-key"] = "AD-AAB-AAD-EMT";
    window['adrum-start-time']= new Date().getTime(); 

</script> 

<script src="https://cdn.appdynamics.com/adrum/adrum-latest.js"/>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>   
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
</head>
<script>
function showpasswordresetDiv(){

	document.getElementById('passreset').style.display = "block";
	document.getElementById('btnID').style.visibility='hidden';
	
}


</script>
<style>

.buttonLogin span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.buttonLogin span:after {
  content: '»';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.buttonLogin:hover span {
  padding-right: 25px;
}

.buttonLogin:hover span:after {
  opacity: 1;
  right: 0;
}



.buttonLogin {
    background-color: #6C3483      ; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

.button4Login {border-radius: 30px;}


</style>
<script type="text/javascript">

var app = angular.module('app', ['ngTouch','ngDialog','ui.bootstrap']);



app.factory('homePageService' , ['$rootScope' , '$http' , '$q' , '$location', function($rootScope,$http  , $q ,$location) 
{

	var x=localStorage.getItem("base_url_openshift");
	var x1=localStorage.getItem("base_url_localtomcat");
	var x2=localStorage.getItem("base_url_local");
	console.log(x);
	console.log(x1);
	console.log(x2);
	var base_url = x1;
	
return {
	
        updateDataToServer : function (body) {
            
            var req = {
                method: 'PUT',
                data : body ,
                url: base_url+'updateToCustomPassword'
            };

            return $http(req).then(function (result) {
                
                return result.data;
            });
        }
        
       
        
       
        
};
}]);
  

app.controller('homePageController', ['$scope','homePageService','ngDialog', function ($scope,homePageService,ngDialog) {

	


$scope.email="";
$scope.username="";
$scope.password="";
$scope.contactno="";
$scope.usertype="";
$scope.custompassword="";

$scope.userinfo = 
{
	"email":$scope.email,
	"username":$scope.username,
	"password":$scope.custompassword,
	"contactno":$scope.contactno,
	"usertype":$scope.usertype
	
		  
}
$scope.upDataToServer = function(updatedJsonStr){
	
	homePageService.updateDataToServer(updatedJsonStr).
	then(function (data) {
		
		$scope.usersInfo=data;
		
	      ngDialog.open({
	            template: '<div class="ngdialog-buttons"><label>Password updated Successfully<br/>Next time when you login use the password which you have reset.</label><button class="ngdialog-button ngdialog-button-primary" data-ng-click="closeThisDialog()">Ok</button></div>',
	            plain: true,
	            showclose: false
	          });
	      $scope.custompassword="";
	      document.getElementById('passreset').style.visibility = 'hidden';
	  	  
	     

	});

	};



$scope.resetPassword = function()
{
	
		 ngDialog.openConfirm({
	         template:
	             '<p>Are you sure you want to update the password ?</p>' +
	             '<div>' +
	               '<button type="button" class="btn btn-default" ng-click="closeThisDialog(0)">No&nbsp;' +
	               '<button type="button" class="btn btn-primary" ng-click="confirm(1)">Yes' +
	             '</button></div>',
	         plain: true,
	         className: 'ngdialog-theme-default'
	     }).then(function (value) {
	        
	    	
	        $scope.userinfo=
	        {		"email":$scope.email,
	        		"username":$scope.username,
	        		"password":$scope.custompassword,
	        		"contactno":$scope.contactno,
	        		"usertype":$scope.usertype
	         };
			$scope.updatedJsonStr = JSON.stringify($scope.userinfo);
	        $scope.upDataToServer($scope.updatedJsonStr);
	     }, function (value) {
	         console.log("down value"+value);
	     });




		
	
	

};

	 
}]);
</script>
<body ng-controller="homePageController">
<div class="jumbotron">
<div class="container text-center">
<div class="row">
<div class="col-md-6">
<div class="col-md-6">
</div>
</div>

<br/>
<div class="col-md-6">
<div>
<h4>Hi.. ${username}</h4>
 <br/>
 <sec:authorize ifAnyGranted="ROLE_JOB_SEEKER">
 <img src="/JobPortal-1.0.0/getUserImage" alt="profilepic" height="200" width="200"/>
 <br/><br/>
 <span>Welcome to the ConnectedIn Job portal.</span>
 We help you find the correct job<br/>
 Please update all the information correctly with contact details so that the job enablers can help you find the best job for you. 
 <br/>
 <!-- <font color="red"><b><u>Important</u></b></font>
 <br/> <br/>  <br/> <br/><br/> <br/> <br/> <br/>
<font color="black"><small>Make sure the session doesnot time out due to inactivity..If you are loggedin and idle for 40 minutes,the information saved may not be reflected in the portal,
so please make sure the session is active with your activity after login.</small></font>
<font color="green"><b>All the Best</b></font> -->
 </sec:authorize>
 <sec:authorize ifAnyGranted="ROLE_EMPLOYER">
 <br/><br/>
 <img src="<c:url value="/resources/images/jpuser.jpe"/>" alt="profilepic" height="100" width="100"/>
 <br/><br/>
 <span>Welcome to the ConnectedIn Job portal.</span>
 Job seekers are waiting for your new Job Post<br/>
 Please update all the information correctly with contact details so that the job seekers can contact you. 
 </sec:authorize>
</div>
</div>
<sec:authorize ifAnyGranted="ROLE_JOB_SEEKER">
<div style="float: right;" class="col-md-6">
<h3><a style="width:200px;" class="buttonLogin button4Login"   href="jobs"><span>ApplyForJob</span></a></h3>
</div>
</sec:authorize>
<sec:authorize ifAnyGranted="ROLE_EMPLOYER">
<div style="float: right;" class="col-md-6">
<h3><a style="width:200px;" class="buttonLogin button4Login"  href="viewjobspostedbyme"><span>UpdateJobs</span></a></h3>
</div>
</sec:authorize>
<sec:authorize ifAnyGranted="ROLE_EMPLOYER">
<div class="col-md-6">
<h3><a style="width:200px;" class="buttonLogin button4Login"  href="postjobs"><span>Post a Job</span></a></h3>
</div>
</sec:authorize>
<sec:authorize ifAnyGranted="ROLE_EMPLOYER">
</sec:authorize>
<sec:authorize ifAnyGranted="ROLE_EMPLOYER">
</sec:authorize>

<div class="col-md-6">
<h3><a style="width:200px;" class="buttonLogin button4Login"  href="postanupdatepage"><span>Post Update</span></a></h3>
</div>
<div class="col-md-6">
<h3><a style="width:200px;" class="buttonLogin button4Login"  href="resetpasswordpage"><span>Reset Password</span></a></h3>
</div>


</div>
</div>
</div>
</body>
</html>

