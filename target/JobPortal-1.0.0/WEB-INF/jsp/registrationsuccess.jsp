<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<title>Registration Success</title>
<%@ include file="/WEB-INF/jsp/includes.jsp"%> 
</head>
<body>
<div class="panel panel-success">
      <div class="panel-heading">Successfully Registered</div>
      <div class="panel-body">Thank you for Registering with us.<b>Please check your registered Email Inbox</b> for the Login Credentials.</div>
<div class="panel-body">Inorder to ensure Security The system has sent a password(your password+system generated key) which you have to use to login.</div>
</div>
<br/>
<br/>
<a href="login">Login</a> 
</body>
</html>