<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/jsp/includes.jsp"%> 
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

<script src="https://cdn.appdynamics.com/adrum/adrum-latest.js">
</script> 
<title>Resetpassword</title>
</head>
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
<body ng-controller="homePageController"> 
<script>
function showpasswordresetDiv(){

	document.getElementById('passreset').style.display = "block";
	document.getElementById('btnID').style.visibility='hidden';
	
}


</script>
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
	            template: '<div class="ngdialog-buttons"><label>Password updated Successfully<br/>Redirecting to Login page...</label><button class="ngdialog-button ngdialog-button-primary" data-ng-click="closeThisDialog()">Ok</button></div>',
	            plain: true,
	            showclose: false
	          });
	      $scope.custompassword="";
	      document.getElementById('passreset').style.visibility = 'hidden';
	      window.location = "login";
	  	  
	     

	});

	};



$scope.resetPassword = function()
{
	
		 ngDialog.openConfirm({
	         template:
	             '<p>Are you sure you want to update the password ?<br/>You will be redirected to Login page after this update...</p>' +
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
<div class="jumbotron">
<div class="container text-center"> 
<div class="col-md-6">
<div class="col-md-6">
 <input class="btn btn-success" type="button" id="btnID" value="Reset Password" onclick="showpasswordresetDiv()" />
<div  id="passreset"  style="display:none;"> 
*<input type="password" id="password" ng-model="custompassword"></input>
<input type="checkbox" onchange="document.getElementById('password').type = this.checked ? 'text' : 'password'"> Show password
<input  class="btn btn-primary" value="Reset" ng-click="resetPassword()" type="submit"></input>
</div>
</div>
</div>
</div>
</div>
</body>
</html>