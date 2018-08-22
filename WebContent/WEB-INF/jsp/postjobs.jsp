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

<script src="https://cdn.appdynamics.com/adrum/adrum-latest.js">
</script> 
<%@ include file="/WEB-INF/jsp/includes.jsp"%> 
<title>Post a New JOB</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular-touch.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular-animate.js"></script>
<script src="<c:url value="/resources/js/ngDialog.js" />"></script>
<link href="<c:url value="/resources/css/ngDialog.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/ngDialog-custom-width.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/ngDialog-theme-default.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/ngDialog-theme-plain.css" />" rel="stylesheet">
</head>
<script type="text/javascript">

var app = angular.module('app', ['ngTouch','ngDialog','ui.bootstrap']);



app.factory('PostJobService' , ['$rootScope' , '$http' , '$q' , '$location', function($rootScope,$http  , $q ,$location) 
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
	
        createDataToServer : function (body) {
            console.log("here........."+body);
            var req = {
                method: 'POST',
                data : body ,
                url: base_url+'createJob'
            };

            return $http(req).then(function (result) {
                
                return result.data;
            });
        },
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
getUniquJobId: function (body) {
            
            var req = {
                method: 'GET',
                data : body ,
                url: base_url+'getNewJobId'
            };

            return $http(req).then(function (result) {
                
                return result;
            });
        }
        
        
        
};
}]);
  

app.controller('PostJobCtrl', ['$scope','PostJobService','ngDialog', function ($scope,PostJobService,ngDialog) {

	ngDialog.open({
        template: '<div class="ngdialog-buttons"><label>Posting a new Job makes us and the Job Seekers Happy<br/>Hearty Welcome<br/>Thank you.</label><button class="ngdialog-button ngdialog-button-primary" data-ng-click="closeThisDialog()">Ok</button></div>',
        plain: true,
        showclose: false
      });



	

$scope.usersInfo=[];
$scope.id="";
$scope.title="";
$scope.jobdescription="";
$scope.industry="";
$scope.functionalarea="";
$scope.experiencerequired="";
$scope.qualificationrequired="";
$scope.joblocation="";
$scope.organization="";
$scope.keyskillsrequired="";
$scope.postedby="";
$scope.postedon="";
$scope.vacancies="";
$scope.salary="";


$scope.userinfo = 
{
		  "id":$scope.id,
		  "title":$scope.title,
		  "jobdescription":$scope.jobdescription,
		  "industry":$scope.industry,
		  "functionalarea":$scope.functionalarea,
		  "experiencerequired":$scope.experiencerequired,
		  "qualificationrequired":$scope.qualificationrequired,
		  "joblocation":$scope.joblocation,
		  "organization":$scope.organization,
		  "keyskillsrequired":$scope.keyskillsrequired,
		  "postedby":$scope.postedby,
		  "postedon":$scope.postedon,
		  "vacancies":$scope.vacancies,
		  "salary":$scope.salary
		  

		


}
			

$scope.getLoggedInEmailAddress = function(){
	
	PostJobService.getLoggedInEmailAddress().
    then(function (data)
	 {
   	 console.log(JSON.stringify(data));
      if(data.length == 0)
      {
    	  
      }
      
      $scope.postedby = data.data.username;
      var d = new Date(); 
      var date = d.toString().replace(/\S+\s(\S+)\s(\d+)\s(\d+)\s.*/,'$2-$1-$3');
      $scope.postedon = date;
      
     
        
    });
	
};	

$scope.getUniquJobId = function(){
	
	PostJobService.getUniquJobId().
    then(function (data)
	 {
   	 console.log(JSON.stringify(data));
      if(data.length == 0)
      {
    	  
      }
      function randomInt(min, max) {
    	    return Math.round(min + Math.random()*(max-min));
    	}
      var number = randomInt(1, 100);
      
      $scope.id = data.data.jobId;
      
      $scope.id= $scope.id+number;
      
     
        
    });
	
};





$scope.upDataToServer = function(updatedJsonStr){
	console.log("3.!!!!!!!!!");
	PostJobService.createDataToServer(updatedJsonStr).
	then(function (data) {
		
		$scope.usersInfo=data;
		$scope.getLoggedInEmailAddress();
		
	      ngDialog.open({
	            template: '<div class="ngdialog-buttons"><label>Data Successfully Inserted</label><button class="ngdialog-button ngdialog-button-primary" data-ng-click="closeThisDialog()">Ok</button></div>',
	            plain: true,
	            showclose: false
	          });
	      $scope.title="";
	      $scope.jobdescription="";
	      $scope.industry="";
	      $scope.functionalarea="";
	      $scope.experiencerequired="";
	      $scope.qualificationrequired="";
	      $scope.joblocation="";
	      $scope.organization="";
	      $scope.keyskillsrequired="";
	      $scope.postedby="";
	      $scope.postedon="";
	      $scope.vacancies="";
	      $scope.salary="";
	                
	      
		      

	});

	};
$scope.vacanciess=['1','3','5','7','9','10','20','50','100','>100'];
$scope.currentctcs=['1lakhs to 3lakhs','3lakhs to 5lakhs','5lakhs to 6lakhs','6lakhs to 9lakhs','9lakhs to 12lakhs','12lakhs to 15lakhs','>15lakhs'];
$scope.highesteduquals=['B-TECH','BE','BSC','MSC','PHD','INTERMEDIATE','M-TECH','BCOM','MCOM','BBA','MBA','DOCTORATE','OTHER GRADUATE','OTHER POSTGRADUATE','TENTH'];
$scope.experiences=['1','2','3','4','5','6','7','8','9','10','11','12','13','>13'];
$scope.states = ['kurnool,Andhra Pradesh', 'hyderabad,Telangana', 'bangalore,Karnataka', 'vizag,Andhra Pradesh', 'kadapa,Andhra Pradesh',
                 'Vijayawada,Andhra Pradesh', 'Rajahmundry,Andhra Pradesh','Agra,Uttar Pradesh','Kanpur,Uttar Pradesh','Bhopal,Madhya Prradesh',
                 'Chennai,Tamil Nadu','Coimbattore,Tamil Nadu','MTV Puram,Tamil Nadu','Kerala','Gujarat','J&K','Rajasthan','Delhi,NCR','Noida,NCR','Gurgaon,NCR','Pune','Abroad'];
$scope.saveAccInfo = function()
{
	
	if($scope.title==""|| $scope.jobdescription==""|| $scope.industry==""|| $scope.functionalarea==""||$scope.experiencerequired==""||
	$scope.qualificationrequired==""||
	$scope.joblocation==""||
	$scope.organization==""||
	$scope.keyskillsrequired==""||
	$scope.postedby==""||
	$scope.postedon==""||
	$scope.vacancies==""||
	$scope.salary=="")
		{
		
		console.log("test111");
		
		//return;
		}
	else
	{
		console.log("test111222");
		 ngDialog.openConfirm({
	         template:
	             '<p>Are you sure you want to save the information ?<br/>The information provided is locked to save,once saved cannot be edited,if you want to edit any information click No and Edit and then proceed to save.</p>' +
	             '<div>' +
	               '<button type="button" class="btn btn-default" ng-click="closeThisDialog(0)">No&nbsp;' +
	               '<button type="button" class="btn btn-primary" ng-click="confirm(1)">Yes' +
	             '</button></div>',
	         plain: true,
	         className: 'ngdialog-theme-default'
	     }).then(function (value) {
	        
	    	
	    	 $scope.userinfo = 
	    	 {
	    	 		  "id":$scope.id,
	    	 		  "title":$scope.title,
	    	 		  "jobdescription":$scope.jobdescription,
	    	 		  "industry":$scope.industry,
	    	 		  "functionalarea":$scope.functionalarea,
	    	 		  "experiencerequired":$scope.experiencerequired,
	    	 		  "qualificationrequired":$scope.qualificationrequired,
	    	 		  "joblocation":$scope.joblocation,
	    	 		  "organization":$scope.organization,
	    	 		  "keyskillsrequired":$scope.keyskillsrequired,
	    	 		  "postedby":$scope.postedby,
	    	 		  "postedon":$scope.postedon,
	    	 		  "vacancies":$scope.vacancies,
	    	 		  "salary":$scope.salary
	    	 		  

	    	 		


	    	 }; 
	    	//{"id":985,"title":"SOFTWAREENGINEER","jobdescription":"HANDS ON CODING ON JAVA","industry":"IT","functionalarea":"CM","experiencerequired":"8","qualificationrequired":"BTECH","joblocation":"BANGALORE","organization":"GOLDMAN","keyskillsrequired":"JAVA","postedby":"dhanatontanahal@gmail.com","postedon":"31-Jul-2016","salary":"98745","vacancies":9};
	    	//,{"id":986,"title":"QA","jobdescription":"SELENIUM","industry":"IT","functionalarea":"IB","experiencerequired":"4","qualificationrequired":"BE","joblocation":"HYDERABAD","organization":"JPM","keyskillsrequired":"JAVA","postedby":"dhanatontanahal@gmail.com","postedon":"31-Jul-2016","salary":"56412","vacancies":6}



	    	 
	
			console.log("2.........");
	        $scope.updatedJsonStr = JSON.stringify($scope.userinfo);
	        $scope.upDataToServer($scope.updatedJsonStr);
	     }, function (value) {
	         console.log("down value"+value);
	     });




		
	}
	

};

$scope.getLoggedInEmailAddress();
$scope.getUniquJobId();
	 
}]);
</script>
<body ng-controller="PostJobCtrl">
<b><u>Post a New Job Here</u></b>
<form  method="POST" name="jobForm" novalidate> 
<div class="col-md-6">
<h3><a class="btn btn-primary"  href="viewjobspostedbyme">ViewJobsPostedByMe>></a></h3>
</div>
<div class="row">
<div class="col-md-6">
<div class="form-group">
<input placeholder="ID"  class="form-control" ng-model="id" type="text" disabled></input>
</div>
<div class="form-group" ng-class="{ 'has-error' : jobForm.title.$invalid && !jobForm.title.$pristine }">
*<input placeholder="Job Title"  name="title" class="form-control" ng-model="title" type="text"  ng-minlength="5" ng-maxlength="25"  ng-required="true"></input>
<p ng-show="jobForm.title.$error.minlength" class="help-block">Title is too short.</p>
<p ng-show="jobForm.title.$error.maxlength" class="help-block">Title is too long.</p>
</div>
<div class="form-group" ng-class="{ 'has-error' : jobForm.jobdescription.$invalid && !jobForm.jobdescription.$pristine }">
*<input placeholder="Job Description Keep it Short and Simple as much possible" name="jobdescription"  class="form-control" ng-model="jobdescription"  type="text" ng-minlength="15" ng-maxlength="100"  ng-required="true"></input>
<p ng-show="jobForm.jobdescription.$error.minlength" class="help-block">Jobdescription is too short.</p>
<p ng-show="jobForm.jobdescription.$error.maxlength" class="help-block">Jobdescription is too long.</p>
</div>
<div class="form-group" ng-class="{ 'has-error' : jobForm.industry.$invalid && !jobForm.industry.$pristine }">
*<input placeholder="Industry of the Job"  name="industry" class="form-control" ng-model="industry"  type="text" ng-minlength="10" ng-maxlength="20"  ng-required="true"></input>
<p ng-show="jobForm.industry.$error.minlength" class="help-block">Industry name is too short.</p>
<p ng-show="jobForm.industry.$error.maxlength" class="help-block">Industry name is too long.</p>
</div>
<div class="form-group" ng-class="{ 'has-error' : jobForm.functionalarea.$invalid && !jobForm.functionalarea.$pristine }">
*<input placeholder="Functional Area of the Job"  name="functionalarea" class="form-control" ng-model="functionalarea"  type="text" ng-minlength="5" ng-maxlength="20"  ng-required="true"></input>
<p ng-show="jobForm.functionalarea.$error.minlength" class="help-block">Functionalarea name is too short.</p>
<p ng-show="jobForm.functionalarea.$error.maxlength" class="help-block">Functionalarea name is too long.</p>
</div>
<div class="form-group" ng-class="{ 'has-error' : jobForm.experiencerequired.$invalid && !jobForm.experiencerequired.$pristine }">
*<input placeholder="Experience Required in Years"  name="experiencerequired" class="form-control" typeahead="experiencerequired for experiencerequired in experiences | filter:$viewValue"" ng-model="experiencerequired"  type="text" ng-minlength="1" ng-maxlength="2"  ng-required="true"></input>
<p ng-show="jobForm.experiencerequired.$error.minlength" class="help-block">Experience year number starts from 0.</p>
<p ng-show="jobForm.experiencerequired.$error.maxlength" class="help-block">Experience year number seems too high.</p>
</div>
<div class="form-group">
*<input placeholder="Qualification Required"  class="form-control"  typeahead="qualificationrequired for qualificationrequired in highesteduquals | filter:$viewValue" ng-model="qualificationrequired"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Job Location"  class="form-control"   typeahead="joblocation for joblocation in states | filter:$viewValue" ng-model="joblocation"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Name of the Organization"  class="form-control" ng-model="organization"  type="text"  ng-required="true"></input>
</div>
<div class="form-group" ng-class="{ 'has-error' : jobForm.keyskillsrequired.$invalid && !jobForm.keyskillsrequired.$pristine }">
*<input placeholder="Primary Key Skills Required Any two"  class="form-control"  name="keyskillsrequired" ng-model="keyskillsrequired" type="text" ng-minlength="10" ng-maxlength="100"  ng-required="true"></input>
<p ng-show="jobForm.keyskillsrequired.$error.minlength" class="help-block">Skill information too less.</p>
<p ng-show="jobForm.keyskillsrequired.$error.maxlength" class="help-block">Skill information more than enough.</p>
</div>
<div class="form-group">
*<input placeholder="Posted By"  class="form-control" ng-model="postedby"  type="text" disabled></input>
</div>
<div class="form-group">
*<input placeholder="Posted On"  class="form-control"  ng-model="postedon"  type="text" disabled></input>
</div>
<div class="form-group">
*<input placeholder="Number of Vacancies of the Job"  typeahead="vacancies for vacancies in vacanciess | filter:$viewValue"  class="form-control"  ng-model="vacancies"  type="text" required></input>
</div>
<div class="form-group" >
*<input placeholder="Salary in INR per Annum"  class="form-control"  typeahead="salary for salary in currentctcs | filter:$viewValue""  ng-model="salary"  type="text" ng-required="true"></input>
</div>

<div class="form-group">
<button  class="btn btn-primary" type="submit" ng-disabled="jobForm.$invalid" ng-click="saveAccInfo()" >SAVE JOB</button>
</div>

</div>
</div>
</form>

</body>
</html>