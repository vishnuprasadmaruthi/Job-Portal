<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="/WEB-INF/jsp/includes.jsp"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
    background-color: #E0E3D8       ; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 4px 2px;
    cursor: pointer;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

.button4Login {border-radius: 30px;}


</style>
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
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script>
function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail());
	  
	}
function showinstructionsDiv(){

	document.getElementById('instructionsDiv').style.display = "block";
	document.getElementById('instructionsbtnID').style.visibility='hidden';
	
}

function showLoginDiv(){

	document.getElementById('loginDiv').style.display = "block";
	document.getElementById('loginbtnID').style.visibility='hidden';
	
}

var myVar;

function myFunction() {
    myVar = setTimeout(showPage, 3000);
}

function showPage() {
  document.getElementById("loader").style.display = "none";
  document.getElementById("myDiv").style.display = "block";
}

</script>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<meta name="google-signin-client_id" content="288775328779-o3tm9bk54d88h69rdu3344a195g001ap.apps.googleusercontent.com">
<title class="">Login</title>
<style>
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
#my_form
{
background-color: transparent;
}
</style>

</head>
<body background="<c:url value="/resources/images/bge.jpg"/>">
<input class="btn btn primary" type="button" id="loginbtnID" value="Click Here to Login" onclick="showLoginDiv()" >
<!-- <div class="g-signin2" data-onsuccess="onSignIn"></div> -->
<div  id="loginDiv"  style="display:none;"> 

<div id="my_form" class="panel panel-info">
<div class="panel-heading"><a class="glyphicon glyphicon-lock" href="#"><span><b>Login</b></span></a></div>
 <div class="row">
 <div class="col-md-6">
<form id="my_form" role="form" action="j_spring_security_check" method="POST">
<div class="form-group">
<label for="username">*Username:</label>
<input placeholder="Please Enter Registered Email address"  class="form-control" type="text" name="j_username" required/>
</div>
<div class="form-group">
<label for="password">*Password:</label>
<input placeholder="Please Enter the Password sent to registered Email Inbox" class="form-control" type="password" id="password" name="j_password" required/>
<input type="checkbox" onchange="document.getElementById('password').type = this.checked ? 'text' : 'password'"><b> Show password</b>
</div> 
<div class="form-group">
<label for="rememberme">Remember Me?</label>
<input  type="checkbox" name="_spring_security_remember_me" value="true" />
</div>
<div class="form-group">
<font color="black"><input value="Login" class="buttonLogin button4Login" type="submit"/></font>
<!-- <a   class="buttonLogin button4Login"><span><font color="green"><b>Login</b></font></span> -->
<br/><br/>
<br/><br/>
<a class="buttonLogin button4Login" href="register"><font color="black"><span>Register</span></font></a><font color="red"><b>|</b></font><a class="buttonLogin button4Login" href="forgotpassword"><font color="black"><span>Forgot Password</span></font></a>
<br/>
<font color="red">
<span>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</span>
</font>
</div>
</div>
</div>
</form>

</div>
</div>

<!-- <div class="col-md-6">
<body onload="myFunction()" style="margin:0;">
<br/><br/><br/></br><br/></br>
<div id="loader"></div>
<input class="btn btn-success" type="button" id="instructionsbtnID" value="For Instructions Click Here" onclick="showinstructionsDiv()" />
<div  id="instructionsDiv"  style="display:none;"> 
<div style="display:none;" id="myDiv" class="animate-bottom">
<p align=left><u><b>NOTE:</b></u></p>
<b>
<p align="left">1.)Use Register Link to Register if you are visiting us for the first time.</p>
<p align="left">2.)Use Forgot Password Link to get your new password.</p>
<p align="left">3.)The Email registered is spelling sensitive.</p>
<p align="left">4.)gmail.com and googlemail.com are to be explicitly used while logging in.i.e if you have registered with abc@gmail.com Pleaase login with abc@gmail.com abc@googlemail.com is not entertained.</p>
<p align="left">5.)Password is case-sensitive.</p>
<p align="left">6.)Username is not case-sensitive.</p>
</b>
</div>
</div>

</div>
</div>
 -->

<div id="myCarousel" class="carousel slide" data-ride="carousel">
  
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
     <li data-target="#myCarousel" data-slide-to="3"></li> 
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
 <%--  <div class="item active">
      <img src="<c:url value="/resources/images/eplus-at-lp.png"/>" alt="RS" height="500" width="1000"/>
    </div>   --%>
  	<div class="item active">
      <img src="<c:url value="/resources/images/newjpp.jpg"/>" alt="RS" height="500" width="1000"/>
    </div>

    <div class="item">
      <img src="<c:url value="/resources/images/job_portal.png"/>" alt="RS" height="500" width="1000"/>
    </div>

    <div class="item">
     <img src="<c:url value="/resources/images/job2.png"/>" alt="RS" height="500" width="1000"/>
    </div>
    
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

</body>
</html>
