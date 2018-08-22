<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>   
<html ng-app="app">
<head>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular-touch.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular-animate.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.3.2/firebase.js"></script>
<script src="https://cdn.firebase.com/libs/angularfire/2.0.1/angularfire.min.js"></script>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Postanupdate</title>
<script>
  
    var app = angular.module('app', ['ngTouch','firebase']);
    app.factory('UserInfoService' , ['$rootScope' , '$http' , '$q' , '$location', function($rootScope,$http  , $q ,$location) 
                                     {
    	var x=localStorage.getItem("base_url_openshift");
    	var x1=localStorage.getItem("base_url_localtomcat");
    	var x2=localStorage.getItem("base_url_local");
    	console.log(x);
    	console.log(x1);
    	console.log(x2);
    	var base_url = x1;
                                     	
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
                                             }
                                            
                                            
                                            
                                             
                                             
                                     };
                                     }]);
    
    app.controller('MainCtrl', ['$rootScope','$firebaseArray','$scope','UserInfoService', function ($rootScope,$firebaseArray,$scope,UserInfoService) 

                                {
   $scope.url="";
   $scope.urlToUpload = "";
   $scope.hideUploadImageIconNow=false;
   $scope.showAfterPostingAnImage = true;
   $scope.postdetailsAtImage = "";
   localStorage.removeItem("Imageurl");
// Initialize Firebase
	
  var config = {
    apiKey: "AIzaSyDcyc3leYi6I3-yzxQmLPI-DPNThXB3-W4",
    authDomain: "jobportal-1227f.firebaseapp.com",
    databaseURL: "https://jobportal-1227f.firebaseio.com",
    storageBucket: "jobportal-1227f.appspot.com",
    messagingSenderId: "320740121440"
  };
  firebase.initializeApp(config);


	  var storage = firebase.storage();
	  var storageRef = storage.ref("folder_images_posts/");
	  
	  $scope.postTheMessageAtImage = function()
	  {
		if($scope.postdetailsAtImage==undefined || $scope.postdetailsAtImage=="" || $scope.postdetailsAtImage=="null" || $scope.postdetailsAtImage==null) 
		{
		//return;
		}
		else
		{
			var ref = firebase.database().ref().child("posts");
			 $scope.postPost= $firebaseArray(ref);
			 var date1 = new Date().toLocaleString();
			 $scope.currentTime= date1;
			  $scope.postPost.$add({
			    			    	postername:$scope.firstname,
			    			      	email: $scope.email ,
			    			      	date:  $scope.currentTime,
			    			      	postdetails: $scope.postdetailsAtImage,
			    			      	imageUrl:localStorage.getItem("Imageurl")
			    			    });
			  $scope.postdetailsAtImage="";
			  localStorage.removeItem("Imageurl");
			  console.log("**************************************************%%%%%%%%%%%%%%%%%%%%%%%%here"+localStorage.getItem("Imageurl"));
			  $scope.showAfterPostingAnImage = true;
			  $scope.hideUploadImageIconNow=false;
			  
			 
				  
		        
			  
			  
			  
	$scope.onLoadPageGetDataAssigned();
	
		}
}
 document.getElementById('Picture').onclick = function()
   {
       document.getElementById('fileButton').click();
   }
   


$scope.imageUpload = function(event){
         var files = event.target.files; //FileList object
         
         for (var i = 0; i < files.length; i++) {
             var file = files[i];
                 var reader = new FileReader();
                 reader.onload = $scope.imageIsLoaded; 
                 reader.readAsDataURL(file);
         }
}

$scope.imageIsLoaded = function(e){
        $scope.$apply(function() {
          $scope.urlToUpload=e.target.result;
          $scope.hideUploadImageIconNow=true;
          localStorage.setItem("Imageurl",$scope.urlToUpload);
           // $scope.stepsModel.push(e.target.result);
        });
 }

//From Here

var fileButton = document.getElementById("fileButton");

fileButton.addEventListener('change' , function(e){

  var file = e.target.files[0];
  
  var storageRef = firebase.storage().ref("folder_images_posts/"+file.name);
  var uploadTask = storageRef.put(file);




  uploadTask.on('state_changed', function(snapshot){
  // Observe state change events such as progress, pause, and resume
  // Get task progress, including the number of bytes uploaded and the total number of bytes to be uploaded
  var progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
  console.log('Upload is ' + progress + '% done');
  //uploader.value=progress;
  switch (snapshot.state) {
    case firebase.storage.TaskState.PAUSED: // or 'paused'
      console.log('Upload is paused');
      break;
    case firebase.storage.TaskState.RUNNING: // or 'running'
      console.log('Upload is running');
      break;
  }
}, function(error) {
  // Handle unsuccessful uploads
}, function() {
  // Handle successful uploads on complete
  // For instance, get the download URL: https://firebasestorage.googleapis.com/...
  var downloadURL = uploadTask.snapshot.downloadURL;
  $scope.hideUploadImageIconNow=true;
 
 localStorage.setItem("Imageurl", downloadURL);


  // localStorage.setItem("Imageurl", downloadURL);
 // console.log(localStorage.getItem("Imageurl"));


/* var ref = firebase.database().ref().child("posts");

var list = $firebaseArray(ref);
//console.log(list);
list.$loaded()
  .then(function(x) {
    x === list; // true
    var key = list.$keyAt(0);
    var rec = list.$getRecord(key); 
   // console.log(rec);
    if(list.length != 0)
    {



  $scope.contact=rec.contact;
  $scope.age=rec.age;
  $scope.gender=rec.gender;
  $scope.address=rec.address;
  $scope.usertype=rec.usertype;
  $scope.url=rec.imageUrl;

list.$remove(rec).then(function(ref) {
 // ref.key() === item.$id;  true
});

var date1 = new Date().toLocaleString();
$scope.currentTime= date1;

    $scope.profileinfo.$add({
    pname:$scope.pname,
    contact:$scope.contact,
    age:$scope.age,
    gender:$scope.gender,
    address:$scope.address,
    email: $scope.currentLoggedInEmail,
    date:  $scope.currentTime,
    imageUrl :downloadURL,
    visibilityhere:$scope.visibilityhere
    });
    }
  })
  .catch(function(error) {
    //console.log("Error:", error);
  }); */
});
});

//To Here

	  
    	  
     $scope.posts="";
  	 console.log("in controller..");
  	 $scope.post="";
  	 $scope.postedBy="";
  	 $scope.email = "";
     $scope.firstname="";
     $scope.contactnumber="";
	 $scope.jobdetails="";
     $scope.showUploadImage = false;
     $scope.hideShowImage = function(){
     $scope.showUploadImage = false;
	 }
     $scope.postShowImage = function(){
	 $scope.showUploadImage = true;
     }      
$scope.postTheMessage = function(){

if($scope.postdetails==undefined || $scope.postdetails=="" || $scope.postdetails=="null" || $scope.postdetails==null) 
{
return;
}
else
{
var ref = firebase.database().ref().child("posts");
$scope.postPost = $firebaseArray(ref);
var date1 = new Date().toLocaleString();
$scope.currentTime= date1;
 $scope.postPost.$add({
  			    	postername:$scope.firstname,
  			      	email: $scope.email ,
  			      	date:  $scope.currentTime,
  			      	postdetails: $scope.postdetails,
			      	imageUrl:"null"
  			     });
$scope.postdetails = "";
$scope.onLoadPageGetDataAssigned();
}
			/* var post = $scope.post;
  	        var postedBy = $scope.postedBy;
  	        var jsonstr = JSON.stringify({ 'post': post, 'postedBy': postedBy });
  	        stompClient.send("/app/addPost", {}, jsonstr);
  	     	$scope.post=""; */
  	  	 	//$scope.postedBy=""; 
};

$scope.onLoadPageGetDataAssigned = function(){


	var ref = firebase.database().ref().child("posts");
	var list = $firebaseArray(ref);
	
	list.$loaded()
		.then(function(x) {
		x === list; // true
		var key = list.$keyAt(0);
		var rec = list.$getRecord(key); 
		if(list.length != 0)
		{
		$scope.posts =list;
		}
		})
		.catch(function(error) {
		 console.log("Error:", error);
		});
	}
	

  			$scope.getLoggedInEmailAddress = function(){
  				
  				UserInfoService.getLoggedInEmailAddress().
  			    then(function (data)
  				 {
  			   	// console.log(JSON.stringify(data));
  			     
  			      $scope.email = data.data.username;
  			      $scope.firstname=data.data.firstname;
  			      $scope.contactnumber=data.data.contactnumber;
  			      $scope.postedBy=data.data.firstname; 
  			        
  			    });
  				
  			};
  			 $scope.getLoggedInEmailAddress();
  			$scope.onLoadPageGetDataAssigned();
  	 
    }]);

   
  </script>
</head>
<body ng-controller="MainCtrl">
<div ng-hide="showUploadImage" class="jumbotron">
<div class="container text-center">
<div class="row">
<div>
<div>
 <p class="new">
   <input placeholder="What's on your mind..?"   ng-show="showAfterPostingAnImage" ng-hide="showUploadImage" ng-model="postdetails" type="text" />
  	<button  class="btn btn-primary"  ng-show="showAfterPostingAnImage" ng-hide="showUploadImage" ng-click="postTheMessage()">Post</button><br/>
  	<b>+</b><button ng-show="showAfterPostingAnImage" class="glyphicon glyphicon-picture" ng-click="postShowImage()"></button>
  	
    </div>
   
  </p>
</div>
</div>
</div>
</div>
<br/>
<div ng-show="showUploadImage">
<button class="glyphicon glyphicon-hide" ng-hide="hideUploadImageIconNow" id="hideThis" ng-click="hideShowImage()">Hide</button>
<img id="Picture" ng-model="Picture" ng-hide="hideUploadImageIconNow" src="<c:url value="/resources/images/uploadimageicon.jpg"/>" alt="Upload ImageIcon" height="400" width="400"/>
<img  height="400" width="400"  ng-hide="showAfterPostingAnImage" ng-show="hideUploadImageIconNow" ng-src={{urlToUpload}} />

<input type='file' ng-hide="true" ng-model="fileButton" onchange="angular.element(this).scope().imageUpload(event)" id="fileButton" accept="image/*" />
<br/>
<input  placeholder="Your comments go here!"   ng-model="postdetailsAtImage" type="text" />
<button  class="btn btn-primary"  ng-click="postTheMessageAtImage()">Post</button><br/>
</div>
<br/>
<div class="tablecontainer">
<div ng-repeat = "post in posts | orderBy: 'date':true" class="jumbotron">
<div class="container text-center">
<div align="center">
<img  ng-hide="post.imageUrl==null || post.imageUrl=='null'" height="400" width="450"  ng-src={{post.imageUrl}} /></div><br/>
<div><font color="blue"><b>{{post.postdetails}}</b></font></div><br/><br/>
<div align="right"><small>{{post.email}}</small></div>
<div align="right"><small>{{post.postername}}</small></div>

</div>
</div>
<!-- <table>
<tr>
	
	<th>Date</th>
	<th>Email</th>
	<th>Postername</th>
	<th>Details</th>
</tr>
<tr ng-repeat = "post in posts track by $index">
	
     <td>{{post.date}}</td>
     <td>{{post.email}}</td>
      <td>{{post.postername}}</td>
      <td>{{post.jobdetails}}</td>
</tr>
</table>  -->
  
</head>


  
  
  
</body>
</html>