<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Panel</title>
    <style type="text/css">
        /* Center the content */
        body {
            text-align: center;
        }
        /* Center the container */
        .container {
            display: inline-block;
            text-align: left;
        }
        /* Set the height and background color for the top section */
       
        }
        /* Add padding for the buttons */
        .container input[type="button"] {
            margin: 10px;
        }
    </style>
</head>
<body>
<% 
if (session.getAttribute("username") != null) {
    
} else {
    String msg2 = "Please Login as Admin to Continue";
    response.sendRedirect("AdminLogin.jsp?msg2=" + msg2);
}
%>
<div class="top-section">
  <marquee behavior="alternate">
     <h1> <font color="green" ><center>Welcome <%= session.getAttribute("username") %></center></font></h1>
  </marquee>
</div>

<pre>
</pre>
<input onclick="location.href='Quiz Manager.jsp'" type="button" value="Quiz Manager">           <input onclick="location.href='QuestionList.jsp'" type="button" value="Question Manager">          <input onclick="location.href='com.controller.LogoutAdmin'" type="button" value="Logout">
   
</body>
</html>
