<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ include file="/WEB-INF/jsp/includes.jsp"%>   

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

    window['adrum-start-time']= new Date().getTime(); 

</script> 

<script src="https://cdn.appdynamics.com/adrum/adrum-latest.js">
</script> 
<style>
blink {
  -webkit-animation: blink 1s steps(5, start) infinite;
  -moz-animation:    blink 1s steps(5, start) infinite;
  -o-animation:      blink 1s steps(5, start) infinite; 
  animation:         blink 1s steps(5, start) infinite;
}

@-webkit-keyframes blink {
  to { visibility: hidden; }
}
@-moz-keyframes blink {
  to { visibility: hidden; }
}
@-o-keyframes blink {
  to { visibility: hidden; }
}
@keyframes blink {
  to { visibility: hidden; }
}

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
</head>
<body>
<p behavior="alternate"><small>Document size must be below 5MB</small></p>
<!-- <font color="red"><b><blink>Please Make sure the document size is below 5MB|Acceptable Formats are pdf ,doc,txt,png,jpg,jpeg</blink></b></font> -->
<!-- <marquee behavior="alternate"><small>
    <h2><b><u>Add New Documents like Resume/CV,Profile Photo,and other documents.</u></b></h2>
    
    Type 'Myphoto' in Notes while uploading an image to set as profile pic
    </small></marquee> -->
    <form action="savefile" method="post" enctype="multipart/form-data">
        <table width="60%" border="1" cellspacing="0">
            <tr>
                <td width="35%"><strong>*File to upload</strong></td>
                <td width="65%"><input  type="file" id="file" name="file" required/></td>
            </tr>
            <tr>
                <td><strong>*Notes</strong></td>
                <td>
                <b>Type 'Myphoto' for any image to set as profile pic</b>
                <input type="text" id="description" name="description" width="60" required/>
                </td>
                
            </tr>
            <tr>
                <td><strong>Use Upload Button to upload your documents<b>-></b></strong></td>
                <td><button class="glyphicon glyphicon-upload" type="submit" name="submit" value="Upload"/></td>
                <!-- <td><a href="savefile" class="btn btn-success custom-width"><span class="glyphicon glyphicon-upload"></span>Upload</a></td> -->
            </tr>
        </table>
    </form>
    
    <u><b>Documents Uploaded for UserID-</b></u><label>${registeredUserDocumentList[0].email}</label>
   
 <div class="generic-container">
        <div class="panel panel-default">
        <div class="panel-heading"><span class="lead">List of Documents </span></div>
            <div class="tablecontainer">
                
             <table class="table table-hover" border="10">
	<th>ID</th>
	<th>FILE NAME</th>
	<th>DESCRIPTION</th>
	<th>Download</th>
	<th>Delete</th>


	<c:forEach items="${registeredUserDocumentList}" var="registeredUserDocument">
	
		<tr>
			<td>${registeredUserDocument.id}</td>
			<td>${registeredUserDocument.filename}</td>
			<td>${registeredUserDocument.description}</td>
			<td><a href="<c:url value='/download-document-${registeredUserDocument.email}-${registeredUserDocument.id}' />" class="btn btn-success custom-width"><span class="glyphicon glyphicon-download"></span>Download</a></td>
            <td><a href="<c:url value='/delete-document-${registeredUserDocument.email}-${registeredUserDocument.id}' />" class="btn btn-danger custom-width"><span class="glyphicon glyphicon-trash"></span>Delete</a></td>
			
			
		</tr>
	</c:forEach>
</table> 
 </div>
        </div>
            </div>
        </div>
        
        </body>
        
        </html>
        