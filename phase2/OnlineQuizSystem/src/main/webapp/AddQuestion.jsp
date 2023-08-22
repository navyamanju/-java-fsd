<%--Document   : AddQuestion--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Add Question</title>
</head>
<body>
<h2><font  face = "WildWest" color="blue">Enter Questions Here</font></h2>
<form action="com.controller.QuestionInsert">
<pre>
Question:    <input type="text" name="Question">

Option A:     <input type="text" name="option1">

Option B:     <input type="text" name="option2">

Option C:     <input type="text" name="option3">

Option D:     <input type="text" name="option4">

Answer:      <select name="answer">
             <option value="a">a</option>
             <option value="b">b</option>
             <option value="c">c</option>
             <option value="d">d</option>
             </select>
             
             <input type="submit" value="Done" class="btn btn-outline-primary">   <input type="button" onclick="location.href='AdminPanel.jsp'" value="Home" class="btn btn-outline-success">  <input type="button" onclick="location.href='QuestionList.jsp'" value="Back" class="btn btn-outline-danger">
</pre>
</form>
<div>
<font color="red" >
		<%
			if(request.getParameter("msg2") != null)
				out.print(request.getParameter("msg2"));
		%>
		</font>
			<font color="green" >
		<%
			if(request.getParameter("msg1") != null)
				out.print(request.getParameter("msg1"));
		%>
		</font>
		</div>

</body>
</html>