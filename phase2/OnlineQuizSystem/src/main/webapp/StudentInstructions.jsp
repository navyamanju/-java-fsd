<%-- Document: StudentInstructions --%>

<%@page import="com.model.StudentsDao"%>
<%@page import="com.model.InstructionsDao"%>
<%@page import="com.db.Instructions"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Insert title here</title>
</head>
<body>

<%
   String name = StudentsDao.getStudentName(session.getAttribute("username").toString());
%> 
<div >
  <marquee behavior="alternate">
    <h2><font color="green">Welcome <%= name %></font></h2>
  </marquee>
</div>

<table class="table table-hover">
  <tr>
    <th colspan="2"><h4><font color="red">Start the Quiz</font></h4></th>
  </tr>
  <%
    int i = 1;
    ArrayList<Instructions> allinsts = InstructionsDao.getAllRecords();
    for (Instructions e : allinsts) {
  %>
  <tr>
    <td><%= i++ %></td>
    <td><%= e.getInstruction() %></td>
  </tr>
  <%
    }
  %>
</table>

<pre>
<button type="button" class="btn btn-outline-primary btn-lg" onclick="location.href='com.controller.LogoutStudent'">Logout</button>        <button type="button" class="btn btn-outline-primary btn-lg" onclick="location.href='Exam.jsp'">Start Test</button>
</pre>
	
</body>
</html>
