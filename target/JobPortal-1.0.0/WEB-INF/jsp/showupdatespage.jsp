<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script> 

    window['adrum-start-time']= new Date().getTime(); 

</script> 

<script src="https://cdn.appdynamics.com/adrum/adrum-latest.js">
</script> 
<title>All Updates</title>

  <script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>
  <script src="<c:url value="/resources/js/stomp.js" />"></script>
  <script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
  <script>
    //Create stomp client over sockJS protocol
    var socket = new SockJS("/realtimeupdates-1.0/ws");
    var stompClient = Stomp.over(socket);

    // Render price data from server into HTML, registered as callback
    // when subscribing to price topic
    function renderPost(frame) {
      var posts = JSON.parse(frame.body);
      $('#post').empty();
      for(var i in posts) {
        var post = posts[i];
        $('#post').append(
          $('<div class="jumbotron">').append(
        	$('<label style="float:left;background-color:white; margin-right:5px;"><br/>').html(post.post),
            /* $('<img style="float:right;background-color:white; margin-right:5px;" src="<c:url value="/resources/images/jpuser.jpe"/>" alt="profilepic" height="75" width="75"/><label>').html(""), */
            $('<label style="float:right;background-color:white; margin-right:5px;"><br/><br/>').html(post.timeStr),
            $('<label style="float:right;background-color:white; margin-right:5px;">').html(post.postedBy)
            
          )
        );
      }
    }
    
    // Callback function to be called when stomp client is connected to server
    var connectCallback = function() {
      stompClient.subscribe('/topic/post', renderPost);
    }; 

    // Callback function to be called when stomp client could not connect to server
    var errorCallback = function(error) {
      alert(error.headers.message);
    };

    // Connect to server via websocket
    stompClient.connect("guest", "guest", connectCallback, errorCallback);
   </script>
</head>
<body>
<font color="green"><u><b>Updates</b></u></font>
<div id="post"></div>
</body>
</html>