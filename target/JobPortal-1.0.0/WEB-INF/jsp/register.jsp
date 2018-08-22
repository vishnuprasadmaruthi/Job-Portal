<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
    <head>
   <!--  <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-83848321-1', 'auto');
  ga('send', 'pageview');

</script> -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script> 
         window["adrum-app-key"] = "AD-AAB-AAD-EMT";
    window['adrum-start-time']= new Date().getTime(); 

</script> 

<script src="https://cdn.appdynamics.com/adrum/adrum-latest.js">
</script> 
        <title>Registration</title>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </head>
    <body>
   <center><h2><u>Registration Form</u></h2></center>
   <br/>
   <form   method="post" action="registration.jsp" role="form">
   
  	<!-- <div class="form-group">
    <label for="name">Name</label>
   <input class="form-control" type="text" name="fullname" value="" />
  </div> -->
   <!-- <div class="form-group">
    <label for="contact">Contact Number</label>
   <input class="form-control" type="text" name="contact" value="" />
  </div>
  <div class="form-group">
    <label for="email">Email</label>
   <input class="form-control"  type="text" name="email" value="" />
  </div> -->
  <div class="form-group">
    <label for="email">User Email:</label>
   <input class="form-control" type="text" name="email" value="" />
  </div>
  <div class="form-group">
    <label for="username">User Name:</label>
    <input class="form-control" type="text" name="username" class="form-control" >
  </div>
  <div class="form-group">
    <label for="pwd">Pass word:</label>
    <input  type="password" name="password" class="form-control" >
  </div>
 <div>
<label for="usertype">I am a:</label>
<select>
  <option value="jobseeker">Job Seeker</option>
  <option value="employer">Job Helper/Employer</option>
  <option value="admin">Admin</option>
</select>
</div>
 <input type="submit" class="btn btn-primary" value="Submit"/>
 <input type="reset" class="btn btn-default" value="Reset" />
  
</form>
<b> Already registered</b>
<a href="login.html">click here to Login</a>  
  <%--  <b> Already registered</b> <a href=" ${pageContext.request.contextPath}/login">Login!</a> --%>
     
    </body>
</html>