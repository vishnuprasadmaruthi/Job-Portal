<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<title>Acknowledgement</title>
<%@ include file="/WEB-INF/jsp/includes.jsp"%> 
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

<script src="https://cdn.appdynamics.com/adrum/adrum-latest.js"/>
<script>

function showDiv() {
	   document.getElementById('ackowledge').style.display = "block";
	   var d = new Date();
	   document.getElementById("todaysdate").innerHTML = d.toDateString();
	   
	}
</script>
<input class="btn btn-success" type="button"  value="I Acknowledge" onclick="showDiv()" />
<div  id="ackowledge"  style="display:none;"> 
<div>
<div class="container-fluid text-center">
  <p>I hereby acknowledge that All the Information is correct and up-to-date.</p>
  <p id="todaysdate">.</p>
  <p>Thank you.</p>
  <br/>
        <div class="panel-heading"><a href="viewby">View My Profile As Others View it</a> </div>
</div>
<div>

</div>





</body>
</html>